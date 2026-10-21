#import "pptx-typst.typ": *

#set page(width: 960pt, height: 540pt, margin: 0pt)

// A reusable brand layer shared by all three layouts.
#let FieldNotes = PptxMaster(
  fill: rgb("#F4F0E6"),
  children: [
    #PptxPlace(
      x: 724pt,
      y: -62pt,
      child: PptxImage("assets/master-orbit.svg", width: 292pt, height: 292pt),
    )
    #PptxPlace(
      x: 48pt,
      y: 497pt,
      child: PptxRect(width: 864pt, height: 1.2pt, fill: rgb("#D5D8CC")),
    )
    #PptxPlace(
      x: 48pt,
      y: 510pt,
      child: PptxText(font: "Arial", size: 10pt, fill: rgb("#66736B"), weight: "bold")[FIELDNOTES  /  RESEARCH & DESIGN],
    )
  ],
)

// Layout 1: a quiet editorial cover with artwork concentrated to the right.
#let CoverLayout = PptxLayout(
  master: FieldNotes,
  children: [
    #PptxPlace(
      x: 574pt,
      y: 45pt,
      child: PptxImage("assets/cover-bloom.svg", width: 350pt, height: 420pt),
    )
    #PptxPlace(
      x: 48pt,
      y: 106pt,
      child: PptxRect(width: 62pt, height: 5pt, fill: rgb("#C66E4E")),
    )
  ],
)

// Layout 2: a split composition with translucent botanical line artwork.
#let StoryLayout = PptxLayout(
  master: FieldNotes,
  children: [
    #PptxPlace(
      x: 708pt,
      y: 0pt,
      child: PptxRect(width: 252pt, height: 497pt, fill: rgb("#253C38")),
    )
    #PptxPlace(
      x: 722pt,
      y: 70pt,
      child: PptxImage("assets/story-botanical.svg", width: 224pt, height: 350pt),
    )
    #PptxPlace(
      x: 48pt,
      y: 105pt,
      child: PptxRect(width: 62pt, height: 5pt, fill: rgb("#C66E4E")),
    )
  ],
)

// Layout 3: a dashboard-like evidence page with a low-contrast ring overlay.
#let InsightLayout = PptxLayout(
  master: FieldNotes,
  children: [
    #PptxPlace(
      x: 556pt,
      y: 248pt,
      child: PptxImage("assets/insight-rings.svg", width: 382pt, height: 230pt),
    )
    #PptxPlace(
      x: 48pt,
      y: 105pt,
      child: PptxRect(width: 62pt, height: 5pt, fill: rgb("#C66E4E")),
    )
  ],
)

// Slide 1 uses CoverLayout. The title and supporting text remain editable.
#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: CoverLayout,
  children: [
    #PptxPlace(
      x: 48pt,
      y: 64pt,
      child: PptxText(font: "Arial", size: 13pt, fill: rgb("#66736B"), weight: "bold")[A FIELD GUIDE  /  2026],
    )
    #PptxPlace(
      x: 48pt,
      y: 132pt,
      child: PptxBox(width: 500pt, height: 164pt)[
        #PptxText(font: "Arial", size: 44pt, fill: rgb("#253C38"), weight: "bold")[Systems for a more resilient future]
      ],
    )
    #PptxPlace(
      x: 48pt,
      y: 326pt,
      child: PptxBox(width: 430pt, height: 72pt)[
        #PptxText(font: "Arial", size: 20pt, fill: rgb("#66736B"))[Connecting research, people, and places to improve everyday care.]
      ],
    )
    #PptxPlace(
      x: 48pt,
      y: 443pt,
      child: PptxText(font: "Arial", size: 12pt, fill: rgb("#253C38"), weight: "bold")[AN ORIGINAL EDITABLE TYPST STARTER DECK],
    )
    #PptxPlace(
      x: 870pt,
      y: 510pt,
      child: PptxText(font: "Arial", size: 10pt, fill: rgb("#66736B"))[01  /  03],
    )
  ],
)

#pagebreak()

