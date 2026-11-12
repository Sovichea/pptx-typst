import json
import os
from pathlib import Path
import subprocess
import sys

from pptx import Presentation
from pptx.opc.package import Part
from pptx.opc.packuri import PackURI
import pytest

from pptx_typst.native_source import REL, attach, restore
from pptx_typst.source_dependencies import IncompleteDependencies, dependencies


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


@pytest.mark.parametrize('copy', [
    '#text("private-token.txt")',
    '// image("private-token.txt")\nHello',
    '/* import "private-token.txt" */Hello',
    '#text[image("private-token.txt")]',
    '```typ\n#image("private-token.txt")\n```',
    '#let caption = "private-token.txt"\n#caption',
    '#text("image(\\\"private-token.txt\\\")")',
])
def test_unrelated_strings_and_comments_do_not_embed_files(tmp_path, copy):
    source = tmp_path / 'main.typ'
    source.write_text(copy)
    (tmp_path / 'private-token.txt').write_text('NEVER_DISTRIBUTE_THIS_TOKEN')
    assert dependencies(source) == {}
    output = tmp_path / 'deck.pptx'
    deck = Presentation()
    deck.slides.add_slide(deck.slide_layouts[6])
    deck.save(output)
    assert attach(source, output)['dependencies_complete']
    from zipfile import ZipFile
    with ZipFile(output) as package:
        assert not any(b'NEVER_DISTRIBUTE_THIS_TOKEN' in package.read(name) for name in package.namelist())


def test_local_imports_and_reader_paths_use_owning_module(tmp_path):
    module = tmp_path / 'nested'
    module.mkdir()
    (module / 'helper.txt').write_text('#let artwork() = image("mark.svg")')
    (module / 'mark.svg').write_text('<svg/>')
    (tmp_path / 'mark.svg').write_text('unrelated same-name file')
    source = tmp_path / 'main.typ'
    source.write_text('#let copy = read("nested/helper.txt")\n#import "nested/helper.txt": artwork\n#artwork()')
    assert set(dependencies(source)) == {'nested/helper.txt', 'nested/mark.svg'}


def test_module_import_inside_code_is_not_a_file_dependency(tmp_path):
    source = tmp_path / 'main.typ'
    source.write_text(
        '#let chart = {\n'
        '  import draw: *\n'
        '  line((0pt, 0pt), (10pt, 0pt))\n'
        '}\n'
    )
    assert dependencies(source) == {}


def test_qualified_builtin_and_unicode_paths_are_collected(tmp_path):
    source = tmp_path / 'main.typ'
    source.write_text('#std.image("\\u{6d}ark.svg")')
    (tmp_path / 'mark.svg').write_text('<svg/>')
    assert set(dependencies(source)) == {'mark.svg'}


def test_reader_style_rules_do_not_disable_literal_dependencies(tmp_path):
    source = tmp_path / 'main.typ'
    source.write_text('#set image(width: 20pt)\n#show image: it => it\n#image("mark.svg")')
    (tmp_path / 'mark.svg').write_text('<svg/>')
    assert set(dependencies(source)) == {'mark.svg'}


@pytest.mark.parametrize('expression', [
    '#image("asset-" + "green.svg")',
    '#let name = "asset-green.svg"\n#image(name)',
    '#let loader = image\n#loader("asset-green.svg")',
    '#import ("helper" + ".typ"): *',
    '#image.decode(read("asset-green.svg"))',
    '#let loader = std.at("image")\n#loader("asset-green.svg")',
    '#eval("image(\\\"asset-green.svg\\\")", mode: "code")',
    '#std.image("asset-" + "green.svg")',
    '#let artwork = () =>\n image("asset-" + "green.svg")',
])
def test_unresolved_dependencies_disable_exact_restoration(tmp_path, expression):
    source = tmp_path / 'main.typ'
    source.write_text(expression)
    (tmp_path / 'asset-green.svg').write_text('<svg/>')
    with pytest.raises(IncompleteDependencies):
        dependencies(source)
    output = tmp_path / 'deck.pptx'
    deck = Presentation()
    deck.slides.add_slide(deck.slide_layouts[6])
    deck.save(output)
    report = attach(source, output)
    assert not report['dependencies_complete'] and report['warnings']
    target = tmp_path / 'restored'
    assert restore(output, target)['source_restoration'] == 'reconstructed'
    assert not target.exists()


def test_snapshots_without_completeness_marker_are_not_claimed_exact(tmp_path):
    source = tmp_path / 'main.typ'
    source.write_text('A legacy snapshot')
    deck = Presentation()
    deck.slides.add_slide(deck.slide_layouts[6])
    output = tmp_path / 'legacy.pptx'
    deck.save(output)
    attach(source, output)
    deck = Presentation(output)
    part = next(r.target_part for r in deck.part.rels.values() if r.reltype == REL)
    manifest = json.loads(part.blob)
    del manifest['dependencies_complete']
    part._blob = json.dumps(manifest).encode()
    deck.save(output)
    assert restore(output, tmp_path / 'restored')['source_restoration'] == 'reconstructed'
