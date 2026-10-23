// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, PptxMaster, PptxLayout, PptxSlide, PptxPlaceholderSlot, PptxPlaceholder, PptxParagraph, PptxTextFrame, PptxPlaceholderParagraph, PptxPlaceholderRun, PptxLine, Place, GroupContent, ClipContent
#let ppt-format=(width:959.750pt,height:540.000pt)
#set page(width:959.750pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:"Arial",size:20pt,fill:black)

#let Master01 = PptxMaster(fill:rgb("#E4EDDD"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:46.800pt, y:48.960pt, width:847.440pt, height:90.000pt, rotation:0.000deg, margin-left:9.598pt, margin-right:9.598pt, margin-top:4.799pt, margin-bottom:4.799pt, anchor:"bottom", font:"Century Gothic"), PptxPlaceholderSlot(id:"body-1", type:"body", idx:1, x:46.800pt, y:166.320pt, width:847.440pt, height:283.680pt, rotation:0.000deg, margin-left:9.598pt, margin-right:9.598pt, margin-top:4.799pt, margin-bottom:4.799pt, font:"Century Gothic")),children:[
])
#let Layout01 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:282.240pt, y:41.760pt, width:612.000pt, height:225.360pt, rotation:0.000deg, font:"Century Gothic", size:54.000pt), PptxPlaceholderSlot(id:"body-10", type:"body", idx:10, x:285.840pt, y:280.080pt, width:612.000pt, height:84.000pt, rotation:0.000deg, font:"Century Gothic", size:24.000pt, weight:"bold", fill:rgb("#3E532A"))),show-master:false,children:[
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 2
  // pptx-object: layout:Layout01:3
  #Place(
    x:40.178pt,
    y:36.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c94f500f8222.svg",width:199.697pt,height:468.000pt,fit:"stretch"),
  )
  // Native editable PowerPoint connector: Straight Connector 3
  // pptx-object: layout:Layout01:4
  #Place(
    x:286.120pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(607.755pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 4
  // pptx-object: layout:Layout01:5
  #Place(
    x:281.875pt,
    y:42.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(607.755pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Source media: assets/media/image1_00a2ebe907.svg | shape: Graphic 7 | rect
  // pptx-object: layout:Layout01:8
  #Place(
    x:0.000pt,
    y:12.000pt,
    orientation:0.000deg,
    child:
      box(width:206.446pt,height:288.000pt,clip:true)[#place(top+left,dx:-114.125pt,dy:1.751pt)[#image("assets/media/image1_00a2ebe907.svg",width:289.225pt,height:288.000pt,fit:"stretch")]],
  )
  // Source media: assets/media/image2_f94bf2412f.svg | shape: Graphic 11 | rect
  // pptx-object: layout:Layout01:12
  #Place(
    x:-1.822pt,
    y:360.000pt,
    orientation:0.000deg,
    child:
      box(width:208.268pt,height:180.000pt,clip:true)[#place(top+left,dx:-54.460pt,dy:3.071pt)[#image("assets/media/image2_f94bf2412f.svg",width:237.246pt,height:230.208pt,fit:"stretch")]],
  )
])
#let Layout02 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:65.875pt, y:131.040pt, width:828.000pt, height:224.640pt, rotation:0.000deg, align:"center", anchor:"center", font:"Century Gothic", size:54.000pt, fill:rgb("#E4EDDD")),),show-master:false,children:[
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout02:7
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 7
  // pptx-object: layout:Layout02:8
  #Place(
    x:45.826pt,
    y:48.001pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_aece8f98b501.svg",width:868.098pt,height:377.999pt,fit:"stretch"),
  )
  // Source media: assets/media/image3_013027c85a.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout02:9
  #Place(
    x:-0.911pt,
    y:277.650pt,
    orientation:0.000deg,
    child:
      box(width:306.786pt,height:265.146pt,clip:true)[#place(top+left,dx:-80.221pt,dy:4.524pt)[#image("assets/media/image3_013027c85a.svg",width:349.470pt,height:339.104pt,fit:"stretch")]],
  )
  // Source media: assets/media/image4_60ac25f068.svg | shape: Graphic 11 | rect
  // pptx-object: layout:Layout02:12
  #Place(
    x:699.370pt,
    y:40.237pt,
    orientation:90.000deg,
    child:
      box(width:301.528pt,height:221.054pt,clip:true)[#place(top+left,dx:-166.688pt,dy:-197.035pt)[#image("assets/media/image4_60ac25f068.svg",width:422.432pt,height:420.646pt,fit:"stretch")]],
  )
])
#let Layout03 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.240pt, width:373.680pt, height:414.000pt, rotation:0.000deg, align:"center", anchor:"center", font:"Century Gothic", size:54.000pt),),show-master:false,children:[
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 9
  // pptx-object: layout:Layout03:10
  #Place(
    x:555.804pt,
    y:36.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_7fd3ca95db42.svg",width:336.236pt,height:468.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 17
  // pptx-object: layout:Layout03:18
  #Place(
    x:525.818pt,
    y:9.751pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_38976466b823.svg",width:163.660pt,height:162.841pt,fit:"stretch"),
  )
  // Group: Group 3 | id: g3_4
  #Place(
    x:45.826pt,
    y:48.000pt,
    child:GroupContent(width:368.636pt,height:414.000pt,children:[
      // Native editable PowerPoint connector: Straight Connector 5
      // pptx-object: layout:Layout03:6
      #Place(
        x:0.000pt,
        y:414.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(368.636pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
      )
      // Native editable PowerPoint connector: Straight Connector 7
      // pptx-object: layout:Layout03:8
      #Place(
        x:0.000pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(368.636pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
      )
    ]))
])
#let Layout04 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:449.280pt, y:49.726pt, width:448.560pt, height:322.274pt, rotation:0.000deg, font:"Century Gothic", size:54.000pt), PptxPlaceholderSlot(id:"body-13", type:"body", idx:13, x:449.605pt, y:375.000pt, width:448.656pt, height:84.000pt, rotation:0.000deg, font:"Century Gothic", size:24.000pt, weight:"bold", fill:rgb("#3E532A"))),show-master:true,children:[
  // Group: Group 31 | id: g4_32
  #Place(
    x:44.008pt,
    y:48.000pt,
    child:GroupContent(width:354.588pt,height:455.999pt,children:[
      // Original editable PowerPoint shape: Rectangle: Rounded Corners 32
      // pptx-object: layout:Layout04:33
      #Place(
        x:0.000pt,
        y:244.480pt,
        orientation:0.000deg,
        child:
          image("assets/media/shape_b7e2a52f307b.svg",width:354.588pt,height:211.520pt,fit:"stretch"),
      )
      // Original editable PowerPoint shape: Rectangle: Rounded Corners 33
      // pptx-object: layout:Layout04:34
      #Place(
        x:0.000pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          image("assets/media/shape_b7e2a52f307b.svg",width:354.588pt,height:211.520pt,fit:"stretch"),
      )
    ]))
  // Native editable PowerPoint connector: Straight Connector 29
  // pptx-object: layout:Layout04:30
  #Place(
    x:449.184pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(446.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 30
  // pptx-object: layout:Layout04:31
  #Place(
    x:449.184pt,
    y:49.726pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(446.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Source media: assets/media/image5_061f1b2921.svg | shape: Graphic 35 | rect
  // pptx-object: layout:Layout04:36
  #Place(
    x:-3.827pt,
    y:3.794pt,
    orientation:-90.000deg,
    child:
      box(width:191.715pt,height:186.526pt,clip:true)[#place(top+left,dx:9.769pt,dy:25.381pt)[#image("assets/media/image5_061f1b2921.svg",width:160.336pt,height:155.580pt,fit:"stretch")]],
  )
])
#let Layout05 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:54.000pt, y:48.960pt, width:450.000pt, height:90.000pt, rotation:0.000deg, align:"left", font:"Century Gothic"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 11
  // pptx-object: layout:Layout05:12
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 12
  // pptx-object: layout:Layout05:13
  #Place(
    x:45.826pt,
    y:48.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 13
  // pptx-object: layout:Layout05:14
  #Place(
    x:557.639pt,
    y:90.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_6b51c91c93f8.svg",width:336.236pt,height:324.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image6_be51971252.svg | shape: Graphic 15 | rect
  // pptx-object: layout:Layout05:16
  #Place(
    x:599.875pt,
    y:122.110pt,
    orientation:0.000deg,
    child:
      box(width:276.000pt,height:262.501pt,clip:true)[#place(top+left,dx:-2.278pt,dy:0.000pt)[#image("assets/media/image6_be51971252.svg",width:263.620pt,height:262.501pt,fit:"stretch")]],
  )
])
#let Layout06 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:36.000pt, y:185.040pt, width:857.520pt, height:90.000pt, rotation:0.000deg, align:"left", font:"Century Gothic"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 5
  // pptx-object: layout:Layout06:6
  #Place(
    x:45.826pt,
    y:80.113pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_d3c655b528c5.svg",width:847.779pt,height:115.403pt,fit:"stretch"),
  )
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout06:7
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout06:8
  #Place(
    x:45.826pt,
    y:48.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Source media: assets/media/image7_0a43c56ff1.svg | shape: Graphic 9 | rect
  // pptx-object: layout:Layout06:10
  #Place(
    x:758.424pt,
    y:-0.000pt,
    orientation:-180.000deg,
    child:
      box(width:201.326pt,height:174.000pt,clip:true)[#place(top+left,dx:-52.644pt,dy:2.969pt)[#image("assets/media/image7_0a43c56ff1.svg",width:229.338pt,height:222.535pt,fit:"stretch")]],
  )
  // Source media: assets/media/image6_be51971252.svg | shape: Graphic 11 | rect
  // pptx-object: layout:Layout06:12
  #Place(
    x:66.145pt,
    y:96.000pt,
    orientation:0.000deg,
    child:
      box(width:275.142pt,height:99.517pt,clip:true)[#place(top+left,dx:-2.573pt,dy:4.409pt)[#image("assets/media/image6_be51971252.svg",width:262.801pt,height:261.686pt,fit:"stretch")]],
  )
])
#let Layout07 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.960pt, width:462.835pt, height:90.000pt, rotation:0.000deg, font:"Century Gothic"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout07:7
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(446.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout07:8
  #Place(
    x:45.826pt,
    y:48.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(446.049pt,0.000pt), stroke:1.000pt + rgb("#435F30")),
  )
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 9
  // pptx-object: layout:Layout07:10
  #Place(
    x:568.876pt,
    y:36.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_4e17d357e914.svg",width:330.587pt,height:468.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image8_299b7b60f5.svg | shape: Graphic 10 | rect
  // pptx-object: layout:Layout07:11
  #Place(
    x:592.832pt,
    y:57.758pt,
    orientation:-0.000deg,
    child:
      scale(x:100%,y:-100%,origin:center+horizon,reflow:false,box(width:306.631pt,height:318.271pt,clip:true)[#place(top+left,dx:-96.294pt,dy:5.430pt)[#image("assets/media/image8_299b7b60f5.svg",width:419.491pt,height:407.048pt,fit:"stretch")]]),
  )
  // Source media: assets/media/image9_34ccaabcb0.svg | shape: Graphic 12 | rect
  // pptx-object: layout:Layout07:13
  #Place(
    x:677.616pt,
    y:377.139pt,
    orientation:90.000deg,
    child:
      box(width:173.398pt,height:127.120pt,clip:true)[#place(top+left,dx:-95.856pt,dy:-113.308pt)[#image("assets/media/image9_34ccaabcb0.svg",width:242.926pt,height:241.898pt,fit:"stretch")]],
  )
])
#let Layout08 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.960pt, width:462.835pt, height:90.000pt, rotation:0.000deg, font:"Century Gothic"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 3
  // pptx-object: layout:Layout08:4
  #Place(
    x:551.061pt,
    y:49.233pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_520b2c3ddb87.svg",width:354.588pt,height:211.520pt,fit:"stretch"),
  )
  // Source media: assets/media/image5_061f1b2921.svg | shape: Graphic 5 | rect
  // pptx-object: layout:Layout08:6
  #Place(
    x:467.203pt,
    y:-5.574pt,
    orientation:-90.000deg,
    child:
      box(width:191.715pt,height:186.526pt,clip:true)[#place(top+left,dx:9.769pt,dy:25.381pt)[#image("assets/media/image5_061f1b2921.svg",width:160.336pt,height:155.580pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 13
  // pptx-object: layout:Layout08:14
  #Place(
    x:551.061pt,
    y:291.990pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_520b2c3ddb87.svg",width:354.588pt,height:211.520pt,fit:"stretch"),
  )
  // Native editable PowerPoint connector: Straight Connector 22
  // pptx-object: layout:Layout08:23
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(446.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 23
  // pptx-object: layout:Layout08:24
  #Place(
    x:45.826pt,
    y:48.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(446.049pt,0.000pt), stroke:1.000pt + rgb("#435F30")),
  )
])
#let Layout09 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:128.880pt, y:77.760pt, width:642.240pt, height:207.360pt, rotation:0.000deg, align:"center", anchor:"center", font:"Century Gothic", size:48.000pt, fill:rgb("#E4EDDD")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 10
  // pptx-object: layout:Layout09:11
  #Place(
    x:45.826pt,
    y:53.384pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_ac81a9afff29.svg",width:847.779pt,height:231.701pt,fit:"stretch"),
  )
  // Native editable PowerPoint connector: Straight Connector 11
  // pptx-object: layout:Layout09:12
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Source media: assets/media/image10_79fc22641c.svg | shape: Graphic 12 | rect
  // pptx-object: layout:Layout09:13
  #Place(
    x:-0.820pt,
    y:-0.000pt,
    orientation:-0.000deg,
    child:
      scale(x:100%,y:-100%,origin:center+horizon,reflow:false,box(width:201.326pt,height:174.000pt,clip:true)[#place(top+left,dx:-52.644pt,dy:2.969pt)[#image("assets/media/image10_79fc22641c.svg",width:229.338pt,height:222.535pt,fit:"stretch")]]),
  )
  // Source media: assets/media/image4_60ac25f068.svg | shape: Graphic 13 | rect
  // pptx-object: layout:Layout09:14
  #Place(
    x:699.370pt,
    y:40.237pt,
    orientation:90.000deg,
    child:
      box(width:301.528pt,height:221.054pt,clip:true)[#place(top+left,dx:-166.688pt,dy:-197.035pt)[#image("assets/media/image4_60ac25f068.svg",width:422.432pt,height:420.646pt,fit:"stretch")]],
  )
])
#let Layout10 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:36.000pt, y:55.440pt, width:847.440pt, height:90.000pt, rotation:0.000deg, align:"left", font:"Century Gothic"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout10:6
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout10:7
  #Place(
    x:45.826pt,
    y:48.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 8
  // pptx-object: layout:Layout10:9
  #Place(
    x:45.826pt,
    y:314.533pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_ae6948501cbb.svg",width:848.049pt,height:90.837pt,fit:"stretch"),
  )
  // Source media: assets/media/image6_be51971252.svg | shape: Graphic 9 | rect
  // pptx-object: layout:Layout10:10
  #Place(
    x:686.253pt,
    y:289.688pt,
    orientation:0.000deg,
    child:
      box(width:157.360pt,height:149.664pt,clip:true)[#place(top+left,dx:-1.299pt,dy:0.000pt)[#image("assets/media/image6_be51971252.svg",width:150.302pt,height:149.664pt,fit:"stretch")]],
  )
  // Source media: assets/media/image6_be51971252.svg | shape: Graphic 10 | rect
  // pptx-object: layout:Layout10:11
  #Place(
    x:404.316pt,
    y:289.688pt,
    orientation:0.000deg,
    child:
      box(width:157.360pt,height:149.664pt,clip:true)[#place(top+left,dx:-1.299pt,dy:0.000pt)[#image("assets/media/image6_be51971252.svg",width:150.302pt,height:149.664pt,fit:"stretch")]],
  )
  // Source media: assets/media/image6_be51971252.svg | shape: Graphic 11 | rect
  // pptx-object: layout:Layout10:12
  #Place(
    x:109.495pt,
    y:289.688pt,
    orientation:0.000deg,
    child:
      box(width:157.360pt,height:149.664pt,clip:true)[#place(top+left,dx:-1.299pt,dy:0.000pt)[#image("assets/media/image6_be51971252.svg",width:150.302pt,height:149.664pt,fit:"stretch")]],
  )
])
#let Layout11 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:36.000pt, y:48.960pt, width:847.440pt, height:90.000pt, rotation:0.000deg, font:"Century Gothic"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 7
  // pptx-object: layout:Layout11:8
  #Place(
    x:48.606pt,
    y:165.246pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_f9dedfd9b0e1.svg",width:409.788pt,height:261.891pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Rectangle: Rounded Corners 8
  // pptx-object: layout:Layout11:9
  #Place(
    x:480.445pt,
    y:164.109pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_47e990027af6.svg",width:417.481pt,height:261.891pt,fit:"stretch"),
  )
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout11:6
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout11:7
  #Place(
    x:45.826pt,
    y:48.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Source media: assets/media/image11_723df3f7c8.svg | shape: Graphic 21 | rect
  // pptx-object: layout:Layout11:22
  #Place(
    x:-0.132pt,
    y:359.556pt,
    orientation:-90.000deg,
    child:
      box(width:97.476pt,height:94.838pt,clip:true)[#place(top+left,dx:4.967pt,dy:12.905pt)[#image("assets/media/image11_723df3f7c8.svg",width:81.521pt,height:79.103pt,fit:"stretch")]],
  )
])
#let Layout12 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:46.800pt, y:47.115pt, width:847.075pt, height:76.725pt, rotation:0.000deg, align:"left", font:"Century Gothic"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout12:8
  #Place(
    x:45.826pt,
    y:462.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
  // Native editable PowerPoint connector: Straight Connector 9
  // pptx-object: layout:Layout12:10
  #Place(
    x:45.826pt,
    y:47.115pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(848.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
  )
])
#let Layout13 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.960pt, width:348.835pt, height:90.000pt, rotation:0.000deg, font:"Century Gothic"),),show-master:true,children:[
  // Group: Group 3 | id: g13_4
  #Place(
    x:45.826pt,
    y:48.000pt,
    child:GroupContent(width:344.049pt,height:414.000pt,children:[
      // Native editable PowerPoint connector: Straight Connector 5
      // pptx-object: layout:Layout13:6
      #Place(
        x:0.000pt,
        y:414.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(344.049pt,0.000pt), stroke:1.000pt + rgb("#3E532A")),
      )
      // Native editable PowerPoint connector: Straight Connector 13
      // pptx-object: layout:Layout13:14
      #Place(
        x:0.000pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(344.049pt,0.000pt), stroke:1.000pt + rgb("#435F30")),
      )
    ]))
])
// Slide 01
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout01,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:282.240pt, y:41.760pt, width:612.000pt, height:225.360pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Open House", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:85.0000, line-source:"master_style", target-pitch:55.0800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Open House", font:"Century Gothic", size:54.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
    PptxPlaceholder(id:"body-10", type:"body", idx:10, x:285.840pt, y:280.080pt, width:612.000pt, height:84.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Jackson Plain Middle School\n", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Jackson Plain Middle School", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)), PptxPlaceholderParagraph(text:"", level:0, empty-size:24.000pt, empty-font:"Century Gothic", bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:0.0000pt, indent:0.0000pt))),
  ),
  children:[
])
#pagebreak()
// Slide 02
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout02,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:65.875pt, y:131.040pt, width:828.000pt, height:224.640pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Overview", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:85.0000, line-source:"master_style", target-pitch:55.0800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Overview", font:"Century Gothic", size:54.000pt, fill:rgb("#E4EDDD"), weight:"bold", italic:false),)),)),
  ),
  children:[
])
#pagebreak()
// Slide 03
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout03,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.240pt, width:373.680pt, height:414.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Meet \nthe Team", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:64.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Meet ", font:"Century Gothic", size:54.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Century Gothic", size:54.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false), PptxPlaceholderRun(text:"the Team", font:"Century Gothic", size:54.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Source media: assets/media/image12_03b471716c.png | shape: Picture Placeholder 7 | complex
    // pptx-object: slide:3:8
    #Place(
      x:591.920pt,
      y:72.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_baac1fa2a3eeac57.png",width:265.582pt,height:394.505pt,fit:"stretch"),
    )
])
#pagebreak()
// Slide 04
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout04,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:449.280pt, y:49.726pt, width:448.560pt, height:322.274pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Get Involved", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:64.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Get Involved", font:"Century Gothic", size:54.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
    PptxPlaceholder(id:"body-13", type:"body", idx:13, x:449.605pt, y:375.000pt, width:448.656pt, height:84.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Jackson Plain Middle School\n", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Jackson Plain Middle School", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)), PptxPlaceholderParagraph(text:"", level:0, empty-size:24.000pt, empty-font:"Century Gothic", bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:0.0000pt, indent:0.0000pt))),
  ),
  children:[
    // Source media: assets/media/image13_a4ac60e8d3.png | shape: Picture Placeholder 4 | complex
    // pptx-object: slide:4:5
    #Place(
      x:74.302pt,
      y:75.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_e2853ea4f503401d.png",width:294.000pt,height:402.000pt,fit:"stretch"),
    )
])
#pagebreak()
// Slide 05
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:54.000pt, y:48.960pt, width:450.000pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Class Rules", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:85.0000, line-source:"master_style", target-pitch:24.4800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Class Rules", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image14_5686775123.svg | shape: Picture Placeholder 4 | rect
    // pptx-object: slide:5:5
    #Place(
      x:671.875pt,
      y:194.320pt,
      orientation:0.000deg,
      child:
        box(width:118.080pt,height:118.080pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.063pt)[#image("assets/media/image14_5686775123.svg",width:118.080pt,height:118.205pt,fit:"stretch")]],
    )
    // Editable text: Content Placeholder 2 | Explain the behavior you expect in your classroom Your class rules might include
    // pptx-object: slide:5:3
    #Place(
      x:54.000pt,
      y:164.160pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:450.000pt,
          height:291.600pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Explain the behavior you expect in your classroom", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Your class rules might include:", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Be respectful", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Be responsible", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Follow directions", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Be punctual", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Be organized", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 6 | 5
    // pptx-object: slide:5:7
    #Place(
      x:821.875pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"5", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
