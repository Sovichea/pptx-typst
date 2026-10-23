// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, PptxMaster, PptxLayout, PptxSlide, PptxPlaceholderSlot, PptxPlaceholder, PptxParagraph, PptxTextFrame, PptxPlaceholderParagraph, PptxPlaceholderRun, PptxLine, Place, GroupContent, ClipContent
#let ppt-format=(width:960.000pt,height:540.000pt)
#set page(width:960.000pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:"Arial",size:20pt,fill:black)

#let Master01 = PptxMaster(fill:rgb("#FEFDFB"),background:none,placeholders:(PptxPlaceholderSlot(id:"body-1", type:"body", idx:1, x:49.924pt, y:167.675pt, width:860.152pt, height:322.325pt, rotation:0.000deg, margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, font:"Calibri"), PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.924pt, y:78.875pt, width:860.152pt, height:59.501pt, rotation:0.000deg, margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"top", font:"Calibri")),children:[
])
#let Layout01 = PptxLayout(master:Master01,fill:rgb("#ECE7DA"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.924pt, y:78.875pt, width:468.900pt, height:431.300pt, rotation:0.000deg, anchor:"bottom", font:"Calibri", size:72.000pt, weight:"regular"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 3
  // pptx-object: layout:Layout01:4
  #Place(
    x:555.931pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout01:3
  #Place(
    x:0.000pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(555.931pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout02 = PptxLayout(master:Master01,fill:rgb("#FFFFFF"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:532.395pt, y:78.875pt, width:377.681pt, height:118.376pt, rotation:0.000deg, anchor:"bottom", font:"Calibri", size:40.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 8
  // pptx-object: layout:Layout02:9
  #Place(
    x:480.000pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(480.000pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 12
  // pptx-object: layout:Layout02:13
  #Place(
    x:480.240pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 13
  // pptx-object: layout:Layout02:14
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout03 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.924pt, y:70.900pt, width:297.000pt, height:411.125pt, rotation:0.000deg, align:"center", anchor:"center", font:"Calibri", size:40.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout03:3
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout03:7
  #Place(
    x:384.544pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(575.456pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 9
  // pptx-object: layout:Layout03:10
  #Place(
    x:384.544pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout04 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:47.112pt, y:402.325pt, width:343.638pt, height:87.675pt, rotation:0.000deg, anchor:"top", font:"Calibri", size:40.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 3
  // pptx-object: layout:Layout04:4
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout05 = PptxLayout(master:Master01,fill:rgb("#ECE7DA"),background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:49.880pt, y:137.675pt, width:860.195pt, height:372.500pt, rotation:0.000deg, align:"left", anchor:"bottom", font:"Calibri", size:72.000pt, fill:rgb("#000000")),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout05:7
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout05:3
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout06 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.924pt, y:78.875pt, width:860.152pt, height:88.800pt, rotation:0.000deg, align:"left", font:"Calibri"), PptxPlaceholderSlot(id:"body-13", type:"body", idx:13, x:49.924pt, y:167.675pt, width:414.653pt, height:322.325pt, rotation:0.000deg, font:"Calibri", size:16.000pt), PptxPlaceholderSlot(id:"body-14", type:"body", idx:14, x:495.424pt, y:167.675pt, width:414.652pt, height:322.325pt, rotation:0.000deg, font:"Calibri", size:16.000pt)),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 3
  // pptx-object: layout:Layout06:4
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout06:3
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout07 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:48.240pt, y:-89.280pt, width:838.800pt, height:89.280pt, rotation:0.000deg, font:"Calibri"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout07:8
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout07:6
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout08 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.924pt, y:80.955pt, width:519.327pt, height:87.675pt, rotation:0.000deg, anchor:"top", font:"Calibri", size:40.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 4
  // pptx-object: layout:Layout08:5
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(588.944pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 11
  // pptx-object: layout:Layout08:12
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout08:3
  #Place(
    x:622.740pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout09 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, align:"left", font:"Calibri"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout09:7
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 8
  // pptx-object: layout:Layout09:9
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout10 = PptxLayout(master:Master01,fill:rgb("#ECE7DA"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.923pt, y:457.920pt, width:860.152pt, height:40.287pt, rotation:0.000deg, anchor:"bottom", font:"Calibri", size:16.000pt, weight:"regular", fill:rgb("#000000")),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout10:6
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout10:8
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout11 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.880pt, y:402.325pt, width:816.370pt, height:95.054pt, rotation:0.000deg, align:"left", anchor:"bottom", font:"Calibri", size:24.000pt, weight:"regular", fill:rgb("#000000")),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout11:8
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout11:6
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout12 = PptxLayout(master:Master01,fill:rgb("#ECE7DA"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.924pt, y:138.275pt, width:860.152pt, height:204.368pt, rotation:0.000deg, anchor:"bottom", font:"Calibri", size:40.000pt, weight:"regular", fill:rgb("#000000")),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout12:8
  #Place(
    x:33.796pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(926.204pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout12:3
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
#let Layout13 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:49.720pt, y:78.875pt, width:267.840pt, height:88.800pt, rotation:0.000deg, anchor:"bottom", font:"Calibri", size:40.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 2
  // pptx-object: layout:Layout13:3
  #Place(
    x:34.000pt,
    y:12.925pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(299.229pt,0.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 11
  // pptx-object: layout:Layout13:12
  #Place(
    x:33.842pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 9
  // pptx-object: layout:Layout13:10
  #Place(
    x:333.229pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.000pt + rgb("#000000")),
  )
])
// Slide 01
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout01,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:49.924pt, y:78.875pt, width:468.900pt, height:431.300pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"GROWTH MARKETING PLAN", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:77.7600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:72.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image14_7b211e4a52.png | shape: Picture Placeholder 15 | rect
    // pptx-object: slide:1:16
    #Place(
      x:556.331pt,
      y:-0.000pt,
      orientation:0.000deg,
      child:
        box(width:404.069pt,height:490.000pt,clip:true)[#place(top+left,dx:-0.048pt,dy:0.000pt)[#image("assets/media/image14_7b211e4a52.png",width:404.166pt,height:490.000pt,fit:"stretch")]],
    )
    // Editable text: Subtitle 2 | Presented by Ellis Turner
    // pptx-object: slide:1:3
    #Place(
      x:565.151pt,
      y:502.027pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:381.699pt,
          height:28.603pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:20.7360pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Presented by Ellis Turner", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.10000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 02
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout02,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"AGENDA", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"AGENDA", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image15_5999961a05.jpeg | shape: Picture Placeholder 7 | rect
    // pptx-object: slide:2:8
    #Place(
      x:47.113pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/image15_5999961a05.jpeg",width:419.767pt,height:540.000pt,fit:"stretch"),
    )
    // Editable text: Slide Number Placeholder 5 | 2
    // pptx-object: slide:2:6
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"2", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:2:5
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | Overview Market analysis Campaign success Metrics & KPIs Q & A
    // pptx-object: slide:2:3
    #Place(
      x:533.589pt,
      y:227.251pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:376.487pt,
          height:262.749pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Overview", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Market analysis", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Campaign success", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Metrics & KPIs", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Q & A", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"center",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 03
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout03,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, anchor:"center", autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"OVERVIEW", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"OVERVIEW", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Slide Number Placeholder 6 | 3
    // pptx-object: slide:3:7
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"3", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Footer Placeholder 5 | GROWTH MARKETING PLAN
    // pptx-object: slide:3:6
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 4 | This presentation is focused on our growth marketing strategy. We'll cover key a
    // pptx-object: slide:3:5
    #Place(
      x:421.174pt,
      y:70.900pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:488.902pt,
          height:411.125pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"This presentation is focused on our growth marketing strategy. We'll cover key areas such as market analysis, campaign success, metrics & KPIs, and more.", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 04
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout04,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"OUR GOAL", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"OUR GOAL", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image16_1771aff905.jpeg | shape: Picture Placeholder 7 | rect
    // pptx-object: slide:4:8
    #Place(
      x:47.112pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/image16_1771aff905.jpeg",width:912.887pt,height:372.325pt,fit:"stretch"),
    )
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:4:5
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 5 | 4
    // pptx-object: slide:4:6
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"4", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | We aim to align our efforts and drive success through effective marketing strate
    // pptx-object: slide:4:3
    #Place(
      x:421.200pt,
      y:402.325pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:488.876pt,
          height:87.675pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"We aim to align our efforts and drive success through effective marketing strategies. Let's dive in and explore how we can achieve our growth objectives together.", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 05
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"NAVIGATING THE LANDSCAPE", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:77.7600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"NAVIGATING THE LANDSCAPE", font:"Calibri", size:72.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
])
#pagebreak()
// Slide 06
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout06,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"CONSUMER EXPECTATIONS", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"CONSUMER EXPECTATIONS", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
    PptxPlaceholder(id:"body-13", type:"body", idx:13, margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"top", autofit-mode:"shrink", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Seamless omnichannel experience: consumers expect a seamless experience across all touchpoints, whether they are interacting with a brand online, in-store, or through a mobile app. \nTransparency and trust: Consumers expect brands to be transparent about their practices, values, and product information. ", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Seamless omnichannel experience", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"bold", italic:false), PptxPlaceholderRun(text:": consumers expect a seamless experience across all touchpoints, whether they are interacting with a brand online, in-store, or through a mobile app. ", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false))), PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Transparency and trust", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"bold", italic:false), PptxPlaceholderRun(text:": Consumers expect brands to be transparent about their practices, values, and product information. ", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false))))),
    PptxPlaceholder(id:"body-14", type:"body", idx:14, margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"top", autofit-mode:"shrink", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Personalization: consumers today expect brands to offer personalized experiences tailored to their individual preferences and behaviors.\nSustainability: Modern consumers are increasingly concerned about environmental impact and sustainability.  ", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Personalization", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"bold", italic:false), PptxPlaceholderRun(text:": consumers today expect brands to offer personalized experiences tailored to their individual preferences and behaviors.", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false))), PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Sustainability", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"bold", italic:false), PptxPlaceholderRun(text:": Modern consumers are increasingly concerned about environmental impact and sustainability.  ", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false))))),
  ),
  children:[
    // Editable text: Footer Placeholder 5 | GROWTH MARKETING PLAN
    // pptx-object: slide:6:6
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 6 | 6
    // pptx-object: slide:6:7
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"6", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 07
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout07,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Quote", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Quote", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Footer Placeholder 3 | GROWTH MARKETING PLAN
    // pptx-object: slide:7:4
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 4 | 7
    // pptx-object: slide:7:5
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"7", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 5 | SUCCESSFUL BRANDS EVOLVE WITH THEIR AUDIENCE, NOT DESPITE THEM.
    // pptx-object: slide:7:6
    #Place(
      x:49.880pt,
      y:78.875pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:860.195pt,
          height:423.470pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:48.0000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"SUCCESSFUL BRANDS EVOLVE WITH THEIR AUDIENCE, NOT DESPITE THEM.", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:40.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 08
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"WHO IS OUR TARGET AUDIENCE?", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:77.7600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"WHO IS OUR TARGET AUDIENCE?", font:"Calibri", size:72.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
])
#pagebreak()
// Slide 09
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout08,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"OUR CUSTOMERS", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"OUR CUSTOMERS", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image17_33de6e528e.jpeg | shape: Picture Placeholder 11 | rect
    // pptx-object: slide:9:12
    #Place(
      x:623.095pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/image17_33de6e528e.jpeg",width:337.305pt,height:540.000pt,fit:"stretch"),
    )
    // Editable text: Footer Placeholder 5 | GROWTH MARKETING PLAN
    // pptx-object: slide:9:6
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 6 | 9
    // pptx-object: slide:9:7
    #Place(
      x:0.000pt,
      y:511.200pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"9", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 4 | Key demographics Understanding key demographics is crucial for tailoring success
    // pptx-object: slide:9:5
    #Place(
      x:49.924pt,
      y:196.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:519.327pt,
          height:293.450pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Key demographics", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"bold", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Understanding key demographics is crucial for tailoring successful marketing strategies. ", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"Challenges & needs", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"bold", italic:false))), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"direct", align:"left", align-source:"master_style", margin-left-source:"direct", indent-source:"direct", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our target audience faces several challenges and needs that our marketing strategies aim to address. ", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"bold",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 10
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#FEFDFB"),
  format:ppt-format,
  layout:Layout09,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"MARKETING STRATEGY", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"MARKETING STRATEGY", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable PowerPoint table: Content Placeholder 6
    // pptx-object: slide:10:7
    #Place(
      x:49.875pt,
      y:167.625pt,
      orientation:0.000deg,
      child:
        table(columns:(224.449pt, 317.900pt, 317.900pt),rows:(64.465pt, 64.465pt, 64.465pt, 64.465pt, 64.465pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Focus area")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Approach")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Goal")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Brand awareness")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Social media campaigns")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Increase engagement by 30%")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Lead generation")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Email marketing & PPC")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Grow qualified leads by 20%")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Customer retention")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Loyalty programs, automation")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Boost purchases")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Content marketing")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "SEO optimized short-form videos")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:left + horizon)[#text(font: ("Calibri"), size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Improve organic reach")]),
    )
    // Editable text: Slide Number Placeholder 5 | 10
    // pptx-object: slide:10:6
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"10", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:10:5
    #Place(
      x:-162.780pt,
      y:176.533pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 11
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"MARKETING MIX: \nTHE 4 PS", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:77.7600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"MARKETING MIX: ", font:"Calibri", size:72.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:72.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"THE 4 PS", font:"Calibri", size:72.000pt, fill:rgb("#000000"), weight:"regular", italic:false))),)),
  ),
  children:[
])
#pagebreak()
// Slide 12
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout10,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"shrink", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Ana Bowman, Director of Marketing", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:23.0400pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Ana Bowman, Director of Marketing", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:12:5
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | “OUR LATEST CAMPAIGN DROVE A 35% INCREASE IN ENGAGEMENT, PROVING THAT STRATEGIC
    // pptx-object: slide:12:3
    #Place(
      x:49.924pt,
      y:82.080pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:860.152pt,
          height:317.899pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:48.0000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:12.9600pt, indent:-12.9600pt, runs:(PptxPlaceholderRun(text:"“OUR LATEST CAMPAIGN DROVE A 35% INCREASE IN ENGAGEMENT, PROVING THAT STRATEGIC STORYTELLING RESONATES.”", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:40.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 5 | 12
    // pptx-object: slide:12:6
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"12", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 13
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout11,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"shrink", font-scale:1.00000, line-spacing-reduction:0.00000, text:"increase in conversion rates \nthrough recent marketing efforts", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"layout", target-pitch:25.9200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"increase in conversion rates ", font:"Calibri", size:24.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:24.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"through recent marketing efforts", font:"Calibri", size:24.000pt, fill:rgb("#000000"), weight:"regular", italic:false))),)),
  ),
  children:[
    // Editable text: Slide Number Placeholder 5 | 13
    // pptx-object: slide:13:6
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"13", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:13:5
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | 28%
    // pptx-object: slide:13:3
    #Place(
      x:49.924pt,
      y:105.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:816.327pt,
          height:266.774pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"layout", target-pitch:324.0000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"28%", font:"Calibri", size:300.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:300.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 14
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout12,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"MARKETING THAT DRIVES \nRESULTS", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"MARKETING THAT DRIVES ", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"RESULTS", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false))),)),
  ),
  children:[
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:14:5
    #Place(
      x:-162.780pt,
      y:175.705pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:359.400pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | By staying data-driven and adaptable, our marketing strategy continues to suppor
    // pptx-object: slide:14:3
    #Place(
      x:49.881pt,
      y:372.644pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:519.369pt,
          height:126.391pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"layout", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"By staying data-driven and adaptable, our marketing strategy continues to support growth and long-term success.", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 5 | 14
    // pptx-object: slide:14:6
    #Place(
      x:0.000pt,
      y:511.221pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"14", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])
