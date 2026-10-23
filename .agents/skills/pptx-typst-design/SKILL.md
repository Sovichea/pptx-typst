---
name: pptx-typst-design
description: Design polished, projector-readable, editable presentations with Typst as the intermediate representation and pptx-typst as the PowerPoint export path. Use for new slide decks, branded presentations, executive pitches, research talks, diagrams, dashboards, visual storytelling, redesigns, and slide revisions when the requested deliverable is PPTX plus editable Typst source. Includes presentation narrative, art direction, master/layout architecture, visual QA, and round-trip export checks.
license: Apache-2.0
metadata:
  compatibility: Requires the pptx-typst CLI and Typst 0.15.1 or a verified compatible version. PDF render review needs Typst and a PDF viewer or rasterizer; PPTX export is limited to the converter's statically parseable Typst subset.
---

# Design PowerPoint presentations through Typst IR

**Primary contract:** create a high-quality presentation, not merely a compilable file. Typst is the **source of truth and editable intermediate representation**. Its PDF is the visual proof. The `.pptx` is a separately verified delivery format. A passing Typst compile does not prove that PowerPoint retained the design.

Use this skill for presentation design and authoring. For importing an existing PowerPoint, preserving its geometry, and editing a converted deck, also consult the sibling `pptx-typst` skill when installed.

## Non-negotiable principles

1. **Art-direct first.** Clarify audience, purpose, key action, speaker, room/screen, branding, duration, and output requirements from available context. If unanswered, choose sensible defaults and proceed. Do not start drawing before defining the story and design direction.
2. **One message per slide.** Make each title communicate a conclusion. Prefer charts, diagrams, comparison, images, and process visuals over dense lists. Be faithful to the supplied facts; never manufacture metrics or attribution.
3. **Projector-first.** At 960 × 540 pt (16:9), target titles 32–44 pt, body 22–28 pt, generous 1.2–1.35 line spacing, and substantial whitespace. Reserve smaller text for limited labels or sources; never rescue an overloaded slide solely by shrinking fonts. Split slides instead.
4. **Use a coherent design system.** Define palette, fonts, 4/8/12/16/24/32 pt spacing scale, margins, grid, component styles, image treatment, charts, and slide types. No arbitrary microscopic adjustments unless needed to correct a measured rendering issue.
5. **Preflight fonts before final export.** Declare intended font families in the design system and run `pptx-typst-fonts deck/main.typ --report deck/font-report.json` (or `python tools/check_presentation_fonts.py ...` in a source checkout). Pass each same `--font-path` used by Typst compilation. Typst font availability and Office/system font availability are separate checks; `--font-path` does not install or embed a font for PowerPoint.
6. **Build an editable scene.** Compose PowerPoint-friendly static `PptxMaster`, `PptxLayout`, `PptxSlide`, `PptxPlace`, native text/shape/table primitives, and separately authored image assets. Avoid unsupported dynamic Typst constructs if PPTX is required.
7. **Author semantic components, then lower them to static IR.** Cards, badges and diagram nodes use one declared component bounding box. Align labels inside a `PptxTextFrame` with explicit paragraph alignment, vertical anchor and margins; do not estimate a second text coordinate. See [semantic components](references/semantic-components.md). Do not implement these as user-defined Typst macros that the exporter cannot evaluate.
8. **Design in layers.** Put shared branding and chrome in masters; repeated layout structure in layouts; editable slide-specific content in slides. Avoid per-slide duplication and all-slide rasterization.
9. **Review every rendered page.** Render contact sheets plus full-resolution critical slides; fix clipped text, low contrast, misalignment, invisible elements, accidental overlaps, and inconsistent rhythm.
10. **Round-trip QA.** Export the PPTX with `typst-to-pptx`, read its `conversion_report.json`, then inspect/render the resulting PPTX if a viewer or PowerPoint renderer is available. When comparing PDFs, use consistent fonts where possible and inspect the font preflight/render report. Do not adjust positions to compensate for a substituted font; first make the intended font available or make an explicit design decision to use a substitute.
11. **Deliver a reproducible package.** Include Typst source, helper module, original assets and provenance, preview PDF, PPTX, and a concise quality/limitations report as appropriate. Report missing/substituted family names, link the licensed font source, and tell recipients to install the font through their OS font manager (Windows Fonts settings, macOS Font Book, or their Linux distribution/user-font configuration) before opening or rendering the deck. Never claim PPTX parity that was not checked.

