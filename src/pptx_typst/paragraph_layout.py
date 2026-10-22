"""Small DrawingML paragraph-style model shared by the text import paths.

The model keeps the PowerPoint value and its inheritance origin. Rendering
translation is deliberately kept separate so a percentage is never mistaken
for an absolute point value during a round trip.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Iterable


EMU_PER_POINT = 12700


@dataclass(frozen=True)
class Spacing:
    kind: str  # "percent" or "points"
    value: float


@dataclass(frozen=True)
class Property:
    value: Any
    source: str

    @property
    def explicit(self) -> bool:
        return self.source == "direct"


@dataclass(frozen=True)
class ParagraphStyle:
    line_spacing: Property | None = None
    space_before: Property | None = None
    space_after: Property | None = None
    alignment: Property | None = None
    margin_left_pt: Property | None = None
    indent_pt: Property | None = None
    bullet: Property | None = None
    level: int = 0
    sources: dict[str, str] = field(default_factory=dict)

    def effective_record(self) -> dict[str, Any]:
        """Return primitive fields suitable for the static Typst API."""
        out: dict[str, Any] = {"level": self.level}
        for name in ("line_spacing", "space_before", "space_after"):
            prop = getattr(self, name)
            prefix = {"line_spacing": "line", "space_before": "before", "space_after": "after"}[name]
            out[prefix + "_kind"] = prop.value.kind if prop else None
            out[prefix + "_value"] = prop.value.value if prop else None
            out[prefix + "_source"] = prop.source if prop else None
        for name, key in (("alignment", "align"), ("margin_left_pt", "margin_left"), ("indent_pt", "indent")):
            prop = getattr(self, name)
            out[key] = prop.value if prop else None
            out[key + "_source"] = prop.source if prop else None
        prop = self.bullet
        bullet = prop.value if prop else None
        out["bullet"] = bullet
        out["bullet_kind"] = bullet.get("kind") if isinstance(bullet, dict) else None
        out["bullet_type"] = bullet.get("type") if isinstance(bullet, dict) else None
        out["bullet_start"] = bullet.get("start") if isinstance(bullet, dict) else None
        out["bullet_source"] = prop.source if prop else None
        return out


def _first(nodes: list[Any], path: str) -> list[Any]:
    return nodes[0].xpath(path) if nodes else []


def _spacing(ppr: Any, tag: str) -> Spacing | None:
    nodes = ppr.xpath(f'./*[local-name()="{tag}"]') if ppr is not None else []
    if not nodes:
        return None
    pct = nodes[0].xpath('./*[local-name()="spcPct"]/@val')
    pts = nodes[0].xpath('./*[local-name()="spcPts"]/@val')
    if pct:
        return Spacing("percent", int(pct[0]) / 1000)
    if pts:
        return Spacing("points", int(pts[0]) / 100)
    return None


def _bullet(ppr: Any) -> Any:
    if ppr is None:
        return None
    for tag in ("buNone", "buChar", "buAutoNum", "buBlip"):
        nodes = ppr.xpath(f'./*[local-name()="{tag}"]')
        if not nodes:
            continue
        node = nodes[0]
        if tag == "buNone":
            return {"kind": "none"}
        if tag == "buChar":
            return {"kind": "char", "glyph": node.get("char", "•")}
        if tag == "buAutoNum":
            return {"kind": "number", "type": node.get("type", "arabicPeriod"),
                    "start": int(node.get("startAt", "1"))}
        return {"kind": "unsupported"}
    return None


def resolve_paragraph_style(sources: Iterable[tuple[str, Any]], level: int = 0) -> ParagraphStyle:
    """Resolve each paragraph property independently from highest to lowest priority.

    ``sources`` is ordered from the paragraph itself toward inherited defaults.
    Missing properties fall through independently; an alignment override does
    not mask inherited line spacing, bullet indentation, or paragraph spacing.
    """
    ordered = list(sources)
    selected: dict[str, Property | None] = {
        "line_spacing": None, "space_before": None, "space_after": None,
        "alignment": None, "margin_left_pt": None, "indent_pt": None, "bullet": None,
    }
    for origin, ppr in ordered:
        if ppr is None:
            continue
        if selected["line_spacing"] is None:
            value = _spacing(ppr, "lnSpc")
            if value is not None:
                selected["line_spacing"] = Property(value, origin)
        for key, tag in (("space_before", "spcBef"), ("space_after", "spcAft")):
            if selected[key] is None:
                value = _spacing(ppr, tag)
                if value is not None:
                    selected[key] = Property(value, origin)
        if selected["alignment"] is None and ppr.get("algn"):
            alignment = {"l": "left", "ctr": "center", "r": "right", "just": "justify"}.get(ppr.get("algn"), "left")
            selected["alignment"] = Property(alignment, origin)
        for key, attr in (("margin_left_pt", "marL"), ("indent_pt", "indent")):
            if selected[key] is None and ppr.get(attr) is not None:
                try:
                    selected[key] = Property(int(ppr.get(attr)) / EMU_PER_POINT, origin)
                except ValueError:
                    pass
        if selected["bullet"] is None:
            value = _bullet(ppr)
            if value is not None:
                selected["bullet"] = Property(value, origin)
    return ParagraphStyle(level=level, sources={key: value.source for key, value in selected.items() if value}, **selected)


def typst_leading(style: ParagraphStyle, max_font_size_pt: float,
                  line_spacing_reduction: float = 0.0) -> float | None:
    """Translate source baseline pitch to Typst's added leading.

    Typst leading is additional spacing between its font-derived line boxes,
    while DrawingML spacing specifies a baseline pitch. Without querying the
    exact font file chosen by Typst, use a documented 1-em natural-pitch
    fallback: percentage pitch maps relative to the run's largest size and
    point pitch subtracts that same nominal em. This preserves the source
    semantic and keeps 100% at zero added leading without deck-specific tuning.
    """
    prop = style.line_spacing
    if max_font_size_pt <= 0:
        return None
    reduction = min(1.0, max(0.0, line_spacing_reduction))
    if prop is None:
        return -max_font_size_pt * reduction if reduction else None
    spacing: Spacing = prop.value
    target = (max_font_size_pt * spacing.value / 100.0 if spacing.kind == "percent"
              else spacing.value)
    target *= 1.0 - reduction
    return target - max_font_size_pt


def typst_spacing(prop: Property | None, max_font_size_pt: float) -> float | None:
    """Translate paragraph before/after spacing to a Typst point distance."""
    if prop is None:
        return None
    spacing: Spacing = prop.value
    return (max_font_size_pt * spacing.value / 100.0 if spacing.kind == "percent"
            else spacing.value)
