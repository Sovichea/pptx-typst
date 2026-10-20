# Quarterly marketing meeting sample

This folder contains Typst source, a neutral helper template, media assets, and a conversion manifest generated from the sample PowerPoint deck. The original `.pptx` file is not included.

Compile the Typst project with:

```console
typst compile main.typ preview.pdf
```

The manifest records unsupported objects for review. Conversion support remains limited to the constructs documented in the project README.

Decorative SVG pictures inherited from PowerPoint masters and layouts are included in the Typst output and kept as vector assets.

Slide picture placeholders also inherit custom clipping geometry from their matching layout placeholders, preserving torn and shaped image edges.

The product timeline SmartArt on slide 6 is included as a vector SVG generated from PowerPoint's stored drawing cache. Its text is part of the SVG artwork rather than separately editable Typst text.
