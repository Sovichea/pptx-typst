# Media compatibility

## EMF and WMF rendering

PowerPoint packages can contain Enhanced Metafiles (EMF) and Windows Metafiles (WMF). The converter preserves each embedded original under `assets/media/` and records its source part, SHA-256, placements, and any generated render derivative in `asset_manifest.json`.

Typst cannot decode EMF or WMF. Forward conversion now creates a separate render asset:

1. If Inkscape is installed, it is asked to import the metafile and write SVG.
2. On Windows, if vector import is unavailable, the bundled PowerShell helper uses GDI+ to render a transparent PNG at up to 300 dpi, capped at 4096 pixels on the longest edge.
3. If neither converter works, the object is omitted from the generated Typst source so the rest of the project can compile. The original asset remains available, and `conversion_report.json` identifies the slide, source shape, media part, attempted fallback, and expected loss.

Rendering derivatives are deduplicated by source hash and conversion parameters. Crop, alpha, rotation, geometry, and stacking remain applied by the existing placement code. The source media is not rewritten. PNG fallback loses vector scalability; the project report records that tradeoff. The imported drawing remains a placed image in Typst rather than separate editable native shapes.

TIFF continues to use the existing Pillow conversion to PNG. PNG, JPEG, GIF, and SVG assets remain on the direct path.

## Frozen benchmark failures

The pre-change run had 11 Typst compilation failures. Each failed deck referenced EMF media; `029_madrid_22.pptx` also contains a WMF, which the same fallback can render when referenced.

| Failed deck | First rejected part | Source format |
|---|---|---|
| `003_LoetLeydesdorff.pptx` | `ppt/media/image4.emf` | EMF |
| `020_Colonieros_de_pelo_en_pecho...pptx` | `ppt/media/image9.emf` | EMF |
| `029_madrid_22.pptx` | `ppt/media/image3.emf` | EMF |
| `031_2014.11_UNIMAL...MEA_.pptx` | `ppt/media/image8.emf` | EMF |
| `035_PACBB2022_EvoPPI_2_SHAREABLE.pptx` | `ppt/media/image10.emf` | EMF |
| `047_oat23_oam.pptx` | `ppt/media/image1.emf` | EMF |
| `052_CPOTE-1266-A.pptx` | `ppt/media/image25.emf` | EMF |
| `057_16834_GRECO_abc02.pptx` | `ppt/media/image55.emf` | EMF |
| `073_TRB_Pres_Rewet-wetland_observatories.pptx` | `ppt/media/image5.emf` | EMF |
| `080_Solid_State_Tracking_Summary.pptx` | `ppt/media/image6.emf` | EMF |
| `088_IntroBookDashMCR.pptx` | `ppt/media/image49.emf` | EMF |

The failure originated at Typst compilation, not extraction: the original metafile bytes were extracted and referenced in generated Typst, but Typst rejected the image format.

## Validation

The 11 failed benchmark decks were rerun through extraction, Typst generation, and Typst compilation after adding the fallback. **All 11 compiled and rendered.** The remaining 89 decks were not rerun in this focused check; their prior successful rows were retained. A complete corpus rerun is required for the final milestone report.

The local Windows run used GDI+ because Inkscape was not installed. Every sampled fallback rendered as RGBA PNG. The derivatives ranged from small line-art assets to roughly 34 MB for one complex high-resolution metafile; output size and conversion time are the main tradeoffs. Automated tests cover Inkscape preference, transparent GDI+ fallback behavior, and graceful reporting when converters are absent.

## Remaining limitations

- The Windows fallback requires PowerShell and .NET `System.Drawing`; it is optional and not needed for other media formats.
- On non-Windows systems, installing Inkscape enables EMF/WMF conversion. Without it, unsupported objects are reported and omitted from Typst rendering rather than aborting the entire conversion.
- Arbitrary malformed metafiles can still fail conversion; failure is reported with source ownership and expected visual loss.
- SVG import behavior depends on the installed Inkscape version. GDI+ raster output is the validated path in the current environment.
