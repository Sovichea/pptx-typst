#!/usr/bin/env python3
"""Convert and compare the downloaded PPTX corpus using local PowerPoint/Typst."""
from __future__ import annotations

import argparse
from collections import Counter
import csv
from difflib import SequenceMatcher
import json
import os
from pathlib import Path
import re
import shutil
import statistics
import subprocess
import sys
import tempfile
import time
import traceback
import zipfile
import xml.etree.ElementTree as ET

import pymupdf as fitz
import numpy as np
from PIL import Image, ImageDraw, ImageFilter
from pptx import Presentation
from pptx.enum.shapes import MSO_SHAPE_TYPE
from pptx_typst.text_diagnostics import (
    align_pdf_pages_to_slides,
    match_text_blocks_spatial,
    select_low_text_slides,
)
from pptx_typst.typst_source_diagnostics import structural_audit as typst_source_structural_audit


ROOT = Path(__file__).resolve().parents[1]
BENCH = ROOT / "benchmarks" / "text_fidelity"
MANIFEST = BENCH / "manifest.json"
RESULTS = BENCH / "results.csv"
SUMMARY = BENCH / "summary.md"
COMPARISON_DIR = BENCH / "visual_comparisons"
EMU_PER_PT = 12700
WORD_RE = re.compile(r"[\w]+", re.UNICODE)