// Slide 06
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout06,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:36.000pt, y:185.040pt, width:857.520pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Curriculum Goals", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:85.0000, line-source:"master_style", target-pitch:24.4800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Curriculum Goals", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Explain how students will be evaluated and graded Tell parents when report cards
    // pptx-object: slide:6:3
    #Place(
      x:36.000pt,
      y:291.600pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:848.160pt,
          height:158.400pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Explain how students will be evaluated and graded", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Tell parents when report cards and progress reports will be sent home", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 10 | 6
    // pptx-object: slide:6:11
    #Place(
      x:821.875pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"6", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout07,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.960pt, width:462.835pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Questions", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Questions", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Take questions from parents Ask parents to fill out a questionnaire about their
    // pptx-object: slide:7:3
    #Place(
      x:41.040pt,
      y:164.160pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:462.835pt,
          height:291.600pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Take questions from parents", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Ask parents to fill out a questionnaire about their middle schooler", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Have them describe areas in which they would like to see the student improve", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Have them describe the student’s personality, interests, and talents", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 8 | 7
    // pptx-object: slide:7:9
    #Place(
      x:431.510pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"7", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
// Slide 08
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout08,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.960pt, width:462.835pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"School Policies", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"School Policies", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image15_e53bd85acd.png | shape: Picture Placeholder 7 | complex
    // pptx-object: slide:8:8
    #Place(
      x:586.771pt,
      y:91.543pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_3c90b27af91dbaa6.png",width:283.168pt,height:369.657pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 3 | Explain how the school addresses academic and behavioral problems Outline the sc
    // pptx-object: slide:8:4
    #Place(
      x:41.040pt,
      y:164.160pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:462.835pt,
          height:291.600pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Explain how the school addresses academic and behavioral problems", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Outline the school's policies regarding tardiness, absence, and discipline", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Provide policy information about:", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"School cancellations for bad weather and other reasons", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Emergency procedures", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Transportation", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 12 | 8
    // pptx-object: slide:8:13
    #Place(
      x:431.510pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"8", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
