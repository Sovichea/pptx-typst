# Experimental release readiness

Assessment date: 2026-10-23. This preparation starts from the latest local `main` at `61ed995`. The package version is `0.1.0`; no PyPI upload or public GitHub release has been created.

## Verified package workflows

`python -m build` produced a wheel and source distribution. The wheel installed in a clean Python 3.12 environment and the sdist installed in a clean Python 3.10 environment, both outside the source checkout. All four console commands (`pptx-typst`, `pptx-to-typst`, `typst-to-pptx`, and `pptx-typst-validate`) ran their help screens from each installation. Both distributions contained the runtime Typst templates, starter files, four SVG assets, and the packaged Windows metafile renderer.

From the installed wheel, `pptx-typst init` produced a starter project that compiled with Typst 0.15.1 and converted back to PPTX. The installed wheel also converted a benchmark source deck to Typst, compiled it, and ran the structural validator from a temporary directory. The source distribution's starter project also compiled. Six independently sourced presentations outside the benchmark converted and compiled; five had source PDF exports and deterministic page mapping for three visually reviewed slides each. These usability findings are detailed in [independent validation](independent-validation.md).

The final local test suite passed 56 tests on Python 3.10 and 56 on Python 3.12. `compileall` passed on Python 3.10. A new regression test covers geometry-less source shapes in the installed validator; it now reports those shapes and excludes them from coordinate comparisons instead of raising an exception.

## Platform status

Windows is the only platform exercised directly in this environment. An installed wheel converted a corpus deck containing EMF, ran the bundled PowerShell/GDI+ path, retained all five original EMF files, generated transparent PNG rendering derivatives, and compiled the resulting Typst project. The historical frozen benchmark was rendered on Windows with PowerPoint and Typst 0.15.1.

CI is configured to run the test suite and all four entry points on Windows, Linux, and macOS with Python 3.10 through 3.13. The final GitHub Actions result is recorded after pushing this preparation commit. Linux and macOS are not locally tested. Inkscape was not installed here, so its actual EMF/WMF conversion path remains unverified; the missing-tool warning path is covered by automated tests. PowerPoint's desktop export was unavailable for one of the six independent decks, which still converted and compiled.

## Unsupported objects and limitations

The frozen 100-deck benchmark's historical result remains 100/100 successful conversions and renders, 92.1% text-masked layout fidelity, and 95.0% weighted visible-word recall. This full visual benchmark was not repeated for release preparation, so those figures are not presented as improvements from the current changes.

The current warning-based audit converted all 100 decks without a conversion failure. It recorded 502 unsupported warning placements (330 estimated significant by area/content/type and 11 with unknown significance) and 916 approximated or rasterized warning occurrences. The latter includes multiple placeholder/picture overlap pairs, not only unique objects. The earlier stabilization report recorded 522 unsupported placements with a different extraction pass; these counts are not a before/after measurement. Category details and every source warning are in the [unsupported-object audit](unsupported-object-audit.md) and its adjacent JSON.

Material limitations include unsupported native charts, picture-mask and complex group-transform approximations, non-editable SmartArt cache artwork and OLE previews, unavailable rendering when no EMF/WMF converter is installed, and placeholder text that can stack above a later picture. The conversion report identifies unsupported objects and fallbacks with source slide and shape information where available. Users should inspect reports and representative slides before relying on output.

## Release artifacts

The local release artifacts are built and ready for review:

| Artifact | Python tag | Result |
|---|---|---|
| `pptx_typst-0.1.0-py3-none-any.whl` | universal wheel | Built and installed in a clean Python 3.12 environment |
| `pptx_typst-0.1.0.tar.gz` | source distribution | Built and installed in a clean Python 3.10 environment |

The attached [experimental alpha notes](releases/v0.1.0-alpha.md) provide the short user-facing scope and workflow. The README includes a visual comparison, install/convert/edit/compile commands, feature matrix, platform media requirements, and known limitations.

## Readiness decision

The Windows package and ordinary conversion workflow are verified from both distribution formats. The existing 100-deck visual baseline and independent sample demonstrate useful layout preservation and editability, while diagnostics expose material omissions. The remaining gaps are documented experimental limitations rather than failures of installation or the common conversion path.

**Release recommendation: Productize as an experimental GitHub alpha after the cross-platform CI matrix passes.** Keep PyPI publication and the public GitHub release as a separate explicitly authorized action. If any CI matrix cells fail, resolve the failure and update this report before creating release artifacts publicly.
