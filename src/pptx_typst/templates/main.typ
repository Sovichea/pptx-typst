#import "pptx-typst.typ": *

#set page(width: 960pt, height: 540pt, margin: 0pt)

// Keep one PptxSlide block per slide. Put supported primitives inside
// PptxPlace calls so their positions are preserved in the PowerPoint output.
// Add #pagebreak() between PptxSlide blocks when creating more slides.

#let Brand = PptxMaster(
  fill: rgb("#FFFFFF"),
  children: [
    #PptxPlace(
      x: 72pt,
      y: 44pt,
      child: PptxRect(width: 96pt, height: 6pt, fill: rgb("#4F46E5")),
    )
  ],
)

#let ContentLayout = PptxLayout(
  master: Brand,
  children: [],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: ContentLayout,
  children: [
    #PptxPlace(
      x: 72pt,
      y: 72pt,
      child: PptxBox(width: 816pt, height: 112pt)[
        #PptxText(font: "Arial", size: 36pt, fill: rgb("#1F2937"), weight: "bold")[A slide authored in Typst]
      ],
    )
    #PptxPlace(
      x: 72pt,
      y: 220pt,
      child: PptxText(font: "Arial", size: 22pt, fill: rgb("#4B5563"))[Edit main.typ, then convert this supported subset to PowerPoint.],
    )
    #PptxPlace(
      x: 72pt,
      y: 300pt,
      child: PptxRect(width: 240pt, height: 8pt, fill: rgb("#DCE3DF")),
    )
  ],
)