## Choose the authoring route

| User request | Route |
| --- | --- |
| New high-quality deck to deliver as PPTX | **Typst IR authoring** (this skill), compile PDF, export PPTX, verify |
| PPTX plus editable source | Same; keep `.typ` and external assets as canonical |
| Edit imported PowerPoint | Use `pptx-typst` import/edit workflow; preserve source object IDs and existing hierarchy |
| PDF-only artistic presentation | Full Typst is allowed, but do not promise subsequent PPTX editability |
| True native PowerPoint charts, animation, notes, SmartArt or arbitrary editable graphics | Explain current converter boundary; if required, plan a specifically authorized native-PPTX finishing step rather than silently substituting a non-editable picture |

## Standard workflow

### 1. Brief and storyboard

- Derive the **one-sentence thesis**, desired decision/action, audience knowledge, time budget, and key evidence.
- When reference decks are supplied, inspect the set before choosing an art direction. Extract its visual signature and separate reusable rules from slide-specific layouts; use [design language from reference decks](references/design-language.md). Do not copy low legibility or repeated-layout habits simply because they appear in a template.
- Write a slide map containing **slide number, claim-title, information role, evidence/visual, layout archetype, visual anchor, and speaker intent**. Aim for a strong opening, logical middle, and memorable closing. Vary rhythm; avoid five consecutive identical grids.
- Select an art direction (e.g., editorial, technical, premium, government, scientific) and 2–3 reusable layout families. Consult [design system and narrative](references/design-system.md) and [composition patterns](references/composition-patterns.md).
- Verify all factual numbers and source assets. If evidence is unavailable, use explicitly labeled placeholders rather than invented statistics.

### 2. Design system and implementation plan

- Use `960pt × 540pt` for 16:9 unless the user specifies another ratio; `#set page(width: 960pt, height: 540pt, margin: 0pt)` and matching `PptxSlide` dimensions.
- Start with `pptx-typst init <project>`, or `pptx-typst module --output <project>/pptx-typst.typ`; work with the **generated helper module** from the installed version. Do not hand-invent its API.
- Define one or more `PptxMaster` and `PptxLayout` values. Keep all essential slide geometry as **explicit static point values** for predictable reverse parsing. Typed styles and simple shared declarations can be used if the reverse parser recognizes them; prove export before using aliases throughout.
- For component-heavy slides, describe cards, badges, metrics, and diagram nodes in JSON, then run `scripts/lower_components.py` to emit converter-supported static placements and a QA manifest. Review the emitted Typst; do not call custom component macros from the final `.typ` source.
- Create a content hierarchy: kicker, statement, proof, supporting detail. Establish whitespace and image crop strategy before fine typography.
- Route features using [Typst IR API and feature routing](references/typst-ir-api.md). Complex visual assets can be SVG/PNG (with source/provenance); text, simple shape geometry, and tables should remain native/editable whenever supported.

### 3. Build a small vertical slice

```sh
pptx-typst init deck
# inspect deck/main.typ and deck/pptx-typst.typ
# replace starter copy and visuals using supported static declarations
typst compile deck/main.typ deck/preview.pdf
mkdir -p deck/export
typst-to-pptx deck/main.typ --output deck/export/deck.pptx
# inspect deck/export/conversion_report.json
```

Author **2–3 representative slides first**: a cover, a dense information slide, and a visual/diagram slide. Compile and reverse-convert these before committing to the entire deck. Fix any unsupported construct in the vertical slice. This avoids discovering at the end that a sophisticated Typst feature is not exportable.

### 4. Fill the deck

- Make content **scannable from the back of a room**. Chart labels and equations need deliberate space; prefer direct labels over tiny legends.
- Use named layout families for consistent title positions, margins, and footer treatments, but vary information compositions. Prefer native bar charts built from simple rectangles and labels when editability matters; pre-render complex scientific charts only when explicitly acceptable.
- Keep the number of graphical elements purposeful. Prioritize high-quality photos, meaningful diagrams, icons of consistent weight, and data-accurate plots over generic decoration.
- Never layer text over an important image without a contrast treatment; never crop out a subject or source annotation unintentionally.
- Do not fabricate source data, logos, photographs, or citations. Record asset rights/provenance when using external media.
- Keep chart and table values consistent with any supplied data file. Where native chart conversion is unsupported, disclose which visuals are static media rather than editable chart objects.

