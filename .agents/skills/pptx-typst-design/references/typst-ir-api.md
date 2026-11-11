# Verified Typst IR authoring API

This reference reflects the `pptx-typst` v0.1.0 helper module at `src/pptx_typst/templates/pptx-typst.typ`, reviewed October 23, 2026. It is not the whole Typst language. **Typst compilation support is broader than the static Typst-to-PPTX export parser.** Verify an intended primitive with an early PPTX export.

## Setup

Generate a helper module from the installed version:

```sh
mkdir -p deck
pptx-typst module --output deck/pptx-typst.typ
```

Or start from an example that already uses the correct module:

```sh
pptx-typst init deck
```

A deck's `main.typ` typically begins:

```typst
#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)
```

The module includes these native aliases:

| Name | Underlying helper | Use |
| --- | --- | --- |
| `PptxMaster(children: [], fill: none, background: none, placeholders: ())` | Shared layer data | Brand/geometry used by multiple layouts |
| `PptxLayout(master: ..., children: [], fill: ..., placeholders: ..., show-master: true)` | Shared layer data | Reusable slide pattern |
| `PptxSlide(width: ..., height: ..., layout: ..., children: [], placeholders: ())` | Renderable slide | Per-slide content and inherited layers |
| `PptxPlace(x: ..., y: ..., orientation: ..., child: ...)` | `Place` | Explicit object placement and rotation |
| `PptxGroup` | `GroupContent` | Simple nested positioned content; test reverse editability |
| `PptxBox` | Typst `box` | Text frame, panel, fixed extent |
| `PptxClip` | Typst `box` | Crop/clip only when supported; test export |
| `PptxText` | Typst `text` | Fonts, weights, fills, static text |
| `PptxImage` | Typst `image` | Relative asset with explicit size |
| `PptxRect` | Typst `rect` | Card, bar, rule, panel |
| `PptxEllipse` | Typst `ellipse` | Circles, badges, diagram nodes |
| `PptxLine` | Specialized line with optional markers | Connectors; known triangle marker subset |
| `PptxTable` | Typst `table` | Basic rectangular tables; merged cells not supported |

Native placeholder declarations use `PptxPlaceholderSlot` and `PptxPlaceholder`, but the reverse-converter support is bounded to common title/body uses. Start from the repository's starter deck and placeholder support documentation before authoring them.

## Content blocks and inverse sync

Put visible copy in a content block, not in a string argument. Typsastra/Tinymist inverse sync indexes markup text; copy supplied only through `PptxText(...)["..."]` or a new `PptxPlaceholderRun(text: "...")` record cannot be clicked back to its source.

Use a layout box for bounds and a nested `PptxText` for the copy:

```typst
#PptxPlace(x: 80pt, y: 240pt,
  child: PptxBox(width: 240pt, height: 140pt)[
    #align(center + horizon)[
      #PptxText(font: "Arial", size: 24pt, weight: "bold",
        fill: rgb("#18372F"))[Detect]
    ]
  ])
```

The nested `PptxText` remains a native editable text box in PPTX, while the surrounding `PptxBox` supplies its frame bounds and alignment. For multi-line copy, set `#set par(leading: ...)` inside the box and use `#linebreak()` or allow the box width to wrap. This rule applies to visible copy only: font family names, asset paths, colors, and other parameters remain ordinary strings.

Keep `PptxTextFrame` and `PptxPlaceholderRun` only for preserving an imported deck's existing paragraph records. Do not use them for new copy, and rewrite edited copy into content blocks.

## Proven base architecture

This is the structural idiom used by the repo's bundled starter, shortened for clarity:

```typst
#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)

#let Brand = PptxMaster(
  fill: rgb("#F6F7F5"),
  children: [
    #PptxPlace(x: 48pt, y: 500pt,
      child: PptxRect(width: 864pt, height: 2pt, fill: rgb("#D9E0DC"))),
  ],
)

#let StatementLayout = PptxLayout(
  master: Brand,
  children: [
    #PptxPlace(x: 48pt, y: 94pt,
      child: PptxRect(width: 56pt, height: 5pt, fill: rgb("#E18C43"))),
  ],
)

#PptxSlide(
  width: 960pt, height: 540pt,
  layout: StatementLayout,
  children: [
    #PptxPlace(x: 48pt, y: 130pt,
      child: PptxBox(width: 810pt, height: 135pt)[
        #PptxText(font: "Arial", size: 42pt,
          weight: "bold", fill: rgb("#18372F"))[
          A clear claim supported by one visual
        ]
      ]),
    #PptxPlace(x: 48pt, y: 308pt,
      child: PptxText(font: "Arial", size: 23pt,
        fill: rgb("#4A625A"))[Supporting evidence goes here.]),
  ],
)
```

Add `#pagebreak()` **between** slides, not after the final slide unless specifically needed. In this style, each element is an explicit static `PptxPlace`; keep numbers literal where possible.

## Image placement

```typst
#PptxPlace(
  x: 560pt, y: 120pt,
  child: PptxImage("assets/team-photo.png", width: 320pt, height: 240pt),
)
```

Place the asset inside the project. Choose and prepare the crop intentionally. A static image can be moved/resized in PPTX if supported, but text inside the image is not editable as PowerPoint text. **Do not convert an entire slide to an image** unless that was explicitly requested.

For `SVG`, export support can depend on native Cairo when reverse conversion needs rasterization. Include a PNG fallback or test the chosen target environment.

## Editable cards and diagram nodes

