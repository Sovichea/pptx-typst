# Semantic layout components

Use a small component description to state intent and bounds, then lower it to the static Typst subset. The exporter does not evaluate custom Typst macros. The helper in `scripts/lower_components.py` emits ordinary `PptxPlace`, `PptxRect`/`PptxEllipse`, and `PptxTextFrame` declarations that remain individually editable in PowerPoint.

## Alignment rule

Every component owns one authoritative rectangle. A card or diagram node may use a native shape for its fill and border, plus a text frame on the exact same `(x, y, width, height)`. Set text padding as the frame's margins, horizontal alignment on its paragraph, and vertical alignment on the frame anchor. Do not add offsets such as `x + 12pt` to imitate centering.

The separate shape and text frame are both editable. The frame's bounds are the component bounds; text glyph bounds are smaller and font-dependent. If an icon is present, declare it as another child using the same component rectangle as the reference and a deliberate icon subregion. Do not pretend that a compound component is a single native PowerPoint object.

## Supported component descriptions

- `card`: rectangle background with one or more centered, padded text rows.
- `badge`: ellipse background with a centered label.
- `diagram-node`: rectangle or ellipse background with centered, padded text.
- `label`: aligned text frame with no background shape.
- `metric`: centered value and caption in one text frame, using separate paragraph/run styles.
- `row` and `stack`: simple horizontal or vertical composition of the component descriptions above. The helper computes child bounds, then emits literal point values.

The helper accepts a JSON file and writes a Typst fragment. Example:

```json
{
  "components": [
    {
      "id": "step-discover",
      "slide": 1,
      "kind": "card",
      "x": 80,
      "y": 180,
      "width": 240,
      "height": 132,
      "text": "Discover",
      "font": "Arial",
      "size": 24,
      "weight": "bold",
      "color": "#18372F",
      "fill": "#EEF3EF",
      "stroke": "#C9D4CE",
      "stroke-width": 1,
      "radius": 14,
      "padding": 16,
      "align": "center",
      "anchor": "center"
    }
  ]
}
```

Run it from the project root:

```sh
python .agents/skills/pptx-typst-design/scripts/lower_components.py \
  components.json --output components.typ --manifest-output components.qa.json
```

Insert the generated placements inside the intended `PptxSlide(children: [...])`. The generated source intentionally contains numeric literals and supported primitive calls only. Keep the JSON description as a convenient editable design spec, but review the emitted Typst before export.

## Static output shape

For a card, the helper emits the equivalent of:

```typst
#PptxPlace(x: 80pt, y: 180pt,
  child: PptxRect(width: 240pt, height: 132pt,
    fill: rgb("#EEF3EF"), stroke: 1pt + rgb("#C9D4CE"), radius: 14pt))
#PptxPlace(x: 80pt, y: 180pt,
  child: PptxTextFrame(
    width: 240pt, height: 132pt,
    font: "Arial", size: 24pt, fill: rgb("#18372F"), weight: "bold",
    anchor: "center", default-align: "center",
    margin-left: 16pt, margin-right: 16pt,
    margin-top: 16pt, margin-bottom: 16pt,
    paragraphs: (PptxParagraph(align: "center", runs: (
      PptxPlaceholderRun(text: "Discover", font: "Arial", size: 24pt,
        fill: rgb("#18372F"), weight: "bold"),
    )),),
  ))
```

`PptxTextFrame` paragraphs and run records are also used by native title/body placeholders. Keep paragraph properties in `PptxParagraph`; keep run-specific font, size, color, weight and italics in `PptxPlaceholderRun` so mixed styling survives export.

## Geometry and design scale

Use deliberate point values, normally from a 4/8/12/16/24/32/48 pt spacing scale. The generator accepts fractional point dimensions for imported or measured layouts, but new designs should prefer simple values. Rows and stacks use explicit parent bounds and a gap; each child inherits the cross-axis size unless it declares one. A child that does not fit the parent is reported as a validation issue in the QA manifest rather than silently resized.

The generator is not a constraint solver. It does not infer a layout from visual similarity, interpret Typst, or add unsupported PowerPoint effects. Unsupported component kinds or colors fail fast with a useful error.
