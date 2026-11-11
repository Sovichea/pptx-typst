"""Exercise both native source recovery and the independent PPTX reader on examples."""
import os
from pathlib import Path
import subprocess
import sys

from lxml import etree
from pptx import Presentation
import pytest

from pptx_typst.engine import compile_document
from pptx_typst.native_source import restore
from pptx_typst.source_dependencies import dependencies
from pptx_typst.typst_to_pptx import convert

ROOT = Path(__file__).resolve().parents[1]
EXAMPLES = sorted((ROOT / 'examples').glob('*/main.typ'))


@pytest.mark.parametrize('source', EXAMPLES, ids=lambda p: p.parent.name)
def test_example_roundtrip(source, tmp_path):
    files = dependencies(source)
    if any(name.endswith('.svg') for name in files):
        try:
            __import__('cairosvg')
        except (ImportError, OSError):
            pytest.skip('External SVG export requires the optional native Cairo runtime')
    project = tmp_path / 'source'
    project.mkdir()
    main = project / 'main.typ'
    main.write_bytes(source.read_bytes())
    for name, blob in files.items():
        target = project / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(blob)
    fonts = [source.parent / 'fonts'] if (source.parent / 'fonts').is_dir() else []
    before = compile_document(main, format='svg', font_paths=fonts)
    output = tmp_path / 'export/deck.pptx'
    report = convert(main, output, font_paths=fonts)
    assert not report['unsupported']
    assert report['native_source_complete'] and not report['source_warnings']
    restored = tmp_path / 'restored'
    assert restore(output, restored)['source_restoration'] == 'exact'
    assert (restored / 'main.typ').read_bytes() == source.read_bytes()
    assert all((restored / name).read_bytes() == blob for name, blob in files.items())
    assert compile_document(restored / 'main.typ', format='svg', font_paths=fonts) == before
    deck = Presentation(output)
    assert len(deck.slides) == report['slides'] == len(before)
    if source.parent.name == 'blue_spheres':
        ns = {'p': 'http://schemas.openxmlformats.org/presentationml/2006/main',
              'a': 'http://schemas.openxmlformats.org/drawingml/2006/main'}
        assert len(deck.slides[1]._element.xpath('./p:cSld/p:bg/p:bgPr/a:gradFill/a:gsLst/a:gs')) == 4
        layout = etree.fromstring(deck.slides[1].slide_layout.part.blob)
        assert layout.xpath('./p:cSld/p:bg/p:bgPr/a:gradFill', namespaces=ns)
    reconstructed = tmp_path / 'reconstructed'
    env = os.environ.copy()
    env['PYTHONPATH'] = str(ROOT / 'src')
    subprocess.run([sys.executable, '-m', 'pptx_typst.pptx_to_typst', str(output),
                    '--output', str(reconstructed), '--reconstruct'],
                   env=env, check=True, capture_output=True, text=True, timeout=120)
    pages = compile_document(reconstructed / 'main.typ', format='svg', font_paths=fonts)
    assert len(pages) == len(before)
