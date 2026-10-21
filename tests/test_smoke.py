from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

from PIL import Image
import pytest
from pptx import Presentation
from pptx.enum.shapes import MSO_SHAPE, MSO_SHAPE_TYPE
from pptx.enum.text import MSO_ANCHOR
from pptx.dml.color import RGBColor
from pptx.util import Pt
from pptx.oxml.xmlchemy import OxmlElement
from pptx.oxml.ns import qn


ROOT = Path(__file__).resolve().parents[1]


def write_pixel(path: Path) -> None:
    Image.new("RGBA", (8, 8), (40, 120, 200, 255)).save(path)


def make_source_pptx(path: Path, image_path: Path) -> None:
    deck = Presentation()
    deck.slide_width = Pt(960)
    deck.slide_height = Pt(540)
    for index in range(2):
        slide = deck.slides.add_slide(deck.slide_layouts[6])
        box = slide.shapes.add_textbox(Pt(40), Pt(40), Pt(420), Pt(60))
        box.text_frame.text = f"PPTX smoke slide {index + 1}"
        slide.shapes.add_picture(str(image_path), Pt(60), Pt(130), width=Pt(48), height=Pt(32))
    deck.save(path)


def run_forward(source: Path, output: Path) -> None:
    env = os.environ.copy()
    source_path = str(ROOT / "src")
    env["PYTHONPATH"] = source_path + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    subprocess.run(
        [sys.executable, "-m", "pptx_typst.pptx_to_typst", str(source), "--output", str(output), "--text-layout", "v3"],
        cwd=ROOT,
        env=env,
        check=True,
        capture_output=True,
        text=True,
        timeout=120,
    )


def text_in(deck: Presentation) -> list[str]:
    return [shape.text for slide in deck.slides for shape in slide.shapes if shape.has_text_frame]


def picture_count(deck: Presentation) -> int:
    return sum(shape.shape_type == MSO_SHAPE_TYPE.PICTURE for slide in deck.slides for shape in slide.shapes)


def test_pptx_converts_to_compilable_typst(tmp_path: Path) -> None:
    typst = shutil.which("typst")
    if not typst:
        pytest.skip("Typst CLI is required for the compile smoke test")
    image_path = tmp_path / "pixel.png"
    source = tmp_path / "source.pptx"
    project = tmp_path / "typst-project"
    write_pixel(image_path)
    make_source_pptx(source, image_path)

    run_forward(source, project)
    assert (project / "main.typ").is_file()
    subprocess.run(
        [typst, "compile", "main.typ", "smoke.pdf"],
        cwd=project,
        check=True,
        capture_output=True,
        text=True,
        timeout=120,
    )
    assert (project / "smoke.pdf").is_file()


def test_tiff_media_gets_a_typst_compatible_derivative(tmp_path: Path) -> None:
    typst = shutil.which("typst")
    if not typst:
        pytest.skip("Typst CLI is required for the TIFF media regression test")
    image_path = tmp_path / "source.tiff"
    Image.new("RGBA", (12, 8), (40, 120, 200, 128)).save(image_path, format="TIFF")
    source = tmp_path / "tiff.pptx"
    deck = Presentation()
    slide = deck.slides.add_slide(deck.slide_layouts[6])
    slide.shapes.add_picture(str(image_path), Pt(20), Pt(20), width=Pt(60), height=Pt(40))
    deck.save(source)

    project = tmp_path / "typst-project"
    run_forward(source, project)
    manifest = json.loads((project / "asset_manifest.json").read_text(encoding="utf-8"))
    media = next(iter(manifest["media"].values()))
    assert media["path"].endswith(".tiff")
    assert media["render_path"].endswith("_typst.png")
    assert (project / media["path"]).is_file()
    with Image.open(project / media["render_path"]) as converted:
        assert converted.format == "PNG"
        assert converted.mode == "RGBA"
        assert converted.getpixel((0, 0))[3] == 128

    subprocess.run(
        [typst, "compile", "main.typ", "tiff.pdf"], cwd=project,
        check=True, capture_output=True, text=True, timeout=120,
    )
    assert (project / "tiff.pdf").is_file()


