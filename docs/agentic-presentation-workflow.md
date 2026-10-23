# Using pptx-typst as a presentation IR for AI agents

`pptx-typst` can be used as a file-based intermediate representation (IR) for agentic presentation work, in addition to its bidirectional conversion workflow. An AI agent can make supported presentation changes by editing readable Typst source and assets, then generate an editable PowerPoint file through the CLI. Routine edits do not require direct edits to OOXML package parts or repeated actions through an open PowerPoint session and its UI/MCP tools.

This workflow is useful when an agent needs to revise text, update colors or geometry, change repeated slide components, generate slides from structured data, or apply the same supported transformation across a deck. Source files can be reviewed, diffed, and versioned before export.

## Existing PowerPoint as the starting point

Import a deck once and work from the resulting project:

```console
pptx-to-typst source.pptx --output working-deck
typst compile working-deck/main.typ working-deck/preview.pdf
typst-to-pptx working-deck/main.typ --output revised-deck.pptx
```

An agent can edit `working-deck/main.typ` and supported assets between compilation and export. Keep `template.typ`, `assets/`, and the generated hierarchy and object markers with the project. Review `conversion_report.json` and `asset_manifest.json` before making edits so the agent understands what was preserved, approximated, or left unsupported. Run `pptx-typst-validate` after edits when source geometry is available.

## New agent-authored presentations

Initialize a project and generate the final Typst IR as explicit static declarations:

```console
pptx-typst init new-deck
# An agent or generator writes supported declarations to new-deck/main.typ.
typst compile new-deck/main.typ new-deck/preview.pdf
typst-to-pptx new-deck/main.typ --output new-deck.pptx
```

Use the generated helper module and supported primitives such as `PptxMaster`, `PptxLayout`, `PptxSlide`, `PptxPlace`, `PptxText`, `PptxRect`, `PptxImage`, and `PptxTable`. Generate static source from external data or an agent's plan when automation is useful. The final IR must remain within the documented statically resolvable subset.

## Why use the IR workflow

- **Work directly on files.** Import, editing, compilation, and PPTX export do not require the PowerPoint application to be open. This avoids serial UI operations and per-edit PowerPoint MCP calls for supported tasks.
- **Keep edits reviewable.** Text-based source can be inspected and diffed. Masters and layouts express shared structure once, and slide-owned content stays separate.
- **Make transformations repeatable.** A script or agent can apply a consistent change across selected slides and preserve the resulting source project for later revisions.
- **Retain editability where supported.** Text, common shapes, tables, placeholders, and hierarchy are emitted as native PowerPoint objects. Reports disclose image-backed fallbacks and unsupported features.

This is not a promise that every PowerPoint feature has an equivalent Typst representation. Arbitrary OOXML parts, native chart internals, animation, some advanced effects, and arbitrary Typst programs remain outside the supported subset. If a task depends on one of those features, preserve it carefully and use a native PowerPoint workflow for that portion. Always compile and inspect the rendered result; use Microsoft PowerPoint or another compatible viewer for final PowerPoint-specific QA when available.

For semantic slide design and component recipes, see the [Milestone 9 semantic layout guide](milestone-9-semantic-layout.md) and the [presentation design skill](../.agents/skills/pptx-typst-design/SKILL.md). For conversion commands and supported features, see the [README](../README.md) and the [conversion skill](../.agents/skills/pptx-typst/SKILL.md).
