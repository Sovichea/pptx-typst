// Minimal, neutral layout primitives used by generated PowerPoint projects.
// Import with: #import "template.typ": Root, Place, GroupContent, ClipContent

#let W = 960pt
#let H = 540pt

#let AxisPosition(x: 0pt, y: 0pt, dx: 0pt, dy: 0pt, child: none) = {
  let x-anchor = if x == center { center } else { left }
  let y-anchor = if y == horizon { horizon } else { top }
  let x-shift = if x == center { dx } else { x + dx }
  let y-shift = if y == horizon { dy } else { y + dy }
  place(x-anchor + y-anchor, dx: x-shift, dy: y-shift, child)
}

#let Root(width: W, height: H, fill: white, format: (width: W, height: H), children: []) = {
  box(width: format.width, height: format.height, fill: fill)[
    #box(width: width, height: height)[#children]
  ]
}

#let PptxMaster(children: [], fill: none) = (children: children, fill: fill)
#let PptxLayout(master: none, children: [], fill: none, show-master: true) = (
  master: master,
  children: children,
  fill: fill,
  show-master: show-master,
)
#let PptxSlide(width: W, height: H, fill: none, format: (width: W, height: H), layout: none, show-master: true, children: []) = {
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
