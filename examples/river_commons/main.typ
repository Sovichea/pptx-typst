// RIVER COMMONS / Fictional design study. All visible copy is editable markup.
#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)
#set text(font: "Arial", lang: "en")
#let LightMaster = PptxMaster(fill: rgb("#F5F1E7"), children: [])
#let DarkMaster = PptxMaster(fill: rgb("#153E40"), children: [])
#let Light = PptxLayout(master: LightMaster, children: [])
#let Dark = PptxLayout(master: DarkMaster, children: [])
#PptxSlide(width: 960pt, height: 540pt, layout: Dark, children: [
  #PptxPlace(x: 0pt, y: 0pt, child: PptxImage(
    "assets/bishan-aerial.jpg",
    width: 960pt,
    height: 540pt,
    fit: "cover",
  ))
  #PptxPlace(x: 0pt, y: 0pt, child: PptxImage("assets/cover-boundary.svg", width: 960pt, height: 540pt))
  #PptxPlace(x: 48pt, y: 97pt, child: PptxBox(width: 430pt, height: 32pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 14pt,
      fill: rgb("#83C8C2"),
      weight: "bold",
    )[A DISTRICT THAT MAKES SPACE]]
  ])
  #PptxPlace(x: 48pt, y: 151pt, child: PptxBox(width: 445pt, height: 190pt)[
    #set par(leading: 0.3em)
    #align(left + top)[#PptxText(
      font: "Georgia",
      size: 64pt,
      fill: rgb("#F5F1E7"),
      weight: "bold",
    )[Make room#linebreak()for water.]]
  ])
  #PptxPlace(x: 48pt, y: 366pt, child: PptxBox(width: 370pt, height: 90pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#F5F1E7"),
      weight: "regular",
    )[A new relationship between#linebreak()the street and the river.]]
  ])
  #PptxPlace(x: 0pt, y: 464pt, child: PptxRect(
    width: 960pt,
    height: 76pt,
    fill: rgb("#153E40"),
    stroke: none,
  ))
  #PptxPlace(x: 48pt, y: 476pt, child: PptxBox(width: 870pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#F5F1E7"),
      weight: "regular",
    )[Bishan Park / Atelierdreiseitl / CC BY-SA 3.0 / cropped; sources in ATTRIBUTION.md]]
  ])
  #PptxPlace(x: 48pt, y: 26pt, child: PptxBox(width: 700pt, height: 20pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#F5F1E7"),
      weight: "bold",
    )[RIVER COMMONS / FIELD NOTES]]
  ])
  #PptxPlace(x: 48pt, y: 506pt, child: PptxBox(width: 760pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#F5F1E7"),
      weight: "regular",
    )[FICTIONAL DISTRICT / CONCEPT STUDY / NOT A PERFORMANCE CLAIM]]
  ])
  #PptxPlace(x: 866pt, y: 506pt, child: PptxBox(width: 60pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rgb("#F5F1E7"), weight: "regular")[01 / 10]]
  ])
])

#PptxSlide(width: 960pt, height: 540pt, layout: Light, children: [
  #PptxPlace(x: 480pt, y: 64pt, child: PptxImage(
    "assets/bishan-river.jpg",
    width: 432pt,
    height: 410pt,
    fit: "cover",
  ))
  #PptxPlace(x: 0pt, y: 0pt, child: PptxImage("assets/river-window-mask.svg", width: 960pt, height: 540pt))
  #PptxPlace(x: 48pt, y: 94pt, child: PptxBox(width: 450pt, height: 122pt)[
    #set par(leading: 0.3em)
    #align(left + top)[#PptxText(
      font: "Georgia",
      size: 44pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[The boundary#linebreak()is the brief.]]
  ])
  #PptxPlace(x: 48pt, y: 256pt, child: PptxBox(width: 392pt, height: 116pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Imagine one district where#linebreak()public life and seasonal#linebreak()water share the same edge.]]
  ])
  #PptxPlace(x: 48pt, y: 408pt, child: PptxRect(width: 64pt, height: 4pt, fill: rgb("#CC613D"), stroke: none))
  #PptxPlace(x: 48pt, y: 434pt, child: PptxBox(width: 412pt, height: 32pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 20pt,
      fill: rgb("#53706B"),
      weight: "regular",
    )[A planning question, not a finished plan.]]
  ])
  #PptxPlace(x: 48pt, y: 477pt, child: PptxBox(width: 864pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Bishan Park / Wzhkevin / CC BY-SA 4.0 / cropped; sources in ATTRIBUTION.md]]
  ])
  #PptxPlace(x: 48pt, y: 26pt, child: PptxBox(width: 700pt, height: 20pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[RIVER COMMONS / FIELD NOTES]]
  ])
  #PptxPlace(x: 48pt, y: 506pt, child: PptxBox(width: 760pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[FICTIONAL DISTRICT / CONCEPT STUDY / NOT A PERFORMANCE CLAIM]]
  ])
  #PptxPlace(x: 866pt, y: 506pt, child: PptxBox(width: 60pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rgb("#153E40"), weight: "regular")[02 / 10]]
  ])
])

