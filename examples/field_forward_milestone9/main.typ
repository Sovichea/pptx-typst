#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)
// FIELD / FORWARD is an illustrative presentation concept, not a claim of measured results.

#let FieldMaster = PptxMaster(children: [])
#let LightLayout = PptxLayout(master: FieldMaster, children: [])
#let DarkLayout = PptxLayout(master: FieldMaster, children: [])

// 01 / The next field is connected
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#0A211D"), layout: DarkLayout, children: [
    #PptxPlace(x: 638pt, y: 0pt, child: PptxRect(width: 322pt, height: 540pt, fill: rgb("#143B34"), stroke: none))
    #PptxPlace(x: 682pt, y: 126pt, orientation: -16deg, child: PptxRect(width: 234pt, height: 74pt, fill: rgb("#1A5444"), stroke: none, radius: 9pt))
    #PptxPlace(x: 704pt, y: 193pt, orientation: -16deg, child: PptxRect(width: 208pt, height: 68pt, fill: rgb("#347A60"), stroke: none, radius: 9pt))
    #PptxPlace(x: 681pt, y: 267pt, orientation: -16deg, child: PptxRect(width: 245pt, height: 66pt, fill: rgb("#1A5444"), stroke: none, radius: 9pt))
    #PptxPlace(x: 728pt, y: 333pt, orientation: -16deg, child: PptxRect(width: 205pt, height: 72pt, fill: rgb("#347A60"), stroke: none, radius: 9pt))
    #PptxPlace(x: 649pt, y: 129pt, child: PptxEllipse(width: 276pt, height: 276pt, fill: none, stroke: 1.7pt + rgb("#9FB3A7")))
    #PptxPlace(x: 686pt, y: 166pt, child: PptxEllipse(width: 202pt, height: 202pt, fill: none, stroke: 1.7pt + rgb("#69A88D")))
    #PptxPlace(x: 722pt, y: 202pt, child: PptxEllipse(width: 130pt, height: 130pt, fill: none, stroke: 1.7pt + rgb("#D6EF8D")))
    #PptxPlace(x: 777pt, y: 257pt, child: PptxEllipse(width: 20pt, height: 20pt, fill: rgb("#D6EF8D"), stroke: none))
    #PptxPlace(x: 769pt, y: 249pt, child: PptxEllipse(width: 36pt, height: 36pt, fill: none, stroke: 2pt + rgb("#D6EF8D")))
    #PptxPlace(x: 52pt, y: 43pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none, radius: 2pt))
    #PptxPlace(x: 72pt, y: 38pt, child: PptxBox(width: 344pt, height: 30pt)[
      #PptxText(font: "Inter", size: 17pt, fill: rgb("#FCFCF7"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 54pt, y: 123pt, child: PptxBox(width: 520pt, height: 24pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#D6EF8D"), weight: "bold")[A CONNECTED AGRICULTURE DESIGN STUDY]
    ])
    #PptxPlace(x: 52pt, y: 179pt, child: PptxBox(width: 582pt, height: 88pt)[
      #PptxText(font: "Inter Display", size: 64pt, fill: rgb("#FCFCF7"), weight: "bold")[The next field]
    ])
    #PptxPlace(x: 52pt, y: 259pt, child: PptxBox(width: 570pt, height: 90pt)[
      #PptxText(font: "Inter Display", size: 64pt, fill: rgb("#FCFCF7"), weight: "bold")[is connected.]
    ])
    #PptxPlace(x: 55pt, y: 377pt, child: PptxRect(width: 60pt, height: 5pt, fill: rgb("#F0A36D"), stroke: none, radius: 1pt))
    #PptxPlace(x: 53pt, y: 407pt, child: PptxBox(width: 520pt, height: 72pt)[
      #PptxText(font: "Inter", size: 24pt, fill: rgb("#E9EDE1"), weight: "regular")[Where sensors, software and robotics work as one useful system.]
    ])
    #PptxPlace(x: 53pt, y: 506pt, child: PptxBox(width: 530pt, height: 22pt)[
      #PptxText(font: "Inter", size: 12pt, fill: rgb("#9FB3A7"), weight: "bold")[CONCEPT PRESENTATION   /   OCTOBER 2026]
    ])
    #PptxPlace(x: 834pt, y: 506pt, child: PptxBox(width: 90pt, height: 22pt)[
      #PptxText(font: "Inter", size: 12pt, fill: rgb("#D6EF8D"), weight: "bold")[01 / 08]
    ])
])
#pagebreak()

