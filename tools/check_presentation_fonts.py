#!/usr/bin/env python3
"""CLI wrapper for the pptx-typst static presentation font preflight."""
from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if (ROOT / "src").is_dir():
    sys.path.insert(0, str(ROOT / "src"))

from pptx_typst.font_diagnostics import main


if __name__ == "__main__":
    raise SystemExit(main())