#PptxSlide(width: 960pt, height: 540pt, layout: Light, children: [
  #PptxPlace(x: 0pt, y: 0pt, child: PptxImage("assets/district.svg", width: 960pt, height: 540pt))
  #PptxPlace(x: 0pt, y: 0pt, child: PptxRect(width: 960pt, height: 166pt, fill: rgb("#153E40"), stroke: none))
  #PptxPlace(x: 48pt, y: 75pt, child: PptxBox(width: 850pt, height: 65pt)[
    #set par(leading: 0.3em)
    #align(left + top)[#PptxText(
      font: "Georgia",
      size: 44pt,
      fill: rgb("#F5F1E7"),
      weight: "bold",
    )[Read the street in layers.]]
  ])
  #PptxPlace(x: 321pt, y: 241pt, child: PptxLine(
    start: (0pt, 0pt),
    end: (176pt, 35pt),
    stroke: 2pt + rgb("#153E40"),
  ))
  #PptxPlace(x: 689pt, y: 389pt, child: PptxLine(
    start: (0pt, 0pt),
    end: (-111pt, -53pt),
    stroke: 2pt + rgb("#153E40"),
  ))
  #PptxPlace(x: 48pt, y: 203pt, child: PptxRect(
    width: 277pt,
    height: 118pt,
    fill: rgb("#F5F1E7"),
    stroke: none,
  ))
  #PptxPlace(x: 68pt, y: 222pt, child: PptxBox(width: 237pt, height: 30pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 14pt,
      fill: rgb("#CC613D"),
      weight: "bold",
    )[01 / MOVEMENT]]
  ])
  #PptxPlace(x: 68pt, y: 250pt, child: PptxBox(width: 237pt, height: 60pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Who needs a route#linebreak()through this block?]]
  ])
  #PptxPlace(x: 658pt, y: 346pt, child: PptxRect(
    width: 254pt,
    height: 122pt,
    fill: rgb("#F5F1E7"),
    stroke: none,
  ))
  #PptxPlace(x: 678pt, y: 366pt, child: PptxBox(width: 214pt, height: 24pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 14pt, fill: rgb("#CC613D"), weight: "bold")[02 / WATER]]
  ])
  #PptxPlace(x: 678pt, y: 394pt, child: PptxBox(width: 214pt, height: 64pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Where can water#linebreak()pause safely?]]
  ])
  #PptxPlace(x: 484pt, y: 269pt, child: PptxEllipse(
    width: 16pt,
    height: 16pt,
    fill: rgb("#CC613D"),
    stroke: none,
  ))
  #PptxPlace(x: 570pt, y: 328pt, child: PptxEllipse(
    width: 16pt,
    height: 16pt,
    fill: rgb("#CC613D"),
    stroke: none,
  ))
  #PptxPlace(x: 48pt, y: 26pt, child: PptxBox(width: 700pt, height: 20pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#F5F1E7"),
      weight: "bold",
    )[RIVER COMMONS / FIELD NOTES]]
  ])
  #PptxPlace(x: 0pt, y: 494pt, child: PptxRect(
    width: 960pt,
    height: 46pt,
    fill: rgb("#F5F1E7"),
    stroke: none,
  ))
  #PptxPlace(x: 48pt, y: 506pt, child: PptxBox(width: 760pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[FICTIONAL DISTRICT / CONCEPT STUDY / NOT A PERFORMANCE CLAIM]]
  ])
  #PptxPlace(x: 866pt, y: 506pt, child: PptxBox(width: 60pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rgb("#153E40"), weight: "regular")[03 / 10]]
  ])
])

