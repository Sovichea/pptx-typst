// Atlas Review: a warm editorial deck with serif display type and native geometry.
#import "pptx-typst.typ": *
#import "@preview/gribouille:0.7.0": *
#set page(width: 960pt, height: 540pt, margin: 0pt)
#set text(font: ("Arial", "Georgia"), lang: "en")

#let paper = rgb("#F4EFE5")
#let card = rgb("#FBF7EF")
#let ink = rgb("#211D18")
#let rust = rgb("#9C3D2E")
#let forest = rgb("#214D3F")
#let ochre = rgb("#C8953F")
#let muted = rgb("#6F6759")
#let rule = rgb("#CFC3B0")
#let track = rgb("#E8DFD1")

#let cost-area = plot(
  data: (
    (year: 1, share: 78, kind: "Build"),
    (year: 1, share: 22, kind: "Operate"),
    (year: 2, share: 62, kind: "Build"),
    (year: 2, share: 38, kind: "Operate"),
    (year: 3, share: 48, kind: "Build"),
    (year: 3, share: 52, kind: "Operate"),
    (year: 4, share: 38, kind: "Build"),
    (year: 4, share: 62, kind: "Operate"),
    (year: 5, share: 30, kind: "Build"),
    (year: 5, share: 70, kind: "Operate"),
    (year: 6, share: 24, kind: "Build"),
    (year: 6, share: 76, kind: "Operate"),
    (year: 7, share: 19, kind: "Build"),
    (year: 7, share: 81, kind: "Operate"),
    (year: 8, share: 15, kind: "Build"),
    (year: 8, share: 85, kind: "Operate"),
    (year: 9, share: 12, kind: "Build"),
    (year: 9, share: 88, kind: "Operate"),
    (year: 10, share: 9, kind: "Build"),
    (year: 10, share: 91, kind: "Operate"),
  ),
  mapping: aes(x: "year", y: "share", fill: "kind"),
  layers: (geom-area(alpha: 1, stroke: none),),
  scales: scales(
    x: scale-continuous(limits: (1, 10), breaks: (1, 3, 5, 7, 10)),
    y: scale-continuous(limits: (0, 100)),
    fill: scale-manual(name: "Spend", values: (rust, forest)),
  ),
  labels: labels(x: "Year", y: "Share of spend", title: none, subtitle: none),
  theme: theme-minimal(
    axis-text: element-text(size: 18pt),
    axis-title: element-text(size: 18pt),
    legend-text: element-text(size: 18pt),
    legend-title: element-text(size: 18pt),
  ),
  width: 568pt,
  height: 240pt,
)

#let AtlasMaster = PptxMaster(
  fill: rgb("#F4EFE5"),
  children: [
    #PptxPlace(x: 24pt, y: 48pt, child: PptxRect(width: 2pt, height: 444pt, fill: rust, stroke: none))
    #PptxPlace(x: 48pt, y: 24pt, child: PptxBox(width: 560pt, height: 16pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 12pt,
        fill: rust,
        weight: "bold",
      )[ATLAS / REVIEW OF DURABLE SYSTEMS]]
    ])
    #PptxPlace(x: 680pt, y: 24pt, child: PptxBox(width: 232pt, height: 16pt)[
      #align(right + top)[#PptxText(
        font: "Arial",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[ISSUE 04 / 2026]]
    ])
    #PptxPlace(x: 48pt, y: 490pt, child: PptxRect(width: 864pt, height: 0.5pt, fill: rule, stroke: none))
    #PptxPlace(x: 48pt, y: 500pt, child: PptxBox(width: 640pt, height: 16pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[MAINTENANCE / REVERSIBILITY / TIME]]
    ])
  ],
)

