---
name: pptx-typst
description: Convert PowerPoint PPTX presentations into editable Typst slide projects, edit imported slides while preserving their layout and artwork, create supported Typst slides, inspect conversion warnings, compile previews, validate slide geometry, and export the supported Typst subset back to PowerPoint. Use for PPTX-to-Typst, PPTX round trips, and presentation migration tasks; not for arbitrary Typst documents or pixel-perfect PowerPoint replication.
license: Apache-2.0
compatibility: Requires the pptx-typst Python CLI (Python 3.10-3.13); Typst CLI for PDF previews. EMF/WMF rendering can require Inkscape or Windows GDI+. Some SVG operations require native Cairo.
---

# Use pptx-typst effectively

`pptx-typst` is a **bounded presentation converter and authoring toolkit**, not a general PowerPoint renderer or a general Typst-to-PPTX compiler. Prioritize preserving slide design: geometry, hierarchy, artwork, crops, alpha, color, relative placement, and stacking. Preserve editable text and supported native objects where possible, but identify image-backed or unsupported content explicitly.

## Choose the workflow

| User wants | Use |
| --- | --- |
| Convert existing `.pptx` into editable Typst | **Import** workflow |
| Edit a previously converted deck | **Edit** workflow; start from the existing generated `main.typ` |
| Create a new slide deck designed for eventual PPTX export | **Author** workflow with `pptx-typst init` |
| Export a supported Typst deck to `.pptx` | **Reverse** workflow; expect a bounded static subset |
| Compare fidelity or troubleshoot a failed conversion | **Validate** workflow and reports |

If the task is unrelated to PowerPoint conversion or requires arbitrary Typst programming that must round-trip exactly to PPTX, this is not the right workflow.

## Prerequisites

- Check whether `pptx-to-typst`, `typst-to-pptx`, `pptx-typst`, and `typst` are available. Use `--help` to confirm options in the installed version.
- Python 3.10-3.13 is tested. The project was not published to PyPI at the time this skill was written. Install it from the trusted repository or a verified release archive in a virtual environment; do not assume `pip install pptx-typst` will work.
- Install the Typst CLI separately when PDF previews or compile verification are needed. The release was tested with Typst 0.15.1; confirm compatibility before relying on a different version.
- Before a final Typst-to-PowerPoint export, run `pptx-typst-fonts main.typ --report font_report.json`. In a source checkout, use `python tools/check_presentation_fonts.py main.typ --report font_report.json`. Repeat every `--font-path` passed to the Typst compiler; those directories affect Typst only and do not install fonts for Office.
- Inkscape can convert EMF/WMF into SVG. On Windows, the packaged PowerShell/GDI+ fallback can instead generate transparent PNGs. If neither is available, the original media remains but its rendered object may be omitted. Native Cairo is needed for some SVG masking/raster operations.
- Avoid changing system-wide dependencies or overwriting user files without authorization.

## Import: PowerPoint to editable Typst

```sh
pptx-to-typst "input.pptx" --output "input-typst"
typst compile "input-typst/main.typ" "input-typst/preview.pdf"
pptx-typst-validate "input.pptx" "input-typst" --out "input-typst/geometry-audit.json"
```

Use the default structured master/layout representation. Only use `--layout-mode flat` to reproduce the documented legacy flat output, not as a general fidelity fix. Leave `--mask-mode legacy` and default crop/group settings unless a **specific, visibly verified** issue warrants a different mode.

Expect these output files:

- `main.typ`: imported presentation, slide declarations, and source-object identity comments.
- `template.typ`: generated rendering helpers. Keep it beside `main.typ`.
- `assets/media/`: deduplicated originals and any render derivatives. Keep the directory structure and relative references.
- `asset_manifest.json`: media provenance, source geometry, placements, masters/layouts, and warnings.
- `conversion_report.json`: `status`, `counts`, and per-object `warnings`. A successful process can still report omitted or approximated objects.

**Before editing**, read `conversion_report.json`. For each material warning, record the `slide`, `shape_id`, `issue`, `outcome`, `fallback`, `reason`, and `expected_loss` fields when present. Also inspect `asset_manifest.json` for master/layout ownership and asset paths. Reports may contain warning entries without every field.

## Edit: maintain the imported design

1. Make a copy or work on a version-controlled branch of the generated project. **Do not reconvert over hand-edited `main.typ`**: a fresh import regenerates that file and may discard edits.
2. Preserve existing `PptxMaster`, `PptxLayout`, `PptxSlide` declarations and their relationships. Change shared master/layout content only when an edit should affect all dependent slides.
3. Prefer changing slide-specific text, dimensions, fills, and placed assets within the existing `PptxSlide`. Retain source object marker comments (`// pptx-object: ...`) when moving or editing source-linked objects; they support diagnostics.
4. Keep `#pagebreak()` separators and source slide order unless the user asks otherwise. Keep point-based positioning and source-relative image paths. Do not flatten whole slides to bitmaps to hide defects.
5. Do not delete original images, change image hashes, or replace vector artwork with a low-resolution screenshot merely to pass compilation. When a chart, SmartArt or OLE object is a preview image, retain it as artwork and disclose that the internals are not editable.
6. Preserve palette, shapes, rotations, crops, alpha, and z-order. Do not change font size, line spacing, wrapping, or slide structure simply to pursue pixel similarity. If text no longer fits after a requested edit, adjust the smallest suitable text frame or explain the constraint.
7. Compile after meaningful edits, then inspect the altered slides, neighboring slides, and any slides affected by shared layouts.

> The `pptx-typst-validate` command checks source/manifest placement and image properties for supported ungrouped objects. It does **not** prove the compiled PDF matches PowerPoint pixels, and it does not fully validate nested group transforms. Prefer visual comparison for important presentations.

