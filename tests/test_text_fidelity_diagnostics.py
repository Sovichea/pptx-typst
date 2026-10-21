from __future__ import annotations

from tools.analyze_text_placement import assign_pdf_blocks_to_shapes
from tools.run_text_fidelity_benchmark import match_text_blocks_spatial


def block(text: str, x: float, y: float) -> dict:
    return {"text": text, "start": (x, y)}


def test_spatial_match_disambiguates_repeated_labels_by_location() -> None:
    source = [block("Section", 20, 30), block("Section", 320, 30)]
    output = [block("Section", 322, 32), block("Section", 19, 29)]

    result = match_text_blocks_spatial(source, output)

    assert {(m["source_index"], m["output_index"]) for m in result["matches"]} == {(1, 0), (0, 1)}
    assert result["ambiguous_source_count"] == 0
    assert result["ambiguous_output_count"] == 0
    assert max(m["distance"] for m in result["matches"]) < 3


def test_spatial_match_reports_tied_repeated_text_as_ambiguous() -> None:
    source = [block("Title", 100, 100), block("Title", 100, 100)]
    output = [block("Title", 100, 100), block("Title", 100, 100)]

    result = match_text_blocks_spatial(source, output)

    assert result["matches"] == []
    assert result["ambiguous_source_count"] == 2
    assert result["ambiguous_output_count"] == 2
    assert result["unmatched_source_count"] == 0
    assert result["unmatched_output_count"] == 0


def test_spatial_match_does_not_assign_distant_or_unrelated_blocks() -> None:
    source = [block("Project timeline", 10, 10), block("Label", 100, 100)]
    output = [block("Completely different", 10, 10), block("Project timeline", 400, 400)]

    result = match_text_blocks_spatial(source, output)

    assert result["matches"] == []
    assert result["ambiguous_source_count"] == 0
    assert result["unmatched_source_count"] == 2
    assert result["unmatched_output_count"] == 2


def test_pdf_blocks_attach_to_repeated_text_objects_using_frame_geometry() -> None:
    shapes = {
        "left": {"text": "Repeated title", "geometry": {"x": 10, "y": 10, "w": 100, "h": 30}},
        "right": {"text": "Repeated title", "geometry": {"x": 300, "y": 10, "w": 100, "h": 30}},
    }
    blocks = [
        {"text": "Repeated title", "bbox": (302, 12, 370, 30)},
        {"text": "Repeated title", "bbox": (12, 12, 80, 30)},
    ]

    assigned, ambiguous, unmatched = assign_pdf_blocks_to_shapes(blocks, shapes)

    assert [len(assigned[key]) for key in ("left", "right")] == [1, 1]
    assert ambiguous == 0
    assert unmatched == 0


def test_pdf_block_shape_attribution_reports_overlapping_ambiguity() -> None:
    shapes = {
        "one": {"text": "Repeated title", "geometry": {"x": 10, "y": 10, "w": 100, "h": 30}},
        "two": {"text": "Repeated title", "geometry": {"x": 10, "y": 10, "w": 100, "h": 30}},
    }
    blocks = [{"text": "Repeated title", "bbox": (12, 12, 80, 30)}]

    assigned, ambiguous, unmatched = assign_pdf_blocks_to_shapes(blocks, shapes)

    assert not any(assigned.values())
    assert ambiguous == 1
    assert unmatched == 0


def test_pdf_page_number_is_not_mistaken_for_a_token_in_a_long_text_frame() -> None:
    shapes = {
        "body": {"text": "Study results from 2021 show broader trends", "geometry": {"x": 20, "y": 20, "w": 640, "h": 400}},
    }
    blocks = [{"text": "21", "bbox": (690, 8, 713, 20)}]

    assigned, ambiguous, unmatched = assign_pdf_blocks_to_shapes(blocks, shapes)

    assert not any(assigned.values())
    assert ambiguous == 0
    assert unmatched == 1
