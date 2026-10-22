"""Pure-Python helpers for matching rendered text during fidelity analysis."""
from __future__ import annotations

from collections import Counter, defaultdict
from difflib import SequenceMatcher
import math
import re


WORD_RE = re.compile(r"[\w]+", re.UNICODE)


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
