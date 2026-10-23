from __future__ import annotations

from pathlib import Path
import zipfile

import pytest
from pptx_typst import font_diagnostics as fonts


def test_extracts_static_font_usage_from_mixed_runs_and_ignores_comments() -> None:
    source = '''
// PptxText(font: "Comment Font")[not real]
#PptxPlace(x: 0pt, y: 0pt, child: PptxText(font: "League Spartan")[Label])
PptxTextFrame(font: "Inter", paragraphs: (
  PptxParagraph(runs: (
    PptxPlaceholderRun(text: "one", font: "Inter Display"),
    PptxPlaceholderRun(text: "two", font: "League Spartan"),
  )),
))
#let layout = PptxLayout(master: master, children: [
  PptxPlaceholderSlot(id: "title", type: "title", font: "Noto Sans Khmer"),
])
'''
    report = fonts.extract_typst_font_usages(source, "sample.typ")
    rows = {row["family"]: row["usages"] for row in report["families"]}
    assert set(rows) == {"League Spartan", "Inter", "Inter Display", "Noto Sans Khmer"}
    assert len(rows["League Spartan"]) == 2
    assert rows["Inter Display"][0]["construct"] == "PptxPlaceholderRun"
    assert "Comment Font" not in rows


def test_family_status_reports_available_missing_and_unknown() -> None:
    inventory = {"Inter", "Noto Sans Khmer"}
    assert fonts._family_status("Inter", inventory, {})["status"] == "available"
    assert fonts._family_status("League Spartan", inventory, {})["status"] == "missing"
    assert fonts._family_status("Inter", None, {"reason": "no query"})["status"] == "unknown"
    assert fonts._family_status("League Spartan", {"League Spartan"}, {})["status"] == "available"
    assert fonts._families_match("Arial Black", "Arial Black")


def test_dynamic_font_alias_is_reported_as_unchecked() -> None:
    report = fonts.extract_typst_font_usages('PptxText(font: brand-font)[Title]')
    assert report["families"] == []
    assert report["dynamic_font_expressions"][0]["expression"] == "brand-font"


def test_typst_inventory_passes_the_same_font_paths(monkeypatch, tmp_path: Path) -> None:
    seen = []

    def inventory(command, timeout=20):
        seen.extend(command)
        return {"Inter"}, {"status": "checked"}

    monkeypatch.setattr(fonts, "_run_inventory", inventory)
    fonts.typst_font_inventory("typst-test", [tmp_path / "fonts A", tmp_path / "fonts-B"])
    assert seen == ["typst-test", "fonts", "--font-path",
                    f"{tmp_path / 'fonts A'}{fonts.os.pathsep}{tmp_path / 'fonts-B'}"]


def test_unavailable_typst_command_is_unknown_not_missing(monkeypatch) -> None:
    monkeypatch.setattr(fonts, "_run_inventory", lambda *_args, **_kwargs: (None, {
        "status": "unknown", "reason": "typst not found"}))
    inventory, metadata = fonts.typst_font_inventory("missing-typst")
    assert inventory is None
    assert metadata["status"] == "unknown"
    assert fonts._family_status("Inter", inventory, metadata)["status"] == "unknown"


def test_non_windows_powerpoint_inventory_is_unknown(monkeypatch) -> None:
    monkeypatch.setattr(fonts.sys, "platform", "linux")
    inventory, metadata = fonts.powerpoint_font_inventory()
    assert inventory is None
    assert metadata["status"] == "unknown"
    assert "desktop PowerPoint" in metadata["reason"]


def test_pdf_font_substitution_classification() -> None:
    assert fonts.classify_rendered_font("Inter Display", ["InterDisplay-Bold"]) == "family_match_metrics_may_differ"
    assert fonts.classify_rendered_font("Inter", ["Calibri-Bold"]) == "detected_substitution"
    assert fonts.classify_rendered_font("Inter", [], "missing") == "unverified_or_ambiguous"
    assert fonts.classify_rendered_font("Inter", ["Calibri"], "missing") == "missing_requested_font_and_detected_substitute"


def test_pptx_font_report_reads_explicit_run_families(tmp_path: Path) -> None:
    pptx_path = tmp_path / "fonts.pptx"
    slide_xml = b'''<p:sld xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"
      xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"><a:rPr><a:latin typeface="Inter Display"/></a:rPr></p:sld>'''
    with zipfile.ZipFile(pptx_path, "w") as package:
        package.writestr("ppt/slides/slide1.xml", slide_xml)
    report = fonts.inspect_pptx_run_fonts(pptx_path)
    assert report["explicit_run_families"][0]["family"] == "Inter Display"


def test_render_comparison_does_not_overclaim_geometry() -> None:
    source = {"families": [{"family": "Inter", "availability": {
        "powerpoint": {"status": "available"}}}]}
    comparison = fonts.compare_font_evidence(
        source,
        {"explicit_run_families": [{"family": "Inter"}]},
        {"resolved_families": [{"family": "Inter", "text_span_count": 3}]},
        {"resolved_families": [{"family": "Calibri", "text_span_count": 3}]},
    )
    row = comparison["families"][0]
    assert row["pptx_declared_run_match"] is True
    assert row["powerpoint_render_classification"] == "detected_substitution"
    assert row["typst_vs_powerpoint"] == "unverified_or_ambiguous"


def test_report_distinguishes_typst_and_powerpoint_inventories(monkeypatch, tmp_path: Path) -> None:
    source = tmp_path / "main.typ"
    source.write_text('PptxText(font: "Inter Display")[Title]', encoding="utf-8")
    monkeypatch.setattr(fonts, "typst_font_inventory", lambda *_: ({"Inter Display"}, {"status": "checked"}))
    monkeypatch.setattr(fonts, "powerpoint_font_inventory", lambda: ({"Calibri"}, {
        "status": "checked", "method": "test", "powerpoint_detected": True}))
    report = fonts.build_font_report(source)
    family = report["families"][0]
    assert family["availability"]["typst"]["status"] == "available"
    assert family["availability"]["powerpoint"]["status"] == "missing"
    assert family["substitution_risk"]["powerpoint"] == "font_missing"


def test_rendered_substitution_overrides_inventory_risk(monkeypatch, tmp_path: Path) -> None:
    fitz = pytest.importorskip("fitz")
    source = tmp_path / "main.typ"
    source.write_text('PptxText(font: "Inter")[LABEL]', encoding="utf-8")
    rendered = fitz.open()
    rendered.new_page().insert_text((40, 40), "LABEL", fontname="helv")
    pdf = tmp_path / "rendered.pdf"
    rendered.save(pdf)
    rendered.close()
    monkeypatch.setattr(fonts, "typst_font_inventory", lambda *_: ({"Inter"}, {"status": "checked"}))
    monkeypatch.setattr(fonts, "powerpoint_font_inventory", lambda: ({"Inter"}, {
        "status": "checked", "method": "windows_font_registry", "powerpoint_detected": True}))
    report = fonts.build_font_report(source, powerpoint_pdf=pdf)
    family = report["families"][0]
    assert family["availability"]["powerpoint"]["status"] == "available"
    assert family["substitution_risk"]["powerpoint"] == "detected_in_powerpoint_pdf"
