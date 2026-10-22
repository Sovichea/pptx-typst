// Minimal, neutral layout primitives used by generated PowerPoint projects.
// Import with: #import "template.typ": Root, Place, GroupContent, ClipContent,
//   PptxMaster, PptxLayout, PptxSlide, PptxPlaceholderSlot, PptxPlaceholder

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

#let PptxLine = line

#let PptxPlaceholderSlot(
  id: "", type: "body", idx: 0,
  x: none, y: none, width: none, height: none, rotation: none,
  font: none, size: none, fill: none, background: none, weight: none, align: none,
  bullet: none,
  anchor: none, margin-left: none, margin-right: none,
  margin-top: none, margin-bottom: none,
) = (
  id: id, type: type, idx: idx, x: x, y: y, width: width, height: height,
  rotation: rotation, font: font, size: size, fill: fill, background: background, weight: weight,
  align: align, anchor: anchor, margin-left: margin-left,
  margin-right: margin-right, margin-top: margin-top, margin-bottom: margin-bottom,
  bullet: bullet,
)
#let PptxPlaceholderRun(text: "", font: none, size: none, fill: none, weight: none, italic: none) = (
  text: text, font: font, size: size, fill: fill, weight: weight, italic: italic,
)
#let PptxPlaceholderParagraph(text: "", level: 0, bullet: none, align: none, runs: ()) = (
  text: text, level: level, bullet: bullet, align: align, runs: runs,
)
#let PptxPlaceholder(
  id: "", type: "body", idx: 0, text: "", content: none, paragraphs: (),
  x: none, y: none, width: none, height: none, rotation: none,
  font: none, size: none, fill: none, background: none, weight: none, align: none,
  bullet: none, anchor: none,
  margin-left: none, margin-right: none, margin-top: none, margin-bottom: none,
) = (
  id: id, type: type, idx: idx, text: text, content: content, paragraphs: paragraphs,
  x: x, y: y, width: width, height: height, rotation: rotation,
  font: font, size: size, fill: fill, background: background, weight: weight, align: align, bullet: bullet,
  anchor: anchor, margin-left: margin-left, margin-right: margin-right,
  margin-top: margin-top, margin-bottom: margin-bottom,
)
#let PptxMaster(children: [], fill: none, background: none, placeholders: ()) = (children: children, fill: fill, background: background, placeholders: placeholders)
#let PptxLayout(master: none, children: [], fill: none, background: none, placeholders: (), show-master: true) = (
  master: master,
  children: children,
  fill: fill,
  background: background,
  placeholders: placeholders,
  show-master: show-master,
)
#let PptxSlide(width: W, height: H, fill: none, format: (width: W, height: H), layout: none, show-master: true, placeholders: (), children: []) = {
  let master = if layout == none { none } else { layout.master }
  let inherited-fill = if fill != none { fill } else if layout != none and layout.fill != none { layout.fill } else if master != none and master.fill != none { master.fill } else { white }
  let inherited-background = if fill != none { none } else if layout != none and layout.background != none { layout.background } else if layout != none and layout.fill != none { none } else if show-master and layout != none and layout.show-master and master != none { master.background } else { none }
  let background-layer = if inherited-background == none { [] } else { [#place(left + top, dx: 0pt, dy: 0pt, inherited-background)] }
  let inherited = if layout == none { [] } else if master == none { layout.children } else if show-master and layout.show-master { master.children + layout.children } else { layout.children }
  let slot-for = (id, owner) => if owner == none { none } else { owner.placeholders.find(slot => slot.id == id) }
  let placeholder-layers = placeholders.map(instance => {
    let local = slot-for(instance.id, layout)
    let parent = if show-master and layout != none and layout.show-master { slot-for(instance.id, master) } else { none }
    let value = (key) => {
      let own = instance.at(key, default: none)
      if own != none { own }
      else if local != none and local.at(key, default: none) != none { local.at(key) }
      else if parent != none { parent.at(key, default: none) }
      else { none }
    }
    let x = value("x")
    let y = value("y")
    let w = value("width")
    let box-height = value("height")
    let angle = value("rotation")
    let font = if value("font") == none { "Aptos" } else { value("font") }
    let size = if value("size") == none { 20pt } else { value("size") }
    let color = if value("fill") == none { black } else { value("fill") }
    let weight = if value("weight") == none { "regular" } else { value("weight") }
    let alignment = if value("align") == "center" or (value("align") == none and instance.type == "centered-title") { center } else if value("align") == "right" { right } else { left }
    let vertical = if value("anchor") == "center" { horizon } else if value("anchor") == "bottom" { bottom } else { top }
    let left-inset = if value("margin-left") == none { 0pt } else { value("margin-left") }
    let right-inset = if value("margin-right") == none { 0pt } else { value("margin-right") }
    let top-inset = if value("margin-top") == none { 0pt } else { value("margin-top") }
    let bottom-inset = if value("margin-bottom") == none { 0pt } else { value("margin-bottom") }
    if x == none or y == none or w == none or box-height == none { none } else {
      let paragraphs = if instance.paragraphs.len() > 0 { instance.paragraphs } else {
        instance.text.split("\n").map(text => (text: text, level: 0, bullet: none, align: none))
      }
      let paragraph-content = paragraphs.map(paragraph => {
        let runs = paragraph.at("runs", default: ())
        let marker = if paragraph.bullet == none { value("bullet") } else { paragraph.bullet }
        let bullet = if marker == none { [] } else { [#text(marker, weight: "bold") #h(0.4em)] }
        let indentation = paragraph.level * 1em
        let paragraph-align = if paragraph.align == "center" { center } else if paragraph.align == "right" { right } else { alignment }
        let run-content = if runs.len() == 0 { paragraph.text } else {
          runs.map(run => {
            let pieces = run.text.split("\n")
            pieces.map(piece => {
              let styled = if run.italic == true { text(style: "italic")[#piece] } else { piece }
              let styled = if run.weight == none { styled } else { text(weight: run.weight)[#styled] }
              let styled = if run.fill == none { styled } else { text(fill: run.fill)[#styled] }
              let styled = if run.size == none { styled } else { text(size: run.size)[#styled] }
              let styled = if run.font == none { styled } else { text(font: run.font)[#styled] }
              styled
            }).join(linebreak())
          }).join()
        }
        [#h(indentation)#align(paragraph-align)[#bullet#run-content]#linebreak()]
      }).join()
      let body = if instance.content == none { paragraph-content } else { instance.content }
      let text-layer = box(width: w, height: box-height, fill: value("background"))[
        #pad(left: left-inset, right: right-inset, top: top-inset, bottom: bottom-inset)[
          #text(font: font, size: size, fill: color, weight: weight)[
            #align(alignment + vertical)[#body]
          ]
        ]
      ]
      let placed = if angle == none { text-layer } else { rotate(angle, reflow: false)[#text-layer] }
      [#place(left + top, dx: x, dy: y)[#placed]]
    }
  })
  Root(width: width, height: height, fill: inherited-fill, format: format, children: background-layer + inherited + children + placeholder-layers.join())
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
