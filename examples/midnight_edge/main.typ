// Midnight Edge: a dark technical deck with native geometry and charts.
#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)
#set text(font: ("Arial", "Barlow", "Consolas"), lang: "en")

#let night = rgb("#07131C")
#let panel = rgb("#0E202B")
#let deep = rgb("#102A35")
#let cyan = rgb("#46E0D0")
#let amber = rgb("#F4B942")
#let lilac = rgb("#B8A1FF")
#let ice = rgb("#EAF4F4")
#let muted = rgb("#7C959B")
#let rule = rgb("#24414B")

#let MidnightMaster = PptxMaster(
  fill: rgb("#07131C"),
  children: [
    #PptxPlace(x: 48pt, y: 24pt, child: PptxBox(width: 560pt, height: 16pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: cyan,
        weight: "bold",
      )[ORBITAL / SYSTEMS NOTEBOOK / 07]]
    ])
    #PptxPlace(x: 680pt, y: 24pt, child: PptxBox(width: 232pt, height: 16pt)[
      #align(right + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[EDGE CONTROL / 2026]]
    ])
    #PptxPlace(x: 48pt, y: 490pt, child: PptxRect(width: 864pt, height: 0.5pt, fill: rule, stroke: none))
    #PptxPlace(x: 48pt, y: 500pt, child: PptxBox(width: 640pt, height: 16pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[SIGNAL / LATENCY / AUTONOMY]]
    ])
  ],
)

