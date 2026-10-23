# Milestone 9: FIELD / FORWARD Semantic Layout Validation

## Result

FIELD / FORWARD has been rebuilt from the corrected eight-slide handoff source. Slides 4–7 now use static semantic component definitions for cards, badges, labels, and diagram nodes. Each component owns the authoritative bounds used by its container and text frame; card padding and text alignment are explicit. The source deck's visual design, slide order, colors, master/layout definitions, and existing editable objects are preserved.

The semantic definitions are lowered to the converter's supported Typst subset by `lower_components.py`. This remains a source-generation workflow, not arbitrary Typst macro evaluation.

## Changes

- Added a reproducible rebuild script and semantic component specifications for slides 4–7 under [`examples/field_forward_milestone9`](../examples/field_forward_milestone9/).
- Combined each slide 4 card heading and body into a single editable text frame with separate paragraph styling. This retains the line break and avoids separately guessed title/body positions.
- Added optional paragraph `after` and `target_pitch` serialization to the component lowerer so the reference card spacing can be represented without injecting manual vertical offsets.
- Extended component QA to report glyph-edge difference separately from anchor-position error. Width changes from compatible font builds should not be misclassified as an alignment shift when the intended left/right/top/bottom anchor is correct.
- Added regression coverage for paragraph-spacing serialization, wrapped text, glyph anchoring, and font-width variation.

## Validation evidence

The output compiles with Typst 0.15.1 using the bundled Inter v4.0 Open Font License files. Compilation creates an eight-page PDF. The Typst-to-PowerPoint converter exports an eight-slide editable PPTX with 99 text boxes, 127 native shapes, no pictures, and zero conversion warnings. The three fewer text boxes than the handoff export are the slide 4 title/body pairs consolidated into three two-paragraph frames. No entire slide or component is rasterized.

Component-aware QA compared the rebuilt Typst PDF to the handoff reference's visible text bounds. All 30 declared components matched; all 30 passed anchor tolerance (2 pt horizontally, 3 pt vertically), with no text overflow and no unavailable matches. The largest anchor-position error was 0.5 pt. One small interface note had a 5.67 pt far-edge glyph-width difference while its left/top anchor remained exact; this is reported as a font-build/rendering difference, not a positional error. On slide 4, measured source body line-top positions are 394.66 and 419.45 pt (24.79 pt pitch); rebuilt positions are 394.65 and 419.45 pt (24.80 pt pitch), with all three card pairs agreeing to 0.01 pt on the first line and 0 pt on the second. The paragraphs compile without clipping.

The side-by-side comparison of reference and rebuilt Typst slides 4–7 is [`source-vs-rebuilt-slides-4-7.png`](../examples/field_forward_milestone9/qa/source-vs-rebuilt-slides-4-7.png). The rebuilt deck contact sheet is [`contact-sheet.png`](../examples/field_forward_milestone9/qa/final/contact-sheet.png), with full-size page renders in the same directory. The structural PPTX report is [`conversion_report.json`](../examples/field_forward_milestone9/exports/conversion_report.json), and component measurements are [`qa.json`](../examples/field_forward_milestone9/qa/final/qa.json).

The full automated suite passes: **66 passed**. Structural inspection confirms eight slides at 960 × 540 pt, zero objects outside the canvas, zero conversion warnings, and native editable text and shapes.

## PowerPoint rendering status

The exported PPTX was opened and rendered to PDF by Microsoft PowerPoint on this PC. It produced eight 960 × 540 pt pages. The Typst and PowerPoint renders were compared side by side; all eight page comparisons are under [`qa/powerpoint/comparison`](../examples/field_forward_milestone9/qa/powerpoint/comparison/), and the PowerPoint contact sheet is [`contact-sheet.png`](../examples/field_forward_milestone9/qa/powerpoint/contact-sheet.png). Slides 4–7 were reviewed at full size. Major object presence, card and diagram geometry, color, layering, and slide composition are preserved, with no clipping or missing component text.

The PowerPoint PDF resolves the requested Inter and Inter Display runs to Calibri and Calibri Bold. The PPTX XML retains the requested Inter family names, but this PowerPoint font catalog did not expose those families during rendering. Component QA therefore classified 29 of 30 slide 4–7 component comparisons as font-substitution/rendering differences and one as pass; none overflowed. The largest glyph-anchor difference was 18.39 pt on a slide 7 card number. That observed text displacement follows the font substitution; the shape and frame bounds in OOXML remain equal. This is documented as an environment/font availability limitation rather than applying offsets that would distort output on systems with the intended fonts.

Across all eight pages, the diagnostic pixel mean absolute error was 0.03352. This is descriptive only: font substitution contributes to the difference and the number is not an acceptance score. The PowerPoint render is [`field_forward_milestone9-powerpoint.pdf`](../examples/field_forward_milestone9/exports/field_forward_milestone9-powerpoint.pdf); the accompanying measurement report is [`qa.json`](../examples/field_forward_milestone9/qa/powerpoint/qa.json). `python-pptx` inspection separately confirms native editable text and shapes.

## Limitations and decision

Exact text ink dimensions can vary with font build and renderer. The bundled font files help make Typst output reproducible, but fonts are not embedded in PPTX. The semantic helper intentionally supports only the documented static component set and does not evaluate arbitrary Typst.

**COMPLETE:** The FIELD / FORWARD semantic rebuild, editable PPTX export, Typst compilation, component QA, regression suite, and actual Microsoft PowerPoint render have all been completed and visually inspected. The host's Calibri substitution and its measurable text-anchor effects remain documented limitations; no converter geometry workaround was applied for this environment-specific font result.
