# Static Typst IR design example

A five-slide illustrative deck demonstrating reusable master/layout declarations, an image-backed decorative asset, editorial type, side-by-side argument, native shape diagram, shape-based data bars, and strong closing action.

## Run

```sh
pptx-typst module --output pptx-typst.typ
typst compile main.typ preview.pdf
mkdir -p export
typst-to-pptx main.typ --output export/example.pptx
```

The generated `pptx-typst.typ` helper module is version-specific and intentionally not bundled in this example. Use one from the installed `pptx-typst` release. Inspect `export/conversion_report.json` and visually compare the PPTX if you can render it.

`assets/orbit-motif.png` is decorative art generated specifically for this example. It is an image-backed object. The other text, rectangles and labels are represented as static native Typst IR primitives. All values, metrics, and narrative statements are illustrative, not real evidence.

This example's text, geometry and source were reviewed statically against the bundled starter pattern. Because Typst was not installed in the packaging environment, this copy of the example has **not been compilation-tested**. Run the commands above in the target environment before relying on it as a release fixture.
