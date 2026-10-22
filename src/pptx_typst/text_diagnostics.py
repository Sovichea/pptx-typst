"""Pure-Python helpers for matching rendered text during fidelity analysis."""
from __future__ import annotations

from collections import Counter, defaultdict
from difflib import SequenceMatcher
import math
import re
from statistics import median
import unicodedata


WORD_RE = re.compile(r"[\w]+", re.UNICODE)


def normalize_text_tokens(text):
    normalized = unicodedata.normalize("NFKC", text).casefold()
    return re.findall(r"[^\W_]+", normalized, flags=re.UNICODE)


def assign_lines_to_paragraphs(lines, paragraphs):
    """Assign rendered lines to source paragraphs through ordered token evidence.

    A line is assigned only when at least 80% of its tokens map monotonically
    to one paragraph. Repeated words are disambiguated by sequence alignment
    over the whole text frame rather than by a local fuzzy match.
    """
    paragraph_tokens = [normalize_text_tokens(paragraph) for paragraph in paragraphs]
    expected = [token for group in paragraph_tokens for token in group]
    expected_paragraph = [index for index, group in enumerate(paragraph_tokens) for _ in group]
    rendered_lines = [normalize_text_tokens(line.get("text", "")) for line in lines]
    rendered = [token for group in rendered_lines for token in group]
    mapping = {}
    for block in SequenceMatcher(None, expected, rendered, autojunk=False).get_matching_blocks():
        for offset in range(block.size):
            mapping[block.b + offset] = block.a + offset
    output, cursor, unmatched = [], 0, 0
    for tokens in rendered_lines:
        mapped = [expected_paragraph[mapping[i]] for i in range(cursor, cursor + len(tokens)) if i in mapping]
        cursor += len(tokens)
        counts = {paragraph: mapped.count(paragraph) for paragraph in set(mapped)}
        paragraph = max(counts, key=counts.get) if counts else None
        confidence = counts.get(paragraph, 0) / max(1, len(tokens)) if paragraph is not None else 0.0
        if confidence < 0.8:
            unmatched += 1
            output.append(None)
        else:
            output.append(paragraph)
    return output, unmatched


def paragraph_render_metrics(source_lines, output_lines, paragraphs):
    """Separate within-paragraph line pitch from paragraph-start displacement."""
    source_ids, source_unmatched = assign_lines_to_paragraphs(source_lines, paragraphs)
    output_ids, output_unmatched = assign_lines_to_paragraphs(output_lines, paragraphs)
    source_by_paragraph, output_by_paragraph = {}, {}
    for lines, ids, target in ((source_lines, source_ids, source_by_paragraph),
                               (output_lines, output_ids, output_by_paragraph)):
        for line, paragraph in zip(lines, ids):
            if paragraph is not None:
                target.setdefault(paragraph, []).append(line)
    start_deltas, pitch_deltas = [], []
    paragraph_pairs = []
    line_count_matches = line_segmentation_matches = 0
    paragraph_count_compared = 0
    for paragraph in sorted(source_by_paragraph.keys() & output_by_paragraph.keys()):
        source = source_by_paragraph[paragraph]
        output = output_by_paragraph[paragraph]
        paragraph_count_compared += 1
        start_delta = abs(float(source[0]["baseline"]) - float(output[0]["baseline"]))
        start_deltas.append(start_delta)
        same_lines = (len(source) == len(output)
                      and all(normalize_text_tokens(a["text"]) == normalize_text_tokens(b["text"])
                              for a, b in zip(source, output)))
        paragraph_pairs.append({
            "paragraph_index": paragraph,
            "source_start_baseline_pt": float(source[0]["baseline"]),
            "typst_start_baseline_pt": float(output[0]["baseline"]),
            "start_displacement_pt": start_delta,
            "source_line_count": len(source),
            "typst_line_count": len(output),
            "same_line_segmentation": same_lines,
        })
        if len(source) == len(output):
            line_count_matches += 1
            if same_lines:
                line_segmentation_matches += 1
                pitch_deltas.extend(abs((float(source[i]["baseline"]) - float(source[i - 1]["baseline"]))
                                        - (float(output[i]["baseline"]) - float(output[i - 1]["baseline"])))
                                    for i in range(1, len(source)))
    return {
        "paragraph_start_pairs": paragraph_count_compared,
        "paragraph_start_mean_abs_displacement_pt": float(sum(start_deltas) / len(start_deltas)) if start_deltas else None,
        "paragraph_start_median_abs_displacement_pt": median(start_deltas) if start_deltas else None,
        "paragraphs_with_same_line_count": line_count_matches,
        "paragraphs_with_identical_line_segmentation": line_segmentation_matches,
        "paragraph_pairs": paragraph_pairs,
        "line_pitch_intervals_compared": len(pitch_deltas),
        "line_pitch_mean_abs_error_pt": float(sum(pitch_deltas) / len(pitch_deltas)) if pitch_deltas else None,
        "line_pitch_median_abs_error_pt": median(pitch_deltas) if pitch_deltas else None,
        "source_unmatched_lines": source_unmatched,
        "typst_unmatched_lines": output_unmatched,
        "_pitch_deltas": pitch_deltas,
        "_start_deltas": start_deltas,
    }


