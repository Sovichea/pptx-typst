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
#let PptxParagraph(
  text: "", level: 0, bullet: none, bullet-kind: none, bullet-type: none, bullet-start: none, bullet-source: none,
  bullet-font: none, bullet-font-source: none, bullet-size: none, bullet-size-kind: none, bullet-size-value: none, bullet-size-source: none, bullet-fill: none, bullet-fill-source: none, bullet-weight: none,
  align: none, align-source: none, runs: (),
  line-kind: none, line-value: none, line-source: none, leading: none,
  before-kind: none, before-value: none, before-source: none, before: none,
  after-kind: none, after-value: none, after-source: none, after: none,
  margin-left: none, margin-left-source: none, indent: none, indent-source: none,
) = (
  text: text, level: level, bullet: bullet, bullet-kind: bullet-kind, bullet-type: bullet-type, bullet-start: bullet-start, bullet-source: bullet-source,
  bullet-font: bullet-font, bullet-font-source: bullet-font-source, bullet-size: bullet-size, bullet-size-kind: bullet-size-kind, bullet-size-value: bullet-size-value, bullet-size-source: bullet-size-source, bullet-fill: bullet-fill, bullet-fill-source: bullet-fill-source, bullet-weight: bullet-weight,
  align: align, align-source: align-source, runs: runs,
  line-kind: line-kind, line-value: line-value, line-source: line-source, leading: leading,
  before-kind: before-kind, before-value: before-value, before-source: before-source, before: before,
  after-kind: after-kind, after-value: after-value, after-source: after-source, after: after,
  margin-left: margin-left, margin-left-source: margin-left-source, indent: indent, indent-source: indent-source,
)
#let PptxPlaceholderParagraph = PptxParagraph
#let PptxTextFrame(
  width: 300pt, height: 60pt, paragraphs: (), font: "Aptos", size: 20pt,
  fill: black, weight: "regular", background: none, anchor: "top", default-align: "left",
  autofit-mode: "none", font-scale: 1.0, line-spacing-reduction: 0.0,
  margin-left: 0pt, margin-right: 0pt, margin-top: 0pt, margin-bottom: 0pt,
) = {
  let render-run = (run) => {
    let pieces = run.text.split("\n")
    pieces.map(piece => {
      let styled = if run.italic == true { text(style: "italic")[#piece] } else { piece }
      let styled = if run.weight == none { styled } else { text(weight: run.weight)[#styled] }
      let styled = if run.fill == none { styled } else { text(fill: run.fill)[#styled] }
      let styled = if run.size == none { styled } else { text(size: run.size * font-scale)[#styled] }
      let styled = if run.font == none { styled } else { text(font: run.font)[#styled] }
      styled
    }).join(linebreak())
  }
  let render-paragraph = (paragraph, index) => {
    let runs = paragraph.at("runs", default: ())
    let body = if runs.len() == 0 {
      if paragraph.text == "" { text("\u{200B}") } else { paragraph.text }
    } else { runs.map(render-run).join() }
    let align-name = if paragraph.align == none { default-align } else { paragraph.align }
    let alignment = if align-name == "center" { center } else if align-name == "right" { right } else { left }
    let marker = paragraph.bullet
    let bullet-body = if marker == none { body } else {
      let indent = if paragraph.at("margin-left", default: none) == none { 0pt } else { paragraph.at("margin-left") }
      let hanging = if paragraph.indent == none { 0pt } else { paragraph.indent }
      let marker-font = paragraph.at("bullet-font", default: font)
      let marker-size = paragraph.at("bullet-size", default: size * font-scale)
      let marker-fill = paragraph.at("bullet-fill", default: fill)
      let marker-weight = paragraph.at("bullet-weight", default: weight)
      let marker-content = text(font: marker-font, size: marker-size, fill: marker-fill, weight: marker-weight)[#marker]
      if hanging < 0pt {
        list(marker: [#marker-content], indent: indent + hanging, body-indent: -hanging, tight: true, spacing: 0pt)[#body]
      } else {
        list(marker: [#marker-content], indent: indent, body-indent: hanging, tight: true, spacing: 0pt)[#body]
      }
    }
    let content = if marker == none and paragraph.at("margin-left", default: none) != none {
      pad(left: paragraph.at("margin-left") + if paragraph.indent == none { 0pt } else { paragraph.indent })[#bullet-body]
    } else { bullet-body }
    let leading = if paragraph.leading == none { 0pt } else { paragraph.leading }
    let after = if paragraph.after == none { 0pt } else { paragraph.after }
    [
      #if paragraph.before != none { v(paragraph.before) }
      #set par(leading: leading, spacing: after)
      #align(alignment)[#content]
      #if index + 1 < paragraphs.len() { parbreak() }
    ]
  }
  let body = paragraphs.enumerate().map(((index, paragraph)) => render-paragraph(paragraph, index)).join()
  let vertical = if anchor == "center" { horizon } else if anchor == "bottom" { bottom } else { top }
  box(width: width, height: height, fill: background)[
    #pad(left: margin-left, right: margin-right, top: margin-top, bottom: margin-bottom)[
      #text(font: font, size: size * font-scale, fill: fill, weight: weight)[#align(left + vertical)[#body]]
    ]
  ]
}
#let PptxPlaceholder(
  id: "", type: "body", idx: 0, text: "", content: none, paragraphs: (),
  autofit-mode: "none", font-scale: 1.0, line-spacing-reduction: 0.0,
  x: none, y: none, width: none, height: none, rotation: none,
  font: none, size: none, fill: none, background: none, weight: none, align: none,
  bullet: none, anchor: none,
  margin-left: none, margin-right: none, margin-top: none, margin-bottom: none,
) = (
  id: id, type: type, idx: idx, text: text, content: content, paragraphs: paragraphs,
  autofit-mode: autofit-mode, font-scale: font-scale, line-spacing-reduction: line-spacing-reduction,
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
#let PptxSlide(width: W, height: H, fill: none, format: format, layout: none, show-master: true, placeholders: (), children: []) = {
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
        instance.text.split("\n").map(text => PptxParagraph(text: text))
      }
      let text-layer = if instance.content == none {
        PptxTextFrame(
          width: w, height: box-height, paragraphs: paragraphs,
          font: font, size: size, fill: color, weight: weight,
          autofit-mode: instance.autofit-mode, font-scale: instance.font-scale,
          line-spacing-reduction: instance.line-spacing-reduction,
          default-align: if value("align") == none { if instance.type == "centered-title" { "center" } else { "left" } } else { value("align") },
          background: value("background"), anchor: if vertical == horizon { "center" } else if vertical == bottom { "bottom" } else { "top" },
          margin-left: left-inset, margin-right: right-inset,
          margin-top: top-inset, margin-bottom: bottom-inset,
        )
      } else {
        box(width: w, height: box-height, fill: value("background"))[
          #pad(left: left-inset, right: right-inset, top: top-inset, bottom: bottom-inset)[
            #text(font: font, size: size, fill: color, weight: weight)[#align(alignment + vertical)[#instance.content]]
          ]
        ]
      }
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
