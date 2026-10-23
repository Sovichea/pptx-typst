# Assets, charts, source data, notes, and presentation handoff

A presentation agent should be able to work from user data and reference imagery, not only from text boxes. Typst is the editable IR for the slide composition; individual media assets may need their own editable sources.

## Asset acquisition and treatment

Before collecting images, determine the expected visual category: real photograph, map, screenshot, vector illustration, document excerpt, chart, or brand asset. Prefer user-provided materials and authoritative sources. Do not imply a generated image is a real scene or real product.

1. Keep `assets/source/` for original media when practicable and `assets/render/` for optimized derivatives. The sample deck uses a simpler single `assets/` directory.
2. Record origin, creator, license, attribution and modification where relevant. Be accurate about rights and uncertainty.
3. Preserve a source vector where possible. For SVG export, validate that the reverse converter can render it; bundle a high-resolution PNG fallback if not.
4. Respect image composition: preserve the subject and annotations. Avoid aggressive crops that remove a point of the slide.
5. For photographs, provide sufficient resolution for projector display at their actual physical size. Pixelation and JPEG artifacts are visual defects.
6. Avoid screenshotting complete slide layouts to sidestep editing. A rasterized full slide violates the editable-IR objective unless the user explicitly accepts it.
7. Avoid unknown icons with inconsistent line weights; create a coherent icon family or use one licensed icon pack.
8. Place logos with their correct aspect ratios and brand colors. Do not stretch logos to fill spaces or infer official marks from similar names.

## Data and chart workflow

1. Inspect the supplied source table/CSV/spreadsheet and decide what question the data should answer.
2. Validate units, dates, categories, duplicates, missing values and denominator choices. Never invent trend data.
3. Choose the right chart: bars for category magnitude, lines for sequential time, scatter for relationships, small multiples for aligned comparisons; avoid pie charts with many categories.
4. Sketch chart axes, scale, labels and title before rendering. Use accessible colors and direct annotations.
5. Choose representation:
   - **Editable simple chart:** build bars/lines/labels as supported static `PptxRect`, `PptxLine` and `PptxText` primitives.
   - **Complex chart:** generate SVG/PNG with a reproducible plotting script and retain the data and script. Insert as `PptxImage`. The chart is visually useful but not a native PowerPoint chart.
   - **Native PowerPoint chart required:** the current `pptx-typst` alpha does not supply that round-trip. Declare the gap and, if authorized, arrange a separate native PowerPoint finishing step.
6. Add visible data source, unit and calculation notes as needed. Avoid fake precision in annotations.
7. Re-render after editing data, then recheck legibility, axis labels and whether charts have drifted from the deck's color system.

### Example: reproduce a chart asset from CSV

Use a standalone Python plotting script where vector editability inside PPTX is not required:

```python
import csv
import matplotlib.pyplot as plt

with open("data/example.csv", newline="", encoding="utf-8") as f:
    rows = list(csv.DictReader(f))
labels = [r["category"] for r in rows]
values = [float(r["value"]) for r in rows]

fig, ax = plt.subplots(figsize=(8, 4.5), layout="constrained")
ax.barh(labels, values)
ax.set_xlabel("Value (units)")
ax.set_title("A title stating the conclusion")
ax.invert_yaxis()
fig.savefig("assets/chart.svg", transparent=True)
fig.savefig("assets/chart.png", dpi=220, transparent=True)
plt.close(fig)
```

This is an illustrative recipe, not a finished design. Customize it to the actual data, units, palette and evidence. Keep chart scripts, data and attribution in the deliverable when practical.

## Diagrams and icons

- Native rectangles, ellipses, text and lines are best for editable block diagrams and straightforward architecture/process flows.
- Use SVG for more intricate isometric art, maps, diagrams or vector logos when editing the asset as one placed image is acceptable.
- For a technical drawing, include original source (SVG, CAD export, Mermaid/PlantUML text if used) and a validated rendered derivative. Do not assume Mermaid markup can be parsed as editable PowerPoint by the Typst converter.
- Apply consistent stroke widths, corner radii and arrowhead semantics across the deck.

## Accessibility and multilingual content

- Keep key labels in native text instead of baked into graphics when possible.
- Test actual font glyph coverage (including Khmer and mathematical notation) in the rendered PDF and in the exported PPTX on target systems.
- Provide chart categories, direct labels, and explanatory context when colors alone are ambiguous.
- For important diagrams, include a concise text description in speaker notes or accompanying narration.

## Speaker notes and narrative script

Native PowerPoint speaker-note export is not a guaranteed current capability. If notes are requested, produce `speaker-notes.md` alongside the slide deck, keyed by slide number and title. Include talking points, transitions, evidence/sources and timings. Do not assert that notes were embedded in the PPTX unless independently verified.

## Tool-neutral agent orchestration

Presentation work may involve retrieval tools, image creation, office applications, spreadsheet/chart tools, data analyzers, and repository tools. Their use is optional and environment-specific:

- Use browsing or connected documents to retrieve user-provided brand context, verified current facts or licensed reference visuals when requested or necessary.
- Use a graphics/chart/image capability for source assets, **not** to silently substitute a single image for an entire editable slide.
- Use PDF rasterization or slides-preview tools to review visual quality.
- Use the `pptx-typst` CLI for static Typst-to-PPTX conversion; the core workflow must not depend on one proprietary PowerPoint MCP.
- If a native PPTX editing API is separately available, reserve it for explicitly required features that cannot be expressed in the supported Typst IR, and document the resulting split in sources of truth.

## Handoff inventory

Recommended output folder:

```text
deliverable/
  main.typ
  pptx-typst.typ
  assets/
  data/                  # when relevant
  source-scripts/        # when assets are generated from data
  preview.pdf
  export/
    final.pptx
    conversion_report.json
  qa/
    contact-sheet.png
    qa.json
  speaker-notes.md       # when requested
  SOURCE_ASSETS.md       # when externally sourced media require attribution
```

For every delivered chart or complex illustration, distinguish: **editable native object**, **placed image with editable position/crop**, or **static media with source files available**. This avoids implying that a presentation is fully editable when it is only visually similar.
