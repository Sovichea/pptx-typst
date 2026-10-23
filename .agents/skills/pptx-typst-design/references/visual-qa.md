# Visual QA and release acceptance

A slide deck is not finished when Typst compiles. Verify the Typst PDF *and* the exported PPTX. This protocol applies whether an agent uses a local coding environment or tool-mediated editing.

## QA passes

### Pass 1: Structural

- Confirm slide count and 16:9 aspect ratio (or the user's specified ratio).
- Ensure every slide has a claim or appropriate purpose; no placeholders or unfinished language.
- Check branding elements, footers and section labels use the intended master/layout.
- Verify every referenced image and font is available locally (or record substitution).
- Preserve source and attribution notes for externally acquired data/media.

### Pass 2: Contact sheet

Render all PDF pages and inspect them as a gallery. Look for story pacing, layout repetition, palette drift, poor visual balance, random transitions between light/dark, inconsistent photo treatments and suspiciously empty or crowded pages. At minimum inspect **every slide thumbnail**, then open detailed renders where anything seems off.

Use:

```sh
python scripts/inspect_deck.py --pdf deck/preview.pdf --out deck/qa \
  --expect-pages 12
```

Generated: `qa/contact-sheet.png`, one `qa/slides/slide-NNN.png` per page, and `qa/qa.json`. Script requires PyMuPDF and Pillow. It flags obviously outside-page text bounds, if PDF extraction exposes them; **absence of a flag does not mean text visually fits**.

### Pass 3: Full-slide legibility

At 100% view, scrutinize:

- Cropped headlines and text; insufficient line spacing, small data labels, overlapping labels.
- Contrast for text over fills/photos and projector washout.
- Alignment of column edges, bars, arrows and diagram nodes.
- Intentional image focus and crop, including photos with people and important annotations.
- Chart accuracy, axis scale, legend, units, baseline and data labels.
- White or negative space; does the slide breathe?
- Accessibility: hue-only coding, tiny captions, color contrast, and reading order.
- Correct attribution and readable source labels where required.

### Pass 4: Editability and PowerPoint export

Run `typst-to-pptx`, examine every meaningful `conversion_report.json` entry and match it to intended objects. Compare a visually complex slide, a text-heavy slide, and an image-heavy slide in the final PPTX renderer; prefer comparing all slides. Check native masters/layouts, colors, shape placement, fonts, crops and z-order.

If the exported PPTX can be rendered independently to a PDF, use:

```sh
python scripts/inspect_deck.py --pdf deck/preview.pdf \
  --pptx deck/export/deck.pptx \
  --roundtrip-pdf deck/export/rendered-from-pptx.pdf \
  --report deck/export/conversion_report.json \
  --out deck/qa-final
```

The script produces paired previews and a coarse pixel-difference statistic. This is a **triage metric**, not a calibrated fidelity or editability score; font rendering can create differences even when geometry is correct.

For component alignment, generate the manifest with `lower_components.py` and pass it to the inspector. Name the renderer used for the exported PPTX PDF:

```sh
python .agents/skills/pptx-typst-design/scripts/inspect_deck.py \
  --pdf deck/preview.pdf \
  --roundtrip-pdf deck/export/rendered-from-pptx.pdf \
  --roundtrip-renderer "PowerPoint" \
  --components deck/components.qa.json \
  --out deck/qa-components
```

The inspector searches each declared single-line label inside its text-frame bounds and compares measured glyph bounds with intended horizontal/vertical alignment and padding. It reports unavailable or ambiguous matches instead of scoring them. A source-PDF failure is classified as an authoring error. A source pass followed by a PowerPoint-rendered failure is classified as a converter error; with another renderer it is reported as a conversion-or-renderer difference. Glyph extraction does not reveal all clipping or layering, so visual inspection remains required.

### Pass 5: Delivery sanity

- Verify files exist and open; do not link nonexistent artifacts.
- Test paths from the project directory and confirm assets are not referenced through temporary absolute paths.
- Ensure PDF and PPTX have expected page counts (unless a known difference is documented).
- Keep the `.typ` source and helper module. Place `conversion_report.json` beside the actual exported PPTX.
- Summarize unverified checks and remaining tradeoffs.

## Scoring rubric for human or agent reviews

Review five dimensions from 0–4; do not aggregate them blindly into a supposed visual-fidelity percentage.

| Dimension | 4 = Strong | 2 = Needs work | 0 = Blocker |
| --- | --- | --- | --- |
| Narrative | One clear claim and supporting visual per slide | Unclear conclusions, generic titles | Unsupported or contradictory argument |
| Hierarchy | Immediately legible at projection size | Some dense or weakly differentiated blocks | Core content unreadable |
| Composition | Grid, spacing, images, alignment are coherent | Repetition or occasional collisions | Significant clipping or visual chaos |
| Accuracy | Numbers, units, labels and sources correct | Ambiguous units/sources | Fabricated or misleading evidence |
| Delivery | Typst and PPTX validated, editability disclosed | Minor warnings, partial verification | Missing/broken output or concealed losses |

Use the rubric to guide revisions, not to chase false numerical precision.

## Fix in this order

1. Missing data, wrong message or incorrect chart.
2. Clipped/invisible text and major objects.
3. Font size and contrast insufficient for the audience.
4. Layout balance, reading order, spacing, alignment and image crops.
5. Brand consistency and minor decorative refinements.
6. Micro-adjustments only when visible and worth the effort.

Avoid treating all warnings as equivalent. A tiny decorative shape and a missing full-slide chart have very different consequences.

## Limits of automated QA

- PDF extraction does not reliably reveal hidden objects, incorrect z-order, chart editability or text that was painted but clipped by a container.
- A PPTX's slide shape count is not proof that the visual composition matches the Typst PDF.
- PDF pixel differences are affected by PowerPoint vs Typst font shaping and rendering. Review side-by-side evidence.
- The conversion report flags supported subset limits, not all aesthetic errors.
- A contact sheet cannot establish small-text legibility. Inspect dense pages at full size.
- Component measurement currently targets unique, single-line searchable labels. Wrapped or repeated labels are reported unavailable and need visual inspection.
- Render tooling may not be installed. Report this limitation instead of declaring a visual test passed.
