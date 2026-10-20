"""Bidirectional PowerPoint and Typst conversion for a supported subset."""

__version__ = "0.1.0"

from .typst_to_pptx import convert as typst_to_pptx

__all__ = ["__version__", "typst_to_pptx"]