#PptxSlide(width: 960pt, height: 540pt, layout: Light, children: [
  #PptxPlace(x: 0pt, y: 0pt, child: PptxImage("assets/section.svg", width: 960pt, height: 540pt))
  #PptxPlace(x: 48pt, y: 80pt, child: PptxBox(width: 860pt, height: 112pt)[
    #set par(leading: 0.3em)
    #align(left + top)[#PptxText(
      font: "Georgia",
      size: 44pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[A street can hold#linebreak()two rhythms.]]
  ])
  #PptxPlace(x: 48pt, y: 432pt, child: PptxBox(width: 240pt, height: 45pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[Everyday access]]
  ])
  #PptxPlace(x: 360pt, y: 447pt, child: PptxBox(width: 260pt, height: 45pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[Seasonal storage]]
  ])
  #PptxPlace(x: 718pt, y: 410pt, child: PptxBox(width: 205pt, height: 60pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[An edge that#linebreak()stays useful]]
  ])
  #PptxPlace(x: 320pt, y: 222pt, child: PptxBox(width: 550pt, height: 35pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#53706B"),
      weight: "regular",
    )[CONCEPTUAL SECTION / NOT TO SCALE]]
  ])
  #PptxPlace(x: 48pt, y: 26pt, child: PptxBox(width: 700pt, height: 20pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[RIVER COMMONS / FIELD NOTES]]
  ])
  #PptxPlace(x: 48pt, y: 506pt, child: PptxBox(width: 760pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[FICTIONAL DISTRICT / CONCEPT STUDY / NOT A PERFORMANCE CLAIM]]
  ])
  #PptxPlace(x: 866pt, y: 506pt, child: PptxBox(width: 60pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rgb("#153E40"), weight: "regular")[04 / 10]]
  ])
])

#PptxSlide(width: 960pt, height: 540pt, layout: Light, children: [
  #PptxPlace(x: 0pt, y: 192pt, child: PptxImage("assets/flow-ribbon.svg", width: 960pt, height: 270pt))
  #PptxPlace(x: 48pt, y: 82pt, child: PptxBox(width: 860pt, height: 65pt)[
    #set par(leading: 0.3em)
    #align(left + top)[#PptxText(
      font: "Georgia",
      size: 48pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[Slow. Hold. Release.]]
  ])
  #PptxPlace(x: 48pt, y: 171pt, child: PptxBox(width: 770pt, height: 40pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#53706B"),
      weight: "regular",
    )[Give each part of the route a different job.]]
  ])
  #PptxPlace(x: 60pt, y: 254pt, child: PptxBox(width: 200pt, height: 42pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 28pt, fill: rgb("#153E40"), weight: "bold")[SLOW]]
  ])
  #PptxPlace(x: 60pt, y: 416pt, child: PptxBox(width: 235pt, height: 70pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Interrupt the rush#linebreak()at the surface.]]
  ])
  #PptxPlace(x: 370pt, y: 356pt, child: PptxBox(width: 220pt, height: 45pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 28pt, fill: rgb("#153E40"), weight: "bold")[HOLD]]
  ])
  #PptxPlace(x: 370pt, y: 416pt, child: PptxBox(width: 235pt, height: 70pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Make a place for#linebreak()temporary water.]]
  ])
  #PptxPlace(x: 700pt, y: 254pt, child: PptxBox(width: 210pt, height: 42pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 28pt, fill: rgb("#153E40"), weight: "bold")[RELEASE]]
  ])
  #PptxPlace(x: 700pt, y: 416pt, child: PptxBox(width: 220pt, height: 70pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 24pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[Connect the exit#linebreak()to a clear route.]]
  ])
  #PptxPlace(x: 48pt, y: 26pt, child: PptxBox(width: 700pt, height: 20pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "bold",
    )[RIVER COMMONS / FIELD NOTES]]
  ])
  #PptxPlace(x: 48pt, y: 506pt, child: PptxBox(width: 760pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(
      font: "Arial",
      size: 12pt,
      fill: rgb("#153E40"),
      weight: "regular",
    )[FICTIONAL DISTRICT / CONCEPT STUDY / NOT A PERFORMANCE CLAIM]]
  ])
  #PptxPlace(x: 866pt, y: 506pt, child: PptxBox(width: 60pt, height: 18pt)[
    #set par(leading: 0.6em)
    #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rgb("#153E40"), weight: "regular")[05 / 10]]
  ])
])

