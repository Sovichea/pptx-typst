#!/usr/bin/env python3
"""Convert and compare the downloaded PPTX corpus using local PowerPoint/Typst."""
from __future__ import annotations

import argparse
from collections import Counter
import csv
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import time
import traceback

import pymupdf as fitz
import numpy as np
from PIL import Image, ImageFilter
from pptx import Presentation
from pptx.enum.shapes import MSO_SHAPE_TYPE


ROOT = Path(__file__).resolve().parents[1]
BENCH = ROOT / "benchmarks" / "text_fidelity"
MANIFEST = BENCH / "manifest.json"
RESULTS = BENCH / "results.csv"
SUMMARY = BENCH / "summary.md"
EMU_PER_PT = 12700
WORD_RE = re.compile(r"[\w]+", re.UNICODE)


def get_typst_font_names():
    result = subprocess.run(["typst", "fonts"], check=True, capture_output=True, text=True)
    return {line.strip().casefold() for line in result.stdout.splitlines() if line.strip()}


def walk_shapes(shapes):
    for shape in shapes:
        if shape.shape_type == MSO_SHAPE_TYPE.GROUP:
            yield from walk_shapes(shape.shapes)
        else:
            yield shape


def pptx_stats(path: Path, installed_fonts: set[str]):
    deck = Presentation(path)
    fonts = Counter()
    runs = 0
    characters = 0
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
                            fonts[run.font.name or "(inherited)"] += len(run.text)
            if getattr(shape, "has_table", False):
                for row in shape.table.rows:
                    for cell in row.cells:
                        for paragraph in cell.text_frame.paragraphs:
                            for run in paragraph.runs:
                                if run.text:
                                    runs += 1
                                    characters += len(run.text)
                                    fonts[run.font.name or "(inherited)"] += len(run.text)
    font_chars = sum(fonts.values())
    explicit_chars = sum(count for name, count in fonts.items() if name != "(inherited)")
    installed_chars = sum(count for name, count in fonts.items()
                          if name.casefold() in installed_fonts)
    inherited_chars = fonts.get("(inherited)", 0)
    return deck, {
        "slides_source": len(deck.slides),
        "text_shapes_source": len(text_shapes),
        "text_runs_source": runs,
        "source_run_characters": characters,
        "source_fonts": "; ".join(f"{name}:{count}" for name, count in fonts.most_common()),
        "installed_font_char_share": round(installed_chars / explicit_chars, 4) if explicit_chars else None,
        "inherited_font_char_share": round(inherited_chars / font_chars, 4) if font_chars else None,
    }, text_shapes


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


def pdf_text_and_sizes(path: Path):
    pdf = fitz.open(path)
    text_parts = []
    weighted_font_sizes = []
    page_sizes = []
    for page in pdf:
        page_sizes.append((page.rect.width, page.rect.height))
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


def text_boxes_by_slide(deck):
    result = []
    for slide in deck.slides:
        current = []
        for shape in walk_shapes(slide.shapes):
            if (getattr(shape, "has_text_frame", False) and shape.text.strip()
                    and None not in (shape.left, shape.top, shape.width, shape.height)):
                current.append((shape.left / EMU_PER_PT, shape.top / EMU_PER_PT,
                                shape.width / EMU_PER_PT, shape.height / EMU_PER_PT))
        result.append(current)
    return result


def text_edge_f1(source_pdf, typst_pdf, boxes_by_slide):
    scale = 1.25
    matrix = fitz.Matrix(scale, scale)
    source_count = converted_count = true_positive = 0
    pages = min(len(source_pdf), len(typst_pdf), len(boxes_by_slide))
    for page_index in range(pages):
        spix = source_pdf[page_index].get_pixmap(matrix=matrix, alpha=False)
        tpix = typst_pdf[page_index].get_pixmap(matrix=matrix, alpha=False)
        source_image = Image.frombytes("RGB", (spix.width, spix.height), spix.samples).convert("L")
        typst_image = Image.frombytes("RGB", (tpix.width, tpix.height), tpix.samples).convert("L")
        if typst_image.size != source_image.size:
            typst_image = typst_image.resize(source_image.size, Image.Resampling.LANCZOS)
        for x, y, width, height in boxes_by_slide[page_index]:
            left = max(0, int(x * scale)); top = max(0, int(y * scale))
            right = min(source_image.width, int((x + width) * scale))
            bottom = min(source_image.height, int((y + height) * scale))
            if right - left < 5 or bottom - top < 5:
                continue
            src_crop = source_image.crop((left, top, right, bottom))
            out_crop = typst_image.crop((left, top, right, bottom))
            src_edge = src_crop.filter(ImageFilter.FIND_EDGES).point(lambda p: 255 if p >= 28 else 0)
            out_edge = out_crop.filter(ImageFilter.FIND_EDGES).point(lambda p: 255 if p >= 28 else 0)
            # Ignore a narrow frame border where PowerPoint draws text-box fills/outlines.
            if src_edge.width > 6 and src_edge.height > 6:
                src_edge = src_edge.crop((2, 2, src_edge.width - 2, src_edge.height - 2))
                out_edge = out_edge.crop((2, 2, out_edge.width - 2, out_edge.height - 2))
            a = np.asarray(src_edge) > 0
            b = np.asarray(out_edge) > 0
            if not a.any() and not b.any():
                continue
            ad = np.asarray(src_edge.filter(ImageFilter.MaxFilter(3))) > 0
            bd = np.asarray(out_edge.filter(ImageFilter.MaxFilter(3))) > 0
            source_count += int(a.sum())
            converted_count += int(b.sum())
            true_positive += int((b & ad).sum())
            # Symmetric match is averaged later with the forward match.
            true_positive += int((a & bd).sum())
    precision = true_positive / (2 * converted_count) if converted_count else 0.0
    recall = true_positive / (2 * source_count) if source_count else 0.0
    f1 = 2 * precision * recall / (precision + recall) if precision + recall else 0.0
    return f1 if source_count else None


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
    explicit = total - counts.get("(inherited)", 0)
    available = sum(count for name, count in counts.items()
                    if name != "(inherited)" and name.casefold() in installed_fonts)
    return (
        round(available / explicit, 4) if explicit else None,
        round(counts.get("(inherited)", 0) / total, 4) if total else None,
        available,
        explicit,
    )


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


