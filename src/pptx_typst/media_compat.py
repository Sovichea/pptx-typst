"""Optional object-level compatibility conversions for legacy vector media."""
from __future__ import annotations

from dataclasses import dataclass
import os
from pathlib import Path
import shutil
import subprocess
import xml.etree.ElementTree as ET

from PIL import Image


@dataclass(frozen=True)
class MediaConversion:
    path: Path
    source_format: str
    output_format: str
    converter: str
    dpi: int | None = None
    max_edge: int | None = None
    notes: str = ""


def _valid_svg(path: Path) -> bool:
    try:
        root = ET.parse(path).getroot()
        return root.tag.rsplit("}", 1)[-1].casefold() == "svg"
    except (OSError, ET.ParseError):
        return False


def _valid_png(path: Path) -> bool:
    try:
        with Image.open(path) as image:
            image.verify()
        with Image.open(path) as image:
            return image.format == "PNG" and image.mode in ("RGBA", "LA", "P", "RGB")
    except (OSError, ValueError):
        return False


def _temporary_output(destination: Path) -> Path:
    return destination.with_name(destination.stem + ".partial" + destination.suffix)


def convert_metafile(
    source: Path,
    destination_stem: Path,
    *,
    dpi: int = 300,
    max_edge: int = 4096,
    timeout: int = 180,
) -> tuple[MediaConversion | None, str | None]:
    """Convert EMF/WMF to SVG where Inkscape is available, else transparent PNG.

    The original source file is never changed. Returned PNGs are rendered with
    Windows GDI+ at the requested resolution, capped by ``max_edge`` pixels.
    Conversion programs are optional; failure is returned as a diagnostic.
    """
    source = Path(source)
    destination_stem = Path(destination_stem)
    failures: list[str] = []

    inkscape = shutil.which("inkscape")
    if inkscape:
        destination = destination_stem.with_suffix(".svg")
        temporary = _temporary_output(destination)
        try:
            result = subprocess.run(
                [inkscape, str(source), "--export-text-to-path", f"--export-filename={temporary}"],
                capture_output=True, text=True, timeout=timeout, check=False,
            )
            if result.returncode == 0 and _valid_svg(temporary):
                temporary.replace(destination)
                return MediaConversion(
                    destination, source.suffix.lstrip(".").lower(), "svg", "Inkscape",
                    notes="Imported as editable vector paths where supported.",
                ), None
            failures.append("Inkscape: " + (result.stderr or result.stdout or "no valid SVG output").strip()[-500:])
        except (OSError, subprocess.TimeoutExpired) as exc:
            failures.append(f"Inkscape: {exc}")
        finally:
            temporary.unlink(missing_ok=True)

    if os.name == "nt":
        powershell = shutil.which("powershell.exe") or shutil.which("powershell")
        script = Path(__file__).with_name("render_metafile.ps1")
        if powershell and script.is_file():
            destination = destination_stem.with_suffix(".png")
            temporary = _temporary_output(destination)
            try:
                result = subprocess.run(
                    [powershell, "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                     str(script), str(source), str(temporary), str(dpi), str(max_edge)],
                    capture_output=True, text=True, timeout=timeout, check=False,
                )
                if result.returncode == 0 and _valid_png(temporary):
                    temporary.replace(destination)
                    rendered = result.stdout.strip().splitlines()[-1] if result.stdout.strip() else ""
                    return MediaConversion(
                        destination, source.suffix.lstrip(".").lower(), "png", "Windows GDI+",
                        dpi=dpi, max_edge=max_edge,
                        notes=f"Transparent raster fallback ({rendered or f'{dpi} dpi, max {max_edge}px'}).",
                    ), None
                failures.append("Windows GDI+: " + (result.stderr or result.stdout or "no valid PNG output").strip()[-500:])
            except (OSError, subprocess.TimeoutExpired) as exc:
                failures.append(f"Windows GDI+: {exc}")
            finally:
                temporary.unlink(missing_ok=True)
        else:
            failures.append("Windows GDI+: PowerShell or the bundled renderer is unavailable")
    else:
        failures.append("No EMF/WMF converter is installed (install Inkscape for vector import)")

    return None, "; ".join(failures)
