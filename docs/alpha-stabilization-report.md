# v0.1.0 alpha stabilization report

## Decision

**Productize as an experimental converter.** The project is useful for editable Typst conversions of supported PowerPoint content, and the frozen 100-deck run completed without a conversion or render failure. Keep the alpha label and conversion warnings: this corpus result does not imply compatibility with arbitrary presentations or production-grade PowerPoint rendering.

## Final benchmark

The final frozen benchmark ran on Windows 11 with Python 3.12.10, python-pptx 1.0.2, Typst 0.15.1, and desktop PowerPoint 16.0. It processed the same 100 CC BY 4.0 presentations with visible-slide identity checked for every PDF comparison.

| Measure | Final result |
|---|---:|
| Conversion and render success | 100/100; 0 failures |
| Visible source slides | 2,221 |
| Verified source-slide/PDF-page pairs | 100/100 decks; 0 ambiguous decks |
| Layout fidelity, text masked | 92.1% mean; 94.6% median; 82.0% p10 |
| Text fidelity, fonts available | 54.5% mean; 55.9% median; 36.8% p10 |
| Full-slide fidelity, fonts available | 74.4% mean; 74.8% median; 63.4% p10 |
| Weighted visible-word recall | 95.0% |
| Font-supported source-text slides | 1,410/2,137 |
| Mean text-mask area | 20.87% |

The layout metric masks extracted glyph pixels and therefore measures surrounding artwork, fills, media, and geometry. Text and full-slide results are font-gated. The 10th percentile uses nearest-rank p10. See the [full benchmark summary](../benchmarks/text_fidelity/summary.md), [per-deck CSV](../benchmarks/text_fidelity/results.csv), [slide diagnostics](../benchmarks/text_fidelity/slide_diagnostics.jsonl), and [comparison index](../benchmarks/text_fidelity/visual_comparisons/index.md).

### Comparison with the frozen starting revision

For a paired check, only decks that succeeded at the starting revision `d820f12` are compared, using the same legacy metrics and deck names. The final run includes newly successful decks, so its all-deck means are shown above and must not be mistaken for this paired population.

| Metric | Starting revision | Final revision | Paired change | Paired observations |
|---|---:|---:|---:|---:|
| Layout fidelity | 91.89% | 92.22% | +0.33 percentage points | 89 decks: 2 higher, 15 lower, 72 unchanged |
| Text fidelity | 56.07% | 55.01% | −1.06 percentage points | 75 font-supported decks: 4 higher, 3 lower, 68 unchanged |
| Text start-position error | 24.05 pt | 26.79 pt | +2.74 pt (worse) | 74 decks: 3 lower error, 4 higher error, 67 unchanged |
| Full-slide fidelity | 74.69% | 74.38% | −0.31 percentage points | 77 font-supported decks: 5 higher, 7 lower, 65 unchanged |

These small paired changes do not establish a broad visual or typography improvement. The material measured reliability gain is conversion coverage: the 11 former compile failures now render, taking the frozen corpus from 89/100 to 100/100.

## Corrections and evidence

- **EMF/WMF media:** all 11 previous compilation failures contained EMF; `029_madrid_22.pptx` also contains WMF. The failure occurred when Typst received those unsupported source formats directly. Original media are retained, and a separate SVG or transparent PNG derivative is used for Typst. In this Windows run Inkscape was unavailable, so the validated fallback used GDI+ at up to 300 dpi, capped at 4096 pixels on the long edge. This restored rendering, not vector editability of the metafile internals. See [media compatibility](media-compatibility.md).
- **Grouped vector strokes:** a group transform was stretching child-local stroke widths and arrow markers together with the path. The converter now compensates for the child-to-world scale. A synthetic 10× group test verifies the expected stroke width, and [the PowerPoint / before / after comparison](../benchmarks/text_fidelity/visual_regressions/grouped_strokes_before_after.png) shows the oversized red areas removed on 038 slides 4 and 15. With the same slide-level masked-layout metric, slide 4 moves from 23.9% to 79.0%; slide 15 moves from 3.4% to 90.2%. Other geometry and text differences remain in this deck.
- **Connector arrowheads:** supported triangle markers render from editable Typst geometry and restore as native PowerPoint line markers. Unsupported marker styles are reported.
- **Tables and inherited artwork/text:** targeted fixes for source row dimensions, theme fills, placeholder fills, bullets, and local run styles remain covered by regression tests and the selected visual review.

