# Atlas Review

Ten-slide example, refined while preserving the existing visual identity, palette, typography, and story.

Larger cost-chart labels; expanded process cards; labeled cost columns; wider rule column. The gribouille 0.7.0 chart remains static vector artwork in PPTX with editable source data in main.typ.

Both decks use explicit master background colors for reliable PowerPoint export. Atlas uses opaque chart areas because Office rendered translucent SVG fills black.

## Files

- main.typ: editable source; visible copy uses content blocks.
- pptx-typst.typ: existing shared helper.
- atlas_review.pptx: editable PowerPoint delivery.
- atlas_review.pdf: intended Typst rendering.
- previews/contact-sheet.png: whole-deck overview.
- previews/slide-N.png and slide-N.svg: generated page previews (ignored by Git).

## Validation and limits

Tinymist formatting applied after each source edit. PNGs and Office-rendered contact sheets inspected. Export reports zero unsupported objects. Exact source recovery, identical SVG recovery, and independent PPTX reconstruction compilation passed the example round-trip tests.

Arial and Georgia are available to Typst and Office.

The inherited sample metrics and testimonial have no supplied external sources. They are demonstration content, not independently verified research. Do not reuse them as substantiated claims.

## Rebuild from repository root

    pptx-typst compile examples/atlas_review/main.typ --output examples/atlas_review/atlas_review.pdf
    typst-to-pptx examples/atlas_review/main.typ --output examples/atlas_review/atlas_review.pptx

Run tools/check_presentation_fonts.py before delivery and tests/test_example_roundtrip.py for round-trip checks. Format edits with Tinymist LSP formatting.
