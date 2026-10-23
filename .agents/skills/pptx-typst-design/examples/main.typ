#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)

// Demo source for pptx-typst-design. All statements and metrics are illustrative.
// Create the local helper module with:
//   pptx-typst module --output pptx-typst.typ

#let Identity = PptxMaster(
  fill: rgb("#F6F3EA"),
  children: [
    #PptxPlace(x: 48pt, y: 492pt,
      child: PptxRect(width: 864pt, height: 2pt, fill: rgb("#C9D4CE"))),
    #PptxPlace(x: 48pt, y: 506pt,
      child: PptxText(font: "Arial", size: 11pt,
        weight: "bold", fill: rgb("#557469"))[SYSTEM DESIGN  /  EXAMPLE DECK]),
  ],
)

#let Cover = PptxLayout(
  master: Identity,
  children: [
    #PptxPlace(x: 590pt, y: 55pt,
      child: PptxImage("assets/orbit-motif.png", width: 310pt, height: 310pt)),
    #PptxPlace(x: 48pt, y: 103pt,
      child: PptxRect(width: 64pt, height: 6pt, fill: rgb("#D97845"))),
  ],
)

#let Standard = PptxLayout(
  master: Identity,
  children: [
    #PptxPlace(x: 48pt, y: 109pt,
      child: PptxRect(width: 52pt, height: 5pt, fill: rgb("#D97845"))),
  ],
)

#let Contrast = PptxLayout(
  master: Identity,
  children: [
    #PptxPlace(x: 616pt, y: 0pt,
      child: PptxRect(width: 344pt, height: 490pt,
        fill: rgb("#173B34"))),
    #PptxPlace(x: 48pt, y: 109pt,
      child: PptxRect(width: 52pt, height: 5pt,
        fill: rgb("#D97845"))),
  ],
)

// SLIDE 1: editorial cover with a decorative image asset and editable text.
#PptxSlide(
  width: 960pt, height: 540pt, layout: Cover,
  children: [
    #PptxPlace(x: 48pt, y: 54pt,
      child: PptxText(font: "Arial", size: 15pt,
        weight: "bold", fill: rgb("#557469"))[DESIGN SYSTEM  /  ILLUSTRATIVE]),
    #PptxPlace(x: 48pt, y: 152pt,
      child: PptxBox(width: 555pt, height: 150pt)[
        #PptxText(font: "Arial", size: 48pt,
          weight: "bold", fill: rgb("#173B34"))[
          Explain complex systems clearly
        ]
      ]),
    #PptxPlace(x: 48pt, y: 345pt,
      child: PptxBox(width: 540pt, height: 75pt)[
        #PptxText(font: "Arial", size: 24pt,
          fill: rgb("#557469"))[A presentation authored as editable Typst IR]
      ]),
    #PptxPlace(x: 855pt, y: 506pt,
      child: PptxText(font: "Arial", size: 12pt,
        fill: rgb("#557469"))[01 / 05]),
  ],
)

#pagebreak()