// Slide 09
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout09,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:128.880pt, y:77.760pt, width:642.240pt, height:207.360pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Class Information", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:57.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Class Information", font:"Century Gothic", size:48.000pt, fill:rgb("#E4EDDD"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Explain how students will be evaluated Tell parents when report cards and progre
    // pptx-object: slide:9:3
    #Place(
      x:46.080pt,
      y:314.640pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:403.920pt,
          height:147.325pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Explain how students will be evaluated", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Tell parents when report cards and progress reports will be sent home", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Content Placeholder 3 | Describe the amount of homework students can expect Provide a calendar of upcomi
    // pptx-object: slide:9:4
    #Place(
      x:480.240pt,
      y:314.640pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:403.920pt,
          height:147.325pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Describe the amount of homework students can expect", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Provide a calendar of upcoming events, such as class field trips and parent-teacher conferences", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 8 | 9
    // pptx-object: slide:9:9
    #Place(
      x:821.875pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"9", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
// Slide 10
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout10,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:36.000pt, y:55.440pt, width:847.440pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Class Information ", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:85.0000, line-source:"master_style", target-pitch:24.4800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Class Information ", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image16_4d4880acdb.png | shape: Picture Placeholder 13 | rect
    // pptx-object: slide:10:14
    #Place(
      x:151.075pt,
      y:331.400pt,
      orientation:0.000deg,
      child:
        image("assets/media/image16_4d4880acdb.png",width:66.240pt,height:66.240pt,fit:"stretch"),
    )
    // Source media: assets/media/image17_2dd4ec6cb7.png | shape: Picture Placeholder 14 | rect
    // pptx-object: slide:10:15
    #Place(
      x:446.750pt,
      y:331.375pt,
      orientation:0.000deg,
      child:
        box(width:66.250pt,height:66.250pt,clip:true)[#place(top+left,dx:-8.874pt,dy:-8.874pt)[#image("assets/media/image17_2dd4ec6cb7.png",width:83.999pt,height:83.999pt,fit:"stretch")]],
    )
    // Source media: assets/media/image18_d673c80364.png | shape: Picture Placeholder 15 | rect
    // pptx-object: slide:10:16
    #Place(
      x:724.611pt,
      y:327.325pt,
      orientation:0.000deg,
      child:
        box(width:66.240pt,height:66.240pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.293pt)[#image("assets/media/image18_d673c80364.png",width:66.240pt,height:66.827pt,fit:"stretch")]],
    )
    // Editable text: Content Placeholder 2 | Explain how students will be evaluated Tell parents when report cards and progre
    // pptx-object: slide:10:3
    #Place(
      x:46.080pt,
      y:162.720pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:403.920pt,
          height:129.165pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Explain how students will be evaluated", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Tell parents when report cards and progress reports will be sent home", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),))),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Content Placeholder 3 | Suggest ways that parents can help their middle schooler learn Use more than one
    // pptx-object: slide:10:4
    #Place(
      x:480.240pt,
      y:162.720pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:403.920pt,
          height:129.165pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Suggest ways that parents can help their middle schooler learn", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Use more than one slide to cover this information", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),))),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 17 | 10
    // pptx-object: slide:10:18
    #Place(
      x:821.875pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"10", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