def lower_decile(values):
    """Return the nearest-rank tenth percentile for a non-empty value set."""
    ordered = sorted(values)
    return ordered[max(0, (len(ordered) + 9) // 10 - 1)] if ordered else None


def get_typst_font_names():
    result = subprocess.run(["typst", "fonts"], check=True, capture_output=True, text=True)
    return {line.strip().casefold() for line in result.stdout.splitlines() if line.strip()}


def walk_shapes(shapes):
    for shape in shapes:
        if shape.shape_type == MSO_SHAPE_TYPE.GROUP:
            yield from walk_shapes(shape.shapes)
        else:
            yield shape


def theme_font_families(path: Path):
    result = {"major": "", "minor": ""}
    ns = {"a": "http://schemas.openxmlformats.org/drawingml/2006/main"}
    try:
        with zipfile.ZipFile(path) as archive:
            themes = sorted(name for name in archive.namelist()
                            if re.fullmatch(r"ppt/theme/theme\d+\.xml", name))
            if themes:
                root = ET.fromstring(archive.read(themes[0]))
                for key in ("major", "minor"):
                    node = root.find(f".//a:fontScheme/a:{key}Font/a:latin", ns)
                    if node is not None:
                        result[key] = node.attrib.get("typeface", "").strip()
    except (OSError, zipfile.BadZipFile, ET.ParseError):
        pass
    return result


def effective_font_name(name, theme_fonts):
    raw = (name or "").strip()
    if raw.casefold() in {"+mj-lt", "+mj-ea", "+mj-cs"}:
        raw = theme_fonts["major"]
    elif raw.casefold() in {"+mn-lt", "+mn-ea", "+mn-cs"} or not raw:
        raw = theme_fonts["minor"] or "(inherited)"
    return raw or "(inherited)"


def resolved_run_font(shape, paragraph, run, theme_fonts, slide):
    rp = run._r.xpath("./a:rPr")
    rp = rp[0] if rp else None
    font = run.font.name or (rp.xpath("./a:latin")[0].get("typeface") if rp is not None and rp.xpath("./a:latin") else None)
    if not font:
        level = min(9, max(1, paragraph.level + 1))
        defaults = paragraph._p.xpath("./a:pPr/a:defRPr")
        defaults += shape._element.xpath(f"./p:txBody/a:lstStyle/a:lvl{level}pPr/a:defRPr")
        if getattr(shape, "is_placeholder", False):
            try:
                idx = shape.placeholder_format.idx
                peer = next((item for item in slide.slide_layout.placeholders
                             if item.placeholder_format.idx == idx), None)
                if peer is not None:
                    defaults += peer._element.xpath(f"./p:txBody/a:lstStyle/a:lvl{level}pPr/a:defRPr")
            except Exception:
                pass
        master = slide.slide_layout.slide_master
        is_title = getattr(shape, "is_placeholder", False) and "TITLE" in str(shape.placeholder_format.type).upper()
        contexts = ["titleStyle"] if is_title else (["bodyStyle", "otherStyle"] if shape.is_placeholder else ["otherStyle"])
        for context in contexts:
            defaults += master._element.xpath(f"./p:txStyles/p:{context}/a:lvl{level}pPr/a:defRPr")
        for node in defaults:
            latin = node.xpath("./a:latin")
            if latin and latin[0].get("typeface"):
                font = latin[0].get("typeface")
                break
    if not font:
        style = shape._element.xpath("./p:style/a:fontRef")
        idx = style[0].get("idx") if style else "minor"
        font = "+mj-lt" if idx == "major" else "+mn-lt"
    return effective_font_name(font, theme_fonts)


def run_slide_fonts(slide, theme_fonts):
    fonts = set()
    for shape in walk_shapes(slide.shapes):
        if getattr(shape, "has_text_frame", False):
            for paragraph in shape.text_frame.paragraphs:
                for run in paragraph.runs:
                    if run.text and run.text.strip():
                        fonts.add(resolved_run_font(shape, paragraph, run, theme_fonts, slide))
        if getattr(shape, "has_table", False):
            for row in shape.table.rows:
                for cell in row.cells:
                    for paragraph in cell.text_frame.paragraphs:
                        for run in paragraph.runs:
                            if run.text and run.text.strip():
                                fonts.add(resolved_run_font(shape, paragraph, run, theme_fonts, slide))
    return fonts


def pptx_stats(path: Path, installed_fonts: set[str]):
    deck = Presentation(path)
    theme_fonts = theme_font_families(path)
    fonts = Counter()
    runs = 0
    characters = 0
    inherited_characters = 0
    text_shapes = []
    for slide in deck.slides:
        for shape in walk_shapes(slide.shapes):
            if getattr(shape, "has_text_frame", False):
                content = shape.text
                if content.strip() and None not in (shape.left, shape.top, shape.width, shape.height):
                    text_shapes.append((slide.slide_id, shape.left / EMU_PER_PT,
                                        shape.top / EMU_PER_PT, shape.width / EMU_PER_PT,
                                        shape.height / EMU_PER_PT, content))
                for paragraph in shape.text_frame.paragraphs:
                    for run in paragraph.runs:
                        if run.text:
                            runs += 1
                            characters += len(run.text)
                            fonts[resolved_run_font(shape, paragraph, run, theme_fonts, slide)] += len(run.text)
                            if not run.font.name:
                                inherited_characters += len(run.text)
            if getattr(shape, "has_table", False):
                for row in shape.table.rows:
                    for cell in row.cells:
                        for paragraph in cell.text_frame.paragraphs:
                            for run in paragraph.runs:
                                if run.text:
                                    runs += 1
                                    characters += len(run.text)
                                    fonts[resolved_run_font(shape, paragraph, run, theme_fonts, slide)] += len(run.text)
                                    if not run.font.name:
                                        inherited_characters += len(run.text)
    slide_fonts = [run_slide_fonts(slide, theme_fonts) for slide in deck.slides]
    font_chars = sum(fonts.values())
    installed_chars = sum(count for name, count in fonts.items()
                          if name.casefold() in installed_fonts)
    hidden_slide_indices = [index for index, slide in enumerate(deck.slides)
                            if slide._element.get("show", "1").casefold() in ("0", "false")]
    return deck, {
        "slides_source": len(deck.slides),
        "slides_hidden_source": len(hidden_slide_indices),
        "slides_visible_source": len(deck.slides) - len(hidden_slide_indices),
        "text_shapes_source": len(text_shapes),
        "text_runs_source": runs,
        "source_run_characters": characters,
        "source_fonts": "; ".join(f"{name}:{count}" for name, count in fonts.most_common()),
        "installed_font_char_share": round(installed_chars / characters, 4) if characters else None,
        "inherited_font_char_share": round(inherited_characters / characters, 4) if characters else None,
    }, text_shapes, slide_fonts


def export_powerpoint_pdf(app, source: Path, output: Path):
    presentation = None
    try:
        presentation = app.Presentations.Open(str(source), ReadOnly=True, Untitled=False, WithWindow=False)
        presentation.SaveAs(str(output), 32)  # ppSaveAsPDF
    finally:
        if presentation is not None:
            presentation.Close()
    if not output.is_file() or output.stat().st_size == 0:
        raise RuntimeError("PowerPoint did not produce a PDF")


def pdf_text_and_sizes(path: Path, included_pages=None):
    pdf = fitz.open(path)
    text_parts = []
    weighted_font_sizes = []
    page_sizes = []
    included_pages = set(included_pages) if included_pages is not None else None
    for page_index, page in enumerate(pdf):
        page_sizes.append((page.rect.width, page.rect.height))
        if included_pages is not None and page_index not in included_pages:
            continue
        text_parts.append(page.get_text("text", sort=True))
        data = page.get_text("dict")
        for block in data.get("blocks", []):
            for line in block.get("lines", []):
                for span in line.get("spans", []):
                    text = span.get("text", "")
                    if text:
                        weighted_font_sizes.extend([float(span["size"])] * len(text))
    return pdf, "\n".join(text_parts), weighted_font_sizes, page_sizes


def overlap_metrics(original: str, converted: str):
    words_a = Counter(word.casefold() for word in WORD_RE.findall(original))
    words_b = Counter(word.casefold() for word in WORD_RE.findall(converted))
    source_count, output_count = sum(words_a.values()), sum(words_b.values())
    matched = sum((words_a & words_b).values())
    source_chars = sum(len(word) for word, count in words_a.items() for _ in range(count))
    matched_chars = sum(len(word) * count for word, count in (words_a & words_b).items())
    return {
        "word_recall": round(matched / source_count, 4) if source_count else None,
        "word_precision": round(matched / output_count, 4) if output_count else None,
        "source_pdf_words": source_count,
        "converted_pdf_words": output_count,
        "source_pdf_text_chars": source_chars,
        "matched_pdf_text_chars": matched_chars,
        "char_recall": round(matched_chars / source_chars, 4) if source_chars else None,
    }


def page_image(page, scale):
    pix = page.get_pixmap(matrix=fitz.Matrix(scale, scale), alpha=False)
    return Image.frombytes("RGB", (pix.width, pix.height), pix.samples)


def save_comparison_sheet(source_pdf, typst_pdf, slide_scores, destination, count=3):
    """Save source/Typst comparisons for the lowest-scoring eligible slides."""
    selected = select_low_text_slides(slide_scores, count)
    if not selected:
        return None
    scale = 0.8
    padding = 12
    header_height = 54
    panels = []
    panel_width = panel_height = 0
    for item in selected:
        source_index = item["source_pdf_page"]
        typst_index = item["typst_pdf_page"]
        if source_index >= len(source_pdf) or typst_index >= len(typst_pdf):
            continue
        source_image = page_image(source_pdf[source_index], scale)
        typst_image = page_image(typst_pdf[typst_index], scale)
        if typst_image.size != source_image.size:
            typst_image = typst_image.resize(source_image.size, Image.Resampling.LANCZOS)
        panel_width, panel_height = source_image.size
        panels.append((item, source_image, typst_image))
    if not panels:
        return None

    sheet = Image.new(
        "RGB",
        (panel_width * 2 + padding * 3,
         len(panels) * (panel_height + header_height) + padding * (len(panels) + 1)),
        "#e9ecef",
    )
    draw = ImageDraw.Draw(sheet)
    for row, (item, source_image, typst_image) in enumerate(panels):
        y = padding + row * (panel_height + header_height + padding)
        score = item["text_fidelity_score"]
        ink = item.get("text_ink_f1")
        position = item.get("text_start_position_score")
        draw.text((padding, y),
                  f"Slide {item['slide']}  |  text {score:.3f}  |  ink {ink:.3f}  |  start {position:.3f}"
                  if ink is not None and position is not None else
                  f"Slide {item['slide']}  |  text {score:.3f}  |  ink {ink if ink is not None else 'n/a'}  |  start {position if position is not None else 'n/a'}",
                  fill="#111111")
        label_y = y + 22
        draw.text((padding, label_y), "PowerPoint", fill="#333333")
        draw.text((padding * 2 + panel_width, label_y), "Typst", fill="#333333")
        image_y = y + header_height
        sheet.paste(source_image, (padding, image_y))
        sheet.paste(typst_image, (padding * 2 + panel_width, image_y))
    destination = Path(destination)
    destination.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(destination, format="PNG", optimize=True)
    return selected


def pdf_text_blocks(page):
    blocks = []
    for block in page.get_text("dict").get("blocks", []):
        lines = block.get("lines", [])
        spans = [span for line in lines for span in line.get("spans", []) if span.get("text", "").strip()]
        text = " ".join(span["text"] for span in spans).strip()
        if text:
            first_line_spans = next((line.get("spans", []) for line in lines
                                     if any(s.get("text", "").strip() for s in line.get("spans", []))), [])
            first = next((span for span in first_line_spans if span.get("text", "").strip()), spans[0])
            boxes = [span["bbox"] for span in spans]
            first_origin = first.get("origin", first["bbox"][:2])
            block_lines = [line for line in lines if any(s.get("text", "").strip() for s in line.get("spans", []))]
            baselines = []
            line_records = []
            line_by_span = {}
            for line in block_lines:
                line_spans = [s for s in line.get("spans", []) if s.get("text", "").strip()]
                line_first = line_spans[0]
                baselines.append(float(line_first.get("origin", line_first["bbox"][:2])[1]))
                line_boxes = [s["bbox"] for s in line_spans]
                line_record = {
                    "text": " ".join(s["text"] for s in line_spans),
                    "baseline": float(line_first.get("origin", line_first["bbox"][:2])[1]),
                    "bbox": (min(b[0] for b in line_boxes), min(b[1] for b in line_boxes),
                             max(b[2] for b in line_boxes), max(b[3] for b in line_boxes)),
                }
                line_records.append(line_record)
                for span in line_spans:
                    line_by_span[id(span)] = line_record
            blocks.append({"text": text, "lines": len(block_lines),
                           "start": (float(first["bbox"][0]), float(first["bbox"][1])),
                           "baseline": (float(first_origin[0]), float(first_origin[1])),
                           "bbox": (min(b[0] for b in boxes), min(b[1] for b in boxes),
                                    max(b[2] for b in boxes), max(b[3] for b in boxes)),
                           "baselines": baselines,
                           "line_records": line_records,
                           "spans": [{"text": span["text"],
                                      "bbox": tuple(float(v) for v in span["bbox"]),
                                      "start": (float(span["bbox"][0]), float(span["bbox"][1])),
                                      "baseline": tuple(float(v) for v in span.get("origin", span["bbox"][:2])),
                                      "line_records": [line_by_span[id(span)]]}
                                     for span in spans],
                           "boxes": boxes})
    return blocks


def text_region_mask(blocks, scale, size, padding=1.5):
    width, height = size
    mask = np.zeros((height, width), dtype=bool)
    for block in blocks:
        for x0, y0, x1, y1 in block["boxes"]:
            left = max(0, int(x0 * scale - padding)); top = max(0, int(y0 * scale - padding))
            right = min(width, int(np.ceil(x1 * scale + padding))); bottom = min(height, int(np.ceil(y1 * scale + padding)))
            if right > left and bottom > top:
                mask[top:bottom, left:right] = True
    return mask


def edge_map(image):
    return np.asarray(image.convert("L").filter(ImageFilter.FIND_EDGES).point(lambda p: 255 if p >= 28 else 0)) > 0


def tolerant_f1(source, output, valid=None):
    if valid is not None:
        source = source & valid
        output = output & valid
    source_count, output_count = int(source.sum()), int(output.sum())
    if not source_count and not output_count:
        return None
    if not source_count or not output_count:
        return 0.0
    source_dilated = np.asarray(Image.fromarray(source.astype("uint8") * 255).filter(ImageFilter.MaxFilter(3))) > 0
    output_dilated = np.asarray(Image.fromarray(output.astype("uint8") * 255).filter(ImageFilter.MaxFilter(3))) > 0
    precision = int((output & source_dilated).sum()) / output_count
    recall = int((source & output_dilated).sum()) / source_count
    return 2 * precision * recall / (precision + recall) if precision + recall else 0.0


def match_text_blocks(source_blocks, output_blocks):
    unused = set(range(len(output_blocks)))
    pairs = []
    for source in sorted(source_blocks, key=lambda block: len(block["text"]), reverse=True):
        normalized = " ".join(WORD_RE.findall(source["text"].casefold()))
        if not normalized or not unused:
            continue
        ranked = []
        for index in unused:
            candidate = " ".join(WORD_RE.findall(output_blocks[index]["text"].casefold()))
            ranked.append((SequenceMatcher(None, normalized, candidate, autojunk=False).ratio(), index))
        score, index = max(ranked)
        if score >= 0.6:
            unused.remove(index)
            pairs.append((source, output_blocks[index]))
    return pairs


def slide_fidelity(source_pdf, typst_pdf, source_page_to_slide, supported_slides, supported_text_slides):
    """Return text-masked layout plus font-gated text and full-slide scores."""
    scale = 1.25
    layout_scores = []
    supported_layout_scores = []
    text_scores = []
    ink_scores = []
    position_scores = []
    position_errors = []
    slide_text_scores = []
    slide_diagnostics = []
    wrap_matches = wrap_equal = 0
    for page_index, slide_index in source_page_to_slide.items():
        source_page, output_page = source_pdf[page_index], typst_pdf[slide_index]
        source_blocks, output_blocks = pdf_text_blocks(source_page), pdf_text_blocks(output_page)
        source_image, typst_image = page_image(source_page, scale), page_image(output_page, scale)
        if typst_image.size != source_image.size:
            typst_image = typst_image.resize(source_image.size, Image.Resampling.LANCZOS)
        src_mask = text_region_mask(source_blocks, scale, source_image.size)
        out_mask = text_region_mask(output_blocks, scale, source_image.size)
        text_mask = src_mask | out_mask
        valid = ~text_mask

        # Layout score: compare non-text edges, non-background object colors, and slide background.
        src_edges, out_edges = edge_map(source_image), edge_map(typst_image)
        edge_score = tolerant_f1(src_edges, out_edges, valid)
        if edge_score is None:
            edge_score = 1.0
        src_rgb, out_rgb = np.asarray(source_image).astype(np.int16), np.asarray(typst_image).astype(np.int16)
        h, w = valid.shape
        corner = max(2, min(h, w) // 40)
        corner_pixels = np.concatenate([src_rgb[:corner, :corner].reshape(-1, 3), src_rgb[:corner, -corner:].reshape(-1, 3),
                                        src_rgb[-corner:, :corner].reshape(-1, 3), src_rgb[-corner:, -corner:].reshape(-1, 3)])
        out_corner_pixels = np.concatenate([out_rgb[:corner, :corner].reshape(-1, 3), out_rgb[:corner, -corner:].reshape(-1, 3),
                                            out_rgb[-corner:, :corner].reshape(-1, 3), out_rgb[-corner:, -corner:].reshape(-1, 3)])
        src_bg = np.median(corner_pixels, axis=0); out_bg = np.median(out_corner_pixels, axis=0)
        bg_score = max(0.0, 1.0 - float(np.abs(src_bg - out_bg).mean()) / 255.0)
        src_foreground = np.linalg.norm(src_rgb - src_bg, axis=2) > 24
        out_foreground = np.linalg.norm(out_rgb - out_bg, axis=2) > 24
        foreground = valid & (src_foreground | out_foreground)
        if foreground.any():
            color_delta = np.linalg.norm(src_rgb - out_rgb, axis=2)
            foreground_score = float((color_delta[foreground] <= 36).mean())
        else:
            foreground_score = 1.0
        if edge_score is not None:
            slide_layout = .7 * edge_score + .2 * foreground_score + .1 * bg_score
            layout_scores.append(slide_layout)
        else:
            slide_layout = None

        # Full-slide layout uses every slide whose resolved fonts are supported.
        if slide_index in supported_slides and edge_score is not None:
            supported_layout_scores.append(.7 * edge_score + .2 * foreground_score + .1 * bg_score)

        spatial = match_text_blocks_spatial(source_blocks, output_blocks)
        position_errors_spatial = [item["distance"] for item in spatial["matches"]]
        reliable_pitch_errors = []
        for match in spatial["matches"]:
            source_lines = match["source"].get("baselines", [])
            output_lines = match["output"].get("baselines", [])
            if len(source_lines) == len(output_lines) and len(source_lines) > 1:
                source_pitch = np.diff(source_lines)
                output_pitch = np.diff(output_lines)
                reliable_pitch_errors.extend(np.abs(source_pitch - output_pitch).tolist())
        slide_diagnostics.append({
            "slide": slide_index + 1,
            "source_pdf_page": page_index + 1,
            "typst_pdf_page": slide_index + 1,
            "page_correspondence": "verified",
            "layout_fidelity_score": slide_layout,
            "text_mask_area_percent": round(float(text_mask.mean()) * 100, 3),
            "source_text_block_count": len(source_blocks),
            "typst_text_block_count": len(output_blocks),
            "spatial_text_matches": len(spatial["matches"]),
            "ambiguous_source_text_blocks": spatial["ambiguous_source_count"],
            "ambiguous_typst_text_blocks": spatial["ambiguous_output_count"],
            "unmatched_source_text_blocks": spatial["unmatched_source_count"],
            "unmatched_typst_text_blocks": spatial["unmatched_output_count"],
            "spatial_start_error_mean_pt": mean_or_none(position_errors_spatial),
            "reliable_line_pitch_error_mean_pt": mean_or_none(reliable_pitch_errors),
            "line_pitch_pairs": len(reliable_pitch_errors),
        })

        # Text metrics require actual source text and support for all its fonts.
        # Slides with no detected source font must not become eligible by default.
        if slide_index not in supported_text_slides:
            continue

        # Text ink is compared from rendered text span regions. Position is measured separately.
        src_text_edges = src_edges & src_mask
        out_text_edges = out_edges & out_mask
        ink = tolerant_f1(src_text_edges, out_text_edges)
        if ink is not None:
            ink_scores.append(ink)
        slide_position_errors = []
        for source, output in match_text_blocks(source_blocks, output_blocks):
            dx, dy = source["start"][0] - output["start"][0], source["start"][1] - output["start"][1]
            slide_position_errors.append((dx * dx + dy * dy) ** .5)
            wrap_matches += 1
            wrap_equal += source["lines"] == output["lines"]
        position_errors.extend(slide_position_errors)
        slide_position_score = (sum(max(0.0, 1.0 - error / 24.0) for error in slide_position_errors)
                                / len(slide_position_errors) if slide_position_errors else None)
        if slide_position_score is not None:
            position_scores.append(slide_position_score)
        available_text_parts = [score for score in (ink, slide_position_score) if score is not None]
        slide_text_score = sum(available_text_parts) / len(available_text_parts) if available_text_parts else None
        if slide_text_score is not None:
            text_scores.append(slide_text_score)
        slide_text_scores.append({
            "slide": slide_index + 1,
            "source_pdf_page": page_index,
            "typst_pdf_page": slide_index,
            "text_fidelity_score": slide_text_score,
            "text_ink_f1": ink,
            "text_start_position_score": slide_position_score,
            "text_start_position_error_pt": mean_or_none(slide_position_errors),
        })
    layout = mean_or_none(layout_scores)
    supported_layout = mean_or_none(supported_layout_scores)
    ink = mean_or_none(ink_scores)
    mean_position_error = mean_or_none(position_errors)
    position_score = mean_or_none(position_scores)
    text = mean_or_none(text_scores)
    full = ((supported_layout + text) / 2 if supported_layout is not None and text is not None
            else (supported_layout if supported_layout is not None else text))
    return {"layout_fidelity_score": layout, "layout_fidelity_supported_slides": supported_layout,
            "text_ink_f1": ink, "text_start_position_score": position_score,
            "text_start_position_error_pt": mean_position_error,
            "text_fidelity_score": text,
            "slide_text_scores": slide_text_scores,
            "slide_diagnostics": slide_diagnostics,
            "full_slide_fidelity_score": full,
            "text_wrap_line_count_match": round(wrap_equal / wrap_matches, 3) if wrap_matches else None,
            "text_blocks_position_matched": wrap_matches}


def mean_or_none(values):
    return round(sum(values) / len(values), 3) if values else None


def font_shares(fonts_field: str, installed_fonts: set[str]):
    counts = Counter()
    for item in fonts_field.split("; "):
        if ":" not in item:
            continue
        name, raw_count = item.rsplit(":", 1)
        try:
            counts[name] += int(raw_count)
        except ValueError:
            continue
    total = sum(counts.values())
    available = sum(count for name, count in counts.items()
                    if name != "(inherited)" and name.casefold() in installed_fonts)
    return round(available / total, 4) if total else None, available, total


def failure_category(error: str, stage: str = ""):
    if not error:
        return ""
    if "unknown image format" in error:
        return "Typst rejected media format"
    if "does not exist in the document" in error:
        return "Unresolved Typst label/reference"
    if "unknown variable" in error:
        return "Unescaped text interpreted as Typst markup"
    if stage == "converter" or "converter:" in error:
        return "Converter runtime error"
    if stage == "powerpoint_render":
        return "PowerPoint rendering error"
    if stage == "source_parse":
        return "PPTX parse error"
    if stage == "typst_compile" or "typst compile:" in error:
        return "Generated Typst syntax/structure error"
    return "Benchmark error"


def typst_failure_excerpt(output: str):
    lines = output.splitlines()
    error_lines = [index for index, line in enumerate(lines) if line.lstrip().startswith("error:")]
    if error_lines:
        excerpt = []
        for index in error_lines[:3]:
            excerpt.extend(lines[index:min(len(lines), index + 6)])
        return "\n".join(excerpt)[-4000:]
    return "\n".join(lines[:40])[-4000:]


def benchmark_one(app, source: Path, entry, installed_fonts):
    record = {key: entry.get(key) for key in ("title", "creator", "doi", "license", "file")}
    record.update({"file_bytes": source.stat().st_size, "status": "ok", "error": ""})
    deck = None
    source_pdf = typst_pdf = None
    stage = "source_parse"
    try:
        deck, stats, _, slide_fonts = pptx_stats(source, installed_fonts)
        record.update(stats)
        supported_slides = set()
        unsupported_fonts = Counter()
        for slide_index, families in enumerate(slide_fonts):
            missing = {family for family in families
                       if family != "(inherited)" and family.casefold() not in installed_fonts}
            if missing:
                unsupported_fonts.update(missing)
            else:
                supported_slides.add(slide_index)
        hidden_slide_indices = {index for index, slide in enumerate(deck.slides)
                                if slide._element.get("show", "1").casefold() in ("0", "false")}
        visible_slide_indices = set(range(len(deck.slides))) - hidden_slide_indices
        text_source_slides = {index for index, families in enumerate(slide_fonts) if families} & visible_slide_indices
        supported_text_slides = text_source_slides & supported_slides
        record["text_source_slide_count"] = len(text_source_slides)
        record["text_font_supported_slide_count"] = len(text_source_slides & supported_slides)
        record["text_font_skipped_slide_count"] = len(text_source_slides - supported_slides)
        record["font_unsupported_families"] = "; ".join(
            f"{family}:{count}" for family, count in unsupported_fonts.most_common()
        )
        with tempfile.TemporaryDirectory(prefix="pptx-typst-bench-") as tmp:
            tmp_path = Path(tmp)
            project = tmp_path / "typst"
            original_pdf_path = tmp_path / "powerpoint.pdf"
            converted_pdf_path = tmp_path / "typst.pdf"
            env = os.environ.copy()
            src_path = str(ROOT / "src")
            env["PYTHONPATH"] = src_path + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
            stage = "converter"
            converted = subprocess.run(
                [sys.executable, "-m", "pptx_typst.pptx_to_typst", str(source),
                 "--output", str(project)],
                cwd=ROOT, env=env, capture_output=True, text=True, encoding="utf-8",
                errors="replace", timeout=900,
            )
            if converted.returncode:
                raise RuntimeError("converter: " + (converted.stderr or converted.stdout)[-1500:])
            manifest_path = project / "asset_manifest.json"
            converted_manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
            generated_typst = (project / "main.typ").read_text(encoding="utf-8")
            structural_audit = typst_source_structural_audit(converted_manifest, generated_typst)
            record.update({key: value for key, value in structural_audit.items()
                           if not key.endswith("_keys")})
            record["_structural_diagnostics"] = structural_audit
            record["text_placements_output"] = converted_manifest.get("counts", {}).get("text_placements", 0)
            record["table_placements_output"] = converted_manifest.get("counts", {}).get("table_placements", 0)
            record["unsupported_objects_output"] = converted_manifest.get("counts", {}).get("unsupported_placements", 0)
            stage = "typst_compile"
            typst = subprocess.run(
                ["typst", "compile", "main.typ", str(converted_pdf_path)],
                cwd=project, capture_output=True, text=True, encoding="utf-8",
                errors="replace", timeout=900,
            )
            if typst.returncode:
                raise RuntimeError("typst compile: " + typst_failure_excerpt(typst.stderr or typst.stdout))
            stage = "powerpoint_render"
            export_powerpoint_pdf(app, source, original_pdf_path)
            stage = "pdf_metrics"
            source_pdf, source_text_all, source_sizes_all, source_page_sizes = pdf_text_and_sizes(original_pdf_path)
            try:
                typst_pdf, converted_text_all, converted_sizes_all, converted_page_sizes = pdf_text_and_sizes(converted_pdf_path)
                page_map, page_alignment_error = align_pdf_pages_to_slides(
                    len(deck.slides), hidden_slide_indices, len(source_pdf), len(typst_pdf)
                )
                record["slides_hidden_source"] = len(hidden_slide_indices)
                record["slides_visible_source"] = len(deck.slides) - len(hidden_slide_indices)
                record["page_correspondence"] = "verified" if page_map is not None else "invalid_comparison"
                record["page_alignment_error"] = page_alignment_error or ""
                record["alignment_eligible"] = page_map is not None
                record["pages_source_pdf"] = len(source_pdf)
                record["pages_typst_pdf"] = len(typst_pdf)
                if page_map is None:
                    record["visual_comparison"] = ""
                    record["comparison_slides"] = ""
                    record["failure_category"] = "invalid_comparison"
                    record["alignment_eligible"] = False
                    continue_metrics = False
                else:
                    continue_metrics = True
                if continue_metrics:
                    source_slide_to_pdf = {slide_index: page_index for page_index, slide_index in page_map.items()}
                    eligible_source_pages = {source_slide_to_pdf[index] for index in supported_text_slides
                                             if index in source_slide_to_pdf}
                    eligible_typst_pages = {index for index in supported_text_slides
                                             if index in source_slide_to_pdf}
                    source_text = "\n".join(source_pdf[i].get_text("text", sort=True)
                                             for i in sorted(eligible_source_pages))
                    converted_text = "\n".join(typst_pdf[i].get_text("text", sort=True)
                                                for i in sorted(eligible_typst_pages))
                    source_sizes = [float(span["size"]) for i in sorted(eligible_source_pages)
                                    for block in source_pdf[i].get_text("dict").get("blocks", [])
                                    for line in block.get("lines", []) for span in line.get("spans", [])
                                    if span.get("text")]
                    converted_sizes = [float(span["size"]) for i in sorted(eligible_typst_pages)
                                       for block in typst_pdf[i].get_text("dict").get("blocks", [])
                                       for line in block.get("lines", []) for span in line.get("spans", [])
                                       if span.get("text")]
                if continue_metrics:
                    record.update(overlap_metrics(source_text, converted_text))
                    record["source_pdf_mean_font_pt"] = mean_or_none(source_sizes)
                    record["typst_pdf_mean_font_pt"] = mean_or_none(converted_sizes)
                    record["mean_font_size_abs_delta_pt"] = (
                        round(abs(record["source_pdf_mean_font_pt"] - record["typst_pdf_mean_font_pt"]), 3)
                        if record["source_pdf_mean_font_pt"] is not None and record["typst_pdf_mean_font_pt"] is not None
                        else None
                    )
                    record["slide_size_matches"] = all(
                        abs(a - c) < 1
                        for source_index, slide_index in page_map.items()
                        for a, c in zip(source_page_sizes[source_index], converted_page_sizes[slide_index])
                    )
                    fidelity = slide_fidelity(source_pdf, typst_pdf, page_map, supported_slides, supported_text_slides)
                    slide_text_scores = fidelity.pop("slide_text_scores", [])
                    slide_diagnostics = fidelity.pop("slide_diagnostics", [])
                    for detail in slide_diagnostics:
                        detail.update({"deck": source.name, "title": entry.get("title", "")})
                    record["_slide_diagnostics"] = slide_diagnostics
                    record.update(fidelity)
                    selected = save_comparison_sheet(
                        source_pdf, typst_pdf, slide_text_scores,
                        COMPARISON_DIR / f"{source.stem}.png", count=3,
                    )
                    if selected:
                        record["visual_comparison"] = f"visual_comparisons/{source.stem}.png"
                        record["comparison_slides"] = ";".join(
                            f"{item['slide']} ({item['text_fidelity_score']:.3f})" for item in selected
                        )
                    else:
                        record["visual_comparison"] = ""
                        record["comparison_slides"] = ""
            finally:
                source_pdf.close()
                source_pdf = None
                if typst_pdf is not None:
                    typst_pdf.close()
                    typst_pdf = None
    except Exception as exc:
        record["status"] = "error"
        record["error"] = f"{type(exc).__name__}: {exc}"
        record["failure_stage"] = stage
        record["failure_category"] = failure_category(record["error"], stage)
    finally:
        if source_pdf is not None:
            source_pdf.close()
        if typst_pdf is not None:
            typst_pdf.close()
    return record


def run_powerpoint_batch(entries, start, manifest, installed_fonts):
    import pythoncom
    import win32com.client

    pythoncom.CoInitialize()
    app = win32com.client.DispatchEx("PowerPoint.Application")
    app.Visible = 1
    app.DisplayAlerts = 0
    app.WindowState = 2
    rows = []
    try:
        manifest_indices = {entry["file"]: index + 1 for index, entry in enumerate(manifest["files"])}
        for entry in entries:
            index = manifest_indices.get(entry["file"], start + 1)
            source = ROOT / entry["file"]
            print(f"[{index}/{len(manifest['files'])}] {entry['title']}", flush=True)
            row = benchmark_one(app, source, entry, installed_fonts)
            rows.append(row)
            print(f"  {row['status']} | layout={row.get('layout_fidelity_score')} | text={row.get('text_fidelity_score')} | full={row.get('full_slide_fidelity_score')}"
                  + (f" | {row['error'][:160]}" if row["error"] else ""), flush=True)
    finally:
        app.Quit()
        pythoncom.CoUninitialize()
    return rows


def main():
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(errors="replace")
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=100)
    parser.add_argument("--start", type=int, default=0, help="zero-based manifest file index")
    parser.add_argument("--end", type=int, help="exclusive manifest file index")
    parser.add_argument("--only", action="append", default=[],
                        help="process a manifest filename or basename (repeatable)")
    parser.add_argument("--report-only", action="store_true", help="recompute aggregate report from existing results.csv")
    args = parser.parse_args()
    if not MANIFEST.is_file():
        raise SystemExit(f"Missing {MANIFEST}; run tools/download_text_benchmark.py first")
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    installed_fonts = get_typst_font_names()
    if args.report_only:
        if not RESULTS.is_file():
            raise SystemExit(f"Missing {RESULTS}")
        with RESULTS.open(encoding="utf-8-sig", newline="") as stream:
            combined = list(csv.DictReader(stream))
    else:
        entries = [entry for entry in manifest["files"] if not entry.get("download_error")]
        if args.only:
            requested = set(args.only)
            entries = [entry for entry in entries
                       if Path(entry["file"]).name in requested or entry["file"] in requested]
            available = {entry["file"] for entry in entries} | {Path(entry["file"]).name for entry in entries}
            missing = requested - available
            if missing:
                raise SystemExit("Benchmark files not found in manifest: " + ", ".join(sorted(missing)))
        else:
            entries = entries[args.start:args.end if args.end is not None else args.start + args.limit]
        if not entries:
            raise SystemExit("No benchmark entries selected")
        rows = run_powerpoint_batch(entries, args.start, manifest, installed_fonts)
        existing = []
        if RESULTS.is_file() and (args.start or args.only):
            with RESULTS.open(encoding="utf-8-sig", newline="") as stream:
                existing = list(csv.DictReader(stream))
        if existing:
            by_file = {row.get("file"): row for row in existing}
            by_file.update({row.get("file"): row for row in rows})
            combined = [by_file[entry["file"]] for entry in manifest["files"]
                        if entry.get("file") in by_file]
        else:
            combined = rows
    for row in combined:
        if row.get("status") == "ok":
            source = ROOT / row.get("file", "")
            if source.is_file():
                try:
                    deck, fresh_stats, _, _ = pptx_stats(source, installed_fonts)
                    row.update({key: fresh_stats[key] for key in
                                ("slides_source", "slides_hidden_source", "slides_visible_source")})
                    hidden = [index for index, slide in enumerate(deck.slides)
                              if slide._element.get("show", "1").casefold() in ("0", "false")]
                    page_map, alignment_error = align_pdf_pages_to_slides(
                        fresh_stats["slides_source"], hidden,
                        int(row.get("pages_source_pdf") or 0), int(row.get("pages_typst_pdf") or 0),
                    )
                    row["page_correspondence"] = "verified" if page_map is not None else "invalid_comparison"
                    row["page_alignment_error"] = alignment_error or ""
                    row["alignment_eligible"] = page_map is not None
                    if page_map is None:
                        row["failure_category"] = "invalid_comparison"
                        for key in ("layout_fidelity_score", "layout_fidelity_supported_slides", "text_ink_f1",
                                    "text_start_position_score", "text_start_position_error_pt", "text_fidelity_score",
                                    "full_slide_fidelity_score", "text_wrap_line_count_match", "word_recall",
                                    "word_precision", "source_pdf_words", "text_blocks_position_matched"):
                            row[key] = ""
                        row["visual_comparison"] = ""
                        row["comparison_slides"] = ""
                except Exception as exc:
                    row["page_correspondence"] = "invalid_comparison"
                    row["page_alignment_error"] = f"could not verify slide identity: {exc}"
                    row["alignment_eligible"] = False
        if args.report_only:
            source = ROOT / row.get("file", "")
            if source.is_file():
                try:
                    _, fresh_stats, _, _ = pptx_stats(source, installed_fonts)
                    row.update(fresh_stats)
                except Exception:
                    pass
        for key in ("layout_fidelity_score", "layout_fidelity_supported_slides", "text_ink_f1",
                    "text_start_position_score", "text_start_position_error_pt", "text_fidelity_score",
                    "text_wrap_line_count_match"):
            if row.get(key) not in (None, ""):
                row[key] = round(float(row[key]), 3)
        if row.get("status") == "ok":
            supported_layout = row.get("layout_fidelity_supported_slides")
            text = row.get("text_fidelity_score")
            if supported_layout not in (None, "") and text not in (None, ""):
                row["full_slide_fidelity_score"] = round((float(supported_layout) + float(text)) / 2, 3)
            elif supported_layout not in (None, ""):
                row["full_slide_fidelity_score"] = round(float(supported_layout), 3)
            elif text not in (None, ""):
                row["full_slide_fidelity_score"] = round(float(text), 3)
    succeeded = [row for row in combined if row.get("status") == "ok"]
    errors = [row for row in combined if row.get("status") != "ok"]
    weighted_words = sum(int(row.get("source_pdf_words") or 0) * float(row.get("word_recall") or 0) for row in succeeded)
    total_words = sum(int(row.get("source_pdf_words") or 0) for row in succeeded)
    layout = [float(row["layout_fidelity_score"]) for row in succeeded if row.get("layout_fidelity_score") not in (None, "")]
    text_score = [float(row["text_fidelity_score"]) for row in succeeded if row.get("text_fidelity_score") not in (None, "")]
    full_score = [float(row["full_slide_fidelity_score"]) for row in succeeded if row.get("full_slide_fidelity_score") not in (None, "")]
    ink = [float(row["text_ink_f1"]) for row in succeeded if row.get("text_ink_f1") not in (None, "")]
    position_score = [float(row["text_start_position_score"]) for row in succeeded if row.get("text_start_position_score") not in (None, "")]
    position = [float(row["text_start_position_error_pt"]) for row in succeeded if row.get("text_start_position_error_pt") not in (None, "")]
    wrap = [float(row["text_wrap_line_count_match"]) for row in succeeded if row.get("text_wrap_line_count_match") not in (None, "")]
    eligible_text_slides = sum(int(row.get("text_font_supported_slide_count") or 0) for row in succeeded)
    source_text_slides = sum(int(row.get("text_source_slide_count") or 0) for row in succeeded)
    skipped_text_slides = sum(int(row.get("text_font_skipped_slide_count") or 0) for row in succeeded)
    font_delta = [float(row["mean_font_size_abs_delta_pt"]) for row in succeeded if row.get("mean_font_size_abs_delta_pt") not in (None, "")]
    word_recall = [float(row["word_recall"]) for row in succeeded if row.get("word_recall") not in (None, "")]
    for row in combined:
        available_share, available_chars, resolved_chars = font_shares(
            row.get("source_fonts", ""), installed_fonts
        )
        row["installed_font_char_share"] = available_share
        row["installed_font_characters"] = available_chars
        row["resolved_font_characters"] = resolved_chars
        if row.get("status") != "ok":
            row["failure_category"] = row.get("failure_category") or failure_category(
                row.get("error", ""), row.get("failure_stage", "")
            )
    known = [float(row["installed_font_char_share"]) for row in combined if row.get("installed_font_char_share") not in (None, "")]
    inherited = [float(row["inherited_font_char_share"]) for row in combined if row.get("inherited_font_char_share") not in (None, "")]
    resolved_total = sum(int(row.get("resolved_font_characters") or 0) for row in combined)
    explicit_installed = sum(int(row.get("installed_font_characters") or 0) for row in combined)
    slide_detail_records = []
    structure_detail_records = []
    updated_decks = {Path(row.get("file", "")).name for row in combined
                     if row.get("_slide_diagnostics") is not None}
    for row in combined:
        slide_detail_records.extend(row.pop("_slide_diagnostics", []) or [])
        structure = row.pop("_structural_diagnostics", None)
        if structure:
            structure_detail_records.append({"record_type": "deck_structure", "deck": Path(row.get("file", "")).name,
                                             "title": row.get("title", ""), **structure})
    slide_details_path = BENCH / "slide_diagnostics.jsonl"
    if not args.report_only:
        preserved_records = []
        if slide_details_path.is_file() and (args.start or args.only):
            for line in slide_details_path.read_text(encoding="utf-8").splitlines():
                try:
                    item = json.loads(line)
                except json.JSONDecodeError:
                    continue
                if Path(item.get("deck", "")).name not in updated_decks:
                    preserved_records.append(item)
        with slide_details_path.open("w", encoding="utf-8") as stream:
            for item in [*preserved_records, *structure_detail_records, *slide_detail_records]:
                stream.write(json.dumps(item, ensure_ascii=False, separators=(",", ":")) + "\n")
    all_slide_details = list(slide_detail_records)
    if slide_details_path.is_file():
        all_slide_details = []
        for line in slide_details_path.read_text(encoding="utf-8").splitlines():
            try:
                item = json.loads(line)
            except json.JSONDecodeError:
                continue
            if item.get("record_type") != "deck_structure":
                all_slide_details.append(item)
    mask_areas = [item["text_mask_area_percent"] for item in all_slide_details
                  if item.get("text_mask_area_percent") is not None]
    spatial_matches = sum(int(item.get("spatial_text_matches") or 0) for item in all_slide_details)
    ambiguous_blocks = sum(int(item.get("ambiguous_source_text_blocks") or 0)
                           + int(item.get("ambiguous_typst_text_blocks") or 0) for item in all_slide_details)
    unmatched_blocks = sum(int(item.get("unmatched_source_text_blocks") or 0)
                           + int(item.get("unmatched_typst_text_blocks") or 0) for item in all_slide_details)
    source_objects = sum(int(row.get("source_object_placements") or 0) for row in succeeded)
    emitted_objects = sum(int(row.get("typst_emitted_source_objects") or 0) for row in succeeded)
    unsupported_objects = sum(int(row.get("unsupported_objects_output") or 0) for row in succeeded)
    supported_source_objects = max(0, source_objects - unsupported_objects)
    geometry_checked = sum(int(row.get("geometry_checked_ungrouped_placements") or 0) for row in succeeded)
    position_error_weighted = sum(
        float(row.get("generated_place_position_mae_pt") or 0)
        * int(row.get("geometry_checked_ungrouped_placements") or 0)
        for row in succeeded
    )
    RESULTS.parent.mkdir(parents=True, exist_ok=True)
    columns = list(dict.fromkeys(key for row in combined for key in row if not key.startswith("_")))
    with RESULTS.open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(combined)
    COMPARISON_DIR.mkdir(parents=True, exist_ok=True)
    index_lines = [
        "# Low text-fidelity slide comparisons",
        "",
        "Each image places the PowerPoint render on the left and Typst on the right. Up to three font-supported slides with the lowest per-slide text score are selected for each successfully rendered deck. PowerPoint PDF pages are mapped to original visible slides by order after excluding hidden slides; Typst retains all source slides.",
        "",
    ]
    for row in combined:
        visual = row.get("visual_comparison", "")
        if not visual:
            continue
        image_name = Path(visual).name
        index_lines.append(f"## {row.get('title') or Path(row.get('file', '')).stem}")
        index_lines.append("")
        index_lines.append(f"Selected slides: {row.get('comparison_slides') or 'n/a'}")
        index_lines.append("")
        index_lines.append(f"![PowerPoint and Typst slide comparison for {row.get('title', image_name)}]({image_name})")
        index_lines.append("")
    (COMPARISON_DIR / "index.md").write_text("\n".join(index_lines).rstrip() + "\n", encoding="utf-8")
    summary = [
        "# PPTX to Typst fidelity benchmark",
        "",
        f"- Corpus: [Zenodo10K](https://huggingface.co/datasets/Forceless/Zenodo10K), sampled deterministically; all selected records are CC BY 4.0.",
        f"- Sample size: {len(manifest['files'])} downloaded decks; measurements recorded for {len(combined)}.",
        f"- Successful conversions and renders: {len(succeeded)}; failures: {len(errors)}.",
        f"- Visible source slides rendered: {sum(int(row.get('slides_visible_source') or row.get('slides_source') or 0) for row in succeeded)}.",
        f"- Page correspondence: {sum(row.get('page_correspondence') == 'verified' for row in succeeded)} verified; {sum(row.get('page_correspondence') == 'invalid_comparison' for row in succeeded)} excluded as ambiguous.",
        f"- Source PDF words: {total_words:,}.",
        f"- Weighted visible-word recall: {weighted_words / total_words:.1%}." if total_words else "- Weighted visible-word recall: n/a.",
        f"- Mean per-deck visible-word recall: {sum(word_recall) / len(word_recall):.1%}; median {statistics.median(word_recall):.1%}." if word_recall else "- Per-deck visible-word recall: n/a.",
        f"- Layout fidelity (text glyph pixels masked; all rendered slides): {sum(layout) / len(layout):.1%} mean per deck; {statistics.median(layout):.1%} median; {lower_decile(layout):.1%} 10th percentile." if layout else "- Layout fidelity: n/a.",
        f"- Text metrics include {eligible_text_slides:,} of {source_text_slides:,} source-text slides with all used font families available; {skipped_text_slides:,} slides were skipped for unsupported fonts.",
        f"- Text fidelity (font-supported slides only): {sum(text_score) / len(text_score):.1%} mean per deck; {statistics.median(text_score):.1%} median; {lower_decile(text_score):.1%} 10th percentile." if text_score else "- Text fidelity: n/a.",
        f"- Full-slide fidelity (font-supported slides only; equal-weight layout + text): {sum(full_score) / len(full_score):.1%} mean per deck; {statistics.median(full_score):.1%} median; {lower_decile(full_score):.1%} 10th percentile." if full_score else "- Full-slide fidelity: n/a.",
        f"- Text ink edge F1: {sum(ink) / len(ink):.1%}; mean start-position accuracy: {sum(position_score) / len(position_score):.1%}; mean start-position error: {sum(position) / len(position):.2f} pt." if ink and position and position_score else "- Text ink and start-position metrics: n/a.",
        f"- Text wrap line-count match (diagnostic only; excluded from scores): {sum(wrap) / len(wrap):.1%}." if wrap else "- Text wrap line-count match: n/a.",
        f"- Low text-fidelity comparison sheets: {sum(bool(row.get('visual_comparison')) for row in combined)} deck(s), in `visual_comparisons/index.md`; each sheet shows up to three font-supported slides with the lowest per-slide text score.",
        f"- Mean per-deck absolute PDF font-size difference: {sum(font_delta) / len(font_delta):.2f} pt; median {statistics.median(font_delta):.2f} pt." if font_delta else "- PDF font-size difference: n/a.",
        f"- Resolved source font families are locally available for {explicit_installed / resolved_total:.1%} of text characters across the sample; mean per-deck share {sum(known) / len(known):.1%}." if resolved_total else "- Available-font share: n/a.",
        f"- Mean share of text run characters without a direct run-level font name (resolved through inherited styles/theme): {sum(inherited) / len(inherited):.1%}." if inherited else "- Inherited-font share: n/a.",
        f"- Mean text-mask area: {sum(mask_areas) / len(mask_areas):.2f}% of rendered pixels; per-slide values are in [`slide_diagnostics.jsonl`](slide_diagnostics.jsonl)." if mask_areas else "- Text-mask area: n/a.",
        f"- Structural source-object emission: {emitted_objects:,}/{supported_source_objects:,} supported source placements have a marker next to an emitted `#Place` call ({unsupported_objects:,} unsupported placements are reported separately from {source_objects:,} total). This verifies emission, not geometry accuracy; missing keys are listed per deck in the JSONL diagnostics." if source_objects else "- Structural source-object coverage: n/a.",
        f"- Generated `#Place` position check: {geometry_checked:,} ungrouped supported placements; mean absolute x/y error {position_error_weighted / geometry_checked:.3f} pt against source-object bounds." if geometry_checked else "- Generated `#Place` position check: n/a.",
        f"- Independent spatial text matching: {spatial_matches:,} matched; {ambiguous_blocks:,} ambiguous block incidences and {unmatched_blocks:,} unmatched block incidences are reported separately, not counted as correct placement. See [`slide_diagnostics.jsonl`](slide_diagnostics.jsonl)." if all_slide_details else "- Spatial text matching diagnostics: n/a.",
        "- Layout score compares full-slide edges, foreground colors, and background color after masking extracted text glyph regions in both PDFs. Text itself does not contribute to this score. Layout includes slides with unsupported fonts because their text is masked.",
        "- A slide is eligible for text fidelity only when every resolved source font family used on that slide is present in Typst's installed-font list. Resolved major/minor theme fonts are checked too. Unsupported-font slides are excluded from text, word, font-size, wrap, and full-slide metrics.",
        "- Text fidelity is the mean of a one-pixel-tolerant rendered ink-edge F1 and a text-start position score. Position score falls linearly to zero at a 24 pt displacement.",
        "- Wrap line-count match is recorded as a diagnostic and is excluded from text and full-slide scores because the renderers wrap differently.",
        "- Full-slide score is the equal-weight mean of layout and text fidelity on font-supported slides. If a supported slide has no extractable text, its full-slide score equals its layout score. Word recall and font-size difference remain supplemental diagnostics and use only font-supported slides.",
        "- Pixel scores use PDF output rendered locally by PowerPoint and Typst. Grouped text spans may be imperfectly extracted from PDFs.",
        "- Word recall compares text extracted from PowerPoint-exported and Typst PDFs. Differences in reading order are ignored; repeated or missing visible words lower the score.",
        "- Font-size difference compares character-weighted average font sizes extracted from the two PDFs. These aggregate metrics are affected by unsupported objects and font substitution.",
        "- Source attribution, license, DOI and download checksums are in [manifest.json](manifest.json). Per-deck measurements are in [results.csv](results.csv); per-slide diagnostics are in [slide_diagnostics.jsonl](slide_diagnostics.jsonl). PPTX files are in the ignored local `data/input/` directory.",
    ]
    if errors:
        summary.extend(["", "## Failure categories", ""])
        for category, count in Counter(row.get("failure_category", "Benchmark error") for row in errors).most_common():
            summary.append(f"- {category}: {count} deck(s). Details are in `results.csv`.")
    SUMMARY.write_text("\n".join(summary) + "\n", encoding="utf-8")
    print(f"Wrote {RESULTS} and {SUMMARY}")


if __name__ == "__main__":
    main()
