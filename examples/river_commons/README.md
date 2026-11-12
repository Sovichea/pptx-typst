# River Commons

A ten-slide fictional district-planning concept, built to test overlay composition and presentation round trips. It asks how public space and seasonal water might share an edge. It makes no measured hydrological or engineering claims.

## Open the deck

- river_commons.pptx: editable text, native lines/shapes, separate photos and vector overlays.
- river_commons.pdf: intended appearance.
- main.typ: canonical editable source, with visible copy in content blocks.
- previews/contact-sheet.png: whole-deck overview.
- previews/slide-N.png and slide-N.svg: full-size generated previews.
- DESIGN.md: narrative, three art directions, design grammar, and editability limits.
- ATTRIBUTION.md: photo creators, sources, licenses, and adaptation notes.

## Rebuild

From the repository root:

    pptx-typst compile examples/river_commons/main.typ --output examples/river_commons/river_commons.pdf
    pptx-typst compile examples/river_commons/main.typ --output "examples/river_commons/previews/slide-{p}.png" --ppi 144
    pptx-typst compile examples/river_commons/main.typ --output "examples/river_commons/previews/slide-{p}.svg"
    typst-to-pptx examples/river_commons/main.typ --output examples/river_commons/river_commons.pptx
    python tools/check_presentation_fonts.py examples/river_commons/main.typ --report examples/river_commons/font-report.json

Format every Typst edit with Tinymist LSP formatting. Geometry uses whole-point placements; type uses 0.5 pt increments or whole points.

## Assets and portability

Three Creative Commons photographs are stored locally at original resolution (4000–5472 pixels wide). See ATTRIBUTION.md before reuse. Photos depict Bishan Park, Singapore, and Queens, New York; they are references, not a built River Commons proposal. Adapted photographic compositions are CC BY-SA 4.0. The existing helper retains its repository license.

Arial and Georgia are the only required font families. Install matching fonts on the presentation machine. Curved masks remain separate SVG pictures, editable through their SVG source files; they are not native PowerPoint freeform paths. Text, simple chart lines, annotation surfaces, and markers remain native PowerPoint objects. Photos remain separate pictures. SVG media includes PNG fallbacks for Office.

The qualitative response sketch on slide 6 has no measured data or calibrated axes. Its curves communicate a design intention, not modeled performance.

## Verified delivery

Ten slides rendered in PNG, SVG, PDF, and installed PowerPoint. Font preflight found Arial and Georgia in both environments. Export: 86 native text boxes, 25 native shapes, 11 separate pictures, zero unsupported objects. Automated visual QA reported no gate issues. Original-export round trips recovered exact source and identical SVG pages; independent reconstruction also compiled.

PowerPoint save normalization triggered guarded reconstruction instead of exact source restoration. This is reported explicitly: keep main.typ as the canonical authored source after Office edits.