// SLIDE 2: left/right claim + graphic blocks. Diagram nodes are native shapes.
#PptxSlide(
  width: 960pt, height: 540pt, layout: Contrast,
  children: [
    #PptxPlace(x: 48pt, y: 52pt,
      child: PptxText(font: "Arial", size: 15pt,
        weight: "bold", fill: rgb("#557469"))[01  /  DESIGN PRINCIPLE]),
    #PptxPlace(x: 48pt, y: 143pt,
      child: PptxBox(width: 500pt, height: 147pt)[
        #PptxText(font: "Arial", size: 40pt,
          weight: "bold", fill: rgb("#173B34"))[
          Separate the message from the machinery
        ]
      ]),
    #PptxPlace(x: 48pt, y: 334pt,
      child: PptxBox(width: 500pt, height: 112pt)[
        #PptxText(font: "Arial", size: 23pt,
          fill: rgb("#557469"))[Lead with the conclusion. Let the diagram support it.]
      ]),
    #PptxPlace(x: 666pt, y: 128pt,
      child: PptxRect(width: 246pt, height: 70pt, radius: 12pt,
        fill: rgb("#E9F1EC"))),
    #PptxPlace(x: 689pt, y: 149pt,
      child: PptxText(font: "Arial", size: 24pt,
        weight: "bold", fill: rgb("#173B34"))[QUESTION]),
    #PptxPlace(x: 666pt, y: 237pt,
      child: PptxRect(width: 246pt, height: 70pt, radius: 12pt,
        fill: rgb("#BFD1C8"))),
    #PptxPlace(x: 689pt, y: 258pt,
      child: PptxText(font: "Arial", size: 24pt,
        weight: "bold", fill: rgb("#173B34"))[EVIDENCE]),
    #PptxPlace(x: 666pt, y: 346pt,
      child: PptxRect(width: 246pt, height: 70pt, radius: 12pt,
        fill: rgb("#D97845"))),
    #PptxPlace(x: 689pt, y: 368pt,
      child: PptxText(font: "Arial", size: 24pt,
        weight: "bold", fill: white)[ACTION]),
    #PptxPlace(x: 855pt, y: 506pt,
      child: PptxText(font: "Arial", size: 12pt,
        fill: rgb("#557469"))[02 / 05]),
  ],
)

#pagebreak()

// SLIDE 3: repeated native rectangles/labels for an editable step process.
#PptxSlide(
  width: 960pt, height: 540pt, layout: Standard,
  children: [
    #PptxPlace(x: 48pt, y: 52pt,
      child: PptxText(font: "Arial", size: 15pt,
        weight: "bold", fill: rgb("#557469"))[02  /  WORKFLOW]),
    #PptxPlace(x: 48pt, y: 132pt,
      child: PptxText(font: "Arial", size: 38pt,
        weight: "bold", fill: rgb("#173B34"))[Design, build, then verify]),
    #PptxPlace(x: 48pt, y: 209pt,
      child: PptxRect(width: 267pt, height: 215pt, radius: 15pt,
        fill: rgb("#E9EFEA"))),
    #PptxPlace(x: 69pt, y: 240pt,
      child: PptxText(font: "Arial", size: 38pt,
        weight: "bold", fill: rgb("#D97845"))[01]),
    #PptxPlace(x: 69pt, y: 306pt,
      child: PptxText(font: "Arial", size: 25pt,
        weight: "bold", fill: rgb("#173B34"))[Storyboard]),
    #PptxPlace(x: 69pt, y: 359pt,
      child: PptxText(font: "Arial", size: 18pt,
        fill: rgb("#557469"))[One message per slide]),
    #PptxPlace(x: 346pt, y: 209pt,
      child: PptxRect(width: 267pt, height: 215pt, radius: 15pt,
        fill: rgb("#E9EFEA"))),
    #PptxPlace(x: 367pt, y: 240pt,
      child: PptxText(font: "Arial", size: 38pt,
        weight: "bold", fill: rgb("#D97845"))[02]),
    #PptxPlace(x: 367pt, y: 306pt,
      child: PptxText(font: "Arial", size: 25pt,
        weight: "bold", fill: rgb("#173B34"))[Compose]),
    #PptxPlace(x: 367pt, y: 359pt,
      child: PptxText(font: "Arial", size: 18pt,
        fill: rgb("#557469"))[Reusable Typst layouts]),
    #PptxPlace(x: 644pt, y: 209pt,
      child: PptxRect(width: 267pt, height: 215pt, radius: 15pt,
        fill: rgb("#173B34"))),
    #PptxPlace(x: 665pt, y: 240pt,
      child: PptxText(font: "Arial", size: 38pt,
        weight: "bold", fill: rgb("#D97845"))[03]),
    #PptxPlace(x: 665pt, y: 306pt,
      child: PptxText(font: "Arial", size: 25pt,
        weight: "bold", fill: rgb("#FFFFFF"))[Verify]),
    #PptxPlace(x: 665pt, y: 359pt,
      child: PptxText(font: "Arial", size: 18pt,
        fill: rgb("#CEE0D6"))[PDF and PPTX review]),
    #PptxPlace(x: 855pt, y: 506pt,
      child: PptxText(font: "Arial", size: 12pt,
        fill: rgb("#557469"))[03 / 05]),
  ],
)

