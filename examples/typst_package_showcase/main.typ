// SIGNAL / SYSTEM — an editorial atlas of evidence and decisions.
#import "pptx-typst.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "@preview/fletcher:0.5.8": diagram, edge, node, shapes
#import "@preview/gribouille:0.7.0": *
#set page(width: 960pt, height: 540pt, margin: 0pt)
#set text(font: "Arial", lang: "en")
#let bone = rgb("#F2F1EA")
#let ink = rgb("#111A20")
#let blue = rgb("#2447FF")
#let orange = rgb("#FF4D2E")
#let lime = rgb("#D8FF3E")
#let muted = rgb("#62645F")
#let rule = rgb("#D2D2C9")
#let signal-wave = canvas(length: 1pt, {
  import draw: *
  let points = (
    (0, 64),
    (50, 64),
    (72, 88),
    (90, 16),
    (114, 122),
    (140, 48),
    (164, 76),
    (194, 64),
    (240, 64),
    (264, 92),
    (286, 34),
    (308, 106),
    (330, 52),
    (350, 76),
    (380, 64),
    (430, 64),
    (454, 78),
    (474, 48),
    (494, 80),
    (518, 64),
  )
  line(..points, stroke: 3pt + lime)
  circle((72, 88), radius: 5pt, fill: orange, stroke: none)
  circle((308, 106), radius: 5pt, fill: orange, stroke: none)
})
#let cetz-chart = canvas(length: 1pt, {
  import draw: *
  let values = (38, 52, 61, 74)
  for v in (0, 20, 40, 60, 80) {
    line((0, v * 2.5), (816, v * 2.5), stroke: 0.5pt + rule)
  }
  for (i, value) in values.enumerate() {
    let x = 40 + i * 200
    rect((x, 0), (x + 112, value * 2.5), fill: if i == 3 { orange } else { blue }, stroke: none)
    content((x + 56, -14), text(font: "Arial", size: 20pt, fill: ink)[Q#(i + 1)], anchor: "north")
    content(
      (x + 56, value * 2.5 + 8),
      text(font: "Arial", size: 22pt, weight: "bold", fill: ink)[#value%],
      anchor: "south",
    )
  }
})
#let decision-loop = diagram(
  node(
    (0pt, 0pt),
    text(font: "Arial", size: 20pt, weight: "bold")[SENSE],
    width: 150pt,
    height: 64pt,
    fill: bone,
    stroke: none,
  ),
  node(
    (230pt, 0pt),
    text(font: "Arial", size: 20pt, weight: "bold")[INTERPRET],
    width: 150pt,
    height: 64pt,
    fill: bone,
    stroke: none,
  ),
  node(
    (460pt, 0pt),
    text(font: "Arial", size: 20pt, weight: "bold")[DECIDE],
    width: 150pt,
    height: 64pt,
    fill: bone,
    stroke: none,
  ),
  node(
    (690pt, 0pt),
    text(font: "Arial", size: 20pt, weight: "bold")[ACT],
    width: 150pt,
    height: 64pt,
    fill: lime,
    stroke: none,
  ),
  edge((0pt, 0pt), (230pt, 0pt), "-|>", stroke: 2pt + bone),
  edge((230pt, 0pt), (460pt, 0pt), "-|>", stroke: 2pt + bone),
  edge((460pt, 0pt), (690pt, 0pt), "-|>", stroke: 2pt + bone),
  edge((690pt, 0pt), (0pt, 0pt), "-|>", bend: 28deg, stroke: 2pt + orange),
)
#let hours-chart = plot(
  data: (
    (phase: "Sense", hours: 18),
    (phase: "Fuse", hours: 22),
    (phase: "Plan", hours: 31),
    (phase: "Act", hours: 29),
  ),
  mapping: aes(x: "phase", y: "hours"),
  layers: (
    geom-col(fill: blue, width: 0.65),
    geom-col(data: ((phase: "Plan", hours: 31),), fill: orange, width: 0.65),
    geom-text(mapping: aes(label: "hours"), nudge-x: 18pt, size: 20pt, colour: ink),
  ),
  coord: coord-flip(),
  scales: scales(x: scale-discrete(limits: ("Sense", "Fuse", "Plan", "Act")), y: scale-continuous(
    limits: (0, 36),
    expand: (0%, 0%),
  )),
  labels: labels(x: none, y: typst([Hours])),
  theme: theme-minimal(
    paper: bone,
    ink: ink,
    axis-text: element-text(size: 20pt),
    axis-title: element-text(size: 20pt),
    text: element-text(font: "Arial"),
  ),
  width: 568pt,
  height: 300pt,
)
#let cetz-line = canvas(length: 1pt, {
  import draw: *
  let values = (62, 54, 47, 39, 30, 22)
  let pts = values.enumerate().map(((i, v)) => (40 + i * 148, v * 2.5))
  for v in (0, 20, 40, 60) { line((0, v * 2.5), (820, v * 2.5), stroke: 0.5pt + rule) }
  line(..pts, stroke: 3pt + orange)
  for (i, p) in pts.enumerate() {
    circle(p, radius: 4pt, fill: orange, stroke: none)
    content((p.at(0), -16), text(font: "Arial", size: 20pt, fill: muted)[W#(i + 1)], anchor: "north")
    content(
      (p.at(0), p.at(1) + 10),
      text(font: "Arial", size: 22pt, weight: "bold", fill: ink)[#values.at(i)],
      anchor: "south",
    )
  }
})
#let branch-diagram = diagram(
  node(
    (0pt, 0pt),
    text(font: "Arial", size: 20pt, weight: "bold")[OBSERVE],
    width: 130pt,
    height: 64pt,
    fill: bone,
    stroke: 1pt + ink,
  ),
  node(
    (200pt, 0pt),
    text(font: "Arial", size: 20pt, weight: "bold", fill: bone)[CLASSIFY],
    width: 154pt,
    height: 104pt,
    shape: shapes.diamond,
    fill: blue,
    stroke: none,
  ),
  node(
    (380pt, -86pt),
    text(font: "Arial", size: 20pt, weight: "bold")[SHIP],
    width: 130pt,
    height: 64pt,
    fill: lime,
    stroke: none,
  ),
  node(
    (380pt, 86pt),
    text(font: "Arial", size: 20pt, weight: "bold")[REWORK],
    width: 130pt,
    height: 64pt,
    fill: orange,
    stroke: none,
  ),
  edge((0pt, 0pt), (200pt, 0pt), "-|>", stroke: 2pt + ink),
  edge((200pt, 0pt), (380pt, -86pt), "-|>", stroke: 2pt + ink),
  edge((200pt, 0pt), (380pt, 86pt), "-|>", stroke: 2pt + ink),
  edge((380pt, 86pt), (200pt, 0pt), "-|>", bend: 35deg, stroke: 2pt + orange),
)
#let confidence-chart = plot(
  data: (
    (week: 1, score: 31),
    (week: 2, score: 42),
    (week: 3, score: 50),
    (week: 4, score: 57),
    (week: 5, score: 66),
    (week: 6, score: 74),
    (week: 7, score: 80),
    (week: 8, score: 84),
  ),
  mapping: aes(x: "week", y: "score"),
  layers: (
    geom-line(stroke: 3pt, colour: lime),
    geom-point(size: 5pt, fill: orange, colour: ink, stroke: 1pt),
  ),
  scales: scales(x: scale-continuous(limits: (1, 8)), y: scale-continuous(limits: (0, 100))),
  labels: labels(x: typst([Week]), y: typst([Confidence])),
  theme: theme-minimal(
    paper: ink,
    ink: bone,
    axis-text: element-text(size: 20pt),
    axis-title: element-text(size: 20pt),
    text: element-text(font: "Arial"),
  ),
  width: 610pt,
  height: 270pt,
)
#let Paper = PptxMaster(fill: rgb("#F2F1EA"), children: [
  #PptxPlace(x: 48pt, y: 24pt, child: PptxBox(width: 400pt, height: 20pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[SIGNAL / SYSTEM]]])
  #PptxPlace(x: 48pt, y: 508pt, child: PptxBox(width: 760pt, height: 18pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#62645F"),
    weight: "regular",
  )[TYPST DRAWING LAB  /  ALL DATA ILLUSTRATIVE]]])
])
#let PaperLayout = PptxLayout(master: Paper, children: [])
#let Night = PptxMaster(fill: rgb("#111A20"), children: [
  #PptxPlace(x: 48pt, y: 24pt, child: PptxBox(width: 400pt, height: 20pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[SIGNAL / SYSTEM]]])
  #PptxPlace(x: 48pt, y: 508pt, child: PptxBox(width: 760pt, height: 18pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[TYPST DRAWING LAB  /  ALL DATA ILLUSTRATIVE]]])
])
#let NightLayout = PptxLayout(master: Night, children: [])
#let Cobalt = PptxMaster(fill: rgb("#2447FF"), children: [
  #PptxPlace(x: 48pt, y: 24pt, child: PptxBox(width: 400pt, height: 20pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[SIGNAL / SYSTEM]]])
  #PptxPlace(x: 48pt, y: 508pt, child: PptxBox(width: 760pt, height: 18pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[TYPST DRAWING LAB  /  ALL DATA ILLUSTRATIVE]]])
])
#let CobaltLayout = PptxLayout(master: Cobalt, children: [])
// 01 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: NightLayout, children: [
  #PptxPlace(x: 48pt, y: 80pt, child: PptxBox(width: 790pt, height: 112pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 96pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[Signals]]])
  #PptxPlace(x: 48pt, y: 195pt, child: PptxBox(width: 790pt, height: 88pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 72pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[into systems.]]])
  #PptxPlace(x: 52pt, y: 332pt, child: PptxBox(width: 330pt, height: 100pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Geometry for structure.#linebreak()Charts and diagrams#linebreak()for evidence.]]])
  #PptxPlace(x: 390pt, y: 332pt, child: PptxStatic(width: 520pt, height: 140pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#signal-wave]]])
  #PptxPlace(x: 810pt, y: 80pt, child: PptxEllipse(
    width: 90pt,
    height: 90pt,
    fill: rgb("#FF4D2E"),
    stroke: none,
  ))
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[01 / 10]]])
])

