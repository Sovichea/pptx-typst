# Midnight Edge

Ten-slide example, refined while preserving the existing visual identity, palette, typography, and story.

Larger, staggered chart annotations and connected data points; corrected the evidence claim to match the plotted values; brighter cloud comparison metric. All chart marks and labels remain native editable PowerPoint objects. Periods 24, 28, 31, 33, 36, 38, 42, 46 ms are recovered from the original tick/point geometry; error values are unchanged.

Both decks use explicit master background colors for reliable PowerPoint export. Atlas uses opaque chart areas because Office rendered translucent SVG fills black.

## Files

- main.typ: editable source; visible copy uses content blocks.
- pptx-typst.typ: existing shared helper.
- midnight_edge.pptx: editable PowerPoint delivery.
- midnight_edge.pdf: intended Typst rendering.
- previews/contact-sheet.png: whole-deck overview.
- previews/slide-N.png and slide-N.svg: generated page previews (ignored by Git).

## Validation and limits

Tinymist formatting applied after each source edit. PNGs and Office-rendered contact sheets inspected. Export reports zero unsupported objects. Exact source recovery, identical SVG recovery, and independent PPTX reconstruction compilation passed the example round-trip tests.

Arial and Consolas are available to Typst and Office. Barlow is available to Typst but missing from the Office font inventory; Office may substitute it. Install Barlow from https://github.com/jpt/barlow using Windows Fonts settings before presenting the PPTX. PDF/PNG/SVG retain the intended appearance.

The inherited sample metrics and testimonial have no supplied external sources. They are demonstration content, not independently verified research. Do not reuse them as substantiated claims.

## Rebuild from repository root

    pptx-typst compile examples/midnight_edge/main.typ --output examples/midnight_edge/midnight_edge.pdf
    typst-to-pptx examples/midnight_edge/main.typ --output examples/midnight_edge/midnight_edge.pptx

Run tools/check_presentation_fonts.py before delivery and tests/test_example_roundtrip.py for round-trip checks. Format edits with Tinymist LSP formatting.
