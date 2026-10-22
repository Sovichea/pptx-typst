"""Small dependency-free helpers for auditing generated Typst source."""
from __future__ import annotations

import re


def structural_audit(manifest, typst_source):
    """Check emitted Place calls using stable source-object marker comments.

    This confirms that an object represented in the generated source has a
    corresponding emitted placement marker. It does not measure geometry or
    prove that the compiled PDF paints that object correctly.
    """
    markers = list(re.finditer(r"^\s*// pptx-object: ([^\s]+)\s*$", typst_source, re.MULTILINE))
    emitted = {marker.group(1) for marker in markers}
    emitted_geometry = {}
    for marker in markers:
        following = typst_source[marker.end():marker.end() + 500]
        placed = re.search(
            r"#Place\(\s*x\s*:\s*(-?[\d.]+)pt,\s*y\s*:\s*(-?[\d.]+)pt,"
            r"\s*orientation\s*:\s*(-?[\d.]+)deg,",
            following,
        )
        if placed:
            emitted_geometry[marker.group(1)] = tuple(float(value) for value in placed.groups())
    expected = set()
    geometry_errors = []
    for owner in [*manifest.get("masters", []), *manifest.get("layouts", []), *manifest.get("slides", [])]:
        owner_type = owner.get("owner", "slide")
        owner_id = owner.get("id", owner.get("slide"))
        for placement in owner.get("placements", []):
            shape_id = placement.get("source_shape_id")
            if shape_id is not None:
                key = f"{owner_type}:{owner_id}:{shape_id}"
                expected.add(key)
                if (key in emitted_geometry and not placement.get("group_path")
                        and placement.get("type") in {"text", "line", "table", "smartart", "image"}
                        and all(name in placement for name in ("x", "y", "rot"))):
                    out_x, out_y, out_rotation = emitted_geometry[key]
                    geometry_errors.append((
                        abs(out_x - float(placement["x"])),
                        abs(out_y - float(placement["y"])),
                        abs(out_rotation - float(placement["rot"])),
                    ))
    covered = expected & emitted
    position_errors = [axis_error for dx, dy, _ in geometry_errors for axis_error in (dx, dy)]
    rotation_errors = [rotation for _, _, rotation in geometry_errors]
    return {
        "source_object_placements": len(expected),
        "typst_emitted_source_objects": len(covered),
        "typst_source_object_coverage": round(len(covered) / len(expected), 4) if expected else None,
        "source_objects_without_emitted_place": len(expected - emitted),
        "emitted_place_markers_without_source_record": len(emitted - expected),
        "geometry_checked_ungrouped_placements": len(geometry_errors),
        "generated_place_position_mae_pt": round(sum(position_errors) / len(position_errors), 4) if position_errors else None,
        "generated_place_position_max_error_pt": round(max(position_errors), 4) if position_errors else None,
        "generated_place_positions_within_0_5pt": sum(dx <= 0.5 and dy <= 0.5 for dx, dy, _ in geometry_errors),
        "generated_place_rotation_mae_deg": round(sum(rotation_errors) / len(rotation_errors), 4) if rotation_errors else None,
        "source_object_missing_keys": sorted(expected - emitted),
        "source_object_unmatched_emission_keys": sorted(emitted - expected),
    }
