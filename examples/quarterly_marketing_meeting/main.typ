// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, PptxMaster, PptxLayout, PptxSlide, PptxPlaceholderSlot, PptxPlaceholder, PptxParagraph, PptxTextFrame, PptxPlaceholderParagraph, PptxPlaceholderRun, PptxLine, Place, GroupContent, ClipContent
#let ppt-format=(width:960.000pt,height:540.000pt)
#set page(width:960.000pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:"Arial",size:20pt,fill:black)

#let Master01 = PptxMaster(fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:28.750pt, width:828.000pt, height:104.375pt, rotation:0.000deg, align:"left", margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"center", font:"Berlin Sans FB"), PptxPlaceholderSlot(id:"body-1", type:"body", idx:1, x:66.000pt, y:143.750pt, width:828.000pt, height:318.762pt, rotation:0.000deg, margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, font:"Calibri")),children:[
])
#let Layout01 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:43.875pt, y:159.633pt, width:474.713pt, height:320.018pt, rotation:0.000deg, align:"left", anchor:"bottom", font:"Berlin Sans FB", size:54.000pt, weight:"regular", fill:rgb("#EAE8E8")), PptxPlaceholderSlot(id:"body-13", type:"body", idx:13, x:135.375pt, y:62.435pt, width:383.213pt, height:72.000pt, rotation:0.000deg, align:"left", anchor:"center", font:"Calibri", size:18.000pt, weight:"regular", fill:rgb("#EBDDC3"))),show-master:true,children:[
  // Source media: assets/media/image1_1a23b57b91.svg | shape: Graphic 31 | rect
  // pptx-object: layout:Layout01:32
  #Place(
    x:356.364pt,
    y:262.788pt,
    orientation:-14.989deg,
    child:
      image("assets/media/image1_1a23b57b91.svg",width:209.424pt,height:209.424pt,fit:"stretch"),
  )
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 32 | rect
  // pptx-object: layout:Layout01:33
  #Place(
    x:0.000pt,
    y:129.784pt,
    orientation:0.000deg,
    child:
      box(width:187.470pt,height:144.375pt,clip:true)[#place(top+left,dx:-57.298pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.768pt,height:144.375pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_7c0e818f4a.svg | shape: Graphic 34 | rect
  // pptx-object: layout:Layout01:35
  #Place(
    x:321.073pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:120.339pt,height:145.735pt,clip:true)[#place(top+left,dx:0.000pt,dy:-17.263pt)[#image("assets/media/image3_7c0e818f4a.svg",width:120.339pt,height:162.998pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Freeform: Shape 30
  // pptx-object: layout:Layout01:31
  #Place(
    x:510.615pt,
    y:-0.417pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c436dd8ce805.svg",width:208.917pt,height:540.833pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Rectangle 36
  // pptx-object: layout:Layout01:37
  #Place(
    x:682.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_560596a583ee.svg",width:278.000pt,height:541.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image4_dc27eb1a84.svg | shape: Graphic 23 | rect
  // pptx-object: layout:Layout01:24
  #Place(
    x:43.875pt,
    y:55.310pt,
    orientation:0.000deg,
    child:
      image("assets/media/image4_dc27eb1a84.svg",width:84.226pt,height:84.226pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 16
  // pptx-object: layout:Layout01:17
  #Place(
    x:104.908pt,
    y:427.613pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_036db51bf8ed.svg",width:113.698pt,height:112.387pt,fit:"stretch"),
  )
])
#let Layout02 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:581.400pt, height:142.170pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 16
  // pptx-object: layout:Layout02:17
  #Place(
    x:603.700pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_10265b29576a.svg",width:356.800pt,height:541.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image5_c40c069a6d.svg | shape: Graphic 12 | rect
  // pptx-object: layout:Layout02:13
  #Place(
    x:648.295pt,
    y:224.775pt,
    orientation:14.624deg,
    child:
      image("assets/media/image5_c40c069a6d.svg",width:144.066pt,height:175.623pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 14
  // pptx-object: layout:Layout02:15
  #Place(
    x:511.828pt,
    y:-0.417pt,
    orientation:180.000deg,
    child:
      image("assets/media/shape_0d5e939dfda0.svg",width:208.917pt,height:540.833pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Rectangle 15
  // pptx-object: layout:Layout02:16
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_19a13ae8718e.svg",width:532.000pt,height:541.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image6_37fd9fbd3c.svg | shape: Graphic 18 | rect
  // pptx-object: layout:Layout02:19
  #Place(
    x:687.900pt,
    y:433.331pt,
    orientation:0.000deg,
    child:
      box(width:165.682pt,height:106.669pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image6_37fd9fbd3c.svg",width:165.682pt,height:143.030pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Freeform: Shape 10
  // pptx-object: layout:Layout02:11
  #Place(
    x:707.368pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_5f521b8ee6b8.svg",width:252.632pt,height:323.160pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 19
  // pptx-object: layout:Layout02:20
  #Place(
    x:866.349pt,
    y:337.661pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_d5e2f1bcad9c.svg",width:93.651pt,height:126.795pt,fit:"stretch"),
  )
])
#let Layout03 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:43.875pt, y:159.633pt, width:474.713pt, height:320.018pt, rotation:0.000deg, align:"left", anchor:"bottom", font:"Berlin Sans FB", size:44.000pt, weight:"regular", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Freeform: Shape 15
  // pptx-object: layout:Layout03:16
  #Place(
    x:468.552pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_f3ec7d23b26d.svg",width:491.948pt,height:541.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image7_42fb22fd6a.svg | shape: Graphic 49 | rect
  // pptx-object: layout:Layout03:50
  #Place(
    x:0.000pt,
    y:277.941pt,
    orientation:0.000deg,
    child:
      box(width:173.482pt,height:165.750pt,clip:true)[#place(top+left,dx:-18.518pt,dy:0.000pt)[#image("assets/media/image7_42fb22fd6a.svg",width:192.000pt,height:165.750pt,fit:"stretch")]],
  )
  // Source media: assets/media/image8_583511fef8.svg | shape: Graphic 50 | rect
  // pptx-object: layout:Layout03:51
  #Place(
    x:233.075pt,
    y:116.436pt,
    orientation:12.045deg,
    child:
      image("assets/media/image8_583511fef8.svg",width:147.750pt,height:192.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image9_ee34313f19.svg | shape: Graphic 51 | rect
  // pptx-object: layout:Layout03:52
  #Place(
    x:310.212pt,
    y:364.174pt,
    orientation:0.000deg,
    child:
      box(width:192.000pt,height:175.826pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image9_ee34313f19.svg",width:192.000pt,height:192.000pt,fit:"stretch")]],
  )
  // Source media: assets/media/image4_dc27eb1a84.svg | shape: Graphic 23 | rect
  // pptx-object: layout:Layout03:24
  #Place(
    x:43.875pt,
    y:55.310pt,
    orientation:0.000deg,
    child:
      image("assets/media/image4_dc27eb1a84.svg",width:84.226pt,height:84.226pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 11
  // pptx-object: layout:Layout03:12
  #Place(
    x:30.963pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_584ec81e9869.svg",width:193.999pt,height:118.050pt,fit:"stretch"),
  )
])
#let Layout04 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:320.400pt, y:67.192pt, width:581.400pt, height:142.170pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 16
  // pptx-object: layout:Layout04:17
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_2a61986cc85c.svg",width:257.800pt,height:541.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image1_1a23b57b91.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout04:9
  #Place(
    x:62.124pt,
    y:191.856pt,
    orientation:-14.989deg,
    child:
      image("assets/media/image1_1a23b57b91.svg",width:209.424pt,height:209.424pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 14
  // pptx-object: layout:Layout04:15
  #Place(
    x:166.420pt,
    y:-0.417pt,
    orientation:-0.000deg,
    child:
      image("assets/media/shape_0d5e939dfda0.svg",width:208.917pt,height:540.833pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Rectangle 7
  // pptx-object: layout:Layout04:8
  #Place(
    x:296.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_64a04a9b67af.svg",width:664.000pt,height:541.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 9 | rect
  // pptx-object: layout:Layout04:10
  #Place(
    x:0.000pt,
    y:23.625pt,
    orientation:0.000deg,
    child:
      box(width:187.470pt,height:144.375pt,clip:true)[#place(top+left,dx:-57.298pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.768pt,height:144.375pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Freeform: Shape 26
  // pptx-object: layout:Layout04:27
  #Place(
    x:0.000pt,
    y:410.456pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_445df2c6bfef.svg",width:105.486pt,height:129.544pt,fit:"stretch"),
  )
])
#let Layout05 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:134.187pt, y:267.724pt, width:691.625pt, height:198.611pt, rotation:0.000deg, align:"center", anchor:"top", font:"Berlin Sans FB", size:44.000pt, weight:"regular", fill:rgb("#F2F2F2")), PptxPlaceholderSlot(id:"body-13", type:"body", idx:13, x:179.938pt, y:152.684pt, width:600.125pt, height:72.000pt, rotation:0.000deg, align:"center", anchor:"bottom", font:"Calibri", size:18.000pt, weight:"regular", fill:rgb("#EBDDC3"))),show-master:true,children:[
  // Source media: assets/media/image10_d61936ec21.svg | shape: Graphic 49 | rect
  // pptx-object: layout:Layout05:50
  #Place(
    x:0.114pt,
    y:311.681pt,
    orientation:0.000deg,
    child:
      box(width:173.482pt,height:165.750pt,clip:true)[#place(top+left,dx:-18.518pt,dy:0.000pt)[#image("assets/media/image10_d61936ec21.svg",width:192.000pt,height:165.750pt,fit:"stretch")]],
  )
  // Source media: assets/media/image11_cada0dced8.svg | shape: Graphic 50 | rect
  // pptx-object: layout:Layout05:51
  #Place(
    x:53.065pt,
    y:51.640pt,
    orientation:12.045deg,
    child:
      image("assets/media/image11_cada0dced8.svg",width:147.750pt,height:192.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image12_4b742b9d55.svg | shape: Graphic 51 | rect
  // pptx-object: layout:Layout05:52
  #Place(
    x:189.926pt,
    y:421.462pt,
    orientation:0.000deg,
    child:
      box(width:192.000pt,height:118.538pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.002pt)[#image("assets/media/image12_4b742b9d55.svg",width:192.000pt,height:192.001pt,fit:"stretch")]],
  )
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 4 | rect
  // pptx-object: layout:Layout05:5
  #Place(
    x:693.806pt,
    y:199.720pt,
    orientation:0.000deg,
    child:
      box(width:246.576pt,height:144.375pt,clip:true)[#place(top+left,dx:1.809pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.770pt,height:144.375pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_7c0e818f4a.svg | shape: Graphic 6 | rect
  // pptx-object: layout:Layout05:7
  #Place(
    x:642.068pt,
    y:-1.537pt,
    orientation:0.000deg,
    child:
      box(width:120.339pt,height:145.735pt,clip:true)[#place(top+left,dx:0.000pt,dy:-17.263pt)[#image("assets/media/image3_7c0e818f4a.svg",width:120.339pt,height:162.998pt,fit:"stretch")]],
  )
  // Source media: assets/media/image13_2d48d3985b.svg | shape: Graphic 7 | rect
  // pptx-object: layout:Layout05:8
  #Place(
    x:210.628pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:538.744pt,height:540.000pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image13_2d48d3985b.svg",width:539.997pt,height:540.000pt,fit:"stretch")]],
  )
  // Source media: assets/media/image14_adc5562936.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout05:9
  #Place(
    x:846.515pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:113.485pt,height:161.195pt,clip:true)[#place(top+left,dx:0.000pt,dy:-61.999pt)[#image("assets/media/image14_adc5562936.svg",width:208.371pt,height:223.193pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Freeform: Shape 17
  // pptx-object: layout:Layout05:18
  #Place(
    x:208.596pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_9bb623cf3145.svg",width:190.035pt,height:78.109pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 27
  // pptx-object: layout:Layout05:28
  #Place(
    x:877.679pt,
    y:444.037pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_5cbb463b6c27.svg",width:82.321pt,height:95.963pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 43
  // pptx-object: layout:Layout05:44
  #Place(
    x:644.882pt,
    y:419.351pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_d45950bec055.svg",width:113.698pt,height:120.649pt,fit:"stretch"),
  )
])
#let Layout06 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, weight:"bold", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 15
  // pptx-object: layout:Layout06:16
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Graphic 32
  // pptx-object: layout:Layout06:8
  #Place(
    x:18.180pt,
    y:16.511pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"),
  )
])
#let Layout07 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:581.400pt, height:142.170pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Freeform: Shape 6
  // pptx-object: layout:Layout07:7
  #Place(
    x:658.364pt,
    y:-0.417pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_3564365a8460.svg",width:302.052pt,height:540.833pt,fit:"stretch"),
  )
])
#let Layout08 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, weight:"bold", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 12
  // pptx-object: layout:Layout08:13
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Graphic 32
  // pptx-object: layout:Layout08:34
  #Place(
    x:18.180pt,
    y:16.511pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"),
  )
])
#let Layout09 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, weight:"bold", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 8
  // pptx-object: layout:Layout09:9
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Graphic 32
  // pptx-object: layout:Layout09:3
  #Place(
    x:18.180pt,
    y:16.511pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"),
  )
])
#let Layout10 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, weight:"bold", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 8
  // pptx-object: layout:Layout10:9
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Graphic 32
  // pptx-object: layout:Layout10:3
  #Place(
    x:18.180pt,
    y:16.511pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"),
  )
])
#let Layout11 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:134.187pt, y:170.695pt, width:691.625pt, height:198.611pt, rotation:0.000deg, align:"center", anchor:"center", font:"Berlin Sans FB", size:44.000pt, weight:"regular", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Source media: assets/media/image10_d61936ec21.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout11:9
  #Place(
    x:0.114pt,
    y:311.681pt,
    orientation:0.000deg,
    child:
      box(width:173.482pt,height:165.750pt,clip:true)[#place(top+left,dx:-18.518pt,dy:0.000pt)[#image("assets/media/image10_d61936ec21.svg",width:192.000pt,height:165.750pt,fit:"stretch")]],
  )
  // Source media: assets/media/image11_cada0dced8.svg | shape: Graphic 9 | rect
  // pptx-object: layout:Layout11:10
  #Place(
    x:53.065pt,
    y:51.640pt,
    orientation:12.045deg,
    child:
      image("assets/media/image11_cada0dced8.svg",width:147.750pt,height:192.000pt,fit:"stretch"),
  )
  // Source media: assets/media/image12_4b742b9d55.svg | shape: Graphic 10 | rect
  // pptx-object: layout:Layout11:11
  #Place(
    x:189.926pt,
    y:421.462pt,
    orientation:0.000deg,
    child:
      box(width:192.000pt,height:118.538pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.002pt)[#image("assets/media/image12_4b742b9d55.svg",width:192.000pt,height:192.001pt,fit:"stretch")]],
  )
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 13 | rect
  // pptx-object: layout:Layout11:14
  #Place(
    x:693.806pt,
    y:199.720pt,
    orientation:0.000deg,
    child:
      box(width:246.576pt,height:144.375pt,clip:true)[#place(top+left,dx:1.809pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.770pt,height:144.375pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_7c0e818f4a.svg | shape: Graphic 15 | rect
  // pptx-object: layout:Layout11:16
  #Place(
    x:642.068pt,
    y:-1.537pt,
    orientation:0.000deg,
    child:
      box(width:120.339pt,height:145.735pt,clip:true)[#place(top+left,dx:0.000pt,dy:-17.263pt)[#image("assets/media/image3_7c0e818f4a.svg",width:120.339pt,height:162.998pt,fit:"stretch")]],
  )
  // Source media: assets/media/image14_adc5562936.svg | shape: Graphic 16 | rect
  // pptx-object: layout:Layout11:17
  #Place(
    x:846.515pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:113.485pt,height:161.195pt,clip:true)[#place(top+left,dx:0.000pt,dy:-61.999pt)[#image("assets/media/image14_adc5562936.svg",width:208.371pt,height:223.193pt,fit:"stretch")]],
  )
  // Source media: assets/media/image13_2d48d3985b.svg | shape: Graphic 7 | rect
  // pptx-object: layout:Layout11:8
  #Place(
    x:210.628pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:538.744pt,height:540.000pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image13_2d48d3985b.svg",width:539.997pt,height:540.000pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Freeform: Shape 21
  // pptx-object: layout:Layout11:22
  #Place(
    x:208.596pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_808dd51a96d4.svg",width:189.756pt,height:78.109pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 32
  // pptx-object: layout:Layout11:33
  #Place(
    x:877.679pt,
    y:444.037pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_5cbb463b6c27.svg",width:82.321pt,height:95.963pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 47
  // pptx-object: layout:Layout11:48
  #Place(
    x:644.882pt,
    y:419.351pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_3144ce6ddb1a.svg",width:113.698pt,height:120.649pt,fit:"stretch"),
  )
])
#let Layout12 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, anchor:"top", font:"Berlin Sans FB", size:36.000pt, weight:"bold", fill:rgb("#F2F2F2")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 12
  // pptx-object: layout:Layout12:13
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Graphic 32
  // pptx-object: layout:Layout12:34
  #Place(
    x:18.180pt,
    y:16.511pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"),
  )
])
#let Layout13 = PptxLayout(master:Master01,fill:rgb("#334031"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:189.300pt, y:79.800pt, width:581.400pt, height:175.654pt, rotation:0.000deg, align:"center", anchor:"bottom", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#FFFFFF")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rectangle 16
  // pptx-object: layout:Layout13:17
  #Place(
    x:-0.500pt,
    y:-0.500pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_0a87422a1b3e.svg",width:958.764pt,height:541.000pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 31
  // pptx-object: layout:Layout13:32
  #Place(
    x:0.000pt,
    y:425.809pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_34c397a5621b.svg",width:136.069pt,height:114.191pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 40
  // pptx-object: layout:Layout13:41
  #Place(
    x:872.435pt,
    y:241.161pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_b60f083cfce3.svg",width:87.565pt,height:126.795pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 37
  // pptx-object: layout:Layout13:38
  #Place(
    x:0.000pt,
    y:225.746pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_d35b14c6015d.svg",width:189.270pt,height:126.161pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 19
  // pptx-object: layout:Layout13:20
  #Place(
    x:777.492pt,
    y:393.084pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_710d93559f07.svg",width:140.659pt,height:146.916pt,fit:"stretch"),
  )
  // Source media: assets/media/image15_7a592df3d2.svg | shape: Graphic 11 | rect
  // pptx-object: layout:Layout13:12
  #Place(
    x:831.088pt,
    y:36.449pt,
    orientation:14.624deg,
    child:
      image("assets/media/image15_7a592df3d2.svg",width:144.066pt,height:175.623pt,fit:"stretch"),
  )
  // Source media: assets/media/image10_d61936ec21.svg | shape: Graphic 18 | rect
  // pptx-object: layout:Layout13:19
  #Place(
    x:0.000pt,
    y:49.147pt,
    orientation:0.000deg,
    child:
      box(width:148.748pt,height:141.353pt,clip:true)[#place(top+left,dx:-16.934pt,dy:0.000pt)[#image("assets/media/image10_d61936ec21.svg",width:165.683pt,height:143.029pt,fit:"stretch")]],
  )
  // Source media: assets/media/image16_a7107c6dad.svg | shape: Graphic 12 | rect
  // pptx-object: layout:Layout13:13
  #Place(
    x:648.295pt,
    y:224.775pt,
    orientation:14.624deg,
    child:
      image("assets/media/image16_a7107c6dad.svg",width:144.066pt,height:175.623pt,fit:"stretch"),
  )
  // Original editable PowerPoint shape: Freeform: Shape 10
  // pptx-object: layout:Layout13:11
  #Place(
    x:80.687pt,
    y:-0.417pt,
    orientation:180.000deg,
    child:
      image("assets/media/shape_c4cd1f33172c.svg",width:798.626pt,height:540.833pt,fit:"stretch"),
  )
])
// Slide 01
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout01,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:43.875pt, y:159.633pt, width:474.713pt, height:320.018pt, rotation:0.000deg, anchor:"bottom", autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Quarterly marketing meeting", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:58.3200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Quarterly marketing meeting", font:"Berlin Sans FB", size:54.000pt, fill:rgb("#EAE8E8"), weight:"regular", italic:false),)),)),
    PptxPlaceholder(id:"body-13", type:"body", idx:13, x:135.375pt, y:62.435pt, width:383.213pt, height:72.000pt, rotation:0.000deg, margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"center", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"NORTHWIND TRADERS", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:19.4400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"NORTHWIND TRADERS", font:"Calibri", size:18.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image17_aceb3da99c.jpg | shape: Picture Placeholder 10 | complex
    // pptx-object: slide:1:11
    #Place(
      x:564.250pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_ce73af6474f6d8dc.png",width:395.750pt,height:540.000pt,fit:"stretch"),
    )
])
#pagebreak()
// Slide 02
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout02,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:581.400pt, height:142.170pt, rotation:0.000deg, anchor:"top", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Agenda", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Agenda", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Growth strategy Market analysis Financial overview Innovative solutions Future i
    // pptx-object: slide:2:3
    #Place(
      x:66.046pt,
      y:229.631pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:538.200pt,
          height:223.969pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:34.5600pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Growth strategy", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:34.5600pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Market analysis", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:34.5600pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Financial overview", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:34.5600pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Innovative solutions", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:34.5600pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Future initiatives", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 3 | 2
    // pptx-object: slide:2:4
    #Place(
      x:313.515pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"2", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