def test_default_text_layout_does_not_insert_a_full_line_between_paragraphs(tmp_path: Path) -> None:
    source = tmp_path / "paragraphs.pptx"
    project = tmp_path / "typst-project"
    image_path = tmp_path / "pixel.png"
    write_pixel(image_path)
    deck = Presentation()
    slide = deck.slides.add_slide(deck.slide_layouts[6])
    frame = slide.shapes.add_textbox(Pt(40), Pt(40), Pt(500), Pt(300)).text_frame
    frame.clear()
    frame.paragraphs[0].text = "First paragraph"
    frame.add_paragraph().text = "Second paragraph"
    for paragraph in frame.paragraphs:
        paragraph.runs[0].font.size = Pt(20)
    slide.shapes.add_picture(str(image_path), Pt(60), Pt(360), width=Pt(48), height=Pt(32))
    deck.save(source)

    env = os.environ.copy()
    env["PYTHONPATH"] = str(ROOT / "src") + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    subprocess.run(
        [sys.executable, "-m", "pptx_typst.pptx_to_typst", str(source), "--output", str(project)],
        cwd=ROOT, env=env, check=True, capture_output=True, text=True, timeout=120,
    )

    typst_source = (project / "main.typ").read_text(encoding="utf-8")
    assert "First paragraph" in typst_source and "Second paragraph" in typst_source
    assert "#v(26.00pt)" not in typst_source
    assert "#v(5.20pt)" in typst_source
    typst = shutil.which("typst")
    if typst:
        subprocess.run(
            [typst, "compile", "main.typ", "paragraphs.pdf"], cwd=project,
            check=True, capture_output=True, text=True, timeout=120,
        )
        assert (project / "paragraphs.pdf").is_file()

    legacy_project = tmp_path / "legacy-project"
    subprocess.run(
        [sys.executable, "-m", "pptx_typst.pptx_to_typst", str(source), "--output", str(legacy_project),
         "--text-layout", "anchors"],
        cwd=ROOT, env=env, check=True, capture_output=True, text=True, timeout=120,
    )
    assert "#v(26.00pt)" in (legacy_project / "main.typ").read_text(encoding="utf-8")
    default_manifest = json.loads((project / "asset_manifest.json").read_text(encoding="utf-8"))
    legacy_manifest = json.loads((legacy_project / "asset_manifest.json").read_text(encoding="utf-8"))
    non_text = lambda manifest: [
        placement for slide in manifest["slides"] for placement in slide["placements"]
        if placement.get("type") != "text"
    ]
    assert non_text(default_manifest) == non_text(legacy_manifest)


def test_default_text_layout_compiles_multiline_bullets_and_vertical_anchor(tmp_path: Path) -> None:
    source = tmp_path / "bullets.pptx"
    project = tmp_path / "typst-project"
    deck = Presentation()
    slide = deck.slides.add_slide(deck.slide_layouts[6])
    shape = slide.shapes.add_textbox(Pt(40), Pt(40), Pt(360), Pt(200))
    shape.text_frame.vertical_anchor = MSO_ANCHOR.MIDDLE
    first = shape.text_frame.paragraphs[0]
    first.text = "A multiline bullet\nwith a continued line"
    first._p.get_or_add_pPr().append(OxmlElement("a:buChar"))
    first._p.pPr[-1].set("char", "•")
    second = shape.text_frame.add_paragraph()
    second.text = "A second bullet"
    second._p.get_or_add_pPr().append(OxmlElement("a:buChar"))
    second._p.pPr[-1].set("char", "•")
    deck.save(source)

    env = os.environ.copy()
    env["PYTHONPATH"] = str(ROOT / "src") + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    subprocess.run(
        [sys.executable, "-m", "pptx_typst.pptx_to_typst", str(source), "--output", str(project)],
        cwd=ROOT, env=env, check=True, capture_output=True, text=True, timeout=120,
    )
    generated = (project / "main.typ").read_text(encoding="utf-8")
    assert "A multiline bullet" in generated and "with a continued line" in generated
    assert "A second bullet" in generated
    assert "#list(" in generated
    assert "#align(center + horizon)[" in generated
    typst = shutil.which("typst")
    if typst:
        subprocess.run(
            [typst, "compile", "main.typ", "bullets.pdf"], cwd=project,
            check=True, capture_output=True, text=True, timeout=120,
        )
        assert (project / "bullets.pdf").is_file()