def benchmark_one(app, source: Path, entry, installed_fonts):
    record = {key: entry.get(key) for key in ("title", "creator", "doi", "license", "file")}
    record.update({"file_bytes": source.stat().st_size, "status": "ok", "error": ""})
    deck = None
    source_pdf = typst_pdf = None
    stage = "source_parse"
    try:
        deck, stats, _ = pptx_stats(source, installed_fonts)
        record.update(stats)
        boxes = text_boxes_by_slide(deck)
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
                raise RuntimeError("typst compile: " + (typst.stderr or typst.stdout)[-1500:])
            stage = "powerpoint_render"
            export_powerpoint_pdf(app, source, original_pdf_path)
            stage = "pdf_metrics"
            source_pdf, source_text, source_sizes, source_page_sizes = pdf_text_and_sizes(original_pdf_path)
            try:
                typst_pdf, converted_text, converted_sizes, converted_page_sizes = pdf_text_and_sizes(converted_pdf_path)
                record.update(overlap_metrics(source_text, converted_text))
                record["pages_source_pdf"] = len(source_pdf)
                record["pages_typst_pdf"] = len(typst_pdf)
                record["source_pdf_mean_font_pt"] = mean_or_none(source_sizes)
                record["typst_pdf_mean_font_pt"] = mean_or_none(converted_sizes)
                record["mean_font_size_abs_delta_pt"] = (
                    round(abs(record["source_pdf_mean_font_pt"] - record["typst_pdf_mean_font_pt"]), 3)
                    if record["source_pdf_mean_font_pt"] is not None and record["typst_pdf_mean_font_pt"] is not None
                    else None
                )
                record["slide_size_matches"] = (
                    len(source_page_sizes) == len(converted_page_sizes)
                    and all(abs(a - c) < 1 for p, q in zip(source_page_sizes, converted_page_sizes)
                            for a, c in zip(p, q))
                )
                record["text_frame_edge_f1"] = text_edge_f1(source_pdf, typst_pdf, boxes)
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
        for index, entry in enumerate(entries, start + 1):
            source = ROOT / entry["file"]
            print(f"[{index}/{len(manifest['files'])}] {entry['title']}", flush=True)
            row = benchmark_one(app, source, entry, installed_fonts)
            rows.append(row)
            print(f"  {row['status']} | words={row.get('word_recall')} | frame-edge={row.get('text_frame_edge_f1')}"
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
        entries = entries[args.start:args.end if args.end is not None else args.start + args.limit]
        if not entries:
            raise SystemExit("No benchmark entries selected")
        rows = run_powerpoint_batch(entries, args.start, manifest, installed_fonts)
        existing = []
        if RESULTS.is_file() and args.start:
            with RESULTS.open(encoding="utf-8-sig", newline="") as stream:
                existing = list(csv.DictReader(stream))
        if existing:
            by_file = {row.get("file"): row for row in existing}
            by_file.update({row.get("file"): row for row in rows})
            combined = [by_file[entry["file"]] for entry in manifest["files"]
                        if entry.get("file") in by_file]
        else:
            combined = rows
    succeeded = [row for row in combined if row.get("status") == "ok"]
    errors = [row for row in combined if row.get("status") != "ok"]
    weighted_words = sum(int(row.get("source_pdf_words") or 0) * float(row.get("word_recall") or 0) for row in succeeded)
    total_words = sum(int(row.get("source_pdf_words") or 0) for row in succeeded)
    ink = [float(row["text_frame_edge_f1"]) for row in succeeded if row.get("text_frame_edge_f1") not in (None, "")]
    font_delta = [float(row["mean_font_size_abs_delta_pt"]) for row in succeeded if row.get("mean_font_size_abs_delta_pt") not in (None, "")]
    word_recall = [float(row["word_recall"]) for row in succeeded if row.get("word_recall") not in (None, "")]
    for row in combined:
        explicit_share, inherited_share, available_chars, explicit_chars = font_shares(
            row.get("source_fonts", ""), installed_fonts
        )
        row["installed_font_char_share"] = explicit_share
        row["inherited_font_char_share"] = inherited_share
        row["installed_font_characters"] = available_chars
        row["explicit_font_characters"] = explicit_chars
        if row.get("status") != "ok":
            row["failure_category"] = row.get("failure_category") or failure_category(
                row.get("error", ""), row.get("failure_stage", "")
            )
    known = [float(row["installed_font_char_share"]) for row in combined if row.get("installed_font_char_share") not in (None, "")]
    inherited = [float(row["inherited_font_char_share"]) for row in combined if row.get("inherited_font_char_share") not in (None, "")]
    explicit_total = sum(int(row.get("explicit_font_characters") or 0) for row in combined)
    explicit_installed = sum(int(row.get("installed_font_characters") or 0) for row in combined)
    RESULTS.parent.mkdir(parents=True, exist_ok=True)
    columns = list(dict.fromkeys(key for row in combined for key in row))
    with RESULTS.open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(combined)
    summary = [
        "# PPTX to Typst text fidelity benchmark",
        "",
        f"- Corpus: [Zenodo10K](https://huggingface.co/datasets/Forceless/Zenodo10K), sampled deterministically; all selected records are CC BY 4.0.",
        f"- Sample size: {len(manifest['files'])} downloaded decks; measurements recorded for {len(combined)}.",
        f"- Successful conversions and renders: {len(succeeded)}; failures: {len(errors)}.",
        f"- Source slides rendered: {sum(int(row.get('slides_source') or 0) for row in succeeded)}.",
        f"- Source PDF words: {total_words:,}.",
        f"- Weighted visible-word recall: {weighted_words / total_words:.1%}." if total_words else "- Weighted visible-word recall: n/a.",
        f"- Mean per-deck visible-word recall: {sum(word_recall) / len(word_recall):.1%}; median {sorted(word_recall)[len(word_recall) // 2]:.1%}." if word_recall else "- Per-deck visible-word recall: n/a.",
        f"- Mean per-deck text-frame edge F1 (1 px tolerance): {sum(ink) / len(ink):.1%}; median {sorted(ink)[len(ink) // 2]:.1%}." if ink else "- Text-frame edge F1: n/a.",
        f"- Mean per-deck absolute PDF font-size difference: {sum(font_delta) / len(font_delta):.2f} pt; median {sorted(font_delta)[len(font_delta) // 2]:.2f} pt." if font_delta else "- PDF font-size difference: n/a.",
        f"- Explicitly named text uses locally available fonts for {explicit_installed / explicit_total:.1%} of characters across the sample; mean per-deck share {sum(known) / len(known):.1%}." if explicit_total else "- Explicit available-font share: n/a.",
        f"- Mean share of text inheriting a font from its theme/layout: {sum(inherited) / len(inherited):.1%}; inherited families are not counted as confirmed installed fonts." if inherited else "- Inherited-font share: n/a.",
        "- Text-frame edge F1 compares rendered edge pixels inside source text-frame rectangles, with a one-pixel tolerance. It includes frame backgrounds and outlines, and is a coarse visual proxy for text layout, wrapping, size and font-shape similarity rather than a pure glyph mask.",
        "- Tables contribute to PDF word metrics but are excluded from the text-frame edge score; grouped text-frame bounds can also be approximate.",
        "- Word recall compares text extracted from PowerPoint-exported PDFs and Typst PDFs. Differences in reading order are ignored; repeated or missing visible words lower the score.",
        "- Font-size difference compares character-weighted average font sizes extracted from the two PDFs. These aggregate metrics are affected by unsupported objects and font substitution.",
        "- Source attribution, license, DOI and download checksums are in [manifest.json](manifest.json). Per-deck measurements are in [results.csv](results.csv). PPTX files are in the ignored local `data/input/` directory.",
    ]
    if errors:
        summary.extend(["", "## Failure categories", ""])
        for category, count in Counter(row.get("failure_category", "Benchmark error") for row in errors).most_common():
            summary.append(f"- {category}: {count} deck(s). Details are in `results.csv`.")
    SUMMARY.write_text("\n".join(summary) + "\n", encoding="utf-8")
    print(f"Wrote {RESULTS} and {SUMMARY}")


if __name__ == "__main__":
    main()
