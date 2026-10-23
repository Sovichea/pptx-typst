from __future__ import annotations

import importlib.util
import json
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
SKILL = ROOT / ".agents" / "skills" / "pptx-typst-design"


def _load(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec and spec.loader
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_semantic_component_lowering_emits_shared_static_bounds() -> None:
    lowerer = _load("lower_components", SKILL / "scripts" / "lower_components.py")
    code, manifest = lowerer.lower({
        "components": [{
            "id": "card-1", "slide": 1, "kind": "card", "x": 24, "y": 32,
            "width": 240, "height": 120, "text": "Aligned",
            "fill": "#FFFFFF", "stroke": "#222222", "radius": 12,
            "padding": {"left": 12, "right": 12, "top": 8, "bottom": 8},
            "align": "center", "anchor": "center",
        }]
    })
    assert "PptxRect(width: 240pt, height: 120pt" in code
    assert "child: PptxTextFrame(" in code
    assert "width: 240pt" in code and "height: 120pt" in code
    assert code.count("x: 24pt, y: 32pt") == 2
    assert 'PptxParagraph(\n        align: "center"' in code
    assert 'anchor: "center"' in code
    assert "PptxSemantic" not in code
    assert manifest["components"][0]["text_frame_bounds_pt"] == [24.0, 32.0, 240.0, 120.0]


def test_semantic_component_preserves_paragraph_spacing_semantics() -> None:
    lowerer = _load("lower_components", SKILL / "scripts" / "lower_components.py")
    code, _ = lowerer.lower({"components": [{
        "id": "spaced", "slide": 1, "kind": "label", "x": 0, "y": 0,
        "width": 240, "height": 120, "paragraphs": [
            {"text": "Heading", "size": 20, "after": 8},
            {"text": "Body", "size": 12, "target_pitch": 15},
        ],
    }]})
    assert "after: 8pt" in code
    assert "target-pitch: 15pt" in code


def test_semantic_row_and_stack_lower_to_literal_positions() -> None:
    lowerer = _load("lower_components", SKILL / "scripts" / "lower_components.py")
    code, _ = lowerer.lower({"components": [{
        "id": "row", "kind": "row", "x": 10, "y": 20, "width": 220, "height": 60,
        "gap": 20, "items": [
            {"id": "left", "kind": "label", "text": "Left", "width": 100},
            {"id": "right", "kind": "label", "text": "Right", "width": 100},
        ],
    }]})
    assert "x: 10pt, y: 20pt" in code
    assert "x: 130pt, y: 20pt" in code
    assert "PptxTextFrame" in code


def test_semantic_component_validation_rejects_unknown_kinds_and_duplicate_ids() -> None:
    lowerer = _load("lower_components", SKILL / "scripts" / "lower_components.py")
    with pytest.raises(ValueError, match="unsupported component kind"):
        lowerer.lower({"components": [{"id": "bad", "kind": "freeform"}]})
    with pytest.raises(ValueError, match="duplicate component id"):
        lowerer.lower({"components": [
            {"id": "same", "kind": "label", "x": 0, "y": 0, "width": 40, "height": 20, "text": "A"},
            {"id": "same", "kind": "label", "x": 0, "y": 30, "width": 40, "height": 20, "text": "B"},
        ]})


def test_component_qa_distinguishes_authoring_and_conversion_differences(tmp_path: Path) -> None:
    fitz = pytest.importorskip("fitz")
    inspector = _load("inspect_deck", SKILL / "scripts" / "inspect_deck.py")
    source = fitz.open()
    page = source.new_page(width=960, height=540)
    page.insert_text((180, 180), "CENTER", fontsize=24)
    source_path = tmp_path / "source.pdf"
    source.save(source_path)
    text_rect = page.search_for("CENTER")[0]
    source.close()

    # Make the source frame's center exactly match the source glyph center.
    center_x = (text_rect.x0 + text_rect.x1) / 2
    center_y = (text_rect.y0 + text_rect.y1) / 2
    component = {
        "id": "center-label", "slide": 1, "text": "CENTER", "text_lines": ["CENTER"],
        "container_bounds_pt": [center_x - 100, center_y - 40, 200, 80],
        "text_frame_bounds_pt": [center_x - 100, center_y - 40, 200, 80],
        "padding_pt": {"left": 0, "right": 0, "top": 0, "bottom": 0},
        "horizontal": "center", "vertical": "center",
    }
    authoring = inspector._component_measurements(source_path, [component], 2, 3)
    assert authoring["components"][0]["status"] == "pass"

    shifted = fitz.open()
    shifted_page = shifted.new_page(width=960, height=540)
    shifted_page.insert_text((210, 180), "CENTER", fontsize=24)
    rendered_path = tmp_path / "shifted.pdf"
    shifted.save(rendered_path)
    shifted.close()
    converted = inspector._component_measurements(rendered_path, [component], 2, 3)
    assert converted["components"][0]["status"] == "misaligned_or_overflow"
    comparison = inspector._compare_component_measurements(authoring, converted, "LibreOffice")["components"][0]
    assert comparison["classification"] == "font_state_unverified_or_ambiguous"
    assert "possible converter geometry error" in comparison["geometry_assessment"]
    powerpoint_result = inspector._compare_component_measurements(authoring, converted, "PowerPoint")["components"][0]
    assert powerpoint_result["classification"] == "font_state_unverified_or_ambiguous"
    assert "possible converter geometry error" in powerpoint_result["geometry_assessment"]


def test_component_qa_reports_missing_matches_as_unavailable(tmp_path: Path) -> None:
    fitz = pytest.importorskip("fitz")
    inspector = _load("inspect_deck", SKILL / "scripts" / "inspect_deck.py")
    document = fitz.open()
    document.new_page(width=960, height=540)
    path = tmp_path / "empty.pdf"
    document.save(path)
    document.close()
    row = inspector._component_measurements(path, [{
        "id": "missing", "slide": 1, "text": "Not present", "text_lines": ["Not present"],
        "text_frame_bounds_pt": [10, 10, 200, 80], "container_bounds_pt": [10, 10, 200, 80],
        "horizontal": "center", "vertical": "center",
    }], 2, 3)["components"][0]
    assert row["status"] == "unavailable"
    assert row["reason"] == "text_not_found"


def test_component_qa_groups_wrapped_paragraph_lines(tmp_path: Path) -> None:
    fitz = pytest.importorskip("fitz")
    inspector = _load("inspect_deck", SKILL / "scripts" / "inspect_deck.py")
    document = fitz.open()
    page = document.new_page(width=200, height=120)
    page.insert_textbox(fitz.Rect(10, 10, 120, 100), "This is a deliberately wrapped paragraph", fontsize=12)
    path = tmp_path / "wrapped.pdf"
    document.save(path)
    document.close()

    row = inspector._component_measurements(path, [{
        "id": "wrapped", "slide": 1, "text": "This is a deliberately wrapped paragraph",
        "text_lines": ["This is a deliberately wrapped paragraph"],
        "text_frame_bounds_pt": [10, 10, 110, 90], "container_bounds_pt": [10, 10, 110, 90],
        "padding_pt": {"left": 0, "top": 0}, "horizontal": "left", "vertical": "top",
    }], 2, 3)["components"][0]
    assert row["status"] == "pass"
    assert row["expected_paragraph_count"] == 1
    assert row["rendered_line_count"] == 2


def test_component_qa_uses_reference_ink_bounds_for_top_anchored_text(tmp_path: Path) -> None:
    fitz = pytest.importorskip("fitz")
    inspector = _load("inspect_deck", SKILL / "scripts" / "inspect_deck.py")
    document = fitz.open()
    page = document.new_page(width=200, height=120)
    page.insert_text((30, 30), "INK", fontsize=12)
    path = tmp_path / "top-anchored.pdf"
    expected = page.search_for("INK")[0]
    document.save(path)
    document.close()

    row = inspector._component_measurements(path, [{
        "id": "top-ink", "slide": 1, "text": "INK", "text_lines": ["INK"],
        "container_bounds_pt": [20, 10, 100, 60], "text_frame_bounds_pt": [20, 10, 100, 60],
        "padding_pt": {"left": 10, "top": 0}, "horizontal": "left", "vertical": "top",
        # A font build may change the right ink edge while preserving the left/top
        # anchor. QA should report that shape difference without calling it drift.
        "reference_glyph_bounds_pt": [round(expected.x0, 3), round(expected.y0, 3),
                                      round(expected.x1 + 5, 3), round(expected.y1, 3)],
    }], 2, 3)["components"][0]
    assert row["status"] == "pass"
    assert row["vertical_alignment_error_pt"] > 3
    assert row["reference_edge_error_pt"] == 5
    assert row["reference_anchor_error_pt"] == [0, 0]


def test_component_qa_classifies_detected_font_substitution(tmp_path: Path) -> None:
    fitz = pytest.importorskip("fitz")
    inspector = _load("inspect_deck", SKILL / "scripts" / "inspect_deck.py")
    source = fitz.open()
    page = source.new_page(width=200, height=120)
    page.insert_text((30, 30), "LABEL", fontsize=12, fontname="helv")
    source_path = tmp_path / "source-label.pdf"
    source.save(source_path)
    bounds = page.search_for("LABEL")[0]
    source.close()
    component = {
        "id": "font-label", "slide": 1, "text": "LABEL", "text_lines": ["LABEL"],
        "font": "Inter", "container_bounds_pt": [0, 0, 150, 70],
        "text_frame_bounds_pt": [0, 0, 150, 70],
        "padding_pt": {"left": bounds.x0, "top": bounds.y0},
        "reference_glyph_bounds_pt": [bounds.x0, bounds.y0, bounds.x1, bounds.y1],
        "horizontal": "left", "vertical": "top",
    }
    authored = inspector._component_measurements(source_path, [component], 2, 3)

    output = fitz.open()
    output_page = output.new_page(width=200, height=120)
    output_page.insert_text((34, 30), "LABEL", fontsize=12, fontname="cour")
    output_path = tmp_path / "output-label.pdf"
    output.save(output_path)
    output.close()
    converted = inspector._component_measurements(output_path, [component], 2, 3)
    comparison = inspector._compare_component_measurements(authored, converted, "PowerPoint")["components"][0]
    assert comparison["classification"] == "detected_font_substitution"
    assert "compare text-frame geometry" in comparison["geometry_assessment"]