def test_supported_typst_converts_to_pptx(tmp_path: Path) -> None:
    from pptx_typst.typst_to_pptx import convert

    image_path = tmp_path / "pixel.png"
    write_pixel(image_path)
    main = tmp_path / "main.typ"
    main.write_text(
        '''#PptxSlide(width:320pt,height:180pt,fill:rgb("#FFFFFF"),children:[
  #PptxPlace(x:20pt,y:20pt,child:PptxBox(width:250pt,height:40pt)[
    #PptxText(font:"Arial",size:18pt,fill:rgb("#111111"))[Supported reverse conversion]
  ])
  #PptxPlace(x:20pt,y:80pt,child:PptxImage("pixel.png",width:32pt,height:24pt))
  #PptxPlace(x:20pt,y:120pt,child:PptxText(font:"Arial",size:16pt,fill:rgb("#222222"))[Direct starter text call])
])
''',
        encoding="utf-8",
    )
    output = tmp_path / "reverse.pptx"

    report = convert(main, output)
    deck = Presentation(output)
    assert report["slides"] == 1
    assert deck.slide_width == Pt(320)
    assert deck.slide_height == Pt(180)
    assert any("Supported reverse conversion" in text for text in text_in(deck))
    assert any("Direct starter text call" in text for text in text_in(deck))
    assert picture_count(deck) == 1


def test_reverse_conversion_preserves_image_fit_and_rounded_panel_style(tmp_path: Path) -> None:
    from pptx_typst.typst_to_pptx import convert

    wide = tmp_path / "wide.png"
    Image.new("RGB", (200, 100), (80, 120, 160)).save(wide)
    main = tmp_path / "main.typ"
    main.write_text(
        '''#PptxSlide(width:320pt,height:180pt,fill:rgb("#FFFFFF"),children:[
  #PptxPlace(x:20pt,y:20pt,child:PptxImage("wide.png",width:40pt,height:40pt,fit:"cover"))
  #PptxPlace(x:80pt,y:20pt,child:PptxRect(width:100pt,height:60pt,fill:rgb("#FF000080"),stroke:1pt + rgb("#223344"),radius:8pt))
])
''',
        encoding="utf-8",
    )
    output = tmp_path / "fit-and-panel.pptx"

    convert(main, output)
    deck = Presentation(output)
    picture = next(shape for shape in deck.slides[0].shapes if shape.shape_type == MSO_SHAPE_TYPE.PICTURE)
    panel = next(shape for shape in deck.slides[0].shapes if shape.shape_type == MSO_SHAPE_TYPE.AUTO_SHAPE)
    assert picture.crop_left == pytest.approx(0.25, abs=0.01)
    assert picture.crop_right == pytest.approx(0.25, abs=0.01)
    assert panel.auto_shape_type == MSO_SHAPE.ROUNDED_RECTANGLE
    assert panel.line.width == Pt(1)
    effect_ref = panel._element.find(qn("p:style")).find(qn("a:effectRef"))
    assert effect_ref.get("idx") == "0"
    assert panel._element.spPr.find(".//" + qn("a:outerShdw")) is None