// Slide 11
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout11,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:36.000pt, y:48.960pt, width:847.440pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Get Involved ", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Get Involved ", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 1 | List opportunities for parents to become involved in volunteer programs, advisor
    // pptx-object: slide:11:2
    #Place(
      x:67.500pt,
      y:182.192pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:372.000pt,
          height:228.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"List opportunities for parents to become involved in volunteer programs, advisory councils, ", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"and the PTA", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false))),),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#FFFFFF"),
          weight:"bold",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | Provide sign-up sheets for parents who are interested in helping with field tr
    // pptx-object: slide:11:3
    #Place(
      x:503.580pt,
      y:182.192pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:372.000pt,
          height:228.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, after-kind:"points", after-value:6.0000, after-source:"layout", after:6.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Provide sign-up sheets for ", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"parents who are interested ", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"in helping with field trips ", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"or fundraising projects ", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false), PptxPlaceholderRun(text:"for your class", font:"Century Gothic", size:18.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false))),),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#FFFFFF"),
          weight:"bold",
          anchor:"top",
          autofit-mode:"none",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 20 | 11
    // pptx-object: slide:11:21
    #Place(
      x:821.875pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"11", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
// Slide 12
#PptxSlide(
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout12,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:46.800pt, y:47.115pt, width:847.075pt, height:76.725pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Table", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:85.0000, line-source:"master_style", target-pitch:24.4800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Table", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable PowerPoint table: Table 9
    // pptx-object: slide:12:12
    #Place(
      x:46.750pt,
      y:142.500pt,
      orientation:0.000deg,
      child:
        table(columns:(276.026pt, 147.999pt, 212.012pt, 212.012pt),rows:(32.667pt, 32.667pt, 32.667pt, 32.667pt, 32.667pt, 32.667pt, 32.667pt, 32.667pt, 32.667pt),gutter:0pt,stroke:none,table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "bold", fill: rgb("#FFFFFF"), "Year 1")],
          table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "bold", fill: rgb("#FFFFFF"), "Year 2")],
          table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "bold", fill: rgb("#FFFFFF"), "Year 3")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Income")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Users")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "50,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "400,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "1,600,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Sales")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "500,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "4,000,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "16,000,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Average price per sale")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "75")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "80")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "90")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Revenue @ 15%")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "5,625,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "48,000,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "216,000,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Gross profit")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "5,625,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "48,000,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "216,000,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Expenses")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "Sales & marketing")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "5,062,500")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "38,400,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Arial", size: 18.00pt, weight: "regular", fill: rgb("#000000"), "151,200,000")]),
    )
    // Editable text: Slide Number Placeholder 13 | 12
    // pptx-object: slide:12:14
    #Place(
      x:821.875pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"12", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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
  width:959.750pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout13,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:41.040pt, y:48.960pt, width:348.835pt, height:90.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Questions ", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Questions ", font:"Century Gothic", size:24.000pt, fill:rgb("#3E532A"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable PowerPoint table: Table 9
    // pptx-object: slide:13:8
    #Place(
      x:432.750pt,
      y:47.500pt,
      orientation:0.000deg,
      child:
        table(columns:(161.155pt, 86.408pt, 123.781pt, 123.781pt),rows:(50.667pt, 50.667pt, 50.667pt, 50.667pt, 50.667pt, 50.667pt, 50.667pt, 50.667pt, 50.667pt),gutter:0pt,stroke:none,table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "bold", fill: rgb("#FFFFFF"), "Year 1")],
          table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "bold", fill: rgb("#FFFFFF"), "Year 2")],
          table.cell(fill:rgb("#5D7C3F"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "bold", fill: rgb("#FFFFFF"), "Year 3")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Income")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Users")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "50,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "400,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "1,600,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Sales")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "500,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "4,000,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "16,000,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Average price per sale")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "75")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "80")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "90")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Revenue @ 15%")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "5,625,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "48,000,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "216,000,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Gross profit")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "5,625,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "48,000,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "216,000,000")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Expenses")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:14.935pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "Sales & marketing")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "5,062,500")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "38,400,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 0.500pt + rgb("#FFFFFF"), bottom: 0.500pt + rgb("#FFFFFF")),inset:(x:7.198pt,y:3.599pt),align:left + horizon)[#text(font: "Century Gothic", size: 16.00pt, weight: "regular", fill: rgb("#000000"), "151,200,000")]),
    )
    // Editable text: Content Placeholder 2 | Take questions from parents Ask parents to fill out a questionnaire about their
    // pptx-object: slide:13:3
    #Place(
      x:41.040pt,
      y:164.160pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:349.200pt,
          height:291.600pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Take questions from parents", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Ask parents to fill out a questionnaire about their middle schooler", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Have them describe areas in which they would like to see the student improve", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(level:1, bullet:"o", bullet-font:"Courier New", bullet-size:18.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:10.6600, before-source:"master_style", before:10.6600pt, margin-left:57.5899pt, indent:-23.9958pt, runs:(PptxPlaceholderRun(text:"Have them describe the student’s personality, interests, and talents", font:"Century Gothic", size:18.000pt, fill:rgb("#3E532A"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Century Gothic", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:20.5200pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt)),
          font:"Century Gothic",
          size:18.000pt,
          fill:rgb("#3E532A"),
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
    // Editable text: Slide Number Placeholder 9 | 13
    // pptx-object: slide:13:10
    #Place(
      x:325.475pt,
      y:487.440pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:72.365pt,
          height:16.560pt,
          paragraphs:(PptxParagraph(text:"13", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#433056"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-size-kind:"percent", bullet-size-value:100.0000, bullet-size-source:"master_style", bullet-fill-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:95.0000, line-source:"master_style", target-pitch:22.8000pt, before-kind:"points", before-value:18.6600, before-source:"master_style", before:18.6600pt, margin-left:23.9958pt, indent:-23.9958pt),),
          font:"Century Gothic",
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