// 02 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: PaperLayout, children: [
  #PptxPlace(x: 48pt, y: 72pt, child: PptxBox(width: 600pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[Uptime rose]]])
  #PptxPlace(x: 48pt, y: 126pt, child: PptxBox(width: 620pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[by 36 points.]]])
  #PptxPlace(x: 712pt, y: 70pt, child: PptxBox(width: 210pt, height: 110pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 88pt,
    fill: rgb("#2447FF"),
    weight: "bold",
  )[+36]]])
  #PptxPlace(x: 712pt, y: 170pt, child: PptxBox(width: 210pt, height: 20pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#62645F"),
    weight: "bold",
  )[PERCENTAGE POINTS]]])
  #PptxPlace(x: 48pt, y: 208pt, child: PptxStatic(width: 864pt, height: 280pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#cetz-chart]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[02 / 10]]])
])

// 03 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: NightLayout, children: [
  #PptxPlace(x: 48pt, y: 72pt, child: PptxBox(width: 860pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[Every action]]])
  #PptxPlace(x: 48pt, y: 126pt, child: PptxBox(width: 864pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[becomes new evidence.]]])
  #PptxPlace(x: 48pt, y: 222pt, child: PptxStatic(width: 864pt, height: 220pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#decision-loop]]])
  #PptxPlace(x: 48pt, y: 458pt, child: PptxBox(width: 864pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Sense. Interpret. Decide. Act. Learn.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[03 / 10]]])
])

