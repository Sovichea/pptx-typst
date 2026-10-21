// Import with: #import "pptx-typst.typ": *
// Small slide canvas and positioning primitives understood by typst-to-pptx.
#let W = 960pt
#let H = 540pt
#let format = (width: W, height: H, logical-width: W, logical-height: H)

#let AxisPosition(x: 0pt, y: 0pt, dx: 0pt, dy: 0pt, child: none) = {
  let x-anchor = if x == center { center } else { left }
  let y-anchor = if y == horizon { horizon } else { top }
  let x-shift = if x == center { dx } else { x + dx }
  let y-shift = if y == horizon { dy } else { y + dy }
  place(x-anchor + y-anchor, dx: x-shift, dy: y-shift, child)
}

#let Root(width: W, height: H, fill: white, format: format, children: []) = {
  let scale-factor = calc.min(format.width / width, format.height / height)
  box(width: format.width, height: format.height, fill: fill)[
    #place(center + horizon)[
      #scale(x: scale-factor * 100%, y: scale-factor * 100%, reflow: true)[
        #box(width: width, height: height)[#children]
      ]
    ]
  ]
}

// Shared hierarchy values. These return data instead of drawing immediately,
// allowing PptxSlide to compose each inherited layer exactly once per render.
#let PptxMaster(children: [], fill: none) = (children: children, fill: fill)
#let PptxLayout(master: none, children: [], fill: none, show-master: true) = (
  master: master,
  children: children,
  fill: fill,
  show-master: show-master,
)
#let PptxSlide(width: W, height: H, fill: none, format: format, layout: none, show-master: true, children: []) = {
  let master = if layout == none { none } else { layout.master }
  let inherited-fill = if fill != none { fill } else if layout != none and layout.fill != none { layout.fill } else if master != none and master.fill != none { master.fill } else { white }
  let inherited = if layout == none { [] } else if master == none { layout.children } else if show-master and layout.show-master { master.children + layout.children } else { layout.children }
  Root(width: width, height: height, fill: inherited-fill, format: format, children: inherited + children)
}

#let Place(
  x: 0pt,
  y: 0pt,
  dx: 0pt,
  dy: 0pt,
  orientation: 0deg,
  origin: center + horizon,
  child: none,
) = {
  let oriented = if orientation == 0deg {
    child
  } else {
    rotate(orientation, origin: origin, reflow: false, child)
  }
  AxisPosition(x: x, y: y, dx: dx, dy: dy, child: oriented)
}

#let GroupContent(width: 0pt, height: 0pt, children: [], clip: false) = box(
  width: width,
  height: height,
  clip: clip,
  children,
)
#let ClipContent(width: 0pt, height: 0pt, children: []) = box(
  width: width,
  height: height,
  clip: true,
  children,
)

// Convenience aliases for supported Typst primitives.
#let PptxPlace = Place
#let PptxGroup = GroupContent
#let PptxClip = box
#let PptxBox = box
#let PptxText = text
#let PptxImage = image
#let PptxRect = rect
#let PptxEllipse = ellipse
#let PptxLine = line
#let PptxTable = table
