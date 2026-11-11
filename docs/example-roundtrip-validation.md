# Example round-trip validation

All six top-level example decks are covered by `tests/test_example_roundtrip.py`.

| Example | Slides |
| --- | ---: |
| Back to School Night | 13 |
| Blue Spheres | 13 |
| Classical Neutrals Marketing | 15 |
| Field Forward Milestone 9 | 8 |
| Japandi Marketing | 15 |
| Quarterly Marketing Meeting | 13 |
| Total | 77 |

Run the regression checks with:

```console
python -m pytest tests/test_example_roundtrip.py tests/test_drawingml_fills.py tests/test_native_artwork.py -q
```

The example checks export PPTX, require no unsupported-export warnings, recover
entrypoint and dependency bytes exactly, and compare every restored SVG page
with its original Typst render. They also force the ordinary PowerPoint reader
with `--reconstruct` and compile its pages independently of source recovery.
External SVG cases require Cairo and skip with an explicit reason if its native
runtime is unavailable.

Validation on Windows with Microsoft PowerPoint also opened, saved, and rendered
all six exported decks to PDF. Office-saved copies re-import through the ordinary
reader because PowerPoint's XML normalization invalidates the conservative source
baseline. This is expected; no stale native source overwrites Office content.

The checks exposed and fixed invalid literal newline endings in example SVGs,
dropped Blue Spheres linear-gradient backgrounds, and Office rendering failures
with raw external SVG syntax. The fixes preserve source layout and artwork.
Linear gradients emitted by the importer now retain native stops, alpha, and
angles; other gradient syntax still reports an unsupported case.

Exact restored Typst renders do not prove identical PowerPoint typography.
The representative visual comparison also shows inherited placeholder text
positioning differences in the Back to School cover: Office honors inherited
vertical alignment differently from the current Typst placeholder renderer.
This remains a rendering-fidelity limitation, not a loss of source or slides.
Field Forward's bundled Inter / Inter Display fonts were available to Typst but
not installed for Office on the validation machine. Office substitution remains
a viewing-environment limitation; source fonts and layout were not changed.