#let Standard = PptxLayout(master: MidnightMaster, children: [])

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 01 / COVER
    #PptxPlace(x: 600pt, y: 70pt, child: PptxEllipse(
      width: 370pt,
      height: 370pt,
      fill: none,
      stroke: 1.5pt + cyan,
    ))
    #PptxPlace(x: 660pt, y: 130pt, child: PptxEllipse(
      width: 250pt,
      height: 250pt,
      fill: none,
      stroke: 1pt + rule,
    ))
    #PptxPlace(x: 720pt, y: 190pt, child: PptxEllipse(
      width: 130pt,
      height: 130pt,
      fill: none,
      stroke: 1.5pt + cyan,
    ))
    #PptxPlace(x: 774pt, y: 244pt, child: PptxEllipse(width: 12pt, height: 12pt, fill: cyan, stroke: none))
    #PptxPlace(x: 48pt, y: 100pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 14pt,
        fill: cyan,
        weight: "bold",
      )[ORBITAL SYSTEMS / FIELD NOTE 07]]
    ])
    #PptxPlace(x: 48pt, y: 136pt, child: PptxBox(width: 520pt, height: 190pt)[
      #set par(leading: 0.3em)
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 62pt,
        fill: ice,
        weight: "bold",
      )[Signal#linebreak()at the edge.]]
    ])
    #PptxPlace(x: 48pt, y: 340pt, child: PptxBox(width: 500pt, height: 80pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 24pt,
        fill: muted,
        weight: "regular",
      )[Latency, autonomy,#linebreak()and the loop between.]]
    ])
    #PptxPlace(x: 48pt, y: 420pt, child: PptxRect(width: 120pt, height: 3pt, fill: cyan, stroke: none))
    #PptxPlace(x: 48pt, y: 440pt, child: PptxBox(width: 600pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[AUTONOMOUS SYSTEMS / CONTROL RESEARCH]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[01 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 02 / CONSTRAINT
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: amber,
        weight: "bold",
      )[01 / THE CONSTRAINT]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[The loop is the constraint.]]
    ])
    #PptxPlace(x: 48pt, y: 188pt, child: PptxBox(width: 420pt, height: 120pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 88pt, fill: cyan, weight: "bold")[41 ms]]
    ])
    #PptxPlace(x: 48pt, y: 306pt, child: PptxBox(width: 420pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 14pt,
        fill: muted,
        weight: "bold",
      )[MEDIAN CONTROL LATENCY]]
    ])
    #PptxPlace(x: 48pt, y: 340pt, child: PptxBox(width: 430pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: ice,
        weight: "regular",
      )[From capture to verification,#linebreak()including the decision.]]
    ])
    #PptxPlace(x: 560pt, y: 182pt, child: PptxBox(width: 140pt, height: 16pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[CAPTURE]]
    ])
    #PptxPlace(x: 560pt, y: 198pt, child: PptxBox(width: 120pt, height: 28pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[7 ms]]
    ])
    #PptxPlace(x: 700pt, y: 204pt, child: PptxRect(width: 75pt, height: 5pt, fill: cyan, stroke: none))
    #PptxPlace(x: 560pt, y: 232pt, child: PptxBox(width: 140pt, height: 16pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[FUSE]]
    ])
    #PptxPlace(x: 560pt, y: 248pt, child: PptxBox(width: 120pt, height: 28pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[6 ms]]
    ])
    #PptxPlace(x: 700pt, y: 254pt, child: PptxRect(width: 64pt, height: 5pt, fill: lilac, stroke: none))
    #PptxPlace(x: 560pt, y: 282pt, child: PptxBox(width: 140pt, height: 16pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[DECIDE]]
    ])
    #PptxPlace(x: 560pt, y: 298pt, child: PptxBox(width: 120pt, height: 28pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[15 ms]]
    ])
    #PptxPlace(x: 700pt, y: 304pt, child: PptxRect(width: 160pt, height: 5pt, fill: amber, stroke: none))
    #PptxPlace(x: 560pt, y: 332pt, child: PptxBox(width: 140pt, height: 16pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[ACT]]
    ])
    #PptxPlace(x: 560pt, y: 348pt, child: PptxBox(width: 120pt, height: 28pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[9 ms]]
    ])
    #PptxPlace(x: 700pt, y: 354pt, child: PptxRect(width: 96pt, height: 5pt, fill: ice, stroke: none))
    #PptxPlace(x: 560pt, y: 382pt, child: PptxBox(width: 140pt, height: 16pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[VERIFY]]
    ])
    #PptxPlace(x: 560pt, y: 398pt, child: PptxBox(width: 120pt, height: 28pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[4 ms]]
    ])
    #PptxPlace(x: 700pt, y: 404pt, child: PptxRect(width: 43pt, height: 5pt, fill: cyan, stroke: none))
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[02 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 03 / ARCHITECTURE
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: amber,
        weight: "bold",
      )[02 / ARCHITECTURE]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 100pt)[
      #set par(leading: 0.3em)
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[Five layers,#linebreak()one control path.]]
    ])
    #PptxPlace(x: 48pt, y: 220pt, child: PptxRect(
      width: 160pt,
      height: 190pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 8pt,
    ))
    #PptxPlace(x: 64pt, y: 232pt, child: PptxBox(width: 100pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: cyan, weight: "bold")[01]]
    ])
    #PptxPlace(x: 64pt, y: 256pt, child: PptxBox(width: 128pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 26pt, fill: ice, weight: "bold")[SENSE]]
    ])
    #PptxPlace(x: 64pt, y: 300pt, child: PptxBox(width: 128pt, height: 72pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Sample the world.]]
    ])
    #PptxPlace(x: 64pt, y: 390pt, child: PptxRect(width: 40pt, height: 4pt, fill: cyan, stroke: none))
    #PptxPlace(x: 208pt, y: 315pt, child: PptxLine(start: (0pt, 0pt), end: (16pt, 0pt), stroke: 1pt + cyan))
    #PptxPlace(x: 220pt, y: 312pt, child: PptxEllipse(width: 6pt, height: 6pt, fill: cyan, stroke: none))
    #PptxPlace(x: 224pt, y: 220pt, child: PptxRect(
      width: 160pt,
      height: 190pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 8pt,
    ))
    #PptxPlace(x: 240pt, y: 232pt, child: PptxBox(width: 100pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: lilac, weight: "bold")[02]]
    ])
    #PptxPlace(x: 240pt, y: 256pt, child: PptxBox(width: 128pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 26pt, fill: ice, weight: "bold")[FUSE]]
    ])
    #PptxPlace(x: 240pt, y: 300pt, child: PptxBox(width: 128pt, height: 72pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Reconcile signals.]]
    ])
    #PptxPlace(x: 240pt, y: 390pt, child: PptxRect(width: 40pt, height: 4pt, fill: lilac, stroke: none))
    #PptxPlace(x: 384pt, y: 315pt, child: PptxLine(start: (0pt, 0pt), end: (16pt, 0pt), stroke: 1pt + cyan))
    #PptxPlace(x: 396pt, y: 312pt, child: PptxEllipse(width: 6pt, height: 6pt, fill: cyan, stroke: none))
    #PptxPlace(x: 400pt, y: 220pt, child: PptxRect(
      width: 160pt,
      height: 190pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 8pt,
    ))
    #PptxPlace(x: 416pt, y: 232pt, child: PptxBox(width: 100pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[03]]
    ])
    #PptxPlace(x: 416pt, y: 256pt, child: PptxBox(width: 128pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 26pt, fill: ice, weight: "bold")[DECIDE]]
    ])
    #PptxPlace(x: 416pt, y: 300pt, child: PptxBox(width: 128pt, height: 72pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Choose one action.]]
    ])
    #PptxPlace(x: 416pt, y: 390pt, child: PptxRect(width: 40pt, height: 4pt, fill: amber, stroke: none))
    #PptxPlace(x: 560pt, y: 315pt, child: PptxLine(start: (0pt, 0pt), end: (16pt, 0pt), stroke: 1pt + cyan))
    #PptxPlace(x: 572pt, y: 312pt, child: PptxEllipse(width: 6pt, height: 6pt, fill: cyan, stroke: none))
    #PptxPlace(x: 576pt, y: 220pt, child: PptxRect(
      width: 160pt,
      height: 190pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 8pt,
    ))
    #PptxPlace(x: 592pt, y: 232pt, child: PptxBox(width: 100pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: ice, weight: "bold")[04]]
    ])
    #PptxPlace(x: 592pt, y: 256pt, child: PptxBox(width: 128pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 26pt, fill: ice, weight: "bold")[ACT]]
    ])
    #PptxPlace(x: 592pt, y: 300pt, child: PptxBox(width: 128pt, height: 72pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: muted, weight: "regular")[Move in time.]]
    ])
    #PptxPlace(x: 592pt, y: 390pt, child: PptxRect(width: 40pt, height: 4pt, fill: ice, stroke: none))
    #PptxPlace(x: 736pt, y: 315pt, child: PptxLine(start: (0pt, 0pt), end: (16pt, 0pt), stroke: 1pt + cyan))
    #PptxPlace(x: 748pt, y: 312pt, child: PptxEllipse(width: 6pt, height: 6pt, fill: cyan, stroke: none))
    #PptxPlace(x: 752pt, y: 220pt, child: PptxRect(
      width: 160pt,
      height: 190pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 8pt,
    ))
    #PptxPlace(x: 768pt, y: 232pt, child: PptxBox(width: 100pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: cyan, weight: "bold")[05]]
    ])
    #PptxPlace(x: 768pt, y: 256pt, child: PptxBox(width: 128pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 26pt, fill: ice, weight: "bold")[LEARN]]
    ])
    #PptxPlace(x: 768pt, y: 300pt, child: PptxBox(width: 128pt, height: 72pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Update the model.]]
    ])
    #PptxPlace(x: 768pt, y: 390pt, child: PptxRect(width: 40pt, height: 4pt, fill: cyan, stroke: none))
    #PptxPlace(x: 48pt, y: 440pt, child: PptxBox(width: 760pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: muted,
        weight: "regular",
      )[Every layer earns its place in the loop.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[03 / 10]]
    ])
  ],
)

