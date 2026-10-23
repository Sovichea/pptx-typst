#!/usr/bin/env python3
"""Lower simple semantic component JSON to static, editable pptx-typst IR."""
from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
import re
import sys


def _pt(value: object, name: str) -> float:
    try:
        number = float(value)
    except (TypeError, ValueError) as exc:
        raise ValueError(f"{name} must be a finite point value") from exc
    if not math.isfinite(number) or number < 0:
        raise ValueError(f"{name} must be a finite non-negative point value")
    return number


def _fmt(value: float) -> str:
    return f"{value:.3f}".rstrip("0").rstrip(".") or "0"


def _string(value: object) -> str:
    return json.dumps(str(value), ensure_ascii=False)


def _color(value: object, name: str) -> str:
    if not isinstance(value, str) or not re.fullmatch(r"#[0-9A-Fa-f]{6}", value):
        raise ValueError(f"{name} must be a #RRGGBB color")
    return f'rgb("{value.upper()}")'


def _style(run: dict, fallback: dict) -> dict:
    return {
        "font": run.get("font", fallback.get("font", "Arial")),
        "size": _pt(run.get("size", fallback.get("size", 20)), "size"),
        "color": run.get("color", fallback.get("color", "#222222")),
        "weight": run.get("weight", fallback.get("weight", "regular")),
        "italic": run.get("italic", fallback.get("italic", False)),
    }


def _line_run(text: str, style: dict) -> str:
    fields = [f"text: {_string(text)}", f"font: {_string(style['font'])}",
              f"size: {_fmt(style['size'])}pt", f"fill: {_color(style['color'], 'color')}",
              f"weight: {_string(style['weight'])}"]
    if style["italic"]:
        fields.append("italic: true")
    return "PptxPlaceholderRun(\n" + ",\n".join("  " + field for field in fields) + ",\n)"


def _paragraphs(item: dict) -> tuple[list[str], list[str]]:
    align = item.get("align", "center")
    if align not in ("left", "center", "right"):
        raise ValueError("align must be left, center or right")
    fallback = _style(item, {})
    source = item.get("paragraphs")
    if source is None:
        if item.get("kind") == "metric":
            source = [
                {"text": item.get("value", ""), "size": item.get("value_size", fallback["size"] * 1.6),
                 "color": item.get("value_color", fallback["color"]),
                 "weight": item.get("value_weight", "bold"), "after": item.get("paragraph_gap", 4)},
                {"text": item.get("caption", ""), "size": item.get("caption_size", fallback["size"]),
                 "color": item.get("caption_color", fallback["color"]),
                 "weight": item.get("caption_weight", "regular")},
            ]
        else:
            source = [{"text": item.get("text", "")}]
    if not isinstance(source, list) or not source:
        raise ValueError("paragraphs must be a non-empty array")
    result = []
    qa_lines = [str(paragraph.get("text", "")) for paragraph in source if str(paragraph.get("text", ""))]
    if item.get("qa_text") is not None:
        qa_lines = [str(item["qa_text"])]
    for paragraph in source:
        if not isinstance(paragraph, dict):
            raise ValueError("each paragraph must be an object")
        text = str(paragraph.get("text", ""))
        style = _style(paragraph, fallback)
        run = _line_run(text, style)
        after = _pt(paragraph.get("after", 0), "paragraph after")
        leading = paragraph.get("leading")
        target_pitch = paragraph.get("target_pitch")
        spacing = []
        if leading is not None:
            spacing.append(f"leading: {_fmt(_pt(leading, 'paragraph leading'))}pt")
        if target_pitch is not None:
            spacing.append(f"target-pitch: {_fmt(_pt(target_pitch, 'paragraph target pitch'))}pt")
        paragraph_fields = [
            f"  align: {_string(align)}",
            "  runs: (\n    " + run.replace("\n", "\n    ") + ",\n  )",
        ]
        paragraph_fields.extend(f"  {field}" for field in spacing)
        if after:
            paragraph_fields.append(f"  after: {_fmt(after)}pt")
        result.append(
            "PptxParagraph(\n" + ",\n".join(paragraph_fields) + ",\n)"
        )
    return result, qa_lines


