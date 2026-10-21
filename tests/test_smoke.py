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
from pptx.enum.shapes import MSO_SHAPE_TYPE
from pptx.util import Pt


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
    assert picture_count(deck) == 1


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