def test_roundtrip_preserves_dimensions_text_and_shared_image(tmp_path: Path) -> None:
    from pptx_typst.typst_to_pptx import convert

    image_path = tmp_path / "pixel.png"
    source = tmp_path / "source.pptx"
    project = tmp_path / "typst-project"
    output = tmp_path / "roundtrip.pptx"
    write_pixel(image_path)
    make_source_pptx(source, image_path)

    run_forward(source, project)
    manifest = json.loads((project / "asset_manifest.json").read_text(encoding="utf-8"))
    assert manifest["unique_images"] == 1
    report = convert(project / "main.typ", output)
    result = Presentation(output)
    assert report["slides"] == 2
    assert result.slide_width == Pt(960)
    assert result.slide_height == Pt(540)
    assert "PPTX smoke slide 1" in text_in(result)
    assert "PPTX smoke slide 2" in text_in(result)
    assert picture_count(result) == 2
    image_hashes = {
        hashlib.sha256(shape.image.blob).hexdigest()
        for slide in result.slides
        for shape in slide.shapes
        if shape.shape_type == MSO_SHAPE_TYPE.PICTURE
    }
    assert len(image_hashes) == 1


def test_table_fill_transparency_survives_pptx_to_typst(tmp_path: Path) -> None:
    source = tmp_path / "transparent-table.pptx"
    project = tmp_path / "typst-project"
    deck = Presentation()
    slide = deck.slides.add_slide(deck.slide_layouts[6])
    table = slide.shapes.add_table(1, 1, Pt(20), Pt(20), Pt(160), Pt(40)).table
    cell = table.cell(0, 0)
    cell.fill.solid()
    cell.fill.fore_color.rgb = RGBColor(51, 102, 153)
    srgb = cell._tc.get_or_add_tcPr().xpath('./a:solidFill/a:srgbClr')[0]
    alpha = OxmlElement('a:alpha')
    alpha.set('val', '40000')
    srgb.append(alpha)
    cell.text = "Transparent cell"
    deck.save(source)

    run_forward(source, project)
    typst = (project / "main.typ").read_text(encoding="utf-8")
    assert 'fill:rgb("#33669966")' in typst


def test_table_fill_transparency_survives_typst_to_pptx(tmp_path: Path) -> None:
    from pptx_typst.typst_to_pptx import convert

    main = tmp_path / "main.typ"
    main.write_text(
        '''#PptxSlide(width:320pt,height:180pt,fill:rgb("#FFFFFF"),children:[
  #PptxPlace(x:20pt,y:20pt,child:table(columns:(100pt),rows:(40pt),
    table.cell(fill:rgb("#33669966"),stroke:none)[Transparent cell]))
])
''',
        encoding="utf-8",
    )
    output = tmp_path / "table.pptx"

    convert(main, output)
    deck = Presentation(output)
    cell = next(shape.table.cell(0, 0) for shape in deck.slides[0].shapes if shape.has_table)
    alpha = cell._tc.get_or_add_tcPr().xpath('./a:solidFill/a:srgbClr/a:alpha/@val')
    assert alpha == ['40000']


def test_image_path_cannot_escape_project_to_prefix_sibling(tmp_path: Path) -> None:
    from pptx_typst.typst_to_pptx import convert

    project = tmp_path / "project"
    sibling = tmp_path / "project-evil"
    project.mkdir()
    sibling.mkdir()
    write_pixel(sibling / "outside.png")
    main = project / "main.typ"
    main.write_text(
        '''#PptxSlide(width:320pt,height:180pt,fill:rgb("#FFFFFF"),children:[
  #PptxPlace(x:10pt,y:10pt,child:PptxImage("../project-evil/outside.png",width:32pt,height:24pt))
])
''',
        encoding="utf-8",
    )

    report = convert(main, tmp_path / "blocked.pptx")
    assert report["pictures"] == 0
    assert any(item["kind"] == "missing_media" for item in report["unsupported"])
