# pptx-typst

`pptx-typst` is a bidirectional presentation conversion tool. It converts PowerPoint (`.pptx`) decks into editable Typst projects and exports a documented, statically resolvable Typst slide subset to editable PowerPoint.

Version `0.1.0` is the first public product release. It is a working tool for presentations within its documented supported subset; it does not claim to reproduce every PowerPoint or Typst feature. It preserves common text, images, shapes, tables, transparency, and reusable master/layout structure. Review each conversion report and inspect important slides before delivery.

## Install

Python 3.10 through 3.13 is supported.

```console
python -m pip install pptx-typst==0.1.0
```

The PyPI project name is available, but the 0.1.0 distribution has not been uploaded yet. Until publication, install from a trusted source checkout with `python -m pip install .`.

The Python package performs conversion. Install the [Typst CLI](https://typst.app/) separately to compile generated Typst projects to PDF. EMF/WMF conversion uses the packaged Windows PowerShell/GDI+ helper on Windows, or Inkscape when available on Linux and macOS. Without a compatible renderer, the original media is retained and the conversion report warns that the object may not render. Some SVG masking and SVG-to-PowerPoint rasterization paths need Cairo native libraries; affected operations report a fallback or unsupported object when Cairo is unavailable.

## PowerPoint to Typst

```console
pptx-to-typst presentation.pptx --output presentation-typst
typst compile presentation-typst/main.typ presentation.pdf
```

The generated project contains `main.typ`, `template.typ`, `asset_manifest.json`, `conversion_report.json`, and shared media under `assets/media/`. The forward converter retains original assets and emits supported text, shapes, images, tables, masters, and layouts as editable Typst objects. EMF/WMF may also have a derived rendering asset. Use `pptx-to-typst --help` for layout, masking, and text options.

## Typst to PowerPoint

```console
typst-to-pptx presentation-typst/main.typ --output presentation-roundtrip.pptx
```

The reverse converter handles the documented static Typst subset; it does not evaluate arbitrary Typst programs, dynamic expressions, or user-defined macros. It writes a `conversion_report.json` next to the output. Review warnings for unsupported constructs and editability changes.

## Start a Typst presentation

```console
pptx-typst init my-deck
typst compile my-deck/main.typ my-deck/preview.pdf
typst-to-pptx my-deck/main.typ --output my-deck.pptx
```

The starter project includes a supported `main.typ`, helper module, original SVG artwork, and three editable slides using one shared master and three layouts. Its copy and metrics are illustrative. To generate only the helper module, run `pptx-typst module --output pptx-typst.typ`.

The helper module provides `PptxMaster`, `PptxLayout`, and `PptxSlide` for reusable hierarchy, plus static `PptxPlace`, `PptxGroup`, `PptxClip`, `PptxBox`, `PptxText`, `PptxImage`, `PptxRect`, `PptxEllipse`, `PptxLine`, and `PptxTable` constructs. Title, centered-title, and body placeholders are supported in the defined subset. See the [placeholder support report](https://github.com/Sovichea/pptx-typst/blob/main/docs/placeholder-support.md) and [master/layout report](https://github.com/Sovichea/pptx-typst/blob/main/docs/master-layout-poc.md).

## Font preflight and validation

Check requested fonts before final export:

```console
pptx-typst-fonts my-deck/main.typ --report my-deck/font_report.json
```

Typst font paths do not install or embed fonts for PowerPoint. The preflight checks Typst and the local Office-facing font inventory separately; unavailable checks are reported as `unknown`. Optional `--pptx`, `--typst-pdf`, and `--powerpoint-pdf` inputs compare requested font names, exported DrawingML, and rendered PDF font names.

Compare source geometry with a generated project:

```console
pptx-typst-validate presentation.pptx presentation-typst --out presentation-typst/geometry-audit.json
```

Reports identify unsupported and approximated objects with slide numbers, source shape IDs when available, fallback behavior, and expected fidelity or editability loss. A successful command does not mean every source object was reproduced.

## Supported feature subset

| PowerPoint feature | PowerPoint to Typst | Typst to PowerPoint |
|---|---|---|
| Text and title/body placeholders | Editable text with supported paragraph and inheritance properties | Editable text and native supported placeholders |
| Images and common vector media | Original assets retained; EMF/WMF may use a render derivative | PNG/JPEG and SVG when the required Cairo path is available |
| Shapes, lines, fills, transparency | Common geometry and styling; complex masks and some shapes may be approximated | Common rectangles, ellipses, lines, and supported static shapes |
| Tables | Editable text, dimensions, alignment, fills, and common borders; merged cells unsupported | Basic rectangular tables |
| Masters and layouts | Reusable hierarchy preserved | Native parts for statically resolvable declarations |
| SmartArt and charts | A stored SmartArt drawing cache may be emitted as a static SVG; charts unsupported | Unsupported |
| Animation and transitions | Unsupported | Unsupported |

Font substitution can change text metrics, wrapping, and alignment. SmartArt cache artwork and OLE previews are not independently editable. Native chart data, animations, complex group transforms, some masks, and arbitrary Typst programs are outside the supported subset. Conversion reports should be reviewed and important slides visually inspected.

## Examples and validation

These comparisons use the same slide from each input PowerPoint and generated Typst project. They show representative results from the local Windows/PowerPoint benchmark, not pixel-equivalent output.

| Example | PowerPoint and Typst comparison |
|---|---|
| [Quarterly marketing meeting](https://github.com/Sovichea/pptx-typst/tree/main/examples/quarterly_marketing_meeting) | [Slide 6 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/quarterly-marketing-meeting.png) ![Quarterly marketing meeting slide 6 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/quarterly-marketing-meeting.png) |
| [Back to school night](https://github.com/Sovichea/pptx-typst/tree/main/examples/back_to_school_night) | [Slide 12 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/back-to-school-night.png) ![Back to school night slide 12 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/back-to-school-night.png) |
| [Classical neutrals marketing](https://github.com/Sovichea/pptx-typst/tree/main/examples/classical_neutrals_marketing) | [Slide 15 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/classical-neutrals-marketing.png) ![Classical neutrals marketing slide 15 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/classical-neutrals-marketing.png) |
| [Japandi linear marketing](https://github.com/Sovichea/pptx-typst/tree/main/examples/japandi_marketing) | [Slide 1 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/japandi-marketing.png) ![Japandi marketing slide 1 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/japandi-marketing.png) |
| [Blue spheres](https://github.com/Sovichea/pptx-typst/tree/main/examples/blue_spheres) | [Slide 7 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/blue-spheres.png) ![Blue spheres slide 7 comparison](https://raw.githubusercontent.com/Sovichea/pptx-typst/main/docs/images/example-comparisons/blue-spheres.png) |

The original [FIELD / FORWARD semantic-layout example](https://github.com/Sovichea/pptx-typst/tree/main/examples/field_forward_milestone9) is also available. The frozen 100-deck benchmark and its methodology are documented in the [stabilization report](https://github.com/Sovichea/pptx-typst/blob/main/docs/alpha-stabilization-report.md); the separate [29-deck measurement report](https://github.com/Sovichea/pptx-typst/tree/main/benchmarks/pptx_template_fidelity) provides benchmark methodology and results. The source PowerPoint files are not included. Licensing for third-party assets in the template-derived examples and screenshots has not been independently confirmed; see the [release audit](https://github.com/Sovichea/pptx-typst/blob/main/docs/pypi-release-audit.md).

## Python API

The supported reverse conversion function is available as `pptx_typst.typst_to_pptx`:

```python
from pptx_typst import typst_to_pptx

report = typst_to_pptx("presentation-typst/main.typ", "presentation.pptx")
```

## Development

```console
python -m pip install -e ".[test]"
python -m pytest -q
python -m pip install --upgrade build twine
python -m build
python -m twine check --strict dist/*
```

Open an [issue](https://github.com/Sovichea/pptx-typst/issues) for questions or bug reports.

## License

The software is licensed under the [Apache License 2.0](https://github.com/Sovichea/pptx-typst/blob/main/LICENSE). Fonts, user-provided decks, and third-party assets retain their own terms; they are not relicensed by this project.
