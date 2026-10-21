# v0.1.0 alpha stabilization

Date: 2026-10-21
Scope: CI collection, paragraph-spacing default, and the frozen 100-deck media failures.

## Result

**PARTIAL.** The test collection issue is fixed, the default `anchors-spacing` mode is retained, and a narrow TIFF-to-PNG rendering derivative resolves 11 of the 22 previously failing decks in the media-failure subset. Eleven decks still contain EMF artwork that Typst cannot render. This is acceptable for an experimental GitHub release if that media limitation remains explicit.

## CI and tests

The diagnostic tests imported functions from `tools/` scripts. Those scripts are benchmark entry points, not an installed Python package, and import optional benchmark dependencies. The pure text-matching and text-frame assignment functions now live in `pptx_typst.text_diagnostics`; both benchmark scripts and tests use that module. Basic pytest collection no longer imports the benchmark scripts or PyMuPDF.

Validation on the supported Python 3.12 environment:

- `python -m pip install -e ".[test]"` — passed.
- `python -m pytest -q` — 15 passed.
- Installed `pptx-to-typst` and `typst-to-pptx` entry points converted a one-slide sample in both directions; the forward output compiled with Typst.
- A focused TIFF fixture compiled and confirmed that its original TIFF remains in the project while the manifest points to a derived RGBA PNG for rendering.

The final GitHub Actions result is recorded after pushing this commit.

## Paragraph-spacing validation

Two existing font-supported decks were converted with the current `anchors-spacing` default and the legacy `anchors` mode. The diagnostic matching is imperfect, so these sample measurements are directional and are not benchmark-score updates.

| Sample | Measurement | `anchors-spacing` | `anchors` |
|---|---|---:|---:|
| Radio Imaging, 142 source text frames | Frames matched by source object ID | 142 | 142 |
| | Maximum structural geometry delta | ≤0.005 pt | ≤0.005 pt |
| | Objects with glyphs found in both PDFs | 140 | 140 |
| | Mean first-glyph displacement | 5.85 pt | 5.85 pt |
| | Typst frames overflowing by >2 pt | 3 | 10 |
| | Mean Typst overflow beyond frame | 0.71 pt | 1.76 pt |
| NAVIS, 136 source text frames | Frames matched by source object ID | 136 | 136 |
| | Maximum structural geometry delta | ≤0.005 pt | ≤0.005 pt |
| | Objects with glyphs found in both PDFs | 12 | 12 |
| | Mean first-glyph displacement | 43.95 pt | 44.08 pt |
| | Typst frames overflowing by >2 pt | 10 | 10 |
| | Mean Typst overflow beyond frame | 8.50 pt | 17.25 pt |

The current mode compiles representative multiline text, bullet lists, and vertical alignment. Its text-only setting leaves non-text placement records identical to `anchors`. The reduced advance did not worsen first-glyph placement in these samples and reduced measured overflow; it did not eliminate NAVIS wrapping and bullet crowding. Both images compare the PowerPoint rendering on the left with Typst on the right. The first uses the current mode; the second uses legacy `anchors`:

![Reduced paragraph advance (`anchors-spacing`)](diagnostics/visuals/stabilization-anchors-spacing.png)

![Legacy full-line paragraph advance (`anchors`)](diagnostics/visuals/stabilization-anchors-legacy.png)

The spacing change is retained. The remaining crowded NAVIS bullets occur in both modes and stem from renderer wrapping/list layout; broader text tuning is outside this milestone.

## Unsupported media diagnosis

All 22 frozen failures occurred after PPTX extraction and Typst source generation, at Typst PDF compilation, where Typst reported `unknown image format`. The first rejected object in 13 decks was TIFF/TIF; in 9 decks it was EMF. The TIFF assets are readable by Pillow, including RGBA, grayscale, and palette variants. One package member named `.tiff` is JPEG-encoded, so the converter decodes image content instead of assuming the suffix proves the encoding.

| First rejected media in frozen benchmark | Affected decks | Result after focused subset rerun |
|---|---:|---|
| TIFF/TIF | 13 | 11 decks now compile; 2 progress to a later EMF failure |
| EMF | 9 | 0 decks resolved; all still fail on EMF |
| **Total** | **22** | **11 compile; 11 remain unsupported** |

TIFF pictures now retain their original embedded asset and receive a derived PNG for Typst rendering. This fixes the TIFF incompatibility without altering source provenance or rasterizing slides. The regression test also checks alpha preservation.

The remaining failures reference EMF media at the image placement itself. The converter already prefers an attached SVG fallback when a shape has one; the affected references have no such Typst-readable fallback. Other PNG/JPEG assets in those PPTX packages are unrelated artwork, not a safe substitute. EMF rendering would require a separate platform-independent vector conversion path, which is outside this bounded fix.

The affected subset was reconverted and Typst-compiled after the fix. It moved from 0/22 to 11/22 compiling. The full benchmark was not rerun, and no new full-corpus fidelity or 100-deck success metric is claimed. The historical `78/100` baseline remains unchanged; an end-to-end rerun would be needed to publish an updated benchmark total.

## Release decision

**PARTIAL — ready for an experimental GitHub release, with limitations documented.** CI collection is fixed, tests and both CLI directions pass locally, the paragraph-spacing default shows no confirmed regression against the previous mode, and the targeted TIFF correction is covered. The v0.1.0 alpha should continue to describe EMF/WMF and other unsupported media as limitations; full conversion coverage is not claimed.
