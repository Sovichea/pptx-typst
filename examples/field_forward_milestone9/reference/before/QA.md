# FIELD / FORWARD: alignment correction QA

- Authoring source: `main.typ` using `pptx-typst.typ` and semantic `PptxTextFrame` anchoring.
- Centered: all network node labels, the CO-OP hub text, numbered diagram badges, dashboard LIVE header.
- Tight caption spacing and third pathway card title adjusted.
- Typst source compiled with user-provided 0.15.1-compatible Typsastra compiler.
- The PPTX was exported using the supplied `pptx-typst` repository reverse converter, not rebuilt separately.
- 8 Typst PDF pages; 8 PPTX slides.
- PPTX native editable text frames: 102; native shapes: 127; images: 0.
- Conversion unsupported constructs: 0.
- Automated gate issues: 0.
- Out-of-page text blocks: 0; out-of-canvas PPTX shapes: 0.
- Rendered slide comparison: Typst PDF and LibreOffice PPTX-to-PDF were visually reviewed.
- LibreOffice vs. Typst PDF mean normalized pixel difference (including font and renderer differences): 0.037.
- Limitations: no Microsoft PowerPoint desktop rendering check; slide-corner-radius appearance varies between renderers.

Rebuild on an environment with Typst 0.15.1 compatible binary and pptx-typst CLI installed:

```sh
typst compile main.typ preview.pdf
typst-to-pptx main.typ --output field-forward-corrected.pptx
```
