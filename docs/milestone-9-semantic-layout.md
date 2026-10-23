# Milestone 9: Semantic Layout and Agent Design Workflow

## Result

The design skill now has a small semantic authoring path that lowers cards, badges, metrics, labels, diagram nodes, rows, and stacks into explicit static Typst IR. Each component owns one geometry; its shape and `PptxTextFrame` use the same bounds, and the frame carries alignment, anchor, and padding. The generated source stays inside the converter's existing bounded subset and keeps text and basic shapes editable.

This implementation is a lightweight JSON-to-Typst source generator rather than a new public Typst macro system. Row and stack layouts resolve to literal positions before conversion. The skill documents this static-lowering requirement and now includes component-aware QA guidance.

## Changes

- Added the `pptx-typst` and `pptx-typst-design` repository skills from the provided archive, including design references, asset guidance, and a five-slide example.
- Added `lower_components.py`, which validates component IDs, bounds, colors, padding, and supported kinds; emits readable Typst source; and writes a component geometry manifest for QA.
- Added QA measurements for rendered glyph bounds relative to declared component frames, including horizontal/vertical alignment errors, overflow, missing and ambiguous matches, and available font metadata. Comparison reports distinguish authoring errors from PowerPoint-rendered converter errors; other rendering backends are labeled as renderer/conversion differences.
- Updated native rounded-rectangle export to map the requested radius to the preset shape adjustment, clamped at half the smaller side. The shape remains editable.
- Added regression tests for semantic lowering, literal row layout, invalid definitions, alignment failure classification, unavailable text matches, and rounded-rectangle adjustments.

## Validation

The synthetic semantic-layout fixture compiles with Typst 0.15.1 and exports as one editable PPTX slide. The export contains 7 native geometric shapes and 8 text frames, with zero conversion warnings and no out-of-canvas shapes. Component QA matched all 7 labels; all 7 passed, with horizontal center error no more than 0.01 pt, vertical center error no more than 2.30 pt, and no text-frame overflow. The same QA utility's regression test detects a deliberately shifted label.

Artifacts: [semantic fixture source](../.agents/skills/pptx-typst-design/examples/semantic-layout/main.typ), [QA contact sheet](../.agents/skills/pptx-typst-design/examples/semantic-layout/qa/contact-sheet.png), [component measurements](../.agents/skills/pptx-typst-design/examples/semantic-layout/qa/qa.json), and [editable PPTX](../.agents/skills/pptx-typst-design/examples/semantic-layout/semantic-components.pptx).

The full test suite passed: **63 passed in 31.59 seconds**. The synthetic deck demonstrates static component lowering and source-PDF alignment; it does not validate PowerPoint's rendering. This environment has no connected PowerPoint or LibreOffice renderer, so exported-PPTX visual alignment remains unverified. `python-pptx` inspection confirms package structure and object presence only.

## Limits and decision

The FIELD / FORWARD source deck was not present in the available workspace, so that reference deck was not rebuilt. The added synthetic fixture exercises cards, a badge, diagram nodes, and a metric, but does not substitute for the requested FIELD / FORWARD regression. The lowerer intentionally supports only a small static set and is not a constraint solver or Typst evaluator. Component QA depends on searchable PDF text; wrapped or ambiguous labels are reported unavailable instead of being counted as passes.

**PARTIAL:** The semantic authoring/lowering path, radius mapping, and Typst-PDF component QA are implemented and tested. PowerPoint-rendered visual validation and the FIELD / FORWARD reference rebuild remain unverified.
