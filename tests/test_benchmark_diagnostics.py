from pptx_typst.typst_source_diagnostics import structural_audit as typst_source_structural_audit


def test_structural_audit_requires_emitted_typst_source_marker():
    manifest = {
        "masters": [{"owner": "master", "id": "MasterA", "placements": [
            {"source_shape_id": 2},
        ]}],
        "layouts": [],
        "slides": [{"slide": 1, "placements": [
            {"source_shape_id": 4, "type": "text", "x": 5, "y": 6, "rot": 0},
            {"source_shape_id": 5},
        ]}],
    }
    generated_typst = """
// pptx-object: master:MasterA:2
#Place(x: 1pt, y: 2pt, orientation: 0deg, child: rect(width: 3pt, height: 4pt))
// pptx-object: slide:1:4
#Place(x: 5pt, y: 6pt, orientation: 0deg, child: text[Title])
"""

    result = typst_source_structural_audit(manifest, generated_typst)

    assert result["source_object_placements"] == 3
    assert result["typst_emitted_source_objects"] == 2
    assert result["typst_source_object_coverage"] == 0.6667
    assert result["source_object_missing_keys"] == ["slide:1:5"]
    assert result["emitted_place_markers_without_source_record"] == 0
    assert result["geometry_checked_ungrouped_placements"] == 1
    assert result["generated_place_position_mae_pt"] == 0
    assert result["generated_place_positions_within_0_5pt"] == 1


def test_structural_audit_flags_unmatched_typst_markers():
    result = typst_source_structural_audit(
        {"slides": [{"slide": 3, "placements": []}]},
        "// pptx-object: slide:3:99\n#Place(x: 0pt, y: 0pt, child: rect())",
    )

    assert result["source_object_placements"] == 0
    assert result["typst_source_object_coverage"] is None
    assert result["emitted_place_markers_without_source_record"] == 1
    assert result["source_object_unmatched_emission_keys"] == ["slide:3:99"]
