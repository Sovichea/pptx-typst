from pathlib import Path
import subprocess

from pptx_typst.engine import compile_document, font_inventory, run_typst


def test_typst_py_renders_without_cli(monkeypatch, tmp_path: Path):
    def forbidden(*args, **kwargs):
        raise AssertionError("external compiler must not run")
    monkeypatch.setattr(subprocess, "run", forbidden)
    source = tmp_path / "main.typ"
    source.write_text("#set page(width: 120pt, height: 60pt, margin: 0pt)\nHello")
    for suffix in ("pdf", "svg", "png"):
        output = tmp_path / ("render." + suffix)
        compile_document(source, output)
        assert output.stat().st_size > 0
    assert font_inventory()
    result = run_typst(["missing-typst", "compile", "main.typ", "other.pdf"], cwd=tmp_path)
    assert result.returncode == 0 and (tmp_path / "other.pdf").is_file()
    source.write_text("#unknown-function()")
    assert run_typst(["typst", "compile", "main.typ"], cwd=tmp_path).returncode != 0
