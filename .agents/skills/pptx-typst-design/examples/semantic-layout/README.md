# Semantic layout proof

This one-slide fixture exercises the design skill's generated component IR: three reusable cards, a numeric badge, two diagram nodes, and a two-line metric. Each component's shape and text frame use identical bounds; alignment is provided by the editable PowerPoint text frame's explicit paragraph alignment, anchor, and margins.

## Rebuild

From the repository root:

```sh
python .agents/skills/pptx-typst-design/scripts/lower_components.py \
  .agents/skills/pptx-typst-design/examples/semantic-layout/components.json \
  --output .agents/skills/pptx-typst-design/examples/semantic-layout/components.typ \
  --manifest-output .agents/skills/pptx-typst-design/examples/semantic-layout/components.qa.json \
  --main-template .agents/skills/pptx-typst-design/examples/semantic-layout/semantic-layout.typ.in \
  --main-output .agents/skills/pptx-typst-design/examples/semantic-layout/main.typ
pptx-typst module --output .agents/skills/pptx-typst-design/examples/semantic-layout/pptx-typst.typ --force
```

The generated `components.typ` is embedded in `main.typ` because the static reverse converter intentionally does not evaluate Typst `include` statements. Then run:

```sh
typst compile .agents/skills/pptx-typst-design/examples/semantic-layout/main.typ \
  .agents/skills/pptx-typst-design/examples/semantic-layout/preview.pdf
typst-to-pptx .agents/skills/pptx-typst-design/examples/semantic-layout/main.typ \
  --output .agents/skills/pptx-typst-design/examples/semantic-layout/semantic-components.pptx
python .agents/skills/pptx-typst-design/scripts/inspect_deck.py \
  --pdf .agents/skills/pptx-typst-design/examples/semantic-layout/preview.pdf \
  --pptx .agents/skills/pptx-typst-design/examples/semantic-layout/semantic-components.pptx \
  --report .agents/skills/pptx-typst-design/examples/semantic-layout/semantic-components_conversion_report.json \
  --components .agents/skills/pptx-typst-design/examples/semantic-layout/components.qa.json \
  --out .agents/skills/pptx-typst-design/examples/semantic-layout/qa
```

## Validation evidence

- Typst 0.15.1 compiled the fixture to a one-page PDF.
- `typst-to-pptx` produced an editable one-slide deck with 14 native shapes, including 8 text frames; conversion warnings: 0.
- Source-PDF text-glyph QA matched all 7 component labels: 7 passed, 0 unavailable. Horizontal center error was at most 0.01 pt and vertical center error at most 2.30 pt; no label overflowed its frame. The checker records resolved fonts when PDF text extraction exposes them.
- This environment has no Microsoft PowerPoint or LibreOffice renderer connected, so native PowerPoint rendering comparison and final visual parity remain unverified. The `.pptx` was reopened and inspected structurally with `python-pptx`; this confirms object presence and frame geometry, not PowerPoint rendering behavior.

All displayed copy and styling are illustrative fixture content.