// 04 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: PaperLayout, children: [
  #PptxPlace(x: 48pt, y: 74pt, child: PptxBox(width: 864pt, height: 68pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 42pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[Planning leads the workload.]]])
  #PptxPlace(x: 48pt, y: 184pt, child: PptxBox(width: 280pt, height: 22pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#62645F"),
    weight: "regular",
  )[100 HOURS / SAMPLE ALLOCATION]]])
  #PptxPlace(x: 48pt, y: 232pt, child: PptxBox(width: 270pt, height: 112pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 96pt,
    fill: rgb("#FF4D2E"),
    weight: "bold",
  )[31]]])
  #PptxPlace(x: 52pt, y: 350pt, child: PptxBox(width: 260pt, height: 22pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#62645F"),
    weight: "regular",
  )[HOURS IN PLANNING]]])
  #PptxPlace(x: 52pt, y: 402pt, child: PptxBox(width: 260pt, height: 80pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[The work before#linebreak()the work.]]])
  #PptxPlace(x: 344pt, y: 166pt, child: PptxStatic(width: 568pt, height: 300pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#hours-chart]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[04 / 10]]])
])

// 05 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: CobaltLayout, children: [
  #PptxPlace(x: 48pt, y: 72pt, child: PptxBox(width: 864pt, height: 70pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 60pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[Four moves. One argument.]]])
  #PptxPlace(x: 48pt, y: 248pt, child: PptxBox(width: 180pt, height: 66pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#D8FF3E"),
    weight: "bold",
  )[01]]])
  #PptxPlace(x: 48pt, y: 320pt, child: PptxRect(
    width: 184pt,
    height: 2pt,
    fill: rgb("#F2F1EA"),
    stroke: none,
  ))
  #PptxPlace(x: 48pt, y: 350pt, child: PptxBox(width: 184pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[GEOMETRY]]])
  #PptxPlace(x: 48pt, y: 402pt, child: PptxBox(width: 184pt, height: 78pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 20pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Structure the page.]]])
  #PptxPlace(x: 264pt, y: 248pt, child: PptxBox(width: 180pt, height: 66pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#D8FF3E"),
    weight: "bold",
  )[02]]])
  #PptxPlace(x: 264pt, y: 320pt, child: PptxRect(
    width: 184pt,
    height: 2pt,
    fill: rgb("#F2F1EA"),
    stroke: none,
  ))
  #PptxPlace(x: 264pt, y: 350pt, child: PptxBox(width: 184pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[EVIDENCE]]])
  #PptxPlace(x: 264pt, y: 402pt, child: PptxBox(width: 184pt, height: 78pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 20pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Show the signal.]]])
  #PptxPlace(x: 480pt, y: 248pt, child: PptxBox(width: 180pt, height: 66pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#D8FF3E"),
    weight: "bold",
  )[03]]])
  #PptxPlace(x: 480pt, y: 320pt, child: PptxRect(
    width: 184pt,
    height: 2pt,
    fill: rgb("#F2F1EA"),
    stroke: none,
  ))
  #PptxPlace(x: 480pt, y: 350pt, child: PptxBox(width: 184pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[SYSTEM]]])
  #PptxPlace(x: 480pt, y: 402pt, child: PptxBox(width: 184pt, height: 78pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 20pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Draw the loop.]]])
  #PptxPlace(x: 696pt, y: 248pt, child: PptxBox(width: 180pt, height: 66pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#D8FF3E"),
    weight: "bold",
  )[04]]])
  #PptxPlace(x: 696pt, y: 320pt, child: PptxRect(
    width: 184pt,
    height: 2pt,
    fill: rgb("#F2F1EA"),
    stroke: none,
  ))
  #PptxPlace(x: 696pt, y: 350pt, child: PptxBox(width: 184pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[PROFILE]]])
  #PptxPlace(x: 696pt, y: 402pt, child: PptxBox(width: 184pt, height: 78pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 20pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Weigh the trade-offs.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[05 / 10]]])
])