// Slide 2 uses StoryLayout, with the artwork panel inherited from the layout.
#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: StoryLayout,
  children: [
    #PptxPlace(
      x: 48pt,
      y: 62pt,
      child: PptxText(font: "Arial", size: 13pt, fill: rgb("#66736B"), weight: "bold")[01  /  DESIGN PRINCIPLE],
    )
    #PptxPlace(
      x: 48pt,
      y: 128pt,
      child: PptxBox(width: 610pt, height: 82pt)[
        #PptxText(font: "Arial", size: 34pt, fill: rgb("#253C38"), weight: "bold")[Care should flow around people]
      ],
    )
    #PptxPlace(
      x: 48pt,
      y: 232pt,
      child: PptxBox(width: 570pt, height: 68pt)[
        #PptxText(font: "Arial", size: 18pt, fill: rgb("#66736B"))[Shared systems work best when each handoff is clear, humane, and easy to navigate.]
      ],
    )
    #PptxPlace(x: 48pt, y: 337pt, child: PptxEllipse(width: 38pt, height: 38pt, fill: rgb("#C66E4E")))
    #PptxPlace(x: 100pt, y: 342pt, child: PptxText(font: "Arial", size: 17pt, fill: rgb("#253C38"), weight: "bold")[Listen])
    #PptxPlace(x: 226pt, y: 337pt, child: PptxEllipse(width: 38pt, height: 38pt, fill: rgb("#78927B")))
    #PptxPlace(x: 278pt, y: 342pt, child: PptxText(font: "Arial", size: 17pt, fill: rgb("#253C38"), weight: "bold")[Connect])
    #PptxPlace(x: 414pt, y: 337pt, child: PptxEllipse(width: 38pt, height: 38pt, fill: rgb("#D2A64A")))
    #PptxPlace(x: 466pt, y: 342pt, child: PptxText(font: "Arial", size: 17pt, fill: rgb("#253C38"), weight: "bold")[Improve])
    #PptxPlace(
      x: 730pt,
      y: 438pt,
      child: PptxText(font: "Arial", size: 11pt, fill: rgb("#F4F0E6"), weight: "bold")[PEOPLE FIRST  /  ALWAYS],
    )
    #PptxPlace(
      x: 870pt,
      y: 510pt,
      child: PptxText(font: "Arial", size: 10pt, fill: rgb("#66736B"))[02  /  03],
    )
  ],
)

#pagebreak()

// Slide 3 uses InsightLayout to show a reusable metrics-page treatment.
// The figures and quote below are illustrative placeholders for replacement.
#PptxSlide(
  width: 960pt,
  height: 540pt,
  layout: InsightLayout,
  children: [
    #PptxPlace(
      x: 48pt,
      y: 62pt,
      child: PptxText(font: "Arial", size: 13pt, fill: rgb("#66736B"), weight: "bold")[02  /  EARLY SIGNALS],
    )
    #PptxPlace(
      x: 48pt,
      y: 128pt,
      child: PptxBox(width: 820pt, height: 82pt)[
        #PptxText(font: "Arial", size: 34pt, fill: rgb("#253C38"), weight: "bold")[Small shifts, measurable change]
      ],
    )
    #PptxPlace(x: 48pt, y: 252pt, child: PptxText(font: "Arial", size: 38pt, fill: rgb("#C66E4E"), weight: "bold")[72%])
    #PptxPlace(x: 48pt, y: 304pt, child: PptxText(font: "Arial", size: 15pt, fill: rgb("#253C38"), weight: "bold")[of participants found a local care option])
    #PptxPlace(x: 48pt, y: 374pt, child: PptxText(font: "Arial", size: 38pt, fill: rgb("#78927B"), weight: "bold")[3.4×])
    #PptxPlace(x: 48pt, y: 426pt, child: PptxText(font: "Arial", size: 15pt, fill: rgb("#253C38"), weight: "bold")[more referrals completed with a warm handoff])
    #PptxPlace(
      x: 544pt,
      y: 256pt,
      child: PptxBox(width: 350pt, height: 110pt, fill: rgb("#FFFFFF"), stroke: 0.8pt + rgb("#D5D8CC"))[
        #PptxText(font: "Arial", size: 17pt, fill: rgb("#253C38"), weight: "bold")[“Clarity made the next step feel possible.”]
      ],
    )
    #PptxPlace(
      x: 870pt,
      y: 510pt,
      child: PptxText(font: "Arial", size: 10pt, fill: rgb("#66736B"))[03  /  03],
    )
  ],
)