### 5. Render, inspect, and repair

```sh
typst compile deck/main.typ deck/preview.pdf
python <skill>/scripts/inspect_deck.py --pdf deck/preview.pdf --out deck/qa \
  --expect-pages 12
```

Use the page count that matches the actual deck. Inspect the generated contact sheet, then full-resolution slides that are dense, image-heavy, or visually anomalous. Follow [visual QA and acceptance](references/visual-qa.md). Recompile after fixes. **Do not mark as done merely because no compile error occurred.**
When a component manifest is available, run component-aware QA against the Typst PDF and exported-PPTX render. Confirm the reported renderer and review unavailable or ambiguous text matches visually.

### 6. Export and inspect PPTX

```sh
typst-to-pptx deck/main.typ --output deck/export/deck.pptx
python <skill>/scripts/inspect_deck.py --pdf deck/preview.pdf \
  --pptx deck/export/deck.pptx \
  --report deck/export/conversion_report.json \
  --out deck/qa-export
```

- Read every material warning and validate slide count, major shape coverage, missing assets, text, slide background, hierarchy, and intended native editability.
- **Important:** reverse conversion is a bounded static Typst parser; it does not evaluate arbitrary Typst macros, dynamic loops, imported design packages, complex native chart logic, or arbitrary visual effects. Treat unsupported constructs as an authoring-design limitation, not a compiler bug.
- If a PowerPoint renderer is available, render the exported PPTX to PDF and compare representative or all pages to the Typst PDF. **PDF parity and PPTX editability are different checks.**
- If unable to render/export, provide the valid Typst/PDF artifacts and state what cannot be verified. Do not invent a PPTX success claim.

### 7. Deliver

Include a **brief QA statement**: intended slide count, Typst compile status, PPTX export status, number/type of conversion warnings, visual review coverage, major known limitations, source attribution, and editability tradeoffs. Make the source project runnable from its own directory.

## Quality gates: what must be true

- **Narrative:** coherent point of view, meaningful title on every slide, no unsupported factual claims.
- **Visual:** aligned grid, cohesive color/typography, sufficient contrast, images intentionally cropped, sensible information density, no cut-off content; review every slide.
- **Technical:** explicit page size, valid Typst source, all assets present, slide count matches, fonts and colors used intentionally.
- **Export:** `.pptx` opens when inspected, common text and shapes remain editable, warnings reviewed, shared layouts preserved if used.
- **Honesty:** identify all image-backed or unsupported visual elements, unverified viewers, unavailable fonts, and incomplete round-trip checks.

## Read these targeted references only when needed

- [Design system and narrative](references/design-system.md): art direction, hierarchy, typography, color, readability, content strategy.
- [Design language from reference decks](references/design-language.md): extract a coherent design signature, choose composition by information role, and adapt visual patterns for Typst IR.
- [Composition patterns](references/composition-patterns.md): concrete layout recipes for covers, split slides, diagrams, comparisons, metrics, timelines, technical slides, and conclusions.
- [Typst IR API and feature routing](references/typst-ir-api.md): actual helper aliases, static code examples, editability and exporter constraints.
- [Semantic components](references/semantic-components.md): static lowering recipes for cards, badges, labels, metrics and diagram nodes.
- [Visual QA and acceptance](references/visual-qa.md): inspection protocol, design review rubric, typical faults and correction order.
- [Assets, charts and handoff](references/assets-charts-and-handoffs.md): media licensing, data-accurate plots, diagrams, notes and multi-tool orchestration.
- [Five-slide example deck](examples/main.typ): illustrative static Typst IR structure; copy the helper module with `pptx-typst module` or create with `pptx-typst init`. The example is authored for the v0.1.0 helper interface, not a guarantee for arbitrary future versions.

This is a **design-and-production skill**. It complements rather than replaces the original `pptx-typst` conversion skill. Its ambition can match that of a PowerPoint design agent, while its **export claims remain limited to what the installed `pptx-typst` converter can actually represent and round-trip**.
