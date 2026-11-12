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

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 04 / PROFILE
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[03 / PROFILE]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[Where latency hides.]]
    ])
    #PptxPlace(x: 36pt, y: 190pt, child: PptxRect(
      width: 584pt,
      height: 292pt,
      fill: panel,
      stroke: none,
      radius: 10pt,
    ))
    #PptxPlace(x: 56pt, y: 204pt, child: PptxBox(width: 320pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[LOOP BUDGET / MILLISECONDS]]
    ])
    #PptxPlace(x: 210pt, y: 232pt, child: PptxRect(width: 1pt, height: 218pt, fill: rule, stroke: none))
    #PptxPlace(x: 56pt, y: 244pt, child: PptxBox(width: 130pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ice, weight: "bold")[CAPTURE]]
    ])
    #PptxPlace(x: 210pt, y: 256pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (149.5pt, 0pt),
      stroke: 2.5pt + cyan,
    ))
    #PptxPlace(x: 354.5pt, y: 251pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 560pt, y: 244pt, child: PptxBox(width: 40pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "bold")[7]]
    ])
    #PptxPlace(x: 56pt, y: 288pt, child: PptxBox(width: 130pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ice, weight: "bold")[FUSE]]
    ])
    #PptxPlace(x: 210pt, y: 300pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (128pt, 0pt),
      stroke: 2.5pt + lilac,
    ))
    #PptxPlace(x: 333pt, y: 295pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: lilac, stroke: none))
    #PptxPlace(x: 560pt, y: 288pt, child: PptxBox(width: 40pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "bold")[6]]
    ])
    #PptxPlace(x: 56pt, y: 332pt, child: PptxBox(width: 130pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ice, weight: "bold")[DECIDE]]
    ])
    #PptxPlace(x: 210pt, y: 344pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (320pt, 0pt),
      stroke: 2.5pt + amber,
    ))
    #PptxPlace(x: 525pt, y: 339pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: amber, stroke: none))
    #PptxPlace(x: 560pt, y: 332pt, child: PptxBox(width: 40pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "bold")[15]]
    ])
    #PptxPlace(x: 56pt, y: 376pt, child: PptxBox(width: 130pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ice, weight: "bold")[ACT]]
    ])
    #PptxPlace(x: 210pt, y: 388pt, child: PptxLine(start: (0pt, 0pt), end: (192pt, 0pt), stroke: 2.5pt + ice))
    #PptxPlace(x: 397pt, y: 383pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: ice, stroke: none))
    #PptxPlace(x: 560pt, y: 376pt, child: PptxBox(width: 40pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "bold")[9]]
    ])
    #PptxPlace(x: 56pt, y: 420pt, child: PptxBox(width: 130pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ice, weight: "bold")[VERIFY]]
    ])
    #PptxPlace(x: 210pt, y: 432pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (85.5pt, 0pt),
      stroke: 2.5pt + cyan,
    ))
    #PptxPlace(x: 290.5pt, y: 427pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 560pt, y: 420pt, child: PptxBox(width: 40pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "bold")[4]]
    ])
    #PptxPlace(x: 650pt, y: 210pt, child: PptxBox(width: 260pt, height: 90pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 72pt, fill: amber, weight: "bold")[37%]]
    ])
    #PptxPlace(x: 650pt, y: 300pt, child: PptxBox(width: 260pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[OF THE LOOP IS DECIDE]]
    ])
    #PptxPlace(x: 650pt, y: 340pt, child: PptxRect(width: 260pt, height: 0.5pt, fill: rule, stroke: none))
    #PptxPlace(x: 650pt, y: 356pt, child: PptxBox(width: 260pt, height: 100pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: ice,
        weight: "regular",
      )[Trim the decision#linebreak()and the whole loop#linebreak()gets shorter.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[04 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 05 / EDGE VS CLOUD
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: amber,
        weight: "bold",
      )[04 / EDGE VS CLOUD]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[Keep the decision close.]]
    ])
    #PptxPlace(x: 48pt, y: 196pt, child: PptxRect(
      width: 410pt,
      height: 244pt,
      fill: panel,
      stroke: 1pt + cyan,
      radius: 10pt,
    ))
    #PptxPlace(x: 502pt, y: 196pt, child: PptxRect(
      width: 410pt,
      height: 244pt,
      fill: deep,
      stroke: 1pt + rule,
      radius: 10pt,
    ))
    #PptxPlace(x: 72pt, y: 216pt, child: PptxBox(width: 300pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: cyan,
        weight: "bold",
      )[EDGE / ON-DEVICE]]
    ])
    #PptxPlace(x: 72pt, y: 240pt, child: PptxBox(width: 300pt, height: 56pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 56pt, fill: ice, weight: "bold")[41 ms]]
    ])
    #PptxPlace(x: 72pt, y: 302pt, child: PptxBox(width: 300pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[CONTROL LATENCY]]
    ])
    #PptxPlace(x: 72pt, y: 346pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[11 W / local power]]
    ])
    #PptxPlace(x: 72pt, y: 378pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[99.97% / uptime]]
    ])
    #PptxPlace(x: 526pt, y: 216pt, child: PptxBox(width: 300pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[CLOUD / CENTRAL]]
    ])
    #PptxPlace(x: 526pt, y: 240pt, child: PptxBox(width: 300pt, height: 56pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 56pt, fill: ice, weight: "bold")[212 ms]]
    ])
    #PptxPlace(x: 526pt, y: 302pt, child: PptxBox(width: 300pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[CONTROL LATENCY]]
    ])
    #PptxPlace(x: 526pt, y: 346pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[68 W / facility power]]
    ])
    #PptxPlace(x: 526pt, y: 378pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[99.91% / uptime]]
    ])
    #PptxPlace(x: 480pt, y: 216pt, child: PptxRect(width: 1pt, height: 204pt, fill: rule, stroke: none))
    #PptxPlace(x: 48pt, y: 458pt, child: PptxBox(width: 864pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: ice,
        weight: "regular",
      )[The cloud trains the model. The edge runs the loop.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[05 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 06 / PATH
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[05 / PATH]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 860pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[From bench to pilot in 12 weeks.]]
    ])
    #PptxPlace(x: 80pt, y: 310pt, child: PptxRect(width: 800pt, height: 2pt, fill: cyan, stroke: none))
    #PptxPlace(x: 30pt, y: 264pt, child: PptxBox(width: 160pt, height: 18pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[W0 / BENCH]]
    ])
    #PptxPlace(x: 100pt, y: 302pt, child: PptxEllipse(width: 20pt, height: 20pt, fill: cyan, stroke: none))
    #PptxPlace(x: 20pt, y: 340pt, child: PptxBox(width: 180pt, height: 34pt)[
      #align(center + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[BENCH]]
    ])
    #PptxPlace(x: 20pt, y: 378pt, child: PptxBox(width: 180pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(center + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Single sensor,#linebreak()12 ms loop.]]
    ])
    #PptxPlace(x: 270pt, y: 264pt, child: PptxBox(width: 160pt, height: 18pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[W4 / LOOP]]
    ])
    #PptxPlace(x: 340pt, y: 302pt, child: PptxEllipse(width: 20pt, height: 20pt, fill: cyan, stroke: none))
    #PptxPlace(x: 260pt, y: 340pt, child: PptxBox(width: 180pt, height: 34pt)[
      #align(center + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[LOOP]]
    ])
    #PptxPlace(x: 260pt, y: 378pt, child: PptxBox(width: 180pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(center + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Fusion and#linebreak()fallback tested.]]
    ])
    #PptxPlace(x: 510pt, y: 264pt, child: PptxBox(width: 160pt, height: 18pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[W8 / FIELD]]
    ])
    #PptxPlace(x: 580pt, y: 302pt, child: PptxEllipse(width: 20pt, height: 20pt, fill: cyan, stroke: none))
    #PptxPlace(x: 500pt, y: 340pt, child: PptxBox(width: 180pt, height: 34pt)[
      #align(center + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[FIELD]]
    ])
    #PptxPlace(x: 500pt, y: 378pt, child: PptxBox(width: 180pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(center + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Three sites,#linebreak()one operator.]]
    ])
    #PptxPlace(x: 750pt, y: 264pt, child: PptxBox(width: 160pt, height: 18pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[W12 / PILOT]]
    ])
    #PptxPlace(x: 820pt, y: 302pt, child: PptxEllipse(width: 20pt, height: 20pt, fill: cyan, stroke: none))
    #PptxPlace(x: 740pt, y: 340pt, child: PptxBox(width: 180pt, height: 34pt)[
      #align(center + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[PILOT]]
    ])
    #PptxPlace(x: 740pt, y: 378pt, child: PptxBox(width: 180pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(center + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Closed loop#linebreak()under 50 ms.]]
    ])
    #PptxPlace(x: 48pt, y: 450pt, child: PptxBox(width: 800pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: ice,
        weight: "regular",
      )[One metric: closed-loop latency under 50 ms.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[06 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 07 / FAILURE MODES
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: amber,
        weight: "bold",
      )[06 / FAILURE MODES]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[Three ways the loop breaks.]]
    ])
    #PptxPlace(x: 48pt, y: 200pt, child: PptxRect(
      width: 270pt,
      height: 220pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 10pt,
    ))
    #PptxPlace(x: 64pt, y: 216pt, child: PptxRect(width: 48pt, height: 4pt, fill: amber, stroke: none))
    #PptxPlace(x: 64pt, y: 230pt, child: PptxBox(width: 60pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[01]]
    ])
    #PptxPlace(x: 64pt, y: 254pt, child: PptxBox(width: 238pt, height: 34pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[Stale signal]]
    ])
    #PptxPlace(x: 64pt, y: 298pt, child: PptxBox(width: 238pt, height: 100pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[The sensor ages out#linebreak()before the model notices.]]
    ])
    #PptxPlace(x: 342pt, y: 200pt, child: PptxRect(
      width: 270pt,
      height: 220pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 10pt,
    ))
    #PptxPlace(x: 358pt, y: 216pt, child: PptxRect(width: 48pt, height: 4pt, fill: cyan, stroke: none))
    #PptxPlace(x: 358pt, y: 230pt, child: PptxBox(width: 60pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: cyan, weight: "bold")[02]]
    ])
    #PptxPlace(x: 358pt, y: 254pt, child: PptxBox(width: 238pt, height: 34pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[Split decision]]
    ])
    #PptxPlace(x: 358pt, y: 298pt, child: PptxBox(width: 238pt, height: 100pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Two controllers disagree#linebreak()about the same input.]]
    ])
    #PptxPlace(x: 636pt, y: 200pt, child: PptxRect(
      width: 270pt,
      height: 220pt,
      fill: panel,
      stroke: 1pt + rule,
      radius: 10pt,
    ))
    #PptxPlace(x: 652pt, y: 216pt, child: PptxRect(width: 48pt, height: 4pt, fill: lilac, stroke: none))
    #PptxPlace(x: 652pt, y: 230pt, child: PptxBox(width: 60pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: lilac, weight: "bold")[03]]
    ])
    #PptxPlace(x: 652pt, y: 254pt, child: PptxBox(width: 238pt, height: 34pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 24pt, fill: ice, weight: "bold")[Late actuation]]
    ])
    #PptxPlace(x: 652pt, y: 298pt, child: PptxBox(width: 238pt, height: 100pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[The command arrives#linebreak()after the window closes.]]
    ])
    #PptxPlace(x: 48pt, y: 450pt, child: PptxBox(width: 800pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: ice,
        weight: "regular",
      )[Each failure is a latency budget problem.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[07 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 08 / EVIDENCE
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[07 / EVIDENCE]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[Precision and latency trade off.]]
    ])
    #PptxPlace(x: 36pt, y: 190pt, child: PptxRect(
      width: 620pt,
      height: 294pt,
      fill: panel,
      stroke: none,
      radius: 10pt,
    ))
    #PptxPlace(x: 56pt, y: 204pt, child: PptxBox(width: 340pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[POSITION ERROR / MICROMETRES]]
    ])
    #PptxPlace(x: 100pt, y: 430pt, child: PptxLine(start: (0pt, 0pt), end: (520pt, 0pt), stroke: 1pt + rule))
    #PptxPlace(x: 100pt, y: 230pt, child: PptxLine(start: (0pt, 0pt), end: (0pt, 200pt), stroke: 1pt + rule))
    #PptxPlace(x: 100pt, y: 230pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (520pt, 0pt),
      stroke: 0.5pt + deep,
    ))
    #PptxPlace(x: 100pt, y: 280pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (520pt, 0pt),
      stroke: 0.5pt + deep,
    ))
    #PptxPlace(x: 100pt, y: 330pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (520pt, 0pt),
      stroke: 0.5pt + deep,
    ))
    #PptxPlace(x: 100pt, y: 380pt, child: PptxLine(
      start: (0pt, 0pt),
      end: (520pt, 0pt),
      stroke: 0.5pt + deep,
    ))
    #PptxPlace(x: 169pt, y: 266pt, child: PptxLine(start: (0pt, 0pt), end: (70pt, 22pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 239pt, y: 288pt, child: PptxLine(start: (0pt, 0pt), end: (52pt, 14pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 291pt, y: 302pt, child: PptxLine(start: (0pt, 0pt), end: (34pt, 12pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 325pt, y: 314pt, child: PptxLine(start: (0pt, 0pt), end: (52pt, 14pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 377pt, y: 328pt, child: PptxLine(start: (0pt, 0pt), end: (35pt, 10pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 412pt, y: 338pt, child: PptxLine(start: (0pt, 0pt), end: (69pt, 14pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 481pt, y: 352pt, child: PptxLine(start: (0pt, 0pt), end: (70pt, 14pt), stroke: 1.5pt + ice))
    #PptxPlace(x: 164pt, y: 261pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 145pt, y: 236pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[8.2]]
    ])
    #PptxPlace(x: 234pt, y: 283pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 215pt, y: 298pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[7.1]]
    ])
    #PptxPlace(x: 286pt, y: 297pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 267pt, y: 272pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[6.4]]
    ])
    #PptxPlace(x: 320pt, y: 309pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 301pt, y: 324pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[5.8]]
    ])
    #PptxPlace(x: 372pt, y: 323pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 353pt, y: 298pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[5.1]]
    ])
    #PptxPlace(x: 407pt, y: 333pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 388pt, y: 348pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[4.6]]
    ])
    #PptxPlace(x: 476pt, y: 347pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: cyan, stroke: none))
    #PptxPlace(x: 457pt, y: 322pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[3.9]]
    ])
    #PptxPlace(x: 546pt, y: 361pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: amber, stroke: none))
    #PptxPlace(x: 527pt, y: 336pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 20pt, fill: ice, weight: "regular")[3.2]]
    ])
    #PptxPlace(x: 76pt, y: 436pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[20]]
    ])
    #PptxPlace(x: 249pt, y: 436pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[30]]
    ])
    #PptxPlace(x: 423pt, y: 436pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[40]]
    ])
    #PptxPlace(x: 596pt, y: 436pt, child: PptxBox(width: 48pt, height: 24pt)[
      #align(center + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[50]]
    ])
    #PptxPlace(x: 56pt, y: 420pt, child: PptxBox(width: 32pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[0]]
    ])
    #PptxPlace(x: 56pt, y: 320pt, child: PptxBox(width: 32pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[5]]
    ])
    #PptxPlace(x: 56pt, y: 220pt, child: PptxBox(width: 32pt, height: 24pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 18pt, fill: muted, weight: "regular")[10]]
    ])
    #PptxPlace(x: 220pt, y: 460pt, child: PptxBox(width: 280pt, height: 24pt)[
      #align(center + top)[#PptxText(
        font: "Consolas",
        size: 18pt,
        fill: muted,
        weight: "regular",
      )[LOOP PERIOD / MS]]
    ])
    #PptxPlace(x: 690pt, y: 210pt, child: PptxBox(width: 220pt, height: 90pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 56pt, fill: amber, weight: "bold")[3.2 µm]]
    ])
    #PptxPlace(x: 690pt, y: 290pt, child: PptxBox(width: 220pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[OBSERVED AT 46 MS]]
    ])
    #PptxPlace(x: 690pt, y: 320pt, child: PptxRect(width: 220pt, height: 0.5pt, fill: rule, stroke: none))
    #PptxPlace(x: 690pt, y: 336pt, child: PptxBox(width: 220pt, height: 100pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: ice,
        weight: "regular",
      )[In this sample,#linebreak()longer periods have#linebreak()lower error.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[08 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 09 / PRINCIPLES
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: amber,
        weight: "bold",
      )[08 / PRINCIPLES]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 60pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 42pt,
        fill: ice,
        weight: "bold",
      )[What we optimize for.]]
    ])
    #PptxPlace(x: 48pt, y: 210pt, child: PptxBox(width: 70pt, height: 34pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 30pt, fill: amber, weight: "bold")[01]]
    ])
    #PptxPlace(x: 130pt, y: 210pt, child: PptxBox(width: 500pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 30pt, fill: ice, weight: "bold")[Decide locally.]]
    ])
    #PptxPlace(x: 130pt, y: 248pt, child: PptxBox(width: 680pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Keep the control loop on the device.]]
    ])
    #PptxPlace(x: 48pt, y: 280pt, child: PptxRect(width: 864pt, height: 0.5pt, fill: rule, stroke: none))
    #PptxPlace(x: 48pt, y: 290pt, child: PptxBox(width: 70pt, height: 34pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 30pt, fill: amber, weight: "bold")[02]]
    ])
    #PptxPlace(x: 130pt, y: 290pt, child: PptxBox(width: 500pt, height: 36pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 30pt, fill: ice, weight: "bold")[Measure the loop.]]
    ])
    #PptxPlace(x: 130pt, y: 328pt, child: PptxBox(width: 680pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Latency is the product metric.]]
    ])
    #PptxPlace(x: 48pt, y: 360pt, child: PptxRect(width: 864pt, height: 0.5pt, fill: rule, stroke: none))
    #PptxPlace(x: 48pt, y: 370pt, child: PptxBox(width: 70pt, height: 34pt)[
      #align(left + top)[#PptxText(font: "Barlow", size: 30pt, fill: amber, weight: "bold")[03]]
    ])
    #PptxPlace(x: 130pt, y: 370pt, child: PptxBox(width: 500pt, height: 36pt)[
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 30pt,
        fill: ice,
        weight: "bold",
      )[Design for failure.]]
    ])
    #PptxPlace(x: 130pt, y: 408pt, child: PptxBox(width: 680pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[A degraded loop beats a stopped one.]]
    ])
    #PptxPlace(x: 48pt, y: 460pt, child: PptxBox(width: 800pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[The edge is a discipline, not a location.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[09 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 10 / CLOSE
    #PptxPlace(x: 620pt, y: 80pt, child: PptxEllipse(
      width: 300pt,
      height: 300pt,
      fill: none,
      stroke: 1.5pt + cyan,
    ))
    #PptxPlace(x: 680pt, y: 140pt, child: PptxEllipse(
      width: 180pt,
      height: 180pt,
      fill: none,
      stroke: 1pt + rule,
    ))
    #PptxPlace(x: 740pt, y: 200pt, child: PptxEllipse(width: 60pt, height: 60pt, fill: amber, stroke: none))
    #PptxPlace(x: 48pt, y: 110pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Consolas", size: 12pt, fill: amber, weight: "bold")[10 / CLOSE]]
    ])
    #PptxPlace(x: 48pt, y: 146pt, child: PptxBox(width: 540pt, height: 170pt)[
      #set par(leading: 0.3em)
      #align(left + top)[#PptxText(
        font: "Barlow",
        size: 56pt,
        fill: ice,
        weight: "bold",
      )[Build the loop.#linebreak()Measure the edge.]]
    ])
    #PptxPlace(x: 48pt, y: 350pt, child: PptxBox(width: 500pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 24pt,
        fill: muted,
        weight: "regular",
      )[Autonomous systems.#linebreak()Close to the signal.]]
    ])
    #PptxPlace(x: 48pt, y: 430pt, child: PptxRect(width: 120pt, height: 3pt, fill: cyan, stroke: none))
    #PptxPlace(x: 48pt, y: 450pt, child: PptxBox(width: 600pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Consolas",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[ORBITAL SYSTEMS / 2026]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Consolas", size: 12pt, fill: muted, weight: "bold")[10 / 10]]
    ])
  ],
)
