# Design language from reference decks

Use this guide when the user provides example decks, brand presentations, or asks for a polished visual direction. It distills recurring design ideas from a review of 29 professional template decks. Treat those decks as evidence of workable design systems, not as templates to copy verbatim.

## What to learn from the reference set

The decks varied widely: restrained editorial systems such as Japandi Linear and Classical Neutrals; image-led covers such as Modern Minimalist; motif-driven systems such as Outdoor Exploration and Back to School Night; and abstract visual systems such as Blue Spheres and Celestial Design. Their common strength was consistency within each deck, not a shared visual style across decks.

The strongest reusable ideas were:

- **A small number of recognizable cues.** Each deck repeated a distinct combination of palette, type roles, line or shape treatment, image framing, and motif. For example, Outdoor Exploration used a dark green field, a torn orange boundary, landscape photography, and compass/camp motifs. Reuse one or two such cues with restraint; do not scatter unrelated icons or decorative shapes.
- **A stable frame with changing compositions.** Page rules, safe margins, title zones, section markers, or footers established continuity. Inside that frame, compositions changed for covers, lists, timelines, tables, portraits, and statements. Keep brand identity steady while letting the information determine the layout.
- **Intentional asymmetry and image placement.** Split panels, inset image windows, off-center focal points, and cropped motifs created energy. Make the imbalance deliberate: align the elements that belong together, preserve clear reading order, and leave negative space around the focal point.
- **Typography as structure.** Strong cover type, clear display/body roles, restrained use of capitals, and consistent alignment made the hierarchy visible before reading the details. A display face can carry personality while body text remains plain and legible.
- **Motifs that support the subject.** The outdoor compass, school cutout shapes, and abstract spheres gave their decks a recognizable visual vocabulary. Prefer one meaningful motif that can recur at different scales over generic decoration on every slide.
- **Image treatment that belongs to the system.** Photography used repeatable crops, panels, frames, or masks. Choose the treatment once, then vary subject and placement only when the slide's purpose calls for it.

These are design options, not universal requirements. A quiet, typographic deck may need no motif; a technical talk may use diagrams as its signature visual language.

## Extract a design DNA before authoring

When references exist, inspect a contact sheet of all slides, then open full-size examples of the cover, at least two different content roles, a data or diagram slide when present, and the ending. Record a compact design DNA card:

| Decision | Record |
|---|---|
| Art direction | A short phrase describing tone and subject fit |
| Palette | Background, text, main accent, secondary accent, and status colors |
| Typography | Display and body families, weights, sizes, and alignment behavior |
| Grid | Safe margins, columns, gutters, title zone, recurring rules or footer |
| Shape language | Corners, outlines, line weights, panels, dividers, and motif |
| Image treatment | Full bleed, split panel, inset window, crop, tint, or frame |
| Layout families | The few compositions actually repeated in the reference |

Separate **invariants** from **variables**. Invariants include palette, type roles, repeated borders, and image treatment. Variables include column count, focal point, and whether the slide uses a photo, diagram, table, or large statement. Do not reproduce accidental features such as cramped text, inconsistent spacing, or a one-off decorative object.

If no references are supplied, create the same card from the brief. Choose cues that fit the audience and topic instead of defaulting to cards, gradients, or stock icons.

## Choose composition by information role

The storyboard should map the content to a composition, not force every slide into the same layout family.

| Information role | Useful composition | Visual check |
|---|---|---|
| Opening or section transition | Image-led split, typographic poster, quiet framed title, or a restrained motif-led cover | One dominant focal point; title has clear contrast |
| Main claim | Large statement with a short proof point or meaningful image | Claim reads before supporting detail |
| Explanation | Editorial two-column layout, annotated image, or a simple diagram | Reading order and relationships are obvious |
| Comparison | Mirrored columns or two visual fields sharing the same scale | Differences are easy to scan without searching |
| Process or timeline | Ordered stages on a line, path, or aligned sequence | Direction, timing, and dependencies are unambiguous |
| Metrics | One primary number with a label, context, and source; use a small set for a scorecard | The number is not mistaken for an unsupported claim |
| Lookup or detailed evidence | A readable table or compact structured list | Use only when exact values or categories matter; split if it becomes small |
| People or examples | Consistent portrait/case-study grid with brief labels | Image crops and text positions are uniform |
| Closing | Return to the thesis, decision, or next action; optionally echo the opening motif | The audience knows what to remember or do |

Plan a visual rhythm across the deck. Alternate dense evidence with simpler or more emphatic slides. Change the dominant geometry when the information role changes; retain the same title logic, margins, palette, and motif. Variation should feel authored, not random.

## Translate the design into Typst IR

Treat Typst as both the editable source and the explicit scene description for export. Convert the design DNA into named palette, type, spacing, and grid tokens, then express the reusable structure with `PptxMaster` and `PptxLayout`. Use `PptxSlide` for slide-specific content and static `PptxPlace` bounds for predictable geometry.

- Keep text, basic shapes, lines, and supported tables as native Typst IR so they remain editable in PowerPoint.
- Build a card, badge, metric, or diagram node from one authoritative component box. Put its label in a text frame aligned within those bounds; do not estimate a second coordinate by eye.
- Use shared master/layout objects for repeated branding and frame elements. Do not duplicate a decorative motif onto every slide when it belongs to the shared system.
- Use SVG or raster artwork for detailed illustrations only when native reconstruction would be disproportionate. Keep meaningful text out of images, retain provenance, and disclose the editability tradeoff.
- Prefer simple fills, strokes, crops, and supported geometry. Before relying on masks, gradients, complex clipping, or custom Typst macros, confirm that they compile and survive the static PPTX exporter.
- Preserve the design's type roles when substituting a font. Check both Typst and Office font availability; adjust wrapping only after the intended font is available or a substitute is chosen deliberately.

Prototype the design on a cover, one dense evidence slide, and one visual or diagram slide. Review their compiled PDF at presentation size before scaling the system across the deck. Then export the static IR to PPTX, inspect conversion warnings, and compare representative slides. A compelling Typst PDF does not prove that the PPTX retained every effect or remained editable.

## Keep professional polish without copying template weaknesses

Some references prioritize editorial density or decoration over projection readability. For a live presentation, retain the projector-first sizes and contrast rules in [design system and narrative](design-system.md). Simplify content, enlarge labels, or split the slide before shrinking primary text. Keep decorative artwork away from titles, data, and the main reading path. A slide should still communicate when viewed as a small contact-sheet thumbnail, then remain comfortable to read at full size.
