#import "pptx-typst.typ": *
#set page(width: 960pt, height: 540pt, margin: 0pt)

#let Identity = PptxMaster(fill: rgb("#F7F6F0"), children: [
  #PptxPlace(x: 56pt, y: 518pt,
    child: PptxRect(width: 848pt, height: 2pt, fill: rgb("#C9D4CE")))
])

#let Content = PptxLayout(master: Identity, children: [])

#PptxSlide(width: 960pt, height: 540pt, layout: Content, children: [
  #PptxPlace(x: 56pt, y: 42pt, child: PptxTextFrame(
    width: 848pt, height: 60pt, font: "Arial", size: 34pt,
    fill: rgb("#18372F"), weight: "bold", anchor: "center", default-align: "left",
    paragraphs: (PptxParagraph(align: "left", runs: (
      PptxPlaceholderRun(text: "Semantic components own alignment", font: "Arial",
        size: 34pt, fill: rgb("#18372F"), weight: "bold"),
    )),),
  ))

  // component: discover-card
  #PptxPlace(x: 56pt, y: 150pt,
    child: PptxRect(width: 266.667pt, height: 136pt, fill: rgb("#E9F1EC"), stroke: 1pt + rgb("#C9D4CE"), radius: 14pt),
  )
  #PptxPlace(x: 56pt, y: 150pt,
    child: PptxTextFrame(
      width: 266.667pt,
      height: 136pt,
      font: "Arial",
      size: 25pt,
      fill: rgb("#18372F"),
      weight: "bold",
      anchor: "center",
      default-align: "center",
      margin-left: 16pt,
      margin-right: 16pt,
      margin-top: 16pt,
      margin-bottom: 16pt,
      paragraphs: (
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "Discover",
              font: "Arial",
              size: 25pt,
              fill: rgb("#18372F"),
              weight: "bold",
            ),
          ),
        ),
      ),
    ),
  )
  // component: design-card
  #PptxPlace(x: 346.667pt, y: 150pt,
    child: PptxRect(width: 266.667pt, height: 136pt, fill: rgb("#D8E5DD"), stroke: 1pt + rgb("#C9D4CE"), radius: 14pt),
  )
  #PptxPlace(x: 346.667pt, y: 150pt,
    child: PptxTextFrame(
      width: 266.667pt,
      height: 136pt,
      font: "Arial",
      size: 25pt,
      fill: rgb("#18372F"),
      weight: "bold",
      anchor: "center",
      default-align: "center",
      margin-left: 16pt,
      margin-right: 16pt,
      margin-top: 16pt,
      margin-bottom: 16pt,
      paragraphs: (
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "Design",
              font: "Arial",
              size: 25pt,
              fill: rgb("#18372F"),
              weight: "bold",
            ),
          ),
        ),
      ),
    ),
  )
  // component: deliver-card
  #PptxPlace(x: 637.333pt, y: 150pt,
    child: PptxRect(width: 266.667pt, height: 136pt, fill: rgb("#18372F"), stroke: 1pt + rgb("#18372F"), radius: 14pt),
  )
  #PptxPlace(x: 637.333pt, y: 150pt,
    child: PptxTextFrame(
      width: 266.667pt,
      height: 136pt,
      font: "Arial",
      size: 25pt,
      fill: rgb("#FFFFFF"),
      weight: "bold",
      anchor: "center",
      default-align: "center",
      margin-left: 16pt,
      margin-right: 16pt,
      margin-top: 16pt,
      margin-bottom: 16pt,
      paragraphs: (
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "Deliver",
              font: "Arial",
              size: 25pt,
              fill: rgb("#FFFFFF"),
              weight: "bold",
            ),
          ),
        ),
      ),
    ),
  )
  // component: badge-01
  #PptxPlace(x: 56pt, y: 344pt,
    child: PptxEllipse(width: 112pt, height: 112pt, fill: rgb("#D97845"), stroke: none),
  )
  #PptxPlace(x: 56pt, y: 344pt,
    child: PptxTextFrame(
      width: 112pt,
      height: 112pt,
      font: "Arial",
      size: 28pt,
      fill: rgb("#FFFFFF"),
      weight: "bold",
      anchor: "center",
      default-align: "center",
      margin-left: 8pt,
      margin-right: 8pt,
      margin-top: 8pt,
      margin-bottom: 8pt,
      paragraphs: (
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "01",
              font: "Arial",
              size: 28pt,
              fill: rgb("#FFFFFF"),
              weight: "bold",
            ),
          ),
        ),
      ),
    ),
  )
  // component: node-observe
  #PptxPlace(x: 208pt, y: 344pt,
    child: PptxRect(width: 336pt, height: 112pt, fill: rgb("#FFFFFF"), stroke: 1pt + rgb("#C9D4CE"), radius: 10pt),
  )
  #PptxPlace(x: 208pt, y: 344pt,
    child: PptxTextFrame(
      width: 336pt,
      height: 112pt,
      font: "Arial",
      size: 23pt,
      fill: rgb("#18372F"),
      weight: "bold",
      anchor: "center",
      default-align: "center",
      margin-left: 16pt,
      margin-right: 16pt,
      margin-top: 16pt,
      margin-bottom: 16pt,
      paragraphs: (
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "Observe",
              font: "Arial",
              size: 23pt,
              fill: rgb("#18372F"),
              weight: "bold",
            ),
          ),
        ),
      ),
    ),
  )
  // component: node-adjust
  #PptxPlace(x: 568pt, y: 344pt,
    child: PptxRect(width: 336pt, height: 112pt, fill: rgb("#FFFFFF"), stroke: 1pt + rgb("#C9D4CE"), radius: 10pt),
  )
  #PptxPlace(x: 568pt, y: 344pt,
    child: PptxTextFrame(
      width: 336pt,
      height: 112pt,
      font: "Arial",
      size: 23pt,
      fill: rgb("#18372F"),
      weight: "bold",
      anchor: "center",
      default-align: "center",
      margin-left: 16pt,
      margin-right: 16pt,
      margin-top: 16pt,
      margin-bottom: 16pt,
      paragraphs: (
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "Adjust",
              font: "Arial",
              size: 23pt,
              fill: rgb("#18372F"),
              weight: "bold",
            ),
          ),
        ),
      ),
    ),
  )
  // component: metric-example
  #PptxPlace(x: 56pt, y: 460pt,
    child: PptxTextFrame(
      width: 848pt,
      height: 54pt,
      font: "Arial",
      size: 20pt,
      fill: rgb("#222222"),
      weight: "regular",
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
              font: "Arial",
              size: 20pt,
              fill: rgb("#557469"),
              weight: "bold",
            ),
          ),
          after: 4pt,
        ),
        PptxParagraph(
          align: "center",
          runs: (
            PptxPlaceholderRun(
              text: "REUSABLE PATTERNS",
              font: "Arial",
              size: 12pt,
              fill: rgb("#557469"),
              weight: "regular",
            ),
          ),
        ),
      ),
    ),
  )
])
