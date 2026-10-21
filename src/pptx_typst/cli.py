"""Command line entry points for pptx-typst."""

from __future__ import annotations

import argparse
from importlib import resources
import runpy
from pathlib import Path

from .typst_to_pptx import main as _typst_to_pptx_main


def pptx_to_typst() -> None:
    """Run the forward converter's established command line interface."""
    runpy.run_module("pptx_typst.pptx_to_typst", run_name="__main__")


def typst_to_pptx() -> None:
    """Run the reverse converter's command line interface."""
    _typst_to_pptx_main()


def validate_layout() -> None:
    """Run the optional source geometry validation script."""
    runpy.run_module("pptx_typst.validate_layout", run_name="__main__")


def _write_template(name: str, destination: Path, force: bool) -> None:
    if destination.exists() and not force:
        raise SystemExit(f"Refusing to overwrite {destination}; pass --force to replace it.")
    source = resources.files("pptx_typst").joinpath("templates", name)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(source.read_text(encoding="utf-8"), encoding="utf-8")
    print(f"Created {destination}")


def _starter_assets() -> list[tuple[str, bytes]]:
    assets = resources.files("pptx_typst").joinpath("templates", "assets")
    return [(asset.name, asset.read_bytes()) for asset in sorted(assets.iterdir(), key=lambda item: item.name) if asset.is_file()]


def main() -> None:
    """Create the starter Typst module or initialize an authoring project."""
    parser = argparse.ArgumentParser(
        prog="pptx-typst",
        description="Create a Typst authoring project for the supported PPTX subset.",
    )
    commands = parser.add_subparsers(dest="command", required=True)

    module = commands.add_parser("module", help="write only pptx-typst.typ")
    module.add_argument("--output", type=Path, default=Path("pptx-typst.typ"))
    module.add_argument("--force", action="store_true", help="replace an existing output file")

    init = commands.add_parser("init", help="create a starter Typst project")
    init.add_argument("directory", nargs="?", type=Path, default=Path("pptx-typst-project"))
    init.add_argument("--force", action="store_true", help="replace generated files that already exist")

    args = parser.parse_args()
    if args.command == "module":
        _write_template("pptx-typst.typ", args.output, args.force)
        return

    project = args.directory
    outputs = [project / "pptx-typst.typ", project / "main.typ"]
    assets = _starter_assets()
    outputs.extend(project / "assets" / name for name, _ in assets)
    conflicts = [path for path in outputs if path.exists()]
    if conflicts and not args.force:
        names = ", ".join(str(path) for path in conflicts)
        raise SystemExit(f"Refusing to overwrite {names}; pass --force to replace them.")
    project.mkdir(parents=True, exist_ok=True)
    for name in ("pptx-typst.typ", "main.typ"):
        _write_template(name, project / name, force=True)
    (project / "assets").mkdir(exist_ok=True)
    for name, content in assets:
        destination = project / "assets" / name
        destination.write_bytes(content)
        print(f"Created {destination}")