// 06 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: PaperLayout, children: [
  #PptxPlace(x: 48pt, y: 72pt, child: PptxBox(width: 864pt, height: 24pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#62645F"),
    weight: "regular",
  )[PRECISION / ERROR IN MICROMETRES]]])
  #PptxPlace(x: 48pt, y: 116pt, child: PptxStatic(width: 864pt, height: 270pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#cetz-line]]])
  #PptxPlace(x: 48pt, y: 418pt, child: PptxBox(width: 864pt, height: 54pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 40pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[The error budget closes.]]])
  #PptxPlace(x: 48pt, y: 470pt, child: PptxBox(width: 864pt, height: 30pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 20pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[62 to 22 µm across six weekly measurements.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[06 / 10]]])
])

// 07 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: PaperLayout, children: [
  #PptxPlace(x: 48pt, y: 74pt, child: PptxBox(width: 330pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 42pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[One gate.]]])
  #PptxPlace(x: 48pt, y: 130pt, child: PptxBox(width: 330pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 42pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[Two paths.]]])
  #PptxPlace(x: 48pt, y: 252pt, child: PptxBox(width: 250pt, height: 130pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 112pt,
    fill: rgb("#FF4D2E"),
    weight: "bold",
  )[2]]])
  #PptxPlace(x: 52pt, y: 384pt, child: PptxBox(width: 300pt, height: 24pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#62645F"),
    weight: "regular",
  )[SHIP OR REWORK]]])
  #PptxPlace(x: 400pt, y: 106pt, child: PptxStatic(width: 512pt, height: 300pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#branch-diagram]]])
  #PptxPlace(x: 48pt, y: 454pt, child: PptxBox(width: 864pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[Classify once. Make the next action explicit.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[07 / 10]]])
])

