# PowerPoint master and layout reuse POC

This document records an isolated proof of concept for representing the PowerPoint hierarchy `Master → Layout → Slide` in Typst and rebuilding it as editable PowerPoint parts. The experiments ran in a temporary directory and did not change the converter implementation. The proposed `PptxMaster` and `PptxLayout` declarations are not currently supported by the shipped conversion commands.

## Proposed model

Create each master once, each layout once under its master, then reference a layout from each slide:

```typst
#let brand = PptxMaster(children: [...])
#let title-layout = PptxLayout(master: brand, children: [...])
#let content-layout = PptxLayout(master: brand, children: [...])

#PptxSlide(layout: title-layout, children: [...])
#PptxSlide(layout: content-layout, children: [...])
```

The render order is master artwork, layout artwork, then slide-owned content. `Root` remains the canvas and coordinate frame. The initial conversion should retain layouts referenced by slides, preserve the slide-to-layout relationship, and keep placeholder content materialized on its slide. It should key shared parts by their owning PowerPoint part rather than infer sharing from similar appearance.

## Synthetic package experiments

A three-slide PPTX was created with one master, two layouts, editable slide content, and an image on the master. The experiments established that:

- The current PPTX-to-Typst converter emits inherited master and layout content into every slide.
- A structured Typst prototype with one master and two layouts compiles to three pages.
- The current Typst-to-PPTX converter ignores the master/layout declarations.
- A temporary OOXML adapter can place editable shapes and pictures into a master and layout parts, create their package relationships, and retain slide-owned content on slides.
- Registering a custom layout part and cloning a second master worked. The second master required its own cloned theme relationship.

The synthetic experiment did not cover placeholder inheritance, visibility flags, animations, or all picture crop cases.

## Quarterly marketing deck test

The local `Quarterly marketing meeting.pptx` sample contains 13 slides, one master, and 13 layouts. Every slide uses a different layout. The master has five placeholders and no non-placeholder artwork. The layouts contain 66 non-placeholder placements; slides contain 39 slide-owned placements.

### PPTX to Typst

The existing converted Typst was reorganized temporarily into one master declaration, 13 layout declarations, and 13 slides referencing their corresponding layouts. The flat and structured sources both compiled to 13 pages. All 13 pages rendered at 960 × 540 pixels and were pixel-identical.

This confirms that the proposed layer order and references can preserve this deck's forward rendering. It does not demonstrate artwork deduplication: each layout is used once and the master has no visible artwork.

### Typst to PPTX

Passing the structured Typst directly to the current reverse converter produces 13 slides but omits all 66 layout placements. The converter needs to resolve layout declarations before this model can work in the reverse direction.

A temporary package adapter was tested using the existing flat reverse-conversion output. It created 13 custom layout parts, remapped image relationships, assigned each slide to its corresponding layout, and moved 58 emitted layout objects out of slide parts. `python-pptx` reopened the package and confirmed one master, 13 custom layouts, 13 slide-to-layout assignments, and the expected slide-owned shape counts. The package also contains the 11 default layouts from the reverse converter's starting template.

Eight empty-box constructs, each 43.26 × 28.75 pt, were unsupported by the reverse converter and remain absent. The package passed structural validation but was not visually rendered in desktop PowerPoint.

## Engineering implications

The POC supports the `Deck → Master → Layout → Slide` intermediate model. A production implementation needs to:

1. Extract each master's and layout's non-placeholder objects once, retaining the owning part and relationships.
2. Emit explicit master and layout declarations in Typst and preserve each slide's layout reference.
3. Resolve those declarations in the reverse converter, then create real PresentationML master/layout parts and relationships.
4. Preserve shared image relationships on the part that owns each picture, and clone theme parts when creating a distinct master.

The forward structure has a positive result on the quarterly sample. The reverse package structure also passed a temporary adapter test, while direct reverse conversion still drops layout content and has the eight empty-box limitation. These findings validate the architecture, not production support or broad visual fidelity. The prototype should remain separate from the supported converter API until the reverse resolver and focused regression tests are implemented.