// Slide 03
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout03,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:43.875pt, y:159.633pt, width:474.713pt, height:320.018pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Strategies \nfor growth", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Strategies ", font:"Berlin Sans FB", size:44.000pt, fill:rgb("#F2F2F2"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:44.000pt, fill:rgb("#F2F2F2"), weight:"regular", italic:false), PptxPlaceholderRun(text:"for growth", font:"Berlin Sans FB", size:44.000pt, fill:rgb("#F2F2F2"), weight:"regular", italic:false))),)),
  ),
  children:[
    // Source media: assets/media/image18_b33e26a03b.jpg | shape: Picture Placeholder 14 | complex
    // pptx-object: slide:3:30
    #Place(
      x:496.625pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_8d48d4fb6eae9d0f.png",width:463.375pt,height:540.000pt,fit:"stretch"),
    )
])
#pagebreak()
// Slide 04
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout04,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:320.400pt, y:67.192pt, width:581.400pt, height:142.170pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Current market \nanalysis", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Current market ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"analysis", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Data reveals a steady increase in consumer demand for sustainable products, pres
    // pptx-object: slide:4:3
    #Place(
      x:320.400pt,
      y:223.800pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:581.400pt,
          height:229.800pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Data reveals a steady increase in consumer demand for sustainable products, presenting an opportunity for our co-friendly offerings.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our competitors are now focusing on digital marketing strategies, suggesting a shift in consumer behavior.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Understanding these nuanced dynamics positions us to adapt and capitalize on emerging market preferences.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 3 | 4
    // pptx-object: slide:4:4
    #Place(
      x:606.588pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"4", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:134.187pt, y:267.724pt, width:691.625pt, height:198.611pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Market expansion", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Market expansion", font:"Berlin Sans FB", size:44.000pt, fill:rgb("#F2F2F2"), weight:"regular", italic:false),)),)),
    PptxPlaceholder(id:"body-13", type:"body", idx:13, x:179.938pt, y:152.684pt, width:600.125pt, height:72.000pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Unlocking new horizons", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:19.4400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Unlocking new horizons", font:"Calibri", size:18.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)),)),
  ),
  children:[
])
#pagebreak()
// Slide 06
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout06,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Product launch \ntimeline", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Product launch ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"timeline", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // SmartArt layout drawing: Content Placeholder 16
    // pptx-object: slide:6:17
    #Place(
      x:448.500pt,
      y:164.875pt,
      orientation:0.000deg,
      child:
        image("assets/media/smartart_0a46e8230802.svg",width:445.750pt,height:308.125pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 2 | Currently gearing up for a ground-breaking launch Our new offerings will captiv
    // pptx-object: slide:6:3
    #Place(
      x:66.000pt,
      y:203.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:332.400pt,
          height:250.302pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Currently gearing up for a ground-breaking launch ", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Our new offerings will captivate the market", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Our marketing campaign will generate anticipation", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 3 | 6
    // pptx-object: slide:6:4
    #Place(
      x:458.368pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"6", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout07,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:581.400pt, height:142.170pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Marketing \nstrategies", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Marketing ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"strategies", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Source media: assets/media/image19_366ddc801f.png | shape: Picture Placeholder 19 | complex
    // pptx-object: slide:7:20
    #Place(
      x:713.750pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_c8facf7e1b0d0704.png",width:246.250pt,height:540.000pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 2 | Implement personalized engagement strategies Tailor campaigns to resonate with s
    // pptx-object: slide:7:3
    #Place(
      x:66.000pt,
      y:229.631pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:538.200pt,
          height:223.969pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Implement personalized engagement strategies", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Tailor campaigns to resonate with specific demographics, fostering a sense of relevance ", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false), PptxPlaceholderRun(text:"and connection", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false))), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Collaborate with influencers and thought leaders ", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false), PptxPlaceholderRun(text:"to amplify our brand message", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false)))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 3 | 7
    // pptx-object: slide:7:4
    #Place(
      x:313.468pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"7", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout08,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Financial \noverview", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Financial ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"overview", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Our financial overview reflects a robust and resilient fiscal performance. Opera
    // pptx-object: slide:8:3
    #Place(
      x:66.000pt,
      y:203.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:275.400pt,
          height:250.302pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:26.6400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our financial overview reflects a robust and resilient fiscal performance.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:26.6400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Operating margins have improved, signaling operational efficiency, while strengthening our reserves.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:24.000pt, empty-font:"Calibri", bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:26.6400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt)),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:0.92500,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 3 | This underscores our commitment to financial stability, positioning us for susta
    // pptx-object: slide:8:4
    #Place(
      x:370.800pt,
      y:203.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:523.200pt,
          height:250.302pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"right", align-source:"master", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"This underscores our commitment to financial stability, positioning us for sustained growth. ", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"right", align-source:"master", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Key indicators show consistent revenue growth over the past quarter, attributed to strategic cost management and successful marketing.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:24.000pt, empty-font:"Calibri", bullet-kind:"char", bullet-source:"layout", align:"right", align-source:"master", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt)),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 4 | 8
    // pptx-object: slide:8:5
    #Place(
      x:458.368pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"8", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout09,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Quarterly \ntargets", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Quarterly ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"targets", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Editable PowerPoint table: Table Placeholder 2
    // pptx-object: slide:9:12
    #Place(
      x:418.250pt,
      y:208.750pt,
      orientation:0.000deg,
      child:
        table(columns:(118.937pt, 118.937pt, 118.937pt, 118.937pt),rows:(72.050pt, 45.450pt, 45.450pt, 45.450pt, 45.450pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Quarter")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Revenue ")#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "growth (%)")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Market share increase (%)")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Customer acquisition")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q1")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "12")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "2")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "500")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q2")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "15")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "3")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "600")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q3")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "18")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "4")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "700")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q4")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "20")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "5")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "800")]),
    )
    // Editable text: Content Placeholder 7 | Market expansion Product innovation Customer retention Operational efficiency
    // pptx-object: slide:9:8
    #Place(
      x:66.019pt,
      y:208.800pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:322.781pt,
          height:250.302pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Market expansion", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Product innovation", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Customer retention", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Operational efficiency", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 3 | 9
    // pptx-object: slide:9:4
    #Place(
      x:458.368pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"9", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout10,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Financial \nsnapshot", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Financial ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"snapshot", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Editable PowerPoint table: Table Placeholder 3
    // pptx-object: slide:10:10
    #Place(
      x:66.000pt,
      y:208.750pt,
      orientation:0.000deg,
      child:
        table(columns:(207.000pt, 207.000pt, 207.000pt, 207.000pt),rows:(42.600pt, 42.600pt, 42.600pt, 42.600pt, 42.600pt, 42.600pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Metric")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Current value")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Previous quarter")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Change (%)")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Revenue")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$2,500,000")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$2,200,000")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+14%")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Operating expenses")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$1,200,000")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$1,400,000")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "-14%")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Net profit")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$1,000,000")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$800,000")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+25%")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Operating margin")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "40%")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "36%")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+4%")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Cash reserves")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$5,000,000")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$4,500,000")],
          table.cell(fill:rgb("#DD804733"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+11%")]),
    )
    // Editable text: Slide Number Placeholder 2 | 10
    // pptx-object: slide:10:3
    #Place(
      x:458.368pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"10", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout11,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:134.187pt, y:170.695pt, width:691.625pt, height:198.611pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Innovative solutions", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Innovative solutions", font:"Berlin Sans FB", size:44.000pt, fill:rgb("#F2F2F2"), weight:"regular", italic:false),)),)),
  ),
  children:[
])
#pagebreak()
// Slide 12
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout12,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:66.000pt, y:67.192pt, width:828.000pt, height:108.440pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Future \ninitiatives", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Future ", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"\n", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false), PptxPlaceholderRun(text:"initiatives", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#F2F2F2"), weight:"bold", italic:false))),)),
  ),
  children:[
    // Editable text: Content Placeholder 3 | Product enhancement. Introduce regular updates and features to enhance product o
    // pptx-object: slide:12:4
    #Place(
      x:66.000pt,
      y:203.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:523.200pt,
          height:274.140pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"right", align-source:"master", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Product enhancement. Introduce regular updates and features to enhance product offerings.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"right", align-source:"master", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Technology integration. Explore emerging technologies for potential integration into ", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false), PptxPlaceholderRun(text:"our operations.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false))), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"right", align-source:"master", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Collaborative partnerships. Foster collaborations with tech innovators and industry leaders to drive innovation.", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 2 | Green supply chain Reduced carbon footprint Waste reduction Water conservation
    // pptx-object: slide:12:3
    #Place(
      x:618.600pt,
      y:203.550pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:275.400pt,
          height:274.140pt,
          paragraphs:(PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Green supply chain", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Reduced carbon footprint", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Waste reduction", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet:"•", bullet-font:"Arial", bullet-size:24.000pt, bullet-fill:rgb("#EBDDC3"), bullet-weight:"regular", bullet-font-source:"layout", bullet-kind:"char", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:27.0000pt, indent:-27.0000pt, runs:(PptxPlaceholderRun(text:"Water conservation", font:"Calibri", size:24.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"shrink",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 4 | 12
    // pptx-object: slide:12:5
    #Place(
      x:458.368pt,
      y:485.822pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:43.263pt,
          height:28.750pt,
          paragraphs:(PptxParagraph(text:"12", level:0, bullet:"•", bullet-font:"Arial", bullet-size:20.000pt, bullet-fill:rgb("#FFFFFF"), bullet-weight:"regular", bullet-font-source:"master_style", bullet-kind:"char", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:18.0000pt, indent:-18.0000pt),),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#FFFFFF"),
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
  fill:rgb("#334031"),
  format:ppt-format,
  layout:Layout13,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:189.300pt, y:79.800pt, width:581.400pt, height:175.654pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Thank you", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:38.8800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Thank you", font:"Berlin Sans FB", size:36.000pt, fill:rgb("#FFFFFF"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 5 | Peyton Davis | 424-555-0124 peyton@northwindtraders.com www.northwindtraders.com
    // pptx-object: slide:13:6
    #Place(
      x:189.300pt,
      y:270.000pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:581.400pt,
          height:180.985pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Peyton Davis | 424-555-0124", font:"Calibri", size:18.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"peyton@northwindtraders.com", font:"Calibri", size:18.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"www.northwindtraders.com", font:"Calibri", size:18.000pt, fill:rgb("#EBDDC3"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:18.000pt,
          fill:rgb("#EBDDC3"),
          weight:"regular",
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