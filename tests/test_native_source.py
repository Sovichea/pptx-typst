import json
import os
from pathlib import Path
import subprocess
import sys

from pptx import Presentation
from pptx.opc.package import Part
from pptx.opc.packuri import PackURI
import pytest

from pptx_typst.native_source import REL, restore


@pytest.fixture
def malformed_snapshot(tmp_path):
    deck = Presentation()
    deck.slides.add_slide(deck.slide_layouts[6])
    part = Part(PackURI('/pptxTypst/source.json'), 'application/json', deck.part.package, b'invalid-json')
    deck.part.relate_to(part, REL)
    output = tmp_path / 'malformed.pptx'
    deck.save(output)
    return output


@pytest.mark.parametrize('enabled', [True, False])
def test_malformed_snapshot_falls_back_without_writing(malformed_snapshot, tmp_path, enabled):
    target = tmp_path / 'restored'
    report = restore(malformed_snapshot, target, enabled=enabled)
    assert report['source_restoration'] == 'reconstructed'
    assert report['warnings']
    assert not target.exists()


@pytest.mark.parametrize('payload', [b'null', b'[]', b'"not an object"', b'\xff'])
def test_invalid_manifest_shape_falls_back(malformed_snapshot, tmp_path, payload):
    deck = Presentation(malformed_snapshot)
    next(r.target_part for r in deck.part.rels.values() if r.reltype == REL)._blob = payload
    deck.save(malformed_snapshot)
    assert restore(malformed_snapshot, tmp_path / 'restored')['source_restoration'] == 'reconstructed'


@pytest.mark.parametrize('reconstruct', [True, False])
def test_cli_can_import_deck_with_malformed_snapshot(malformed_snapshot, tmp_path, reconstruct):
    target = tmp_path / 'imported'
    env = os.environ.copy()
    env['PYTHONPATH'] = str(Path(__file__).resolve().parents[1] / 'src')
    command = [sys.executable, '-m', 'pptx_typst.pptx_to_typst', str(malformed_snapshot),
               '--output', str(target)]
    if reconstruct:
        command.append('--reconstruct')
    subprocess.run(command, env=env, check=True, capture_output=True, text=True)
    report = json.loads((target / 'conversion_report.json').read_text())
    assert report['source_restoration'] == 'reconstructed'
    assert (target / 'main.typ').is_file()