// 02 / Agriculture is a systems problem
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#F7F6EE"), layout: LightLayout, children: [
    #PptxPlace(x: 50pt, y: 40pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#347A60"), stroke: none, radius: 2pt))
    #PptxPlace(x: 69pt, y: 35pt, child: PptxBox(width: 335pt, height: 28pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#0A211D"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 804pt, y: 39pt, child: PptxBox(width: 110pt, height: 24pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#62766C"), weight: "bold")[02  /  08]
    ])
    #PptxPlace(x: 52pt, y: 85pt, child: PptxBox(width: 660pt, height: 28pt)[
      #PptxText(font: "Inter", size: 14pt, fill: rgb("#347A60"), weight: "bold")[01  /  THE OPPORTUNITY]
    ])
    #PptxPlace(x: 52pt, y: 127pt, child: PptxBox(width: 890pt, height: 63pt)[
      #PptxText(font: "Inter Display", size: 43pt, fill: rgb("#0A211D"), weight: "bold")[Agriculture is a systems problem.]
    ])
    #PptxPlace(x: 54pt, y: 204pt, child: PptxBox(width: 819pt, height: 38pt)[
      #PptxText(font: "Inter", size: 22pt, fill: rgb("#62766C"), weight: "regular")[Better outcomes begin when information and action connect.]
    ])
    #PptxPlace(x: 52pt, y: 294pt, child: PptxRect(width: 268pt, height: 164pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 14pt))
    #PptxPlace(x: 70pt, y: 312pt, child: PptxRect(width: 45pt, height: 5pt, fill: rgb("#347A60"), stroke: none, radius: 1pt))
    #PptxPlace(x: 70pt, y: 330pt, child: PptxBox(width: 75pt, height: 56pt)[
      #PptxText(font: "Inter Display", size: 35pt, fill: rgb("#347A60"), weight: "bold")[01]
    ])
    #PptxPlace(x: 148pt, y: 338pt, child: PptxBox(width: 161pt, height: 35pt)[
      #PptxText(font: "Inter", size: 24pt, fill: rgb("#0A211D"), weight: "bold")[SENSE]
    ])
    #PptxPlace(x: 71pt, y: 393pt, child: PptxBox(width: 238pt, height: 57pt)[
      #PptxText(font: "Inter", size: 19pt, fill: rgb("#62766C"), weight: "regular")[Make conditions visible.]
    ])
    #PptxPlace(x: 346pt, y: 294pt, child: PptxRect(width: 268pt, height: 164pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 14pt))
    #PptxPlace(x: 364pt, y: 312pt, child: PptxRect(width: 45pt, height: 5pt, fill: rgb("#1A5444"), stroke: none, radius: 1pt))
    #PptxPlace(x: 364pt, y: 330pt, child: PptxBox(width: 75pt, height: 56pt)[
      #PptxText(font: "Inter Display", size: 35pt, fill: rgb("#1A5444"), weight: "bold")[02]
    ])
    #PptxPlace(x: 442pt, y: 338pt, child: PptxBox(width: 161pt, height: 35pt)[
      #PptxText(font: "Inter", size: 24pt, fill: rgb("#0A211D"), weight: "bold")[DECIDE]
    ])
    #PptxPlace(x: 365pt, y: 393pt, child: PptxBox(width: 238pt, height: 57pt)[
      #PptxText(font: "Inter", size: 19pt, fill: rgb("#62766C"), weight: "regular")[Turn signals into priorities.]
    ])
    #PptxPlace(x: 640pt, y: 294pt, child: PptxRect(width: 268pt, height: 164pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 14pt))
    #PptxPlace(x: 658pt, y: 312pt, child: PptxRect(width: 45pt, height: 5pt, fill: rgb("#F0A36D"), stroke: none, radius: 1pt))
    #PptxPlace(x: 658pt, y: 330pt, child: PptxBox(width: 75pt, height: 56pt)[
      #PptxText(font: "Inter Display", size: 35pt, fill: rgb("#F0A36D"), weight: "bold")[03]
    ])
    #PptxPlace(x: 736pt, y: 338pt, child: PptxBox(width: 161pt, height: 35pt)[
      #PptxText(font: "Inter", size: 24pt, fill: rgb("#0A211D"), weight: "bold")[RESPOND]
    ])
    #PptxPlace(x: 659pt, y: 393pt, child: PptxBox(width: 238pt, height: 57pt)[
      #PptxText(font: "Inter", size: 19pt, fill: rgb("#62766C"), weight: "regular")[Act where it matters.]
    ])
    #PptxPlace(x: 52pt, y: 505pt, child: PptxLine(start: (0pt, 0pt), end: (856pt, 0pt), stroke: 1pt + rgb("#CCD7CC")))
    #PptxPlace(x: 52pt, y: 510pt, child: PptxBox(width: 500pt, height: 19pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[DESIGN STUDY  /  CONNECTED AGRICULTURE]
    ])
    #PptxPlace(x: 828pt, y: 510pt, child: PptxBox(width: 83pt, height: 18pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[2026]
    ])
])
#pagebreak()

