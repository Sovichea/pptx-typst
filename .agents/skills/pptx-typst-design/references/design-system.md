# Presentation art direction and narrative

This reference adapts a professional slide-design workflow to a Typst scene that must later export to PowerPoint. Design quality is judged by what the audience sees and understands, not by the elegance of the source code alone.

## Design brief: minimum useful decisions

Before authoring, extract (or choose defaults for):

- **Audience and context:** executives, technical colleagues, students, investors, workshop; presentation or leave-behind; projector or laptop.
- **Purpose:** inform, persuade, teach, decide, pitch, report progress, or facilitate discussion.
- **Single takeaway and requested action:** what should remain in the audience's mind?
- **Evidence:** trustworthy figures, images, quotations, diagrams, demonstrations, data provenance.
- **Brand:** palette, fonts, logo, and reference deck, if supplied. Do not borrow a client's logo or invent a partner mark.
- **Format:** duration, slide count, aspect ratio, language, PPTX/PDF/source deliverables, degree of PowerPoint editability.

Default when unclear: 16:9, a concise clear editorial style, one main message per slide, minimum decoration, a purposeful visual rhythm, Typst + PDF + PPTX if all tools are available.

## Storyboard before layout

Write a private planning table with columns: slide number; claim headline; evidence; one dominant visual; layout family; speaker objective; sources. Structure the deck like an argument:

1. Open with the problem, opportunity, or compelling answer, not a generic table of contents unless required.
2. Establish stakes and context. Use only necessary definitions.
3. Develop a chain of claims, each supported by evidence or explanation.
4. Include counterpoints, constraints, or risks when appropriate, particularly in executive proposals.
5. Close on implications and a specific next step or memorable takeaway.

Use a **sentence headline** where useful, e.g., "Order accuracy improved while throughput doubled" rather than "Results". Keep supporting statements concise.

Rule of thumb: if the slide requires narration to make sense, add a brief headline, not a paragraph of prose. If it is a document slide intended for independent reading, note the different use case and increase information density deliberately.

## Canvas, grid, and type

Default canvas: 960 × 540 pt. Use point coordinates; do not confuse points with pixels. Useful design tokens:

| Token | Value | Use |
| --- | ---: | --- |
| `slide-width` | 960 pt | Standard 16:9 width |
| `slide-height` | 540 pt | Standard 16:9 height |
| `margin-x` | 48 pt | Default horizontal safe zone; increase for premium look |
| `margin-y` | 36–48 pt | Default top/bottom safe zone |
| `gutter` | 24–32 pt | Between columns |
| Spacing scale | 4 / 8 / 12 / 16 / 24 / 32 / 48 pt | Consistency across the deck |
| Display | 40–52 pt | Covers and big statements (use less text) |
| Slide headline | 32–44 pt | Strong visible hierarchy |
| Body | 22–28 pt | Projected-screen text |
| Subhead | 24–32 pt | Supporting content |
| Data labels | 16–22 pt | Keep charts readable |
| Sources/footer | 11–14 pt | Only when unavoidable; do not use as primary content |

Avoid choosing tiny measured differences such as 0.21 em and independent arbitrary values for every slide. Use established tokens, check the render, and refine only when necessary. Use line spacing near 1.2–1.35; validate in Typst because measured font metrics differ from PowerPoint.

Prefer two complementary font roles: display for titles and humanist sans for body. A single robust family with weight variation is also fine. For Khmer presentations, use available MiSans Khmer with tested glyph coverage; check line breaking and actual projection readability, not just PDF text extraction. Do not assume fonts are embedded in or installed on recipients' PowerPoint systems.

## Palette and contrast

Define: background, foreground, secondary text, one principal accent, one restrained secondary accent, positive/negative status if applicable. A 60/30/10 split is a useful starting ratio, not a rule. Use a neutral background and a sharp accent for corporate/technical decks; strong dark/light alternation can add pacing when intentional.

- Small body text: aim for WCAG 4.5:1 contrast where practical.
- Large text and key diagram elements: at least 3:1, preferably more on washed-out projectors.
- Avoid conveying categories solely by hue: pair colors with labels, shape, or position.
- Charts: keep palette consistent across slides; avoid rainbow bars, unnecessary outlines and arbitrary 3D effects.
- Keep text readable over photos using a dark/light panel or adequate gradient/overlay. The converter supports some gradients but not necessarily editable gradient round-trip; prefer validated, static treatments.

## Composition rules

- Choose one visual focal point, then supporting elements. Align to a clear grid; allow intentional deviations only for visual reasons.
- Leave space around headings and large diagrams. Do not fill every corner or add purely decorative icons without meaning.
- Use images with consistent color treatment, aspect ratio/crop logic, and source rights; consider accessible descriptions in accompanying notes if required.
- Use actual charts for quantitative comparisons. Axis bounds, scales, labels, units and baselines must be honest. Zero baselines for bars unless the chart semantics justify otherwise.
- Tables are for lookup/detail, not for replacing a narrative. If a table needs tiny text, split or simplify it.
- Prefer progressive disclosure by sequencing slides instead of relying on unsupported PowerPoint animation.

## Visualization routing

| Need | Preferred construction | PowerPoint editability |
| --- | --- | --- |
| Title, subtitle, body | `PptxText` inside positioned `PptxBox` | Common text editable |
| Callouts, KPI cards, labels | `PptxRect`, `PptxEllipse`, `PptxText` | Common native elements editable |
| Simple comparison bars | Native rectangles and labels | Bar artwork editable as shapes, not a native chart |
| Simple arrows / flows | `PptxLine`, rectangles, text | Supported lines and triangle markers; verify |
| Photos, detailed logos, icons | Placed asset via `PptxImage` | Image placement editable; internal elements not necessarily |
| Complex charts / maps / technical plots | Rendered SVG or PNG, with original data file separately | Placed graphic only; not editable as native chart |
| Common basic table | `PptxTable` / static `table` | Basic rectangular tables editable; merged cells unsupported |
| Master branding | `PptxMaster` and `PptxLayout` | Shared native parts in supported subset |
| Speaker notes | Separate Markdown or text file if requested | Not guaranteed by current Typst converter |
| Video, animation, arbitrary Typst dynamic drawing | Not supported by the current reverse converter | Requires separate finishing tool and explicit scope |

**Important distinction:** A deck can be as compelling as any PowerPoint deck visually. That does **not** imply every object can remain editable as a PowerPoint-native chart, SmartArt, or animation. Design for the required combination of appearance and editability, then disclose compromises.

## Human design-review questions

- Could someone read this from the back of the room in 5 seconds?
- Is the claim obvious before the speaker explains it?
- Is the dominant visual evidence, not ornament?
- Are alignments and margins consistent with neighboring slides?
- Does every color or icon encode something?
- Does the deck alternate informative and emphatic beats rather than repeating one template?
- Will the final PPTX still work after changing one headline, image, or metric?