## Author: new slides designed for PPTX export

```sh
pptx-typst init "new-deck"
typst compile "new-deck/main.typ" "new-deck/preview.pdf"
```

The initialized project supplies a local `pptx-typst.typ`, example assets, and a three-layout starter deck. Begin with its working examples instead of inventing another PowerPoint/Typst interface. Supported authoring helpers include `PptxMaster`, `PptxLayout`, `PptxSlide`, `PptxPlace`, `PptxText`, `PptxBox`, `PptxImage`, `PptxRect`, `PptxEllipse`, `PptxLine`, and `PptxTable`.

- Define reusable artwork, backgrounds, and style structure in masters/layouts; put slide-specific content in slide children.
- Use explicit static declarations and placements for material intended for reverse conversion. Do not expect arbitrary loops, custom macros, computations, or dynamic Typst constructs to be understood by `typst-to-pptx`.
- Keep slides projector-readable. If content is crowded, reduce content or split the slide rather than shrinking every text box.
- To generate only the reusable helper module: `pptx-typst module --output "pptx-typst.typ"`. Do not use `--force` unless replacing existing files was requested.

## Reverse: supported Typst to PowerPoint

```sh
typst-to-pptx "new-deck/main.typ" --output "exports/new-deck.pptx"
```

- Reverse conversion **recognizes only the documented static subset** of Typst declarations, not arbitrary Typst. It also supports the legacy `Root`/`Place` structure in limited cases.
- Read `exports/conversion_report.json` after export. It reports unsupported constructs, loss of editable structure, media problems, and other bounded-subset limitations.
- Review the font report separately from geometry diagnostics. It distinguishes Typst compiler availability from the local PowerPoint/system font inventory and marks unsupported checks as `unknown`; it never installs or substitutes fonts. Pass `--pptx`, `--typst-pdf`, and `--powerpoint-pdf` to the checker when available to compare requested families, DrawingML declarations, and PDF-reported families.
- Put reverse output in a separate directory so its `conversion_report.json` does not overwrite an import report.
- Open/render the `.pptx` in PowerPoint or a compatible viewer when available. Inspect placeholders, masters, images, and tables; do not assume a successfully written `.pptx` looks identical to the Typst PDF.

## Validate and handle failures

**Check in this order:**

1. Confirm converter and Typst versions; keep source `.pptx` unchanged.
2. Check command exit codes and confirm `main.typ` plus its referenced assets exist.
3. Inspect `conversion_report.json`; prioritize missing pictures/shapes, large objects, empty placeholders, unexpected layering, and missing fonts. Treat `completed_with_warnings` as a warning, not a clean fidelity result.
4. Compile the Typst output; verify expected page count and legibility. Source hidden slides can remain in Typst even if PowerPoint PDF export omits them.
5. If an original PowerPoint render is available, compare affected slides side by side at the **same page dimensions**. Review a cover, dense/text-heavy slide, image-heavy slide, and every slide with material warnings.
6. When exporting back, inspect the reverse report and the resulting PPTX with an independent viewer if available.
7. Summarize fixes separately from accepted limitations. Never label a conversion “lossless” or “pixel-perfect” solely because it compiled.

Common issues and appropriate responses:

| Symptom | First response |
| --- | --- |
| EMF/WMF not rendered | Check optional Inkscape / Windows GDI+ availability; inspect fallback warning and derivative; do not claim source vector is now editable |
| SVG masking or reverse rasterization fails | Check native Cairo; use documented fallback and report visual loss |
| Text rewraps or changes shape | Check installed source fonts, inheritance, frame dimensions, and text warnings; avoid arbitrary global font calibration |
| PowerPoint text shifts while Typst is aligned | Check `font_report.json` and extracted PDF font families. A detected substitution can change text metrics; do not change positions or sizes to compensate. Link the licensed font source and ask recipients to install the family through their OS font manager (Windows Fonts settings, macOS Font Book, or their Linux distribution/user-font configuration), then reopen and render the deck; otherwise deliberately revise the design font and rerun both renders. |
| Placeholder appears above an image | Inspect `placeholder_layering_risk` and source z-order; treat as a known limitation, not proof of successful reproduction |
| Missing chart or SmartArt | Check whether a cached preview was materialized; retain its visual form and disclose non-editability; native charts remain unsupported |
| Grouped shapes, gradients, masks, or arrowheads differ | Confirm supported subset and run a focused visual comparison before altering modes or converting to images |
| Reverse export omits content | Check whether the source used unsupported dynamic Typst or unsupported media; simplify to supported static constructs if editability is required |

## Delivery checklist

Report all of the following, as applicable:

- Paths to edited Typst project, compiled PDF, optional PPTX output, and conversion report.
- Which slides were edited or checked, with source shape IDs for material warnings.
- Whether compile/export completed and page counts matched the intended presentation.
- Important visual differences, omitted elements, substitutions, fallbacks, and losses of editability.
- Which verification steps could not run because PowerPoint, Typst, fonts, or optional platform tools were unavailable.

Do not silently discard warnings, claim full support for arbitrary PowerPoint, or start a new converter feature-development cycle when the user asked only to convert/edit a presentation.

For project-specific feature boundaries, consult the repository [README](https://github.com/Sovichea/pptx-typst), [media compatibility](https://github.com/Sovichea/pptx-typst/blob/main/docs/media-compatibility.md), and [release readiness](https://github.com/Sovichea/pptx-typst/blob/main/docs/experimental-release-readiness.md). Prefer the installed version's `--help` and reports over assumptions based on this skill.
