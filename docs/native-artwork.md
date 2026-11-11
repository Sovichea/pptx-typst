# Native artwork and source recovery

Use the current helper module (`pptx-typst module --output pptx-typst.typ`).
Inside an explicit `PptxPlace`, `PptxStatic(width: 300pt, height: 160pt)[...]`
keeps native drawing code inside a bounded frame. Its dimensions must be positive
literal point lengths for export. Frame clipping is the same in native Typst and
SVG export; choose dimensions that actually contain the artwork.

The exporter evaluates the body with typst-py, preserves the SVG as vector media,
and supplies a transparent PNG fallback for Office versions that need it. These
pictures remain static in PowerPoint. Ordinary supported text and shapes outside
the frame remain editable. Existing SVG image assets also retain their vectors
when the supported crop can be represented without raster compositing.
External SVGs are normalized to Cairo's vector syntax for Office compatibility;
their unmodified source bytes remain available through source recovery. Native
`PptxStatic` SVGs keep their typst-py output and do not require Cairo.

## Rendering context

Place required imports and definitions before the first explicit slide. The
renderer uses that preamble and resolves local asset paths from the project.
It does not evaluate arbitrary slide-local programming scopes. Unsupported
rendering fails with an explicit error rather than silently omitting artwork.
Keep the authored source unchanged; generated images belong under `assets/static`.

```console
pptx-typst compile deck/main.typ --output deck/preview.pdf
pptx-typst compile deck/main.typ --output "deck/preview-{p}.svg"
pptx-typst compile deck/main.typ --output "deck/preview-{p}.png" --ppi 144
typst-to-pptx deck/main.typ --output exports/deck.pptx
```

Preview compilation, artwork rendering, and font discovery use the Python
binding. `--font-path` is available on compile, export, and font-preflight commands.
It does not install fonts in Office. Native SVG creation through `PptxStatic`
does not require Cairo; some external SVG and mask conversions still do.

## What the PPTX stores

A related JSON part stores the original entrypoint, local Typst dependencies,
checksums, and a baseline of slide content, geometry, inheritance, links, and notes.
Binary dependencies reuse byte-identical media by SHA-256 where possible;
otherwise a private binary part retains one copy. References to visible media
do not add source-to-image relationships that make Office clone media on save.
Remote Typst packages and system fonts are not bundled automatically.

Local dependency discovery accepts literal paths in imports, includes, image
calls (including `PptxImage`), and file readers. Comments, prose, and unrelated
quoted strings do not cause files to be bundled. Paths resolve relative to the
module containing the call. Computed paths, reader aliases, and unresolved file
operations disable exact recovery instead of guessing dependencies. The PPTX
still exports; its report sets `native_source_complete: false` and explains the
limitation in `source_warnings`. Use literal paths to enable exact recovery.

On unchanged re-import, `main.typ` contains the original entrypoint bytes and
local dependency paths are restored. This recovers code from embedded provenance,
not from tracing images. `conversion_report.json` records `source_restoration:
"exact"`. Source entry and dependency checksums are validated before restoration;
paths escaping the output directory are rejected before files are written.
Older snapshots without a dependency-completeness marker use reconstruction.
Malformed source JSON also falls back to reconstruction; `--reconstruct`
bypasses source JSON parsing entirely.

Edits to content, formatting, geometry, SVG media, inheritance, links, notes, or
required binary dependencies prevent stale exact restoration. Unknown or
unsupported PowerPoint save changes can also require reconstruction. The normal
reader then reconstructs the current deck; SVG pictures remain vectors, but
arbitrary original diagram source cannot be inferred. Use `--reconstruct` to
force this reader path when testing conversion fidelity:

```console
pptx-to-typst exports/deck.pptx --output restored
pptx-to-typst exports/deck.pptx --output reconstructed --reconstruct
```

An unchanged synthetic deck with repeated SVG artwork and separate editable text
was opened, saved, and rendered in Microsoft PowerPoint during implementation;
its native source restored exactly. This verifies that case, not every Office
normalization or arbitrary shape-edit workflow. Review every final slide and
compare native rendered pages and source/dependency bytes separately.