#let Standard = PptxLayout(master: AtlasMaster, children: [])

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 01 / COVER
    #PptxPlace(x: 680pt, y: 70pt, child: PptxEllipse(width: 260pt, height: 260pt, fill: rust, stroke: none))
    #PptxPlace(x: 760pt, y: 230pt, child: PptxRect(width: 150pt, height: 220pt, fill: forest, stroke: none))
    #PptxPlace(x: 700pt, y: 140pt, child: PptxRect(width: 36pt, height: 36pt, fill: ochre, stroke: none))
    #PptxPlace(x: 620pt, y: 200pt, child: PptxRect(width: 0.75pt, height: 240pt, fill: rule, stroke: none))
    #PptxPlace(x: 48pt, y: 100pt, child: PptxBox(width: 560pt, height: 18pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 14pt,
        fill: rust,
        weight: "bold",
      )[ATLAS REVIEW / ISSUE 04]]
    ])
    #PptxPlace(x: 48pt, y: 136pt, child: PptxBox(width: 540pt, height: 210pt)[
      #set par(leading: 0.3em)
      #align(left + top)[#PptxText(
        font: "Georgia",
        size: 64pt,
        fill: ink,
        weight: "bold",
      )[The quiet#linebreak()infrastructure.]]
    ])
    #PptxPlace(x: 48pt, y: 370pt, child: PptxBox(width: 480pt, height: 70pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 24pt,
        fill: muted,
        weight: "regular",
      )[A field guide to systems that last.]]
    ])
    #PptxPlace(x: 48pt, y: 440pt, child: PptxRect(width: 120pt, height: 3pt, fill: rust, stroke: none))
    #PptxPlace(x: 48pt, y: 456pt, child: PptxBox(width: 600pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 12pt,
        fill: muted,
        weight: "regular",
      )[EDITED BY THE ATLAS WORKING GROUP]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Arial", size: 12pt, fill: muted, weight: "bold")[01 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 02 / THESIS
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rust, weight: "bold")[01 / THESIS]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 820pt, height: 70pt)[
      #align(left + top)[#PptxText(
        font: "Georgia",
        size: 48pt,
        fill: ink,
        weight: "bold",
      )[Maintenance is the product.]]
    ])
    #PptxPlace(x: 48pt, y: 210pt, child: PptxBox(width: 500pt, height: 80pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 24pt,
        fill: ink,
        weight: "regular",
      )[The build is a moment.#linebreak()The operating model is the lifetime.]]
    ])
    #PptxPlace(x: 48pt, y: 300pt, child: PptxBox(width: 500pt, height: 100pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: muted,
        weight: "regular",
      )[A system that is expensive to keep#linebreak()is not finished. It is a liability with#linebreak()a launch date.]]
    ])
    #PptxPlace(x: 620pt, y: 196pt, child: PptxBox(width: 300pt, height: 100pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 80pt, fill: rust, weight: "bold")[68%]]
    ])
    #PptxPlace(x: 620pt, y: 300pt, child: PptxBox(width: 300pt, height: 40pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[OF LIFETIME COST#linebreak()ARRIVES AFTER BUILD]]
    ])
    #PptxPlace(x: 620pt, y: 370pt, child: PptxRect(width: 84pt, height: 22pt, fill: rust, stroke: none))
    #PptxPlace(x: 704pt, y: 370pt, child: PptxRect(width: 196pt, height: 22pt, fill: forest, stroke: none))
    #PptxPlace(x: 620pt, y: 398pt, child: PptxBox(width: 300pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 12pt,
        fill: muted,
        weight: "bold",
      )[BUILD / OPERATIONS]]
    ])
    #PptxPlace(x: 48pt, y: 420pt, child: PptxBox(width: 820pt, height: 40pt)[
      #align(left + top)[#PptxText(
        font: "Georgia",
        size: 30pt,
        fill: forest,
        weight: "bold",
      )[Design the second decade, not just the launch.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Arial", size: 12pt, fill: muted, weight: "bold")[02 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 03 / TWO MODELS
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rust, weight: "bold")[02 / TWO MODELS]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 70pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 48pt, fill: ink, weight: "bold")[Two ways to grow.]]
    ])
    #PptxPlace(x: 48pt, y: 200pt, child: PptxRect(
      width: 410pt,
      height: 240pt,
      fill: card,
      stroke: 1pt + rule,
      radius: 6pt,
    ))
    #PptxPlace(x: 502pt, y: 200pt, child: PptxRect(
      width: 410pt,
      height: 240pt,
      fill: forest,
      stroke: none,
      radius: 6pt,
    ))
    #PptxPlace(x: 72pt, y: 220pt, child: PptxBox(width: 340pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rust, weight: "bold")[EXTRACTIVE]]
    ])
    #PptxPlace(x: 72pt, y: 244pt, child: PptxBox(width: 340pt, height: 80pt)[
      #set par(leading: 0.3em)
      #align(left + top)[#PptxText(
        font: "Georgia",
        size: 30pt,
        fill: ink,
        weight: "bold",
      )[Build, then#linebreak()move on.]]
    ])
    #PptxPlace(x: 72pt, y: 328pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Measure the launch]]
    ])
    #PptxPlace(x: 72pt, y: 362pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Optimize the build]]
    ])
    #PptxPlace(x: 72pt, y: 396pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Retire by surprise]]
    ])
    #PptxPlace(x: 526pt, y: 220pt, child: PptxBox(width: 340pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: ochre, weight: "bold")[REGENERATIVE]]
    ])
    #PptxPlace(x: 526pt, y: 244pt, child: PptxBox(width: 340pt, height: 80pt)[
      #set par(leading: 0.3em)
      #align(left + top)[#PptxText(
        font: "Georgia",
        size: 30pt,
        fill: paper,
        weight: "bold",
      )[Operate, then#linebreak()renew.]]
    ])
    #PptxPlace(x: 526pt, y: 328pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: paper,
        weight: "regular",
      )[Measure the second year]]
    ])
    #PptxPlace(x: 526pt, y: 362pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: paper,
        weight: "regular",
      )[Optimize the operating model]]
    ])
    #PptxPlace(x: 526pt, y: 396pt, child: PptxBox(width: 340pt, height: 20pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: paper,
        weight: "regular",
      )[Retire on purpose]]
    ])
    #PptxPlace(x: 48pt, y: 456pt, child: PptxBox(width: 800pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: muted,
        weight: "regular",
      )[The difference is where the cost lands.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Arial", size: 12pt, fill: muted, weight: "bold")[03 / 10]]
    ])
  ],
)

