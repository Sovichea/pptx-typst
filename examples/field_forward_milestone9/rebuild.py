#!/usr/bin/env python3
"""Rebuild the handoff deck by replacing four verified component groups."""
from __future__ import annotations

import json
import math
from pathlib import Path
import re

import fitz

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "reference" / "before" / "main.typ"
COMPONENTS = ROOT / "components"
OUTPUT = ROOT / "main.typ"


def placement_calls(source: str) -> list[tuple[int, int, str, float, float]]:
    calls = []
    for match in re.finditer(r"#PptxPlace\(", source):
        start = match.start()
        depth = 0
        quoted = False
        escaped = False
        end = None
        for index in range(start + len("#PptxPlace"), len(source)):
            char = source[index]
            if quoted:
                if escaped:
                    escaped = False
                elif char == "\\":
                    escaped = True
                elif char == '"':
                    quoted = False
                continue
            if char == '"':
                quoted = True
            elif char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
                if depth == 0:
                    end = index + 1
                    break
        if end is None:
            raise ValueError("Unclosed PptxPlace call in source deck")
        call = source[start:end]
        coords = re.search(r"x:\s*([\d.]+)pt,\s*y:\s*([\d.]+)pt", call)
        if coords is None:
            raise ValueError(f"Could not read placement coordinates: {call[:100]!r}")
        line_start = source.rfind("\n", 0, start) + 1
        line_end = source.find("\n", end)
        if line_end == -1:
            line_end = len(source)
        else:
            line_end += 1
        calls.append((line_start, line_end, call, float(coords.group(1)), float(coords.group(2))))
    return calls


def component_fragments() -> dict[str, str]:
    fragments: dict[str, str] = {}
    for slide in (4, 5, 6, 7):
        content = (COMPONENTS / f"slide-{slide}.typ").read_text(encoding="utf-8")
        sections = re.split(r"(?m)^// component: ", content)
        for section in sections[1:]:
            ident, _, remainder = section.partition("\n")
            if not ident or ident in fragments:
                raise ValueError(f"Missing or duplicate lowered component id: {ident!r}")
            fragments[ident] = "// component: " + ident + "\n" + remainder.rstrip() + "\n"
    return fragments


def close(a: float, b: float) -> bool:
    return math.isclose(a, b, abs_tol=0.01)


def patch_slide(source: str, slide_number: int, predicate, insert: str) -> str:
    slides = list(re.finditer(r"(?m)^#PptxSlide\(", source))
    if slide_number < 1 or slide_number > len(slides):
        raise ValueError(f"Expected slide {slide_number}, found only {len(slides)} slides")
    start = slides[slide_number - 1].start()
    end = slides[slide_number].start() if slide_number < len(slides) else len(source)
    slide_text = source[start:end]
    selected = [row for row in placement_calls(slide_text) if predicate(row[2], row[3], row[4])]
    if not selected:
        raise ValueError(f"No source placements selected on slide {slide_number}")
    indent = "    "
    replacement = "\n".join(
        indent + line if line else "" for line in insert.rstrip().splitlines()
    ) + "\n"
    for index, (line_start, line_end, _call, _x, _y) in reversed(list(enumerate(selected))):
        slide_text = slide_text[:line_start] + (replacement if index == 0 else "") + slide_text[line_end:]
    return source[:start] + slide_text + source[end:]


def text_token(text: str):
    return lambda call, _x, _y: f")[{text}]" in call or f'text: "{text}"' in call


def shape_at(x: float, y: float, fragment: str) -> callable:
    return lambda call, px, py: close(px, x) and close(py, y) and fragment in call


def patch_text_labels(source: str, slide: int, tokens: list[str], fragments: dict[str, str]) -> str:
    for token in tokens:
        matching = [row for row in placement_calls(source) if text_token(token)(row[2], row[3], row[4])]
        if len(matching) != 1:
            raise ValueError(f"Expected exactly one '{token}' text placement; found {len(matching)}")
        ident = next((name for name, fragment in fragments.items() if f'text: "{token}"' in fragment), None)
        if ident is None:
            raise ValueError(f"No lowered component found for label {token!r}")
        # The exact source call is replaced in its owning slide by a location-qualified pass.
        x, y = matching[0][3], matching[0][4]
        fragment = fragments[ident]
        source = patch_slide(source, slide, lambda call, px, py, x=x, y=y, token=token:
                             close(px, x) and close(py, y) and text_token(token)(call, px, py), fragment)
        fragments.pop(ident)
    return source


