from __future__ import annotations

from pathlib import Path
import subprocess
from types import SimpleNamespace

from PIL import Image

from pptx_typst import media_compat


def test_metafile_prefers_valid_inkscape_svg_and_keeps_original(tmp_path: Path, monkeypatch) -> None:
    source = tmp_path / "drawing.emf"
    source.write_bytes(b"original metafile")
    monkeypatch.setattr(media_compat.shutil, "which", lambda name: "inkscape.exe" if name == "inkscape" else None)

    def fake_run(command, **_kwargs):
        output = Path(command[-1].split("=", 1)[1])
        output.write_text('<svg xmlns="http://www.w3.org/2000/svg"><path d="M0 0"/></svg>', encoding="utf-8")
        return SimpleNamespace(returncode=0, stdout="", stderr="")

    monkeypatch.setattr(media_compat.subprocess, "run", fake_run)
    converted, warning = media_compat.convert_metafile(source, tmp_path / "rendered")

    assert warning is None
    assert converted is not None
    assert converted.output_format == "svg"
    assert converted.converter == "Inkscape"
    assert converted.path.is_file()
    assert source.read_bytes() == b"original metafile"


def test_metafile_uses_transparent_gdi_fallback_when_inkscape_is_missing(tmp_path: Path, monkeypatch) -> None:
    source = tmp_path / "drawing.wmf"
    source.write_bytes(b"original metafile")
    monkeypatch.setattr(media_compat, "os", SimpleNamespace(name="nt"))
    monkeypatch.setattr(
        media_compat.shutil, "which",
        lambda name: "powershell.exe" if name == "powershell.exe" else None,
    )

    def fake_run(command, **_kwargs):
        output = Path(command[-3])
        Image.new("RGBA", (32, 24), (10, 20, 30, 128)).save(output, format="PNG")
        return SimpleNamespace(returncode=0, stdout="32 x 24 px", stderr="")

    monkeypatch.setattr(media_compat.subprocess, "run", fake_run)
    converted, warning = media_compat.convert_metafile(source, tmp_path / "rendered")

    assert warning is None
    assert converted is not None
    assert converted.output_format == "png"
    assert converted.converter == "Windows GDI+"
    assert converted.dpi == 300
    assert converted.max_edge == 4096
    with Image.open(converted.path) as image:
        assert image.mode == "RGBA"
        assert image.getchannel("A").getextrema() == (128, 128)
    assert source.read_bytes() == b"original metafile"


def test_metafile_conversion_failure_is_reported_without_raising(tmp_path: Path, monkeypatch) -> None:
    source = tmp_path / "drawing.emf"
    source.write_bytes(b"original metafile")
    monkeypatch.setattr(media_compat, "os", SimpleNamespace(name="posix"))
    monkeypatch.setattr(media_compat.shutil, "which", lambda _name: None)

    converted, warning = media_compat.convert_metafile(source, tmp_path / "rendered")

    assert converted is None
    assert warning == "No EMF/WMF converter is installed (install Inkscape for vector import)"
    assert not (tmp_path / "rendered.png").exists()