Prefer one authoritative component rectangle and place the text frame on the same bounds. The text frame owns alignment, vertical anchor and inset, so the label is never positioned by estimating a separate text origin. The rectangle and text frame remain separate native PowerPoint objects.

```typst
#let card-x = 80pt
#let card-y = 240pt
#let card-width = 240pt
#let card-height = 140pt

#PptxPlace(x: card-x, y: card-y,
  child: PptxRect(width: card-width, height: card-height,
    fill: rgb("#EEF3EF"), stroke: 1pt + rgb("#C9D4CE"), radius: 16pt))
#PptxPlace(x: card-x, y: card-y,
  child: PptxBox(width: card-width, height: card-height)[
    #set par(leading: 4pt)
    #align(center + horizon)[
      #PptxText(font: "Arial", size: 24pt, weight: "bold",
        fill: rgb("#18372F"))[Detect]
    ]
  ])
```

The four component values are authored once and reused for both placements; adjust the component bounds or padding rather than the text origin. The box dimensions determine the editable text frame, `#align` controls horizontal and vertical alignment, and `#set par(leading: ...)` controls multi-line rhythm. Use this same-bounds pattern for a card, badge or diagram node; select `PptxEllipse` as the background for circular nodes. Keep complex icons as separate assets or supported shapes. Rounded-rectangle radius maps to PowerPoint's native adjustment within the shape's maximum possible radius; inspect the exported result for the design's corner scale.

The static exporter does not evaluate custom component macros. Any generator or agent-side component recipe must lower to explicit `PptxPlace`, `PptxRect`/`PptxEllipse`, `PptxBox`, `PptxText` and content-block calls in the final source; keep `PptxTextFrame` only for preserving imported run records.

## Native shape-based charts

When an editable native PowerPoint chart is **not required**, use static geometric bars for short quantitative comparisons. Explicitly scale values from a true baseline. Example, values 35 and 70 on a 0–100 scale with 240 pt available bar width:

```typst
#PptxPlace(x: 210pt, y: 230pt,
  child: PptxRect(width: 84pt, height: 34pt, fill: rgb("#9DBBB1")))
#PptxPlace(x: 210pt, y: 300pt,
  child: PptxRect(width: 168pt, height: 34pt, fill: rgb("#1B6252")))
```

Those widths correspond to 35/100 × 240 and 70/100 × 240. Also add editable category labels, values and units in separate `PptxText` placements. Mark the bars as **shapes**, not a native chart. Do not invent metric values for user decks.

## Connector lines

The helper's `PptxLine` accepts `start`, `end`, `stroke`, and optional marker arguments including `head-end`/`tail-end`. Triangle-marker handling exists in the supported converter subset, but not all marker styles export. Prefer ordinary lines or tested triangle markers; review `conversion_report.json` after export. For intricate technical routing use a vector asset and disclose reduced editability.

## Basic tables

`PptxTable` maps to Typst `table`. The converter supports basic static rectangular tables. Use the starter syntax from the installed helper and test a minimal two-row table through `typst-to-pptx` before building a large report. Merged cells, arbitrary cell functions, complex gradients and automated conditional formatting are not a safe assumption.

## Unsupported or risky Typst patterns for PPTX delivery

- Dynamic `for`, `while`, computed layouts and custom macros that generate slide objects, even if they render successfully in Typst.
- Complex charts drawn by external Typst packages, equations and SVG-internal text that must stay native-editable.
- Freeform visual effects, masks, shadows, arbitrary transforms and nested groups that are not included in the documented reverse parser.
- Animation, transitions, embedded video, native PowerPoint speaker notes and native charts.
- Mixing slide sizes inside a single deck.

### How to handle a rich visual outside the static subset

1. Determine whether the user prioritizes **appearance** or **native editability**.
2. If appearance matters more, render the visual to high-resolution PNG or SVG using a trusted graphics workflow; keep its data/source in the project; place it as a `PptxImage`.
3. If every constituent must be editable, express it through supported native text/line/shape primitives or state that the current converter cannot produce that specific native feature.
4. Use a separate PowerPoint-native finishing tool only when explicitly requested and available. Do not silently claim success.
5. Always render the final PPTX and check whether objects have the intended layers, geometry, fonts, and crop.

## Export and file structure

```text
presentation/
  main.typ
  pptx-typst.typ
  assets/
    photo.png
    illustration.svg
  preview.png
  preview.svg
  preview.pdf
  export/
    presentation.pptx
    conversion_report.json
  qa/
    contact-sheet.png
    qa.json
```

Use PNG or SVG for the design loop. On the final pass, render PNG, SVG, and PDF from the same source:

```sh
pptx-typst compile presentation/main.typ --output "presentation/preview-{p}.png" --ppi 144
pptx-typst compile presentation/main.typ --output "presentation/preview-{p}.svg"
pptx-typst compile presentation/main.typ --output presentation/preview.pdf
typst-to-pptx presentation/main.typ --output presentation/export/presentation.pptx
```

A single-page poster can omit the `{p}` page template. Set every font size to a multiple of 0.5 pt; PowerPoint does not render arbitrary fractions reliably.

`conversion_report.json` is written beside the PPTX output. If importing an original PPTX, keep its generated `asset_manifest.json` and source object comments and use `pptx-typst-validate` for geometry checks; that validation is *not* needed for a newly authored deck with no source PPTX.

Primary reference: [pptx-typst GitHub repository](https://github.com/Sovichea/pptx-typst) and its installed `src/pptx_typst/templates/pptx-typst.typ`.