// 03 / See the invisible
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#0A211D"), layout: DarkLayout, children: [
    #PptxPlace(x: 50pt, y: 40pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none, radius: 2pt))
    #PptxPlace(x: 69pt, y: 35pt, child: PptxBox(width: 335pt, height: 28pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#FCFCF7"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 804pt, y: 39pt, child: PptxBox(width: 110pt, height: 24pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#9FB3A7"), weight: "bold")[03  /  08]
    ])
    #PptxPlace(x: 52pt, y: 85pt, child: PptxBox(width: 660pt, height: 28pt)[
      #PptxText(font: "Inter", size: 14pt, fill: rgb("#D6EF8D"), weight: "bold")[02  /  THE INTERFACE]
    ])
    #PptxPlace(x: 52pt, y: 137pt, child: PptxBox(width: 470pt, height: 59pt)[
      #PptxText(font: "Inter Display", size: 52pt, fill: rgb("#FCFCF7"), weight: "bold")[See the]
    ])
    #PptxPlace(x: 52pt, y: 197pt, child: PptxBox(width: 480pt, height: 74pt)[
      #PptxText(font: "Inter Display", size: 60pt, fill: rgb("#D6EF8D"), weight: "bold")[invisible.]
    ])
    #PptxPlace(x: 54pt, y: 310pt, child: PptxBox(width: 438pt, height: 104pt)[
      #PptxText(font: "Inter", size: 24pt, fill: rgb("#E9EDE1"), weight: "regular")[Water. Soil. Movement. The field tells a story when its signals are connected.]
    ])
    #PptxPlace(x: 526pt, y: 90pt, child: PptxRect(width: 385pt, height: 380pt, fill: rgb("#143B34"), stroke: none, radius: 16pt))
    #PptxPlace(x: 548pt, y: 111pt, child: PptxRect(width: 340pt, height: 336pt, fill: rgb("#1A5444"), stroke: none, radius: 10pt))
    #PptxPlace(x: 570pt, y: 128pt, child: PptxRect(width: 58pt, height: 302pt, fill: rgb("#347A60"), stroke: none, radius: 9pt))
    #PptxPlace(x: 577pt, y: 151pt, child: PptxRect(width: 44pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 577pt, y: 208pt, child: PptxRect(width: 44pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 577pt, y: 265pt, child: PptxRect(width: 44pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 577pt, y: 322pt, child: PptxRect(width: 44pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 577pt, y: 379pt, child: PptxRect(width: 44pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 631pt, y: 128pt, child: PptxRect(width: 52pt, height: 302pt, fill: rgb("#69A88D"), stroke: none, radius: 9pt))
    #PptxPlace(x: 638pt, y: 151pt, child: PptxRect(width: 38pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 638pt, y: 208pt, child: PptxRect(width: 38pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 638pt, y: 265pt, child: PptxRect(width: 38pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 638pt, y: 322pt, child: PptxRect(width: 38pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 638pt, y: 379pt, child: PptxRect(width: 38pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 692pt, y: 128pt, child: PptxRect(width: 64pt, height: 302pt, fill: rgb("#24463D"), stroke: none, radius: 9pt))
    #PptxPlace(x: 699pt, y: 151pt, child: PptxRect(width: 50pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 699pt, y: 208pt, child: PptxRect(width: 50pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 699pt, y: 265pt, child: PptxRect(width: 50pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 699pt, y: 322pt, child: PptxRect(width: 50pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 699pt, y: 379pt, child: PptxRect(width: 50pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 753pt, y: 128pt, child: PptxRect(width: 50pt, height: 302pt, fill: rgb("#347A60"), stroke: none, radius: 9pt))
    #PptxPlace(x: 760pt, y: 151pt, child: PptxRect(width: 36pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 760pt, y: 208pt, child: PptxRect(width: 36pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 760pt, y: 265pt, child: PptxRect(width: 36pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 760pt, y: 322pt, child: PptxRect(width: 36pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 760pt, y: 379pt, child: PptxRect(width: 36pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 814pt, y: 128pt, child: PptxRect(width: 46pt, height: 302pt, fill: rgb("#69A88D"), stroke: none, radius: 9pt))
    #PptxPlace(x: 821pt, y: 151pt, child: PptxRect(width: 32pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 821pt, y: 208pt, child: PptxRect(width: 32pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 821pt, y: 265pt, child: PptxRect(width: 32pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 821pt, y: 322pt, child: PptxRect(width: 32pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 821pt, y: 379pt, child: PptxRect(width: 32pt, height: 2pt, fill: rgb("#BDD4B6"), stroke: none))
    #PptxPlace(x: 622pt, y: 190pt, child: PptxEllipse(width: 44pt, height: 44pt, fill: none, stroke: 2pt + rgb("#D6EF8D")))
    #PptxPlace(x: 639pt, y: 207pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none))
    #PptxPlace(x: 764pt, y: 308pt, child: PptxEllipse(width: 44pt, height: 44pt, fill: none, stroke: 2pt + rgb("#D6EF8D")))
    #PptxPlace(x: 781pt, y: 325pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none))
    #PptxPlace(x: 709pt, y: 143pt, child: PptxEllipse(width: 44pt, height: 44pt, fill: none, stroke: 2pt + rgb("#D6EF8D")))
    #PptxPlace(x: 726pt, y: 160pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none))
    #PptxPlace(x: 536pt, y: 374pt, child: PptxRect(width: 234pt, height: 65pt, fill: rgb("#F7F6EE"), stroke: none, radius: 9pt))
    #PptxPlace(x: 549pt, y: 389pt, child: PptxBox(width: 214pt, height: 23pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#347A60"), weight: "bold")[FIELD VISIBILITY]
    ])
    #PptxPlace(x: 549pt, y: 412pt, child: PptxBox(width: 212pt, height: 21pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#0A211D"), weight: "regular")[Concept illustration]
    ])
    #PptxPlace(x: 52pt, y: 505pt, child: PptxLine(start: (0pt, 0pt), end: (856pt, 0pt), stroke: 1pt + rgb("#143B34")))
    #PptxPlace(x: 52pt, y: 510pt, child: PptxBox(width: 500pt, height: 19pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#9FB3A7"), weight: "regular")[DESIGN STUDY  /  CONNECTED AGRICULTURE]
    ])
    #PptxPlace(x: 828pt, y: 510pt, child: PptxBox(width: 83pt, height: 18pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#9FB3A7"), weight: "regular")[2026]
    ])
])
#pagebreak()