def main() -> None:
    source = SOURCE.read_text(encoding="utf-8")
    fragments = component_fragments()
    slide4_ids = ["s4-observe-card", "s4-observe-badge", "s4-interpret-card",
                  "s4-interpret-badge", "s4-act-card", "s4-act-badge"]
    slide4_text = ["OBSERVE", "Sensors and devices capture field conditions.", "01",
                   "INTERPRET", "Software turns raw readings into decisions.", "02",
                   "ACT", "People and machines complete the task.", "03"]
    slide4_shape_coords = {(52, 278), (67, 294), (350, 278), (365, 294), (648, 278), (663, 294)}

    def slide4_target(call: str, x: float, y: float) -> bool:
        if any(close(x, px) and close(y, py) for px, py in slide4_shape_coords):
            return ("PptxRect(width: 260pt, height: 183pt" in call or
                    "PptxRect(width: 48pt, height: 48pt" in call or
                    any(text_token(text)(call, x, y) for text in slide4_text))
        return any(text_token(text)(call, x, y) for text in slide4_text)

    source = patch_slide(source, 4, slide4_target, "\n".join(fragments.pop(i) for i in slide4_ids))

    slide5_labels = [
        "FIELD OPERATIONS", "LIVE", "Soil moisture", "IRRIGATION", "Review",
        "GREENHOUSE", "Stable", "ILLUSTRATIVE INTERFACE  /  NOT LIVE DATA",
    ]
    for token in slide5_labels:
        source = patch_text_labels(source, 5, [token], fragments)

    slide6_text = ["CO-OP", "SHARED HUB", "SOFTWARE", "SERVICE", "TOOLS", "FIELD B", "FIELD A"]
    slide6_shape_coords = {(666, 213), (674, 100.5), (818, 181.5), (811, 360.5),
                          (559, 372.5), (528, 200.5)}

    def slide6_target(call: str, x: float, y: float) -> bool:
        if any(close(x, px) and close(y, py) for px, py in slide6_shape_coords):
            return ("PptxEllipse(width: 138pt, height: 138pt" in call or
                    "PptxRect(width: 118pt, height: 45pt" in call or
                    any(text_token(text)(call, x, y) for text in slide6_text))
        return ((close(x, 666) and close(y, 250) and text_token("CO-OP")(call, x, y)) or
                (close(x, 666) and close(y, 293) and text_token("SHARED HUB")(call, x, y)) or
                any(text_token(text)(call, x, y) for text in slide6_text))

    slide6_ids = ["s6-coop-hub", "s6-shared-hub-label", "s6-software-node", "s6-service-node",
                  "s6-tools-node", "s6-field-b-node", "s6-field-a-node"]
    source = patch_slide(source, 6, slide6_target, "\n".join(fragments.pop(i) for i in slide6_ids))

    slide7_ids = ["s7-software-first-card", "s7-software-first-title", "s7-software-first-caption",
                  "s7-automation-next-card", "s7-automation-next-title", "s7-automation-next-caption",
                  "s7-robotics-card", "s7-robotics-title", "s7-robotics-caption"]
    slide7_text = ["01", "SOFTWARE FIRST", "Visibility and workflows", "02", "AUTOMATION NEXT",
                   "Sensors and controls", "03", "ROBOTICS WHEN READY", "Autonomous operations"]
    slide7_shape_coords = {(52, 276), (346, 276), (640, 276)}

    def slide7_target(call: str, x: float, y: float) -> bool:
        if any(close(x, px) and close(y, py) for px, py in slide7_shape_coords):
            return "PptxRect(width: 267pt, height: 193pt" in call or any(
                text_token(text)(call, x, y) for text in slide7_text
            )
        return any(text_token(text)(call, x, y) for text in slide7_text)

    source = patch_slide(source, 7, slide7_target, "\n".join(fragments.pop(i) for i in slide7_ids))
    if fragments:
        raise ValueError(f"Unused components after rebuild: {sorted(fragments)}")
    if source.count("#PptxSlide(") != 8:
        raise ValueError("Rebuild changed the eight-slide count")
    OUTPUT.write_text(source, encoding="utf-8")
    component_rows = []
    for slide in (4, 5, 6, 7):
        manifest = json.loads((COMPONENTS / f"slide-{slide}.qa.json").read_text(encoding="utf-8"))
        component_rows.extend(manifest["components"])
    baseline_pdf = ROOT / "reference" / "before" / "Field_Forward_Corrected_Typst_Preview.pdf"
    with fitz.open(baseline_pdf) as document:
        for component in component_rows:
            page_number = component["slide"]
            x, y, width, height = component["text_frame_bounds_pt"]
            frame = fitz.Rect(x, y, x + width, y + height)
            glyphs = None
            for paragraph in component.get("text_lines", []):
                matches = [fitz.Rect(box) for box in document[page_number - 1].search_for(paragraph)
                           if fitz.Rect(box).intersects(frame)]
                if not matches:
                    glyphs = None
                    break
                matches.sort(key=lambda box: (round(box.y0, 1), box.x0))
                if len(matches) > 1:
                    heights = sorted(box.height for box in matches)
                    line_height = heights[len(heights) // 2]
                    advances = [b.y0 - a.y0 for a, b in zip(matches, matches[1:])]
                    if any(step < line_height * 0.35 or step > line_height * 1.75 for step in advances):
                        glyphs = None
                        break
                paragraph_box = fitz.Rect(matches[0])
                for box in matches[1:]:
                    paragraph_box |= box
                glyphs = paragraph_box if glyphs is None else glyphs | paragraph_box
            if glyphs is not None:
                component["reference_glyph_bounds_pt"] = [round(value, 3) for value in glyphs]
            else:
                component["reference_glyph_match"] = "unavailable_or_ambiguous"
    (COMPONENTS / "all.qa.json").write_text(
        json.dumps({"reference_pdf": str(baseline_pdf.relative_to(ROOT)),
                    "components": component_rows}, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    print(f"Wrote {OUTPUT.relative_to(ROOT)} with {len(component_rows)} semantic components")


if __name__ == "__main__":
    main()
