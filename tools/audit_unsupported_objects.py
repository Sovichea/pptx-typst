#!/usr/bin/env python3
"""Audit unsupported PPTX placements through the installed pptx-to-typst CLI."""
from __future__ import annotations

import argparse
from collections import defaultdict
import json
from pathlib import Path
import subprocess
import tempfile


def affected_slides(item: dict, manifest: dict) -> set[int]:
    if item.get("slide") is not None:
        return {int(item["slide"])}
    owner, owner_id = item.get("owner"), item.get("owner_id")
    key = "master" if owner == "master" else "layout"
    return {
        index
        for index, slide in enumerate(manifest.get("slides", []), start=1)
        if slide.get(key) == owner_id
    }


def audit(corpus: Path, output: Path, converter: str = "pptx-to-typst") -> dict:
    records = []
    fallbacks = []
    by_type = defaultdict(lambda: {"occurrences": 0, "decks": set(), "slides": set(), "visually_significant": 0})
    fallback_types = defaultdict(lambda: {"occurrences": 0, "decks": set(), "slides": set(), "issues": set()})
    decks = sorted(corpus.glob("*.pptx"))
    if not decks:
        raise ValueError(f"No .pptx files found in {corpus}")
    with tempfile.TemporaryDirectory(prefix="pptx-typst-unsupported-audit-") as work:
        work_root = Path(work)
        for index, deck in enumerate(decks):
            project = work_root / f"deck-{index}"
            run = subprocess.run(
                [converter, str(deck), "--output", str(project)],
                capture_output=True,
                text=True,
                check=False,
            )
            if run.returncode:
                records.append({"deck": deck.name, "outcome": "conversion_failed", "detail": run.stderr[-2000:]})
                continue
            report = json.loads((project / "conversion_report.json").read_text(encoding="utf-8"))
            manifest = json.loads((project / "asset_manifest.json").read_text(encoding="utf-8"))
            slide_width, slide_height = manifest.get("slide_dimensions_pt", [0, 0])
            for item in report.get("warnings", []):
                if item.get("outcome") in {"approximated", "rasterized"}:
                    source_type = item.get("source_type", "unknown")
                    slides = affected_slides(item, manifest)
                    fallbacks.append({
                        "deck": deck.name,
                        "source_type": source_type,
                        "outcome": item["outcome"],
                        "issue": item.get("issue"),
                        "slide_numbers": sorted(slides),
                        "shape_id": item.get("shape_id"),
                        "shape": item.get("shape"),
                        "fallback": item.get("fallback"),
                        "reason": item.get("reason"),
                    })
                    tally = fallback_types[source_type]
                    tally["occurrences"] += 1
                    tally["decks"].add(deck.name)
                    tally["slides"].update((deck.name, slide) for slide in slides)
                    tally["issues"].add(item.get("issue", "unknown"))
                    continue
                if item.get("outcome") != "unsupported":
                    continue
                source_type = item.get("source_type", "unknown")
                geometry = item.get("geometry_pt", {})
                has_geometry = all(key in geometry for key in ("w", "h"))
                area_ratio = (
                    max(0.0, float(geometry.get("w", 0)))
                    * max(0.0, float(geometry.get("h", 0)))
                    / (slide_width * slide_height)
                    if has_geometry and slide_width and slide_height
                    else None
                )
                slides = affected_slides(item, manifest)
                extent = max(float(geometry.get("w", 0)), float(geometry.get("h", 0)))
                if area_ratio is None:
                    significance = "unknown"
                elif (
                    area_ratio >= 0.01
                    or item.get("has_text", False)
                    or source_type in {"chart", "table", "smartart"}
                    or (source_type == "connector" and extent >= 0.1 * max(slide_width, slide_height))
                ):
                    significance = "significant_estimate"
                else:
                    significance = "negligible_estimate"
                row = {
                    "deck": deck.name,
                    "source_type": source_type,
                    "slide_numbers": sorted(slides),
                    "shape_id": item.get("shape_id"),
                    "shape": item.get("shape"),
                    "geometry_pt": geometry,
                    "slide_area_fraction": round(area_ratio, 6) if area_ratio is not None else None,
                    "visual_significance_estimate": significance,
                    "fallback": item.get("fallback"),
                    "reason": item.get("reason"),
                }
                records.append(row)
                tally = by_type[source_type]
                tally["occurrences"] += 1
                tally["decks"].add(deck.name)
                tally["slides"].update((deck.name, slide) for slide in slides)
                tally[significance] = tally.get(significance, 0) + 1
    summary = {
        "corpus": str(corpus),
        "presentations": len(decks),
        "conversion_failures": sum(row.get("outcome") == "conversion_failed" for row in records),
        "unsupported_occurrences": sum(item["occurrences"] for item in by_type.values()),
        "fallback_occurrences": len(fallbacks),
        "categories": [
            {
                "source_type": source_type,
                "occurrences": values["occurrences"],
                "decks_affected": len(values["decks"]),
                "slides_affected": len(values["slides"]),
                "significant_estimate": values.get("significant_estimate", 0),
                "unknown_significance": values.get("unknown", 0),
            }
            for source_type, values in sorted(by_type.items())
        ],
        "fallback_categories": [
            {
                "source_type": source_type,
                "occurrences": values["occurrences"],
                "decks_affected": len(values["decks"]),
                "slides_affected": len(values["slides"]),
                "issues": sorted(values["issues"]),
            }
            for source_type, values in sorted(fallback_types.items())
        ],
        "objects": records,
        "fallbacks": fallbacks,
    }
    output.mkdir(parents=True, exist_ok=True)
    (output / "unsupported_objects.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    lines = [
        "# Unsupported object audit",
        "",
        f"- Presentations: {summary['presentations']}",
        f"- Conversion failures: {summary['conversion_failures']}",
        f"- Unsupported object placements: {summary['unsupported_occurrences']}",
        f"- Approximated or rasterized warning occurrences: {summary['fallback_occurrences']}",
        "",
        "Visual significance is estimated from object area (at least 1% of slide area), text presence, a chart/table/SmartArt type, or a long connector. Objects without measurable bounds are marked unknown. Estimates are triage aids, not visual review.",
        "",
        "| Source type | Occurrences | Decks | Slides | Significant estimate | Unknown |",
        "|---|---:|---:|---:|---:|---:|",
    ]
    lines.extend(
        f"| {row['source_type']} | {row['occurrences']} | {row['decks_affected']} | {row['slides_affected']} | {row['significant_estimate']} | {row['unknown_significance']} |"
        for row in summary["categories"]
    )
    if summary["fallback_categories"]:
        lines.extend([
            "",
            "## Documented fallbacks",
            "",
            "| Source type | Occurrences | Decks | Slides | Issues |",
            "|---|---:|---:|---:|---|",
        ])
        lines.extend(
            f"| {row['source_type']} | {row['occurrences']} | {row['decks_affected']} | {row['slides_affected']} | {', '.join(row['issues'])} |"
            for row in summary["fallback_categories"]
        )
    (output / "unsupported_objects.md").write_text("\n".join(lines) + "\n", encoding="utf-8")
    return summary


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("corpus", type=Path, help="directory of PowerPoint files")
    parser.add_argument("output", type=Path, help="directory for JSON and Markdown reports")
    parser.add_argument("--converter", default="pptx-to-typst", help="installed converter command")
    args = parser.parse_args()
    result = audit(args.corpus, args.output, args.converter)
    print(f"Audited {result['presentations']} presentations; found {result['unsupported_occurrences']} unsupported placements.")


if __name__ == "__main__":
    main()