The broader selected-defect findings and remaining examples are in the [visual fidelity regression review](visual-fidelity-regression-review.md). The grouped-stroke patch does not make every freeform or transformed group exact.

## Structure, content, and editability

The generated-source audit found 14,242 source placements. Of these, 13,720 placements classified as supported have an identity marker next to an emitted `#Place`; the remaining 522 are reported as unsupported, and these counts account for every missing marker. The 9,595 ungrouped supported placements checked have mean x/y error of 0.002 pt between the source object bounds and parsed generated `#Place` values. That is a source-generation check, not an independent proof of final rendered geometry. Group transforms are not included in that simple coordinate statistic.

Visible-word recall is 95.0% weighted across the source PDF words. Independent spatial text diagnostics report 9,506 matched PDF text blocks, 3 ambiguous block incidences, and 6,717 unmatched block incidences; the latter two categories are excluded from matched-position accuracy rather than counted as correct. The benchmark therefore does not hide unmatched text. Fonts were available for only 1,410 of 2,137 source-text slides, so the text and full-slide scores apply to a subset.

## Feature support decision

| Area | Status | Practical boundary |
|---|---|---|
| Text, common shapes, lines, pictures, tables | Supported subset | Editable output where represented by native Typst/PowerPoint constructs; advanced fills, effects, and group transforms can differ. |
| Masters, layouts, title/body placeholders | Supported subset | Shared ownership and native parts are retained; full Office style and placeholder inheritance is not implemented. |
| PNG/JPEG/SVG/GIF/TIFF media | Supported | TIFF may use a derivative; crop and placement are handled by the existing image path. |
| EMF/WMF | Rendered fallback | Original bytes and provenance retained; Typst receives a derived SVG or transparent PNG, so metafile internals are not editable. Converter availability varies by OS. |
| SmartArt | Partial | Stored PowerPoint drawing cache can render as vector artwork; its text is not independently editable. |
| Unsupported objects | Reported | 522 placements in this corpus were not emitted as supported `#Place` objects. Reports identify omissions where the source metadata permits. |
| Charts, animation, video, arbitrary Typst, complex Office effects | Unsupported or limited | These are outside the bounded static conversion subset and may be reported or omitted. |

## Validation

- `python -m pip install -e ".[test]"` completed successfully.
- `python -m compileall -q src tools tests` passed.
- `python -m pytest -q` passed: **52 tests**.
- Installed `pptx-typst`, `pptx-to-typst`, `typst-to-pptx`, and `pptx-typst-validate` entry points were checked.
- The existing 13-slide quarterly Typst example compiled; reverse conversion produced a 13-slide PPTX with one master. The automated tests also exercised forward conversion and Typst compilation, and the corpus reran the forward path on all 100 decks.
- Both conversion directions remain within the existing supported subset. This report does not claim that desktop PowerPoint was available for behavior tests on all reverse-converted decks.

## Limitations and recommendation

Design preservation is a practical priority of this converter, but the corpus still has a long lower tail: the 10th-percentile layout result is 82.0%, and text rendering remains substantially different on font-supported slides. Typography, renderer-specific line wrapping, some image masks, gradients, advanced effects, complex groups, chart rendering, and unsupported objects remain known limitations. The Windows metafile fallback can create large PNG files and depends on GDI+; Inkscape is the vector alternative.

The result supports continued productization as a **v0.1.0 experimental tool**: it converts the frozen sample reliably, retains editable structure for its supported subset, and reports material fallback/unsupported cases. It is not evidence for arbitrary-deck or cross-platform fidelity. Keep this scoped to the documented subset and review conversion reports and visual output for important presentations.