def align_pdf_pages_to_slides(total_slides, hidden_slide_indices, source_pdf_pages, typst_pdf_pages):
    """Map visible PowerPoint PDF pages to Typst pages by source slide order.

    PowerPoint's default PDF export omits hidden slides. The converter retains
    every source slide in Typst, including hidden slides, so source PDF page
    indices map to the corresponding original slide indices.
    """
    hidden = set(hidden_slide_indices)
    if any(index < 0 or index >= total_slides for index in hidden):
        return None, "hidden slide index is outside the source presentation"
    visible_slides = [index for index in range(total_slides) if index not in hidden]
    if source_pdf_pages != len(visible_slides):
        return None, (f"PowerPoint exported {source_pdf_pages} pages for "
                      f"{len(visible_slides)} visible source slides")
    if typst_pdf_pages != total_slides:
        return None, (f"Typst rendered {typst_pdf_pages} pages for "
                      f"{total_slides} source slides")
    return {pdf_index: slide_index for pdf_index, slide_index in enumerate(visible_slides)}, None


def select_low_text_slides(slide_scores, count=3):
    """Choose the lowest-scoring font-supported slides for visual review."""
    scored = [item for item in slide_scores if item.get("text_fidelity_score") is not None]
    return sorted(scored, key=lambda item: (item["text_fidelity_score"], item["slide"]))[:count]


def match_text_blocks_spatial(source_blocks, output_blocks, *, min_similarity=0.72,
                              max_distance_pt=180.0, ambiguity_tolerance_pt=4.0):
    """Match PDF text blocks using text and position, reporting uncertain pairs."""
    candidates = []
    by_source = defaultdict(list)
    by_output = defaultdict(list)
    for source_index, source in enumerate(source_blocks):
        source_text = " ".join(WORD_RE.findall(source["text"].casefold()))
        if not source_text:
            continue
        for output_index, output in enumerate(output_blocks):
            output_text = " ".join(WORD_RE.findall(output["text"].casefold()))
            if not output_text:
                continue
            similarity = SequenceMatcher(None, source_text, output_text, autojunk=False).ratio()
            if similarity < min_similarity:
                continue
            dx = float(source["start"][0]) - float(output["start"][0])
            dy = float(source["start"][1]) - float(output["start"][1])
            distance = math.hypot(dx, dy)
            if distance > max_distance_pt:
                continue
            # Content establishes identity; distance breaks repeated-text ties.
            rank = similarity - 0.12 * distance / max_distance_pt
            item = {"source_index": source_index, "output_index": output_index,
                    "similarity": similarity, "dx": dx, "dy": dy,
                    "distance": distance, "rank": rank}
            candidates.append(item)
            by_source[source_index].append(item)
            by_output[output_index].append(item)

    ambiguous_sources = set()
    ambiguous_outputs = set()
    for mapping, key_name in ((by_source, "output_index"), (by_output, "source_index")):
        for index, items in mapping.items():
            ranked = sorted(items, key=lambda item: (-item["rank"], item["distance"]))
            if len(ranked) < 2:
                continue
            first, second = ranked[:2]
            if (abs(first["similarity"] - second["similarity"]) <= 0.02
                    and abs(first["distance"] - second["distance"]) <= ambiguity_tolerance_pt):
                if key_name == "output_index":
                    ambiguous_sources.add(index)
                else:
                    ambiguous_outputs.add(index)

    blocked_sources = set(ambiguous_sources)
    blocked_outputs = set(ambiguous_outputs)
    used_sources, used_outputs, matches = set(), set(), []
    for item in sorted(candidates, key=lambda pair: (-pair["rank"], pair["distance"])):
        source_index, output_index = item["source_index"], item["output_index"]
        if (source_index in blocked_sources or output_index in blocked_outputs
                or source_index in used_sources or output_index in used_outputs):
            continue
        used_sources.add(source_index)
        used_outputs.add(output_index)
        matches.append({**item, "source": source_blocks[source_index],
                        "output": output_blocks[output_index]})
    return {
        "matches": matches,
        "ambiguous_source_count": len(ambiguous_sources),
        "ambiguous_output_count": len(ambiguous_outputs),
        "unmatched_source_count": len(source_blocks) - len(used_sources) - len(ambiguous_sources),
        "unmatched_output_count": len(output_blocks) - len(used_outputs) - len(ambiguous_outputs),
    }