// 04 / From observation to action
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#F7F6EE"), layout: LightLayout, children: [
    #PptxPlace(x: 50pt, y: 40pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#347A60"), stroke: none, radius: 2pt))
    #PptxPlace(x: 69pt, y: 35pt, child: PptxBox(width: 335pt, height: 28pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#0A211D"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 804pt, y: 39pt, child: PptxBox(width: 110pt, height: 24pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#62766C"), weight: "bold")[04  /  08]
    ])
    #PptxPlace(x: 52pt, y: 85pt, child: PptxBox(width: 660pt, height: 28pt)[
      #PptxText(font: "Inter", size: 14pt, fill: rgb("#347A60"), weight: "bold")[03  /  HOW IT WORKS]
    ])
    #PptxPlace(x: 52pt, y: 126pt, child: PptxBox(width: 845pt, height: 66pt)[
      #PptxText(font: "Inter Display", size: 43pt, fill: rgb("#0A211D"), weight: "bold")[From observation to action.]
    ])
    #PptxPlace(x: 53pt, y: 200pt, child: PptxBox(width: 853pt, height: 38pt)[
      #PptxText(font: "Inter", size: 22pt, fill: rgb("#62766C"), weight: "regular")[Three connected layers. One clearer workflow.]
    ])
    // component: s4-observe-card
    #PptxPlace(x: 52pt, y: 278pt,
      child: PptxRect(width: 260pt, height: 183pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 15pt),
    )
    #PptxPlace(x: 52pt, y: 278pt,
      child: PptxTextFrame(
        width: 260pt,
        height: 183pt,
        font: "Inter",
        size: 18pt,
        fill: rgb("#62766C"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 14pt,
        margin-top: 82pt,
        margin-bottom: 10pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "OBSERVE",
                font: "Inter",
                size: 25pt,
                fill: rgb("#0A211D"),
                weight: "bold",
              ),
            ),
            after: 20.8pt,
          ),
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Sensors and devices capture field conditions.",
                font: "Inter",
                size: 18pt,
                fill: rgb("#62766C"),
                weight: "regular",
              ),
            ),
            target-pitch: 24.8pt,
          ),
        ),
      ),
    )

    // component: s4-observe-badge
    #PptxPlace(x: 67pt, y: 294pt,
      child: PptxRect(width: 48pt, height: 48pt, fill: rgb("#347A60"), stroke: none, radius: 10pt),
    )
    #PptxPlace(x: 67pt, y: 294pt,
      child: PptxTextFrame(
        width: 48pt,
        height: 48pt,
        font: "Inter",
        size: 24pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "01",
                font: "Inter",
                size: 24pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s4-interpret-card
    #PptxPlace(x: 350pt, y: 278pt,
      child: PptxRect(width: 260pt, height: 183pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 15pt),
    )
    #PptxPlace(x: 350pt, y: 278pt,
      child: PptxTextFrame(
        width: 260pt,
        height: 183pt,
        font: "Inter",
        size: 18pt,
        fill: rgb("#62766C"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 14pt,
        margin-top: 82pt,
        margin-bottom: 10pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "INTERPRET",
                font: "Inter",
                size: 25pt,
                fill: rgb("#0A211D"),
                weight: "bold",
              ),
            ),
            after: 20.8pt,
          ),
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Software turns raw readings into decisions.",
                font: "Inter",
                size: 18pt,
                fill: rgb("#62766C"),
                weight: "regular",
              ),
            ),
            target-pitch: 24.8pt,
          ),
        ),
      ),
    )

    // component: s4-interpret-badge
    #PptxPlace(x: 365pt, y: 294pt,
      child: PptxRect(width: 48pt, height: 48pt, fill: rgb("#1A5444"), stroke: none, radius: 10pt),
    )
    #PptxPlace(x: 365pt, y: 294pt,
      child: PptxTextFrame(
        width: 48pt,
        height: 48pt,
        font: "Inter",
        size: 24pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "02",
                font: "Inter",
                size: 24pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s4-act-card
    #PptxPlace(x: 648pt, y: 278pt,
      child: PptxRect(width: 260pt, height: 183pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 15pt),
    )
    #PptxPlace(x: 648pt, y: 278pt,
      child: PptxTextFrame(
        width: 260pt,
        height: 183pt,
        font: "Inter",
        size: 18pt,
        fill: rgb("#62766C"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 14pt,
        margin-top: 82pt,
        margin-bottom: 10pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "ACT",
                font: "Inter",
                size: 25pt,
                fill: rgb("#0A211D"),
                weight: "bold",
              ),
            ),
            after: 20.8pt,
          ),
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "People and machines complete the task.",
                font: "Inter",
                size: 18pt,
                fill: rgb("#62766C"),
                weight: "regular",
              ),
            ),
            target-pitch: 24.8pt,
          ),
        ),
      ),
    )

    // component: s4-act-badge
    #PptxPlace(x: 663pt, y: 294pt,
      child: PptxRect(width: 48pt, height: 48pt, fill: rgb("#F0A36D"), stroke: none, radius: 10pt),
    )
    #PptxPlace(x: 663pt, y: 294pt,
      child: PptxTextFrame(
        width: 48pt,
        height: 48pt,
        font: "Inter",
        size: 24pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "03",
                font: "Inter",
                size: 24pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    #PptxPlace(x: 316pt, y: 371pt, child: PptxLine(start: (0pt, 0pt), end: (28pt, 0pt), stroke: 3pt + rgb("#69A88D")))
    #PptxPlace(x: 333pt, y: 366pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: rgb("#69A88D"), stroke: none))
    #PptxPlace(x: 614pt, y: 371pt, child: PptxLine(start: (0pt, 0pt), end: (28pt, 0pt), stroke: 3pt + rgb("#69A88D")))
    #PptxPlace(x: 631pt, y: 366pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: rgb("#69A88D"), stroke: none))
    #PptxPlace(x: 52pt, y: 505pt, child: PptxLine(start: (0pt, 0pt), end: (856pt, 0pt), stroke: 1pt + rgb("#CCD7CC")))
    #PptxPlace(x: 52pt, y: 510pt, child: PptxBox(width: 500pt, height: 19pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[DESIGN STUDY  /  CONNECTED AGRICULTURE]
    ])
    #PptxPlace(x: 828pt, y: 510pt, child: PptxBox(width: 83pt, height: 18pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[2026]
    ])
])
#pagebreak()

