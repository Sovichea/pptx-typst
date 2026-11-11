from pathlib import Path
import json
import os
import shutil
import subprocess
import sys
from zipfile import ZipFile

from lxml import etree
from PIL import Image
from pptx import Presentation
import pytest
import typst

from pptx_typst.native_source import REL, ASVG, restore
from pptx_typst.typst_to_pptx import convert

ROOT = Path(__file__).resolve().parents[1]


@pytest.fixture
def exported(tmp_path: Path):
    shutil.copyfile(ROOT / "src/pptx_typst/templates/pptx-typst.typ", tmp_path / "pptx-typst.typ")
    Image.new("RGB", (12, 12), "green").save(tmp_path / "mark.png")
    (tmp_path / "art.typ").write_text('''#let diagram() = {
  rect(width: 180pt, height: 60pt, fill: rgb("#167E85"), stroke: none)
  image("mark.png", width: 20pt)
}
''')
    source = tmp_path / "authored.typ"
    source.write_text('''#import "pptx-typst.typ": *
#import "art.typ": diagram
// Native comments and program definitions must survive conversion.
#let caption = [Original caption]
#set page(width: 960pt, height: 540pt, margin: 0pt)
#PptxSlide(width: 960pt, height: 540pt, children: [
  #PptxPlace(x: 20pt, y: 30pt, child: PptxStatic(width: 200pt, height: 100pt)[#diagram()])
  #PptxPlace(x: 250pt, y: 30pt, child: PptxStatic(width: 200pt, height: 100pt)[#diagram()])
  #PptxPlace(x: 30pt, y: 160pt, child: PptxText(font: "Arial", size: 20pt)[Editable text])
])
''')
    original = source.read_bytes()
    output = tmp_path / "export.pptx"
    report = convert(source, output)
    return source, original, output, report


def test_native_artwork_exports_svg_and_exact_source(exported, tmp_path: Path):
    source, original, output, report = exported
    assert source.read_bytes() == original
    assert report['static_artwork'] == report['svg_assets_embedded'] == 2
    assert not report['unsupported']
    deck = Presentation(output)
    assert len(deck.slides[0].shapes) == 3
    for picture in list(deck.slides[0].shapes)[:2]:
        assert picture.width.pt == 200 and picture.height.pt == 100
        assert picture._element.findall('.//{' + ASVG + '}svgBlip')
    with ZipFile(output) as package:
        svgs = [n for n in package.namelist() if n.endswith('.svg')]
        assert len(svgs) == 1  # identical artwork shares one vector part
        assert etree.fromstring(package.read(svgs[0])).get('viewBox').split()[-2:] == ['200', '100']
        private = [n for n in package.namelist() if n.startswith('pptxTypst/assets/')]
        assert len(private) == 1  # original embedded bitmap retained once
    source.write_text('Source on disk is no longer used.')
    restored = tmp_path / 'restored'
    assert restore(output, restored)['source_restoration'] == 'exact'
    assert (restored / 'main.typ').read_bytes() == original
    for name in ['art.typ', 'mark.png', 'pptx-typst.typ']:
        assert (restored / name).read_bytes() == (tmp_path / name).read_bytes()
    assert typst.compile(str(restored / 'main.typ'), format='png')
    saved = tmp_path / 'saved.pptx'
    deck.save(saved)
    assert restore(saved, tmp_path / 'saved-restored')['source_restoration'] == 'exact'


@pytest.mark.parametrize('edit', ['text', 'geometry', 'color', 'svg', 'dependency', 'notes'])
def test_edits_disable_stale_source_restore(exported, tmp_path: Path, edit):
    _, _, output, _ = exported
    deck = Presentation(output)
    if edit == 'text': deck.slides[0].shapes[2].text = 'Changed in PowerPoint'
    elif edit == 'geometry': deck.slides[0].shapes[0].left += 12700
    elif edit == 'color': deck.slides[0].shapes[2].text_frame.paragraphs[0].runs[0].font.bold = True
    elif edit == 'notes': deck.slides[0].notes_slide.notes_text_frame.text = 'New speaker notes'
    elif edit == 'svg':
        part = next(p for p in deck.part.package.iter_parts() if p.content_type == 'image/svg+xml')
        part._blob = part.blob.replace(b'#167e85', b'#ff0000').replace(b'#167E85', b'#FF0000')
        if b'ff0000' not in part._blob.lower(): part._blob += b' '
    elif edit == 'dependency':
        part = next(p for p in deck.part.package.iter_parts() if str(p.partname).startswith('/pptxTypst/assets/'))
        part._blob += b'changed'
    edited = tmp_path / 'edited.pptx'
    deck.save(edited)
    result = restore(edited, tmp_path / 'restored')
    assert result['source_restoration'] == 'reconstructed'
    assert not (tmp_path / 'restored/main.typ').exists()


def test_cli_reconstruction_can_bypass_snapshot(exported, tmp_path: Path):
    _, _, output, _ = exported
    env = os.environ.copy()
    env['PYTHONPATH'] = str(ROOT / 'src')
    for mode in ['exact', 'reconstruct']:
        target = tmp_path / mode
        args = [sys.executable, '-m', 'pptx_typst.pptx_to_typst', str(output), '--output', str(target)]
        if mode == 'reconstruct': args.append('--reconstruct')
        subprocess.run(args, check=True, env=env, capture_output=True, text=True)
        report = json.loads((target / 'conversion_report.json').read_text())
        assert report['source_restoration'] == ('exact' if mode == 'exact' else 'reconstructed')


def test_snapshot_rejects_dependency_path_traversal(exported, tmp_path: Path):
    _, _, output, _ = exported
    deck = Presentation(output)
    part = next(r.target_part for r in deck.part.rels.values() if r.reltype == REL)
    data = json.loads(part.blob)
    data['files']['../escape.typ'] = {'text': 'eA==', 'sha256': __import__('hashlib').sha256(b'x').hexdigest()}
    part._blob = json.dumps(data).encode()
    deck.save(output)
    with pytest.raises(ValueError, match='escapes output directory'):
        restore(output, tmp_path / 'restored')
    assert not (tmp_path / 'escape.typ').exists()