def _block_frame_evidence(block, shape):
    x, y, width, height = (float(shape["geometry"][key]) for key in ("x", "y", "w", "h"))
    x0, y0, x1, y1 = block["bbox"]
    intersection = max(0., min(x1, x + width) - max(x0, x)) * max(0., min(y1, y + height) - max(y0, y))
    area = max(1., (x1 - x0) * (y1 - y0))
    overlap = intersection / area
    center_x, center_y = (x0 + x1) / 2, (y0 + y1) / 2
    dx = max(x - center_x, 0., center_x - (x + width))
    dy = max(y - center_y, 0., center_y - (y + height))
    return overlap, math.hypot(dx, dy)


def assign_pdf_blocks_to_shapes(blocks, shapes, *, minimum_text_evidence=0.58,
                                maximum_frame_distance_pt=72., ambiguity_distance_pt=3.):
    """Attach extracted PDF spans to source text objects using text and frame evidence."""
    assigned = {shape_id: [] for shape_id in shapes}
    ambiguous = unmatched = 0
    pieces = [span for block in blocks for span in block.get("spans", [])]
    if not pieces:
        pieces = blocks
    for block in pieces:
        block_words = Counter(WORD_RE.findall(block["text"].casefold()))
        if not block_words:
            unmatched += 1
            continue
        if len(block_words) == 1:
            only_word = next(iter(block_words))
            # Page numbers and single-character bullets are weak object identity.
            if only_word.isdecimal() or len(only_word) <= 1:
                unmatched += 1
                continue
        candidates = []
        for shape_id, shape in shapes.items():
            shape_words = Counter(WORD_RE.findall(shape["text"].casefold()))
            if not shape_words:
                continue
            common = sum((block_words & shape_words).values())
            coverage = common / sum(block_words.values())
            sequence = SequenceMatcher(None, " ".join(block_words.elements()),
                                       " ".join(shape_words.elements()), autojunk=False).ratio()
            evidence = max(coverage, sequence)
            if evidence < minimum_text_evidence:
                continue
            overlap, distance = _block_frame_evidence(block, shape)
            if distance > maximum_frame_distance_pt:
                continue
            rank = evidence + .08 * overlap - .001 * distance
            candidates.append((rank, evidence, overlap, distance, shape_id))
        candidates.sort(reverse=True)
        if not candidates:
            unmatched += 1
            continue
        if len(candidates) > 1:
            best, second = candidates[:2]
            if (abs(best[1] - second[1]) <= .02
                    and abs(best[2] - second[2]) <= .08
                    and abs(best[3] - second[3]) <= ambiguity_distance_pt):
                ambiguous += 1
                continue
        assigned[candidates[0][4]].append(block)
    return assigned, ambiguous, unmatched