// 05 / Clarity in one operating view
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#E9EDE1"), layout: LightLayout, children: [
    #PptxPlace(x: 50pt, y: 40pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#347A60"), stroke: none, radius: 2pt))
    #PptxPlace(x: 69pt, y: 35pt, child: PptxBox(width: 335pt, height: 28pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#0A211D"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 804pt, y: 39pt, child: PptxBox(width: 110pt, height: 24pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#62766C"), weight: "bold")[05  /  08]
    ])
    #PptxPlace(x: 52pt, y: 85pt, child: PptxBox(width: 660pt, height: 28pt)[
      #PptxText(font: "Inter", size: 14pt, fill: rgb("#347A60"), weight: "bold")[04  /  OPERATIONAL CLARITY]
    ])
    #PptxPlace(x: 52pt, y: 146pt, child: PptxBox(width: 342pt, height: 65pt)[
      #PptxText(font: "Inter Display", size: 42pt, fill: rgb("#0A211D"), weight: "bold")[A control room]
    ])
    #PptxPlace(x: 52pt, y: 204pt, child: PptxBox(width: 350pt, height: 65pt)[
      #PptxText(font: "Inter Display", size: 42pt, fill: rgb("#0A211D"), weight: "bold")[for every field.]
    ])
    #PptxPlace(x: 54pt, y: 303pt, child: PptxRect(width: 50pt, height: 5pt, fill: rgb("#F0A36D"), stroke: none, radius: 1pt))
    #PptxPlace(x: 52pt, y: 338pt, child: PptxBox(width: 325pt, height: 109pt)[
      #PptxText(font: "Inter", size: 23pt, fill: rgb("#62766C"), weight: "regular")[A single place to see priorities, organize work and keep humans in control.]
    ])
    #PptxPlace(x: 418pt, y: 112pt, child: PptxRect(width: 490pt, height: 359pt, fill: rgb("#0A211D"), stroke: none, radius: 17pt))
    #PptxPlace(x: 434pt, y: 128pt, child: PptxRect(width: 458pt, height: 43pt, fill: rgb("#143B34"), stroke: none, radius: 9pt))
    #PptxPlace(x: 452pt, y: 145pt, child: PptxEllipse(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none))
    // component: s5-field-operations-header
    #PptxPlace(x: 434pt, y: 128pt,
      child: PptxTextFrame(
        width: 458pt,
        height: 43pt,
        font: "Inter",
        size: 16pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 40pt,
        margin-right: 36pt,
        margin-top: 9pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "FIELD OPERATIONS",
                font: "Inter",
                size: 16pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    // component: s5-live-status
    #PptxPlace(x: 434pt, y: 128pt,
      child: PptxTextFrame(
        width: 458pt,
        height: 43pt,
        font: "Inter",
        size: 12pt,
        fill: rgb("#D6EF8D"),
        weight: "bold",
        anchor: "center",
        default-align: "right",
        margin-left: 0pt,
        margin-right: 36pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "right",
            runs: (
              PptxPlaceholderRun(
                text: "LIVE",
                font: "Inter",
                size: 12pt,
                fill: rgb("#D6EF8D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    #PptxPlace(x: 437pt, y: 186pt, child: PptxRect(width: 282pt, height: 253pt, fill: rgb("#143B34"), stroke: none, radius: 12pt))
    #PptxPlace(x: 732pt, y: 186pt, child: PptxRect(width: 157pt, height: 117pt, fill: rgb("#1A5444"), stroke: none, radius: 11pt))
    #PptxPlace(x: 732pt, y: 315pt, child: PptxRect(width: 157pt, height: 124pt, fill: rgb("#1A5444"), stroke: none, radius: 11pt))
    // component: s5-soil-moisture-label
    #PptxPlace(x: 437pt, y: 186pt,
      child: PptxTextFrame(
        width: 282pt,
        height: 253pt,
        font: "Inter",
        size: 17pt,
        fill: rgb("#E9EDE1"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 13pt,
        margin-right: 17pt,
        margin-top: 14pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Soil moisture",
                font: "Inter",
                size: 17pt,
                fill: rgb("#E9EDE1"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    // component: s5-irrigation-label
    #PptxPlace(x: 732pt, y: 186pt,
      child: PptxTextFrame(
        width: 157pt,
        height: 117pt,
        font: "Inter",
        size: 12pt,
        fill: rgb("#9FB3A7"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 8pt,
        margin-top: 16pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "IRRIGATION",
                font: "Inter",
                size: 12pt,
                fill: rgb("#9FB3A7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    // component: s5-review-status
    #PptxPlace(x: 732pt, y: 186pt,
      child: PptxTextFrame(
        width: 157pt,
        height: 117pt,
        font: "Inter",
        size: 22pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 8pt,
        margin-top: 43pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Review",
                font: "Inter",
                size: 22pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    // component: s5-greenhouse-label
    #PptxPlace(x: 732pt, y: 315pt,
      child: PptxTextFrame(
        width: 157pt,
        height: 124pt,
        font: "Inter",
        size: 12pt,
        fill: rgb("#9FB3A7"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 8pt,
        margin-top: 15pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "GREENHOUSE",
                font: "Inter",
                size: 12pt,
                fill: rgb("#9FB3A7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    // component: s5-stable-status
    #PptxPlace(x: 732pt, y: 315pt,
      child: PptxTextFrame(
        width: 157pt,
        height: 124pt,
        font: "Inter",
        size: 22pt,
        fill: rgb("#D6EF8D"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 16pt,
        margin-right: 8pt,
        margin-top: 43pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Stable",
                font: "Inter",
                size: 22pt,
                fill: rgb("#D6EF8D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    #PptxPlace(x: 451pt, y: 377pt, child: PptxRect(width: 12pt, height: 48pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 471pt, y: 359pt, child: PptxRect(width: 12pt, height: 66pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 491pt, y: 365pt, child: PptxRect(width: 12pt, height: 60pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 511pt, y: 331pt, child: PptxRect(width: 12pt, height: 94pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 531pt, y: 348pt, child: PptxRect(width: 12pt, height: 77pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 551pt, y: 324pt, child: PptxRect(width: 12pt, height: 101pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 571pt, y: 311pt, child: PptxRect(width: 12pt, height: 114pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 591pt, y: 337pt, child: PptxRect(width: 12pt, height: 88pt, fill: rgb("#69A88D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 611pt, y: 303pt, child: PptxRect(width: 12pt, height: 122pt, fill: rgb("#D6EF8D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 631pt, y: 298pt, child: PptxRect(width: 12pt, height: 127pt, fill: rgb("#D6EF8D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 651pt, y: 321pt, child: PptxRect(width: 12pt, height: 104pt, fill: rgb("#D6EF8D"), stroke: none, radius: 3pt))
    #PptxPlace(x: 671pt, y: 288pt, child: PptxRect(width: 12pt, height: 137pt, fill: rgb("#D6EF8D"), stroke: none, radius: 3pt))
    // component: s5-illustrative-data-note
    #PptxPlace(x: 418pt, y: 112pt,
      child: PptxTextFrame(
        width: 490pt,
        height: 359pt,
        font: "Inter",
        size: 10pt,
        fill: rgb("#9FB3A7"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 33pt,
        margin-right: 202pt,
        margin-top: 334pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "ILLUSTRATIVE INTERFACE  /  NOT LIVE DATA",
                font: "Inter",
                size: 10pt,
                fill: rgb("#9FB3A7"),
                weight: "regular",
              ),
            ),
          ),
        ),
      ),
    )
    #PptxPlace(x: 52pt, y: 505pt, child: PptxLine(start: (0pt, 0pt), end: (856pt, 0pt), stroke: 1pt + rgb("#CCD7CC")))
    #PptxPlace(x: 52pt, y: 510pt, child: PptxBox(width: 500pt, height: 19pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[DESIGN STUDY  /  CONNECTED AGRICULTURE]
    ])
    #PptxPlace(x: 828pt, y: 510pt, child: PptxBox(width: 83pt, height: 18pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[2026]
    ])
])
#pagebreak()

// 06 / Share the capability
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#0A211D"), layout: DarkLayout, children: [
    #PptxPlace(x: 50pt, y: 40pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none, radius: 2pt))
    #PptxPlace(x: 69pt, y: 35pt, child: PptxBox(width: 335pt, height: 28pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#FCFCF7"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 804pt, y: 39pt, child: PptxBox(width: 110pt, height: 24pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#9FB3A7"), weight: "bold")[06  /  08]
    ])
    #PptxPlace(x: 52pt, y: 85pt, child: PptxBox(width: 660pt, height: 28pt)[
      #PptxText(font: "Inter", size: 14pt, fill: rgb("#D6EF8D"), weight: "bold")[05  /  PRACTICAL DEPLOYMENT]
    ])
    #PptxPlace(x: 52pt, y: 145pt, child: PptxBox(width: 480pt, height: 65pt)[
      #PptxText(font: "Inter Display", size: 42pt, fill: rgb("#FCFCF7"), weight: "bold")[Technology should]
    ])
    #PptxPlace(x: 52pt, y: 203pt, child: PptxBox(width: 470pt, height: 65pt)[
      #PptxText(font: "Inter Display", size: 42pt, fill: rgb("#D6EF8D"), weight: "bold")[fit the farmer.]
    ])
    #PptxPlace(x: 54pt, y: 311pt, child: PptxBox(width: 410pt, height: 112pt)[
      #PptxText(font: "Inter", size: 22pt, fill: rgb("#E9EDE1"), weight: "regular")[Cooperatives can make advanced tools useful across many farms without expecting every farmer to buy a robot.]
    ])
    #PptxPlace(x: 733pt, y: 123pt, child: PptxLine(start: (2pt, 159pt), end: (0pt, 0pt), stroke: 2pt + rgb("#69A88D")))
    #PptxPlace(x: 735pt, y: 204pt, child: PptxLine(start: (0pt, 78pt), end: (142pt, 0pt), stroke: 2pt + rgb("#69A88D")))
    #PptxPlace(x: 735pt, y: 282pt, child: PptxLine(start: (0pt, 0pt), end: (135pt, 101pt), stroke: 2pt + rgb("#69A88D")))
    #PptxPlace(x: 618pt, y: 282pt, child: PptxLine(start: (117pt, 0pt), end: (0pt, 113pt), stroke: 2pt + rgb("#69A88D")))
    #PptxPlace(x: 587pt, y: 223pt, child: PptxLine(start: (148pt, 59pt), end: (0pt, 0pt), stroke: 2pt + rgb("#69A88D")))
    #PptxPlace(x: 657pt, y: 204pt, child: PptxEllipse(width: 156pt, height: 156pt, fill: rgb("#D6EF8D"), stroke: none))
    // component: s6-coop-hub
    #PptxPlace(x: 666pt, y: 213pt,
      child: PptxEllipse(width: 138pt, height: 138pt, fill: rgb("#143B34"), stroke: none),
    )
    #PptxPlace(x: 666pt, y: 213pt,
      child: PptxTextFrame(
        width: 138pt,
        height: 138pt,
        font: "Inter",
        size: 14pt,
        fill: rgb("#D6EF8D"),
        weight: "regular",
        anchor: "top",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 48.31pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "CO-OP",
                font: "Inter Display",
                size: 28pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s6-shared-hub-label
    #PptxPlace(x: 666pt, y: 213pt,
      child: PptxTextFrame(
        width: 138pt,
        height: 138pt,
        font: "Inter",
        size: 14pt,
        fill: rgb("#D6EF8D"),
        weight: "bold",
        anchor: "top",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 89.91pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "SHARED HUB",
                font: "Inter",
                size: 14pt,
                fill: rgb("#D6EF8D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s6-software-node
    #PptxPlace(x: 674pt, y: 100.5pt,
      child: PptxRect(width: 118pt, height: 45pt, fill: rgb("#1A5444"), stroke: 1pt + rgb("#69A88D"), radius: 10pt),
    )
    #PptxPlace(x: 674pt, y: 100.5pt,
      child: PptxTextFrame(
        width: 118pt,
        height: 45pt,
        font: "Inter",
        size: 13pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "SOFTWARE",
                font: "Inter",
                size: 13pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s6-service-node
    #PptxPlace(x: 818pt, y: 181.5pt,
      child: PptxRect(width: 118pt, height: 45pt, fill: rgb("#1A5444"), stroke: 1pt + rgb("#69A88D"), radius: 10pt),
    )
    #PptxPlace(x: 818pt, y: 181.5pt,
      child: PptxTextFrame(
        width: 118pt,
        height: 45pt,
        font: "Inter",
        size: 13pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "SERVICE",
                font: "Inter",
                size: 13pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s6-tools-node
    #PptxPlace(x: 811pt, y: 360.5pt,
      child: PptxRect(width: 118pt, height: 45pt, fill: rgb("#1A5444"), stroke: 1pt + rgb("#69A88D"), radius: 10pt),
    )
    #PptxPlace(x: 811pt, y: 360.5pt,
      child: PptxTextFrame(
        width: 118pt,
        height: 45pt,
        font: "Inter",
        size: 13pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "TOOLS",
                font: "Inter",
                size: 13pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s6-field-b-node
    #PptxPlace(x: 559pt, y: 372.5pt,
      child: PptxRect(width: 118pt, height: 45pt, fill: rgb("#1A5444"), stroke: 1pt + rgb("#69A88D"), radius: 10pt),
    )
    #PptxPlace(x: 559pt, y: 372.5pt,
      child: PptxTextFrame(
        width: 118pt,
        height: 45pt,
        font: "Inter",
        size: 13pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "FIELD B",
                font: "Inter",
                size: 13pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s6-field-a-node
    #PptxPlace(x: 528pt, y: 200.5pt,
      child: PptxRect(width: 118pt, height: 45pt, fill: rgb("#1A5444"), stroke: 1pt + rgb("#69A88D"), radius: 10pt),
    )
    #PptxPlace(x: 528pt, y: 200.5pt,
      child: PptxTextFrame(
        width: 118pt,
        height: 45pt,
        font: "Inter",
        size: 13pt,
        fill: rgb("#FCFCF7"),
        weight: "bold",
        anchor: "center",
        default-align: "center",
        margin-left: 0pt,
        margin-right: 0pt,
        margin-top: 0pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "center",
            runs: (
              PptxPlaceholderRun(
                text: "FIELD A",
                font: "Inter",
                size: 13pt,
                fill: rgb("#FCFCF7"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )
    #PptxPlace(x: 52pt, y: 505pt, child: PptxLine(start: (0pt, 0pt), end: (856pt, 0pt), stroke: 1pt + rgb("#143B34")))
    #PptxPlace(x: 52pt, y: 510pt, child: PptxBox(width: 500pt, height: 19pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#9FB3A7"), weight: "regular")[DESIGN STUDY  /  CONNECTED AGRICULTURE]
    ])
    #PptxPlace(x: 828pt, y: 510pt, child: PptxBox(width: 83pt, height: 18pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#9FB3A7"), weight: "regular")[2026]
    ])
])
#pagebreak()