// 08 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: NightLayout, children: [
  #PptxPlace(x: 48pt, y: 72pt, child: PptxBox(width: 640pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[Confidence]]])
  #PptxPlace(x: 48pt, y: 126pt, child: PptxBox(width: 640pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[compounds.]]])
  #PptxPlace(x: 48pt, y: 210pt, child: PptxStatic(width: 610pt, height: 270pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#confidence-chart]]])
  #PptxPlace(x: 704pt, y: 182pt, child: PptxBox(width: 208pt, height: 132pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 112pt,
    fill: rgb("#D8FF3E"),
    weight: "bold",
  )[84]]])
  #PptxPlace(x: 710pt, y: 318pt, child: PptxBox(width: 202pt, height: 22pt)[#align(left + top)[#PptxText(
    font: "Consolas",
    size: 14pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[WEEK 8 / CONFIDENCE]]])
  #PptxPlace(x: 710pt, y: 366pt, child: PptxBox(width: 202pt, height: 112pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[The conclusion#linebreak()stays editable.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[08 / 10]]])
])

// 09 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: PaperLayout, children: [
  #PptxPlace(x: 48pt, y: 70pt, child: PptxBox(width: 864pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[Three rules]]])
  #PptxPlace(x: 48pt, y: 124pt, child: PptxBox(width: 864pt, height: 56pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 44pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[for technical decks.]]])
  #PptxPlace(x: 48pt, y: 222pt, child: PptxBox(width: 58pt, height: 46pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 28pt,
    fill: rgb("#2447FF"),
    weight: "bold",
  )[01]]])
  #PptxPlace(x: 128pt, y: 222pt, child: PptxBox(width: 784pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 26pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[One claim per slide.]]])
  #PptxPlace(x: 128pt, y: 262pt, child: PptxBox(width: 784pt, height: 34pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 22pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[The headline is the argument, not the topic.]]])
  #PptxPlace(x: 48pt, y: 306pt, child: PptxBox(width: 58pt, height: 46pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 28pt,
    fill: rgb("#2447FF"),
    weight: "bold",
  )[02]]])
  #PptxPlace(x: 128pt, y: 306pt, child: PptxBox(width: 784pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 26pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[Make the evidence visible.]]])
  #PptxPlace(x: 128pt, y: 346pt, child: PptxBox(width: 784pt, height: 34pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 22pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[Give the chart the space it needs.]]])
  #PptxPlace(x: 48pt, y: 390pt, child: PptxBox(width: 58pt, height: 46pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 28pt,
    fill: rgb("#2447FF"),
    weight: "bold",
  )[03]]])
  #PptxPlace(x: 128pt, y: 390pt, child: PptxBox(width: 784pt, height: 40pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 26pt,
    fill: rgb("#111A20"),
    weight: "bold",
  )[Keep the words editable.]]])
  #PptxPlace(x: 128pt, y: 430pt, child: PptxBox(width: 784pt, height: 34pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 22pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[Draw the artwork. Keep the meaning in text.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#111A20"),
    weight: "regular",
  )[09 / 10]]])
])

// 10 / Narrative composition
#PptxSlide(width: 960pt, height: 540pt, layout: CobaltLayout, children: [
  #PptxPlace(x: 390pt, y: 68pt, child: PptxStatic(width: 520pt, height: 140pt)[#block(
    width: 100%,
    height: 100%,
  )[#align(center + horizon)[#signal-wave]]])
  #PptxPlace(x: 48pt, y: 216pt, child: PptxBox(width: 720pt, height: 78pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 60pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[Keep the]]])
  #PptxPlace(x: 48pt, y: 288pt, child: PptxBox(width: 630pt, height: 138pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 112pt,
    fill: rgb("#F2F1EA"),
    weight: "bold",
  )[signal.]]])
  #PptxPlace(x: 654pt, y: 350pt, child: PptxBox(width: 258pt, height: 126pt)[#align(left + top)[#PptxText(
    font: "Arial",
    size: 24pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[Draw the artwork.#linebreak()Keep the meaning#linebreak()editable.]]])
  #PptxPlace(x: 838pt, y: 508pt, child: PptxBox(width: 74pt, height: 18pt)[#align(right + top)[#PptxText(
    font: "Consolas",
    size: 12pt,
    fill: rgb("#F2F1EA"),
    weight: "regular",
  )[10 / 10]]])
])