#pagebreak()

// SLIDE 4: quantitative visual as native shapes, not as a PowerPoint chart.
// Values are demonstrative only: 35% and 70% of a 240pt maximum.
#PptxSlide(
  width: 960pt, height: 540pt, layout: Standard,
  children: [
    #PptxPlace(x: 48pt, y: 52pt,
      child: PptxText(font: "Arial", size: 15pt,
        weight: "bold", fill: rgb("#557469"))[03  /  VISUAL EVIDENCE]),
    #PptxPlace(x: 48pt, y: 132pt,
      child: PptxText(font: "Arial", size: 37pt,
        weight: "bold", fill: rgb("#173B34"))[Prefer direct data labels]),
    #PptxPlace(x: 48pt, y: 220pt,
      child: PptxText(font: "Arial", size: 20pt,
        weight: "bold", fill: rgb("#557469"))[VERSION A]),
    #PptxPlace(x: 205pt, y: 224pt,
      child: PptxRect(width: 168pt, height: 37pt,
        fill: rgb("#A6C6B8"))),
    #PptxPlace(x: 403pt, y: 226pt,
      child: PptxText(font: "Arial", size: 23pt,
        weight: "bold", fill: rgb("#173B34"))[35%]),
    #PptxPlace(x: 48pt, y: 301pt,
      child: PptxText(font: "Arial", size: 20pt,
        weight: "bold", fill: rgb("#557469"))[VERSION B]),
    #PptxPlace(x: 205pt, y: 305pt,
      child: PptxRect(width: 336pt, height: 37pt,
        fill: rgb("#1B6252"))),
    #PptxPlace(x: 570pt, y: 307pt,
      child: PptxText(font: "Arial", size: 23pt,
        weight: "bold", fill: rgb("#173B34"))[70%]),
    #PptxPlace(x: 48pt, y: 396pt,
      child: PptxText(font: "Arial", size: 17pt,
        fill: rgb("#557469"))[Illustrative values only. Replace with sourced data.]),
    #PptxPlace(x: 855pt, y: 506pt,
      child: PptxText(font: "Arial", size: 12pt,
        fill: rgb("#557469"))[04 / 05]),
  ],
)

#pagebreak()

// SLIDE 5: decisive close with editable call to action.
#PptxSlide(
  width: 960pt, height: 540pt, layout: Standard,
  children: [
    #PptxPlace(x: 48pt, y: 52pt,
      child: PptxText(font: "Arial", size: 15pt,
        weight: "bold", fill: rgb("#557469"))[04  /  TAKEAWAY]),
    #PptxPlace(x: 48pt, y: 150pt,
      child: PptxBox(width: 820pt, height: 145pt)[
        #PptxText(font: "Arial", size: 44pt,
          weight: "bold", fill: rgb("#173B34"))[
          Design in Typst. Verify in PowerPoint.
        ]
      ]),
    #PptxPlace(x: 48pt, y: 359pt,
      child: PptxRect(width: 455pt, height: 82pt,
        fill: rgb("#173B34"), radius: 12pt)),
    #PptxPlace(x: 74pt, y: 383pt,
      child: PptxText(font: "Arial", size: 25pt,
        weight: "bold", fill: white)[Make the next slide editable]),
    #PptxPlace(x: 855pt, y: 506pt,
      child: PptxText(font: "Arial", size: 12pt,
        fill: rgb("#557469"))[05 / 05]),
  ],
)