// 07 / One platform, many entry points
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#F7F6EE"), layout: LightLayout, children: [
    #PptxPlace(x: 50pt, y: 40pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#347A60"), stroke: none, radius: 2pt))
    #PptxPlace(x: 69pt, y: 35pt, child: PptxBox(width: 335pt, height: 28pt)[
      #PptxText(font: "Inter", size: 15pt, fill: rgb("#0A211D"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 804pt, y: 39pt, child: PptxBox(width: 110pt, height: 24pt)[
      #PptxText(font: "Inter", size: 13pt, fill: rgb("#62766C"), weight: "bold")[07  /  08]
    ])
    #PptxPlace(x: 52pt, y: 85pt, child: PptxBox(width: 660pt, height: 28pt)[
      #PptxText(font: "Inter", size: 14pt, fill: rgb("#347A60"), weight: "bold")[06  /  ADOPTION PATHWAY]
    ])
    #PptxPlace(x: 52pt, y: 122pt, child: PptxBox(width: 855pt, height: 62pt)[
      #PptxText(font: "Inter Display", size: 42pt, fill: rgb("#0A211D"), weight: "bold")[One platform. Many entry points.]
    ])
    #PptxPlace(x: 54pt, y: 193pt, child: PptxBox(width: 855pt, height: 34pt)[
      #PptxText(font: "Inter", size: 21pt, fill: rgb("#62766C"), weight: "regular")[Start with a useful tool. Add complexity only when it pays off.]
    ])
    // component: s7-software-first-card
    #PptxPlace(x: 52pt, y: 276pt,
      child: PptxRect(width: 267pt, height: 193pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 16pt),
    )
    #PptxPlace(x: 52pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter Display",
        size: 43pt,
        fill: rgb("#347A60"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 12pt,
        margin-top: 32pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "01",
                font: "Inter Display",
                size: 43pt,
                fill: rgb("#347A60"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-software-first-title
    #PptxPlace(x: 52pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter",
        size: 19pt,
        fill: rgb("#0A211D"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 8pt,
        margin-top: 90pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "SOFTWARE FIRST",
                font: "Inter",
                size: 19pt,
                fill: rgb("#0A211D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-software-first-caption
    #PptxPlace(x: 52pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter",
        size: 18pt,
        fill: rgb("#62766C"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 8pt,
        margin-top: 157pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Visibility and workflows",
                font: "Inter",
                size: 18pt,
                fill: rgb("#62766C"),
                weight: "regular",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-automation-next-card
    #PptxPlace(x: 346pt, y: 276pt,
      child: PptxRect(width: 267pt, height: 193pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 16pt),
    )
    #PptxPlace(x: 346pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter Display",
        size: 43pt,
        fill: rgb("#1A5444"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 12pt,
        margin-top: 32pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "02",
                font: "Inter Display",
                size: 43pt,
                fill: rgb("#1A5444"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-automation-next-title
    #PptxPlace(x: 346pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter",
        size: 19pt,
        fill: rgb("#0A211D"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 8pt,
        margin-top: 90pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "AUTOMATION NEXT",
                font: "Inter",
                size: 19pt,
                fill: rgb("#0A211D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-automation-next-caption
    #PptxPlace(x: 346pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter",
        size: 18pt,
        fill: rgb("#62766C"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 8pt,
        margin-top: 157pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Sensors and controls",
                font: "Inter",
                size: 18pt,
                fill: rgb("#62766C"),
                weight: "regular",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-robotics-card
    #PptxPlace(x: 640pt, y: 276pt,
      child: PptxRect(width: 267pt, height: 193pt, fill: rgb("#FCFCF7"), stroke: 1pt + rgb("#CCD7CC"), radius: 16pt),
    )
    #PptxPlace(x: 640pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter Display",
        size: 43pt,
        fill: rgb("#F0A36D"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 12pt,
        margin-top: 32pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "03",
                font: "Inter Display",
                size: 43pt,
                fill: rgb("#F0A36D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-robotics-title
    #PptxPlace(x: 640pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter",
        size: 19pt,
        fill: rgb("#0A211D"),
        weight: "bold",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 8pt,
        margin-top: 90pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "ROBOTICS WHEN READY",
                font: "Inter",
                size: 19pt,
                fill: rgb("#0A211D"),
                weight: "bold",
              ),
            ),
          ),
        ),
      ),
    )

    // component: s7-robotics-caption
    #PptxPlace(x: 640pt, y: 276pt,
      child: PptxTextFrame(
        width: 267pt,
        height: 193pt,
        font: "Inter",
        size: 18pt,
        fill: rgb("#62766C"),
        weight: "regular",
        anchor: "top",
        default-align: "left",
        margin-left: 18pt,
        margin-right: 8pt,
        margin-top: 157pt,
        margin-bottom: 0pt,
        paragraphs: (
          PptxParagraph(
            align: "left",
            runs: (
              PptxPlaceholderRun(
                text: "Autonomous operations",
                font: "Inter",
                size: 18pt,
                fill: rgb("#62766C"),
                weight: "regular",
              ),
            ),
          ),
        ),
      ),
    )
    #PptxPlace(x: 52pt, y: 276pt, child: PptxRect(width: 267pt, height: 10pt, fill: rgb("#347A60"), stroke: none, radius: 5pt))
    #PptxPlace(x: 346pt, y: 276pt, child: PptxRect(width: 267pt, height: 10pt, fill: rgb("#1A5444"), stroke: none, radius: 5pt))
    #PptxPlace(x: 640pt, y: 276pt, child: PptxRect(width: 267pt, height: 10pt, fill: rgb("#F0A36D"), stroke: none, radius: 5pt))
    #PptxPlace(x: 52pt, y: 505pt, child: PptxLine(start: (0pt, 0pt), end: (856pt, 0pt), stroke: 1pt + rgb("#CCD7CC")))
    #PptxPlace(x: 52pt, y: 510pt, child: PptxBox(width: 500pt, height: 19pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[DESIGN STUDY  /  CONNECTED AGRICULTURE]
    ])
    #PptxPlace(x: 828pt, y: 510pt, child: PptxBox(width: 83pt, height: 18pt)[
      #PptxText(font: "Inter", size: 11pt, fill: rgb("#62766C"), weight: "regular")[2026]
    ])
])
#pagebreak()