#pagebreak()
// Slide 15
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout13,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Q & A", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:43.2000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Q & A", font:"Calibri", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image18_08cd74568f.jpeg | shape: Picture Placeholder 7 | rect
    // pptx-object: slide:15:8
    #Place(
      x:333.425pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/image18_08cd74568f.jpeg",width:626.975pt,height:540.000pt,fit:"stretch"),
    )
    // Editable text: Footer Placeholder 4 | GROWTH MARKETING PLAN
    // pptx-object: slide:15:5
    #Place(
      x:-162.412pt,
      y:176.117pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:358.576pt,
          height:33.840pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:16.000pt, bullet-fill:rgb("#000000"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH MARKETING PLAN", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 5 | 15
    // pptx-object: slide:15:6
    #Place(
      x:0.000pt,
      y:511.250pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:33.796pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"15", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#111111"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#111111"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | Let’s discuss questions as a team.
    // pptx-object: slide:15:3
    #Place(
      x:49.720pt,
      y:196.178pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:267.840pt,
          height:293.822pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:0.0000, before-source:"direct", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Let’s discuss questions ", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:23.0400pt, before-kind:"points", before-value:0.0000, before-source:"direct", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"as a team.", font:"Calibri", size:16.000pt, fill:rgb("#000000"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:16.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
])