def _leaf(item: dict, x: float, y: float, width: float, height: float) -> tuple[list[str], dict]:
    kind = item.get("kind")
    if kind not in {"card", "badge", "diagram-node", "metric", "label"}:
        raise ValueError(f"unsupported component kind: {kind!r}")
    ident = str(item.get("id", "")).strip()
    if not ident:
        raise ValueError("each component needs a non-empty id")
    slide = int(item.get("slide", 1))
    if slide < 1:
        raise ValueError(f"{ident}: slide number must be positive")
    align = item.get("align", "center")
    anchor = item.get("anchor", "center")
    if anchor not in ("top", "center", "bottom"):
        raise ValueError(f"{ident}: anchor must be top, center or bottom")
    padding = item.get("padding", 0)
    if isinstance(padding, dict):
        margins = {side: _pt(padding.get(side, 0), f"{ident} padding {side}")
                   for side in ("left", "right", "top", "bottom")}
    else:
        value = _pt(padding, f"{ident} padding")
        margins = {side: value for side in ("left", "right", "top", "bottom")}
    if margins["left"] + margins["right"] >= width or margins["top"] + margins["bottom"] >= height:
        raise ValueError(f"{ident}: padding must leave positive text-frame dimensions")

    fill_value = item.get("fill")
    if kind in {"card", "badge", "diagram-node"} and fill_value is None:
        raise ValueError(f"{ident}: {kind} needs a fill color")
    shape = item.get("shape", "ellipse" if kind == "badge" else "rect")
    code = [f"// component: {ident}"]
    if kind != "label" and fill_value is not None:
        if shape not in ("rect", "ellipse"):
            raise ValueError(f"{ident}: shape must be rect or ellipse")
        fill = _color(fill_value, "fill")
        stroke_value = item.get("stroke")
        stroke = "none" if stroke_value is None else (
            f"{_fmt(_pt(item.get('stroke_width', 1), 'stroke_width'))}pt + {_color(stroke_value, 'stroke')}"
        )
        if shape == "ellipse":
            shape_call = f"PptxEllipse(width: {_fmt(width)}pt, height: {_fmt(height)}pt, fill: {fill}, stroke: {stroke})"
        else:
            radius = _pt(item.get("radius", 0), "radius")
            shape_call = (f"PptxRect(width: {_fmt(width)}pt, height: {_fmt(height)}pt, fill: {fill}, "
                          f"stroke: {stroke}, radius: {_fmt(radius)}pt)")
        code.append(
            f"#PptxPlace(x: {_fmt(x)}pt, y: {_fmt(y)}pt,\n"
            f"  child: {shape_call},\n)"
        )

    paragraphs, qa_lines = _paragraphs(item)
    base = _style(item, {})
    frame = [
        f"width: {_fmt(width)}pt", f"height: {_fmt(height)}pt",
        f"font: {_string(base['font'])}", f"size: {_fmt(base['size'])}pt",
        f"fill: {_color(base['color'], 'color')}", f"weight: {_string(base['weight'])}",
        f"anchor: {_string(anchor)}", f"default-align: {_string(align)}",
        f"margin-left: {_fmt(margins['left'])}pt", f"margin-right: {_fmt(margins['right'])}pt",
        f"margin-top: {_fmt(margins['top'])}pt", f"margin-bottom: {_fmt(margins['bottom'])}pt",
        "paragraphs: (\n" + ",\n".join("  " + paragraph.replace("\n", "\n  ") for paragraph in paragraphs) + ",\n)",
    ]
    code.append(
        f"#PptxPlace(x: {_fmt(x)}pt, y: {_fmt(y)}pt,\n"
        "  child: PptxTextFrame(\n"
        + ",\n".join("    " + field.replace("\n", "\n    ") for field in frame)
        + ",\n  ),\n)"
    )
    qa = {
        "id": ident, "slide": slide, "text": qa_lines[0] if len(qa_lines) == 1 else "",
        "text_lines": qa_lines,
        "container_bounds_pt": [round(x, 3), round(y, 3), round(width, 3), round(height, 3)],
        "text_frame_bounds_pt": [round(x, 3), round(y, 3), round(width, 3), round(height, 3)],
        "padding_pt": {k: round(v, 3) for k, v in margins.items()},
        "horizontal": align, "vertical": anchor,
        "font": str(base["font"]),
    }
    return code, qa


