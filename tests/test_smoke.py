from __future__ import annotations

import hashlib
import json
import os
import posixpath
from pathlib import Path
import shutil
import subprocess
import sys
from zipfile import ZipFile

from lxml import etree

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


def test_init_uses_current_master_layout_macro(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    from pptx_typst.cli import main as cli_main
    from pptx_typst.typst_to_pptx import convert

    project = tmp_path / "starter"
    monkeypatch.setattr(sys, "argv", ["pptx-typst", "init", str(project)])
    cli_main()

    packaged_macro = (ROOT / "src/pptx_typst/templates/pptx-typst.typ").read_text(encoding="utf-8")
    copied_macro = (project / "pptx-typst.typ").read_text(encoding="utf-8")
    starter = (project / "main.typ").read_text(encoding="utf-8")
    assert copied_macro == packaged_macro
    assert "#let Brand = PptxMaster(" in starter
    assert "#let ContentLayout = PptxLayout(" in starter
    assert "layout: ContentLayout," in starter

    typst = shutil.which("typst")
    if typst:
        subprocess.run(
            [typst, "compile", "main.typ", "starter.pdf"], cwd=project,
            check=True, capture_output=True, text=True, timeout=120,
        )

    output = project / "starter.pptx"
    report = convert(project / "main.typ", output)
    deck = Presentation(output)
    assert report["hierarchy_written"] is True
    assert len(deck.slides) == 1
    assert len(deck.slide_masters) == 1
    assert deck.slides[0].slide_layout.name == "ContentLayout"
    assert sum(not shape.is_placeholder for shape in deck.slide_masters[0].shapes) == 1
    assert "A slide authored in Typst" in text_in(deck)


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


def test_master_layout_hierarchy_is_shared_and_roundtrips(tmp_path: Path) -> None:
    from pptx_typst.typst_to_pptx import convert

    write_pixel(tmp_path / "pixel.png")
    main = tmp_path / "main.typ"
    main.write_text(
        '''#import "pptx-typst.typ": PptxMaster, PptxLayout, PptxSlide, Place, PptxPlace, PptxRect, PptxImage
#let Brand = PptxMaster(fill:rgb("#112233"),children:[
  #PptxPlace(x:10pt,y:10pt,child:PptxRect(width:12pt,height:12pt,fill:rgb("#123456")))
  #PptxPlace(x:30pt,y:10pt,child:PptxImage("pixel.png",width:20pt,height:20pt))
])
#let Other = PptxMaster(children:[
  #Place(x:10pt,y:10pt,child:rect(width:14pt,height:14pt,fill:rgb("#654321")))
])
#let Alpha = PptxLayout(master:Brand,fill:rgb("#223344"),children:[
  #PptxPlace(x:10pt,y:40pt,child:PptxRect(width:30pt,height:8pt,fill:rgb("#CC0000")))
])
#let Beta = PptxLayout(master:Brand,children:[
  #Place(x:10pt,y:60pt,child:rect(width:30pt,height:8pt,fill:rgb("#00CC00")))
])
#let Gamma = PptxLayout(master:Other,children:[
  #Place(x:10pt,y:80pt,child:rect(width:30pt,height:8pt,fill:rgb("#0000CC")))
])
#PptxSlide(width:320pt,height:180pt,layout:Alpha,children:[#Place(x:80pt,y:20pt,child:text(size:18pt)[Slide one])])
#pagebreak()
#PptxSlide(width:320pt,height:180pt,layout:Alpha,children:[#Place(x:80pt,y:20pt,child:text(size:18pt)[Slide two])])
#pagebreak()
#PptxSlide(width:320pt,height:180pt,layout:Beta,children:[#Place(x:80pt,y:20pt,child:text(size:18pt)[Slide three])])
#pagebreak()
#PptxSlide(width:320pt,height:180pt,layout:Gamma,children:[#Place(x:80pt,y:20pt,child:text(size:18pt)[Slide four])])
''',
        encoding="utf-8",
    )
    # The starter module supports both composition and the bounded static parser.
    (tmp_path / "template.typ").write_text((ROOT / "src/pptx_typst/template.typ").read_text(encoding="utf-8"), encoding="utf-8")
    (tmp_path / "pptx-typst.typ").write_text((ROOT / "src/pptx_typst/templates/pptx-typst.typ").read_text(encoding="utf-8"), encoding="utf-8")
    typst = shutil.which("typst")
    if typst:
        subprocess.run([typst, "compile", "main.typ", "authored.pdf"], cwd=tmp_path, check=True, capture_output=True, text=True, timeout=120)
        pdftotext = shutil.which("pdftotext")
        if pdftotext:
            extracted = subprocess.run([pdftotext, "authored.pdf", "-"], cwd=tmp_path, check=True, capture_output=True, text=True, timeout=30).stdout
            assert "," not in extracted
    output = tmp_path / "hierarchy.pptx"
    report = convert(main, output)

    deck = Presentation(output)
    assert report["hierarchy_written"] is True
    assert len(deck.slides) == 4
    assert len(deck.slide_masters) == 2
    assert [slide.slide_layout.name for slide in deck.slides] == ["Alpha", "Alpha", "Beta", "Gamma"]
    assert [str(slide.slide_layout.slide_master.part.partname) for slide in deck.slides] == [
        str(deck.slide_masters[0].part.partname), str(deck.slide_masters[0].part.partname),
        str(deck.slide_masters[0].part.partname), str(deck.slide_masters[1].part.partname),
    ]
    assert [len(slide.shapes) for slide in deck.slides] == [1, 1, 1, 1]
    assert "Slide four" in text_in(deck)[-1]
    assert sum(shape.shape_type == MSO_SHAPE_TYPE.PICTURE for shape in deck.slide_masters[0].shapes) == 1
    assert sum(not shape.is_placeholder for shape in deck.slide_masters[0].shapes) == 2
    assert sum(not shape.is_placeholder for shape in deck.slide_masters[1].shapes) == 1
    assert [len(master.slide_layouts) for master in deck.slide_masters] == [2, 1]
    assert len({str(master.part.related_part(rel.rId).partname) for master in deck.slide_masters for rel in master.part.rels.values() if rel.reltype.endswith("/theme")}) == 2

    # Inspect package ownership and relationship targets directly. Slide parts
    # contain only slide-owned text; shared artwork lives in its master/layout.
    ns = {"p": "http://schemas.openxmlformats.org/presentationml/2006/main", "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships", "rel": "http://schemas.openxmlformats.org/package/2006/relationships"}
    with ZipFile(output) as package:
        names = set(package.namelist())
        presentation = etree.fromstring(package.read("ppt/presentation.xml"))
        presentation_rels = etree.fromstring(package.read("ppt/_rels/presentation.xml.rels"))
        rel_map = {rel.get("Id"): rel.get("Target") for rel in presentation_rels}
        slide_ids = presentation.xpath("./p:sldIdLst/p:sldId", namespaces=ns)
        assert len(slide_ids) == 4
        slide_parts = []
        for slide_id in slide_ids:
            target = rel_map[slide_id.get("{%s}id" % ns["r"])]
            slide_part = "ppt/" + target
            slide_parts.append(slide_part)
            slide_xml = etree.fromstring(package.read(slide_part))
            assert len(slide_xml.xpath("./p:cSld/p:spTree/p:sp", namespaces=ns)) == 1
            rel_path = str(Path(slide_part).parent / "_rels" / (Path(slide_part).name + ".rels")).replace("\\", "/")
            slide_rels = etree.fromstring(package.read(rel_path))
            layout_rel = next(rel for rel in slide_rels if rel.get("Type", "").endswith("/slideLayout"))
            assert layout_rel.get("Target").startswith("../slideLayouts/")
        assert slide_parts[0] != slide_parts[1]
        master_parts = [name for name in names if name.startswith("ppt/slideMasters/slideMaster") and name.endswith(".xml")]
        assert len(master_parts) == 2
        layout_ids = []
        master1_rels = etree.fromstring(package.read("ppt/slideMasters/_rels/slideMaster1.xml.rels"))
        master1_targets = {rel.get("Target") for rel in master1_rels if rel.get("Type", "").endswith("/slideLayout")}
        assert len(master1_targets) == 2
        for master_part in master_parts:
            master_xml = etree.fromstring(package.read(master_part))
            layout_ids.extend(master_xml.xpath("./p:sldLayoutIdLst/p:sldLayoutId/@id", namespaces=ns))
            assert len(master_xml.xpath("./p:cSld/p:spTree/p:sp", namespaces=ns)) >= 1
            master_rels_path = str(Path(master_part).parent / "_rels" / (Path(master_part).name + ".rels")).replace("\\", "/")
            owner_rels = etree.fromstring(package.read(master_rels_path))
            for rel in owner_rels:
                if rel.get("Type", "").endswith("/image"):
                    target = posixpath.normpath(posixpath.join(posixpath.dirname(master_part), rel.get("Target")))
                    assert target in names
        assert len(layout_ids) == len(set(layout_ids))
        master1_xml = etree.fromstring(package.read("ppt/slideMasters/slideMaster1.xml"))
        alpha_layout = next(name for name in names if name.endswith("slideLayout12.xml"))
        alpha_xml = etree.fromstring(package.read(alpha_layout))
        assert master1_xml.xpath("string(./p:cSld/p:bg/p:bgPr/a:solidFill/a:srgbClr/@val)", namespaces={**ns, "a": "http://schemas.openxmlformats.org/drawingml/2006/main"}) == "112233"
        assert alpha_xml.xpath("string(./p:cSld/p:bg/p:bgPr/a:solidFill/a:srgbClr/@val)", namespaces={**ns, "a": "http://schemas.openxmlformats.org/drawingml/2006/main"}) == "223344"

    # Forward conversion must recover the same explicit declarations and use
    # every shared object only once in the generated Typst source.
    project = tmp_path / "forward-project"
    run_forward(output, project)
    manifest = json.loads((project / "asset_manifest.json").read_text(encoding="utf-8"))
    generated = (project / "main.typ").read_text(encoding="utf-8")
    assert len(manifest["masters"]) == 2
    assert len(manifest["layouts"]) == 3
    assert generated.count(" = PptxMaster(") == 2
    assert generated.count(" = PptxLayout(") == 3
    assert generated.count('"Slide one"') == 1
    assert "#PptxSlide(\n" in generated
    assert "#Place(\n    x:" in generated
    assert 'PptxMaster(fill:rgb("#112233")' in generated
    assert 'PptxLayout(master:Master01,fill:rgb("#223344")' in generated

    if typst:
        subprocess.run([typst, "compile", "main.typ", "hierarchy.pdf"], cwd=project, check=True, capture_output=True, text=True, timeout=120)
        pdftotext = shutil.which("pdftotext")
        if pdftotext:
            extracted = subprocess.run([pdftotext, "hierarchy.pdf", "-"], cwd=project, check=True, capture_output=True, text=True, timeout=30).stdout
            assert extracted.count("Slide one") == 1
            assert "," not in extracted


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