#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: Standard,
  children: [
    // 04 / PROCESS
    #PptxPlace(x: 48pt, y: 78pt, child: PptxBox(width: 520pt, height: 18pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 12pt, fill: rust, weight: "bold")[03 / PROCESS]]
    ])
    #PptxPlace(x: 48pt, y: 102pt, child: PptxBox(width: 760pt, height: 70pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 48pt, fill: ink, weight: "bold")[The review loop.]]
    ])
    #PptxPlace(x: 48pt, y: 220pt, child: PptxRect(
      width: 190pt,
      height: 192pt,
      fill: card,
      stroke: 1pt + rule,
      radius: 6pt,
    ))
    #PptxPlace(x: 64pt, y: 236pt, child: PptxBox(width: 80pt, height: 30pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 28pt, fill: rust, weight: "bold")[01]]
    ])
    #PptxPlace(x: 64pt, y: 268pt, child: PptxBox(width: 158pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ink, weight: "bold")[OBSERVE]]
    ])
    #PptxPlace(x: 64pt, y: 300pt, child: PptxBox(width: 158pt, height: 104pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Watch the system#linebreak()in use.]]
    ])
    #PptxPlace(x: 238pt, y: 288pt, child: PptxBox(width: 28pt, height: 30pt)[
      #align(center + top)[#PptxText(font: "Arial", size: 24pt, fill: rust, weight: "bold")[→]]
    ])
    #PptxPlace(x: 266pt, y: 220pt, child: PptxRect(
      width: 190pt,
      height: 192pt,
      fill: card,
      stroke: 1pt + rule,
      radius: 6pt,
    ))
    #PptxPlace(x: 282pt, y: 236pt, child: PptxBox(width: 80pt, height: 30pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 28pt, fill: rust, weight: "bold")[02]]
    ])
    #PptxPlace(x: 282pt, y: 268pt, child: PptxBox(width: 158pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ink, weight: "bold")[QUESTION]]
    ])
    #PptxPlace(x: 282pt, y: 300pt, child: PptxBox(width: 158pt, height: 104pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Question the#linebreak()assumption.]]
    ])
    #PptxPlace(x: 456pt, y: 288pt, child: PptxBox(width: 28pt, height: 30pt)[
      #align(center + top)[#PptxText(font: "Arial", size: 24pt, fill: rust, weight: "bold")[→]]
    ])
    #PptxPlace(x: 484pt, y: 220pt, child: PptxRect(
      width: 190pt,
      height: 192pt,
      fill: card,
      stroke: 1pt + rule,
      radius: 6pt,
    ))
    #PptxPlace(x: 500pt, y: 236pt, child: PptxBox(width: 80pt, height: 30pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 28pt, fill: rust, weight: "bold")[03]]
    ])
    #PptxPlace(x: 500pt, y: 268pt, child: PptxBox(width: 158pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ink, weight: "bold")[DECIDE]]
    ])
    #PptxPlace(x: 500pt, y: 300pt, child: PptxBox(width: 158pt, height: 104pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Keep, change,#linebreak()or retire.]]
    ])
    #PptxPlace(x: 674pt, y: 288pt, child: PptxBox(width: 28pt, height: 30pt)[
      #align(center + top)[#PptxText(font: "Arial", size: 24pt, fill: rust, weight: "bold")[→]]
    ])
    #PptxPlace(x: 702pt, y: 220pt, child: PptxRect(
      width: 190pt,
      height: 192pt,
      fill: card,
      stroke: 1pt + rule,
      radius: 6pt,
    ))
    #PptxPlace(x: 718pt, y: 236pt, child: PptxBox(width: 80pt, height: 30pt)[
      #align(left + top)[#PptxText(font: "Georgia", size: 28pt, fill: rust, weight: "bold")[04]]
    ])
    #PptxPlace(x: 718pt, y: 268pt, child: PptxBox(width: 158pt, height: 24pt)[
      #align(left + top)[#PptxText(font: "Arial", size: 20pt, fill: ink, weight: "bold")[RECORD]]
    ])
    #PptxPlace(x: 718pt, y: 300pt, child: PptxBox(width: 158pt, height: 104pt)[
      #set par(leading: 0.55em)
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 20pt,
        fill: muted,
        weight: "regular",
      )[Leave the reason#linebreak()where the next team looks.]]
    ])
    #PptxPlace(x: 48pt, y: 430pt, child: PptxBox(width: 800pt, height: 24pt)[
      #align(left + top)[#PptxText(
        font: "Arial",
        size: 22pt,
        fill: muted,
        weight: "regular",
      )[Review is a cadence, not an event.]]
    ])
    #PptxPlace(x: 862pt, y: 500pt, child: PptxBox(width: 50pt, height: 16pt)[
      #align(right + top)[#PptxText(font: "Arial", size: 12pt, fill: muted, weight: "bold")[04 / 10]]
    ])
  ],
)