// 08 / Build the next field
#PptxSlide(width: 960pt, height: 540pt, fill: rgb("#0A211D"), layout: DarkLayout, children: [
    #PptxPlace(x: 585pt, y: 0pt, child: PptxRect(width: 375pt, height: 540pt, fill: rgb("#143B34"), stroke: none))
    #PptxPlace(x: 635pt, y: 70pt, orientation: -14deg, child: PptxRect(width: 280pt, height: 54pt, fill: rgb("#1A5444"), stroke: none, radius: 16pt))
    #PptxPlace(x: 625pt, y: 144pt, orientation: -14deg, child: PptxRect(width: 304pt, height: 54pt, fill: rgb("#347A60"), stroke: none, radius: 16pt))
    #PptxPlace(x: 615pt, y: 222pt, orientation: -14deg, child: PptxRect(width: 295pt, height: 54pt, fill: rgb("#69A88D"), stroke: none, radius: 16pt))
    #PptxPlace(x: 605pt, y: 303pt, orientation: -14deg, child: PptxRect(width: 320pt, height: 54pt, fill: rgb("#1A5444"), stroke: none, radius: 16pt))
    #PptxPlace(x: 595pt, y: 387pt, orientation: -14deg, child: PptxRect(width: 320pt, height: 54pt, fill: rgb("#347A60"), stroke: none, radius: 16pt))
    #PptxPlace(x: 643pt, y: 159pt, child: PptxEllipse(width: 230pt, height: 230pt, fill: none, stroke: 1.8pt + rgb("#D6EF8D")))
    #PptxPlace(x: 682pt, y: 198pt, child: PptxEllipse(width: 152pt, height: 152pt, fill: none, stroke: 1.8pt + rgb("#BDD4B6")))
    #PptxPlace(x: 720pt, y: 236pt, child: PptxEllipse(width: 76pt, height: 76pt, fill: none, stroke: 1.8pt + rgb("#9FB3A7")))
    #PptxPlace(x: 52pt, y: 45pt, child: PptxRect(width: 10pt, height: 10pt, fill: rgb("#D6EF8D"), stroke: none, radius: 2pt))
    #PptxPlace(x: 72pt, y: 40pt, child: PptxBox(width: 340pt, height: 30pt)[
      #PptxText(font: "Inter", size: 17pt, fill: rgb("#FCFCF7"), weight: "bold")[FIELD / FORWARD]
    ])
    #PptxPlace(x: 52pt, y: 145pt, child: PptxBox(width: 580pt, height: 88pt)[
      #PptxText(font: "Inter Display", size: 60pt, fill: rgb("#FCFCF7"), weight: "bold")[The next field]
    ])
    #PptxPlace(x: 52pt, y: 228pt, child: PptxBox(width: 555pt, height: 93pt)[
      #PptxText(font: "Inter Display", size: 65pt, fill: rgb("#D6EF8D"), weight: "bold")[starts here.]
    ])
    #PptxPlace(x: 55pt, y: 358pt, child: PptxRect(width: 58pt, height: 5pt, fill: rgb("#F0A36D"), stroke: none, radius: 1pt))
    #PptxPlace(x: 54pt, y: 397pt, child: PptxBox(width: 530pt, height: 64pt)[
      #PptxText(font: "Inter", size: 24pt, fill: rgb("#E9EDE1"), weight: "regular")[Prototype thoughtfully. Learn in the field. Scale what works.]
    ])
    #PptxPlace(x: 55pt, y: 505pt, child: PptxBox(width: 550pt, height: 22pt)[
      #PptxText(font: "Inter", size: 12pt, fill: rgb("#9FB3A7"), weight: "bold")[A TYPOGRAPHICALLY EDITABLE TYPST + PPTX DESIGN STUDY]
    ])
    #PptxPlace(x: 833pt, y: 505pt, child: PptxBox(width: 100pt, height: 22pt)[
      #PptxText(font: "Inter", size: 12pt, fill: rgb("#D6EF8D"), weight: "bold")[08 / 08]
    ])
])