def lower(data: dict) -> tuple[str, dict]:
    components = data.get("components")
    if not isinstance(components, list):
        raise ValueError("top-level components must be an array")
    output: list[str] = []
    manifest: list[dict] = []
    seen: set[str] = set()

    def emit(item: dict, x: float | None = None, y: float | None = None,
             width: float | None = None, height: float | None = None) -> None:
        kind = item.get("kind")
        if kind in ("row", "stack"):
            ident = str(item.get("id", "group"))
            gx = _pt(item.get("x", x or 0), f"{ident} x")
            gy = _pt(item.get("y", y or 0), f"{ident} y")
            gw = _pt(item.get("width", width or 0), f"{ident} width")
            gh = _pt(item.get("height", height or 0), f"{ident} height")
            children = item.get("items")
            if not isinstance(children, list) or not children:
                raise ValueError(f"{ident}: row/stack needs non-empty items")
            gap = _pt(item.get("gap", 0), f"{ident} gap")
            cross = item.get("cross_align", "top" if kind == "row" else "left")
            if kind == "row":
                if cross not in ("top", "center", "bottom"):
                    raise ValueError(f"{ident}: row cross_align must be top, center or bottom")
                available = gw - gap * (len(children) - 1)
                if available <= 0:
                    raise ValueError(f"{ident}: gaps consume the row width")
                default_width = available / len(children)
                cursor = gx
                for child in children:
                    cw = _pt(child.get("width", default_width), f"{ident} child width")
                    ch = _pt(child.get("height", gh), f"{ident} child height")
                    cy = gy if cross == "top" else gy + (gh-ch)/2 if cross == "center" else gy + gh-ch
                    if cw > available + 0.001 or ch > gh + 0.001:
                        raise ValueError(f"{ident}: child exceeds row bounds")
                    emit({**child, "slide": child.get("slide", item.get("slide", 1))}, cursor, cy, cw, ch)
                    cursor += cw + gap
                if cursor - gap > gx + gw + 0.001:
                    raise ValueError(f"{ident}: child widths and gaps exceed row bounds")
            else:
                if cross not in ("left", "center", "right"):
                    raise ValueError(f"{ident}: stack cross_align must be left, center or right")
                available = gh - gap * (len(children) - 1)
                if available <= 0:
                    raise ValueError(f"{ident}: gaps consume the stack height")
                default_height = available / len(children)
                cursor = gy
                for child in children:
                    ch = _pt(child.get("height", default_height), f"{ident} child height")
                    cw = _pt(child.get("width", gw), f"{ident} child width")
                    cx = gx if cross == "left" else gx + (gw-cw)/2 if cross == "center" else gx + gw-cw
                    if ch > available + 0.001 or cw > gw + 0.001:
                        raise ValueError(f"{ident}: child exceeds stack bounds")
                    emit({**child, "slide": child.get("slide", item.get("slide", 1))}, cx, cursor, cw, ch)
                    cursor += ch + gap
                if cursor - gap > gy + gh + 0.001:
                    raise ValueError(f"{ident}: child heights and gaps exceed stack bounds")
            return
        if kind not in {"card", "badge", "diagram-node", "metric", "label"}:
            raise ValueError(f"unsupported component kind: {kind!r}")
        ident = str(item.get("id", "")).strip()
        if ident in seen:
            raise ValueError(f"duplicate component id: {ident}")
        seen.add(ident)
        cx = _pt(item.get("x", x), f"{ident} x")
        cy = _pt(item.get("y", y), f"{ident} y")
        cw = _pt(item.get("width", width), f"{ident} width")
        ch = _pt(item.get("height", height), f"{ident} height")
        if cw <= 0 or ch <= 0:
            raise ValueError(f"{ident}: width and height must be positive")
        code, qa = _leaf(item, cx, cy, cw, ch)
        output.extend(code)
        manifest.append(qa)

    for component in components:
        if not isinstance(component, dict):
            raise ValueError("each component must be an object")
        emit(component)
    return "\n".join(output) + ("\n" if output else ""), {"version": 1, "components": manifest}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path, help="JSON semantic component specification")
    parser.add_argument("--output", type=Path, required=True, help="Static Typst fragment")
    parser.add_argument("--manifest-output", type=Path, help="Optional component QA manifest")
    parser.add_argument("--main-template", type=Path, help="Optional .typ template containing // COMPONENTS INSERT HERE")
    parser.add_argument("--main-output", type=Path, help="Write a complete .typ file with the static fragment inserted")
    args = parser.parse_args()
    try:
        if bool(args.main_template) != bool(args.main_output):
            raise ValueError("--main-template and --main-output must be provided together")
        data = json.loads(args.input.read_text(encoding="utf-8"))
        code, manifest = lower(data)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(code, encoding="utf-8")
        if args.manifest_output:
            args.manifest_output.parent.mkdir(parents=True, exist_ok=True)
            args.manifest_output.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        if args.main_template:
            template = args.main_template.read_text(encoding="utf-8")
            marker = "  // COMPONENTS INSERT HERE"
            if template.count(marker) != 1:
                raise ValueError(f"template must contain exactly one {marker!r} marker")
            fragment = "\n".join("  " + line for line in code.rstrip().splitlines())
            args.main_output.parent.mkdir(parents=True, exist_ok=True)
            args.main_output.write_text(template.replace(marker, fragment), encoding="utf-8")
    except (OSError, json.JSONDecodeError, TypeError, ValueError) as exc:
        print(f"component lowering failed: {exc}", file=sys.stderr)
        return 2
    print(f"Wrote {len(manifest['components'])} components to {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
