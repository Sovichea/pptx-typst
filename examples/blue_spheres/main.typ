// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, PptxMaster, PptxLayout, PptxSlide, PptxPlaceholderSlot, PptxPlaceholder, PptxParagraph, PptxTextFrame, PptxPlaceholderParagraph, PptxPlaceholderRun, PptxLine, Place, GroupContent, ClipContent
#let ppt-format=(width:960.000pt,height:540.000pt)
#set page(width:960.000pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:"Arial",size:20pt,fill:black)

#let Master01 = PptxMaster(fill:rgb("#FFFFFF"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:66.000pt, y:28.750pt, width:828.000pt, height:104.375pt, rotation:0.000deg, align:"center", margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"center", font:"Calibri"), PptxPlaceholderSlot(id:"body-1", type:"body", idx:1, x:66.000pt, y:143.750pt, width:828.000pt, height:342.625pt, rotation:0.000deg, align:"center", margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, font:"Calibri")),children:[
])
#let Layout01 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:48.240pt, y:39.600pt, width:862.560pt, height:255.600pt, rotation:0.000deg, align:"center", anchor:"bottom", font:"Calibri", size:66.000pt, weight:"bold", fill:rgb("#2E303F")),),show-master:true,children:[
  // Source media: assets/media/image1_56961de44e.jpg | shape: Picture 3 | rect
  // pptx-object: layout:Layout01:4
  #Place(
    x:0.000pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      image("assets/media/image1_56961de44e.jpg",width:960.817pt,height:540.000pt,fit:"stretch"),
  )
])
#let Layout02 = PptxLayout(master:Master01,fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:130.000deg),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:66.960pt, width:308.160pt, height:378.000pt, rotation:0.000deg, font:"Calibri", fill:rgb("#2E303F")),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 4
  // pptx-object: layout:Layout02:7
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
  // Source media: assets/media/image2_31635d619a.svg | shape: Picture 7 | rect
  // pptx-object: layout:Layout02:11
  #Place(
    x:697.092pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:147.645pt,height:126.403pt,clip:true)[#place(top+left,dx:0.000pt,dy:-21.881pt)[#image("assets/media/image2_31635d619a.svg",width:147.645pt,height:148.284pt,fit:"stretch")]],
  )
  // Source media: assets/media/image2_31635d619a.svg | shape: Picture 7 | rect
  // pptx-object: layout:Layout02:13
  #Place(
    x:56.203pt,
    y:435.724pt,
    orientation:0.000deg,
    child:
      image("assets/media/image2_31635d619a.svg",width:38.850pt,height:39.018pt,fit:"stretch"),
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 14 | rect
  // pptx-object: layout:Layout02:15
  #Place(
    x:812.355pt,
    y:214.462pt,
    orientation:0.000deg,
    child:
      box(width:147.645pt,height:283.542pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image3_bf630332b5.svg",width:277.497pt,height:283.542pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 16 | rect
  // pptx-object: layout:Layout02:17
  #Place(
    x:275.368pt,
    y:498.004pt,
    orientation:0.000deg,
    child:
      box(width:71.671pt,height:42.627pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image3_bf630332b5.svg",width:71.671pt,height:73.232pt,fit:"stretch")]],
  )
  // Source media: assets/media/image4_940acef68e.svg | shape: Graphic 18 | rect
  // pptx-object: layout:Layout02:19
  #Place(
    x:126.080pt,
    y:0.000pt,
    orientation:0.000deg,
    child:
      box(width:81.333pt,height:56.591pt,clip:true)[#place(top+left,dx:0.000pt,dy:-26.514pt)[#image("assets/media/image4_940acef68e.svg",width:81.333pt,height:83.105pt,fit:"stretch")]],
  )
])
#let Layout03 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:69.120pt, y:104.400pt, width:823.680pt, height:180.000pt, rotation:0.000deg, align:"center", anchor:"bottom", font:"Calibri", size:66.000pt, weight:"bold", fill:rgb("#2E303F")),),show-master:true,children:[
  // Source media: assets/media/image5_025ee25cae.jpg | shape: Picture 4 | rect
  // pptx-object: layout:Layout03:5
  #Place(
    x:0.000pt,
    y:0.230pt,
    orientation:0.000deg,
    child:
      image("assets/media/image5_025ee25cae.jpg",width:960.409pt,height:539.770pt,fit:"stretch"),
  )
])
#let Layout04 = PptxLayout(master:Master01,fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:320.000deg),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 3
  // pptx-object: layout:Layout04:7
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
  // Source media: assets/media/image6_5bdf916cb7.svg | shape: Graphic 7 | rect
  // pptx-object: layout:Layout04:8
  #Place(
    x:0.000pt,
    y:227.368pt,
    orientation:0.000deg,
    child:
      box(width:191.529pt,height:283.832pt,clip:true)[#place(top+left,dx:-86.251pt,dy:0.000pt)[#image("assets/media/image6_5bdf916cb7.svg",width:277.780pt,height:283.832pt,fit:"stretch")]],
  )
  // Source media: assets/media/image4_940acef68e.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout04:9
  #Place(
    x:888.290pt,
    y:196.369pt,
    orientation:90.000deg,
    child:
      box(width:81.333pt,height:69.913pt,clip:true)[#place(top+left,dx:0.000pt,dy:-13.192pt)[#image("assets/media/image4_940acef68e.svg",width:81.333pt,height:83.104pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 9 | rect
  // pptx-object: layout:Layout04:10
  #Place(
    x:779.368pt,
    y:471.429pt,
    orientation:0.000deg,
    child:
      box(width:38.584pt,height:39.771pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image3_bf630332b5.svg",width:38.584pt,height:39.424pt,fit:"stretch")]],
  )
])
#let Layout05 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:366.480pt, y:2.160pt, width:551.520pt, height:280.800pt, rotation:0.000deg, align:"center", anchor:"bottom", font:"Calibri", size:60.000pt, weight:"bold", fill:rgb("#2E303F")),),show-master:true,children:[
  // Source media: assets/media/image7_2f3af46ed9.jpg | shape: Picture 3 | rect
  // pptx-object: layout:Layout05:4
  #Place(
    x:-0.204pt,
    y:0.115pt,
    orientation:0.000deg,
    child:
      box(width:960.409pt,height:539.770pt,clip:true)[#place(top+left,dx:0.010pt,dy:0.000pt)[#image("assets/media/image7_2f3af46ed9.jpg",width:960.601pt,height:539.884pt,fit:"stretch")]],
  )
])
#let Layout06 = PptxLayout(master:Master01,fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:359.900deg),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:827.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 11
  // pptx-object: layout:Layout06:12
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 7 | rect
  // pptx-object: layout:Layout06:8
  #Place(
    x:140.053pt,
    y:409.790pt,
    orientation:90.000deg,
    child:
      box(width:71.458pt,height:194.120pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image3_bf630332b5.svg",width:189.981pt,height:194.120pt,fit:"stretch")]],
  )
  // Source media: assets/media/image8_640dff8f45.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout06:9
  #Place(
    x:46.737pt,
    y:427.528pt,
    orientation:0.000deg,
    child:
      image("assets/media/image8_640dff8f45.svg",width:31.985pt,height:32.682pt,fit:"stretch"),
  )
  // Source media: assets/media/image4_940acef68e.svg | shape: Graphic 9 | rect
  // pptx-object: layout:Layout06:10
  #Place(
    x:804.267pt,
    y:28.750pt,
    orientation:0.000deg,
    child:
      box(width:81.333pt,height:87.144pt,clip:true)[#place(top+left,dx:0.000pt,dy:4.039pt)[#image("assets/media/image4_940acef68e.svg",width:81.333pt,height:83.104pt,fit:"stretch")]],
  )
])
#let Layout07 = PptxLayout(master:Master01,fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:320.000deg),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Source media: assets/media/image9_cbe4a83c3a.jpg | shape: Picture 10 | rect
  // pptx-object: layout:Layout07:11
  #Place(
    x:0.000pt,
    y:0.230pt,
    orientation:0.000deg,
    child:
      box(width:960.409pt,height:539.770pt,clip:true)[#place(top+left,dx:-30.347pt,dy:0.000pt)[#image("assets/media/image9_cbe4a83c3a.jpg",width:990.755pt,height:556.826pt,fit:"stretch")]],
  )
  // Original editable PowerPoint shape: Rounded Rectangle 4
  // pptx-object: layout:Layout07:12
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
])
#let Layout08 = PptxLayout(master:Master01,fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:280.000deg),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 4
  // pptx-object: layout:Layout08:7
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
  // Source media: assets/media/image4_940acef68e.svg | shape: Graphic 7 | rect
  // pptx-object: layout:Layout08:8
  #Place(
    x:44.836pt,
    y:348.542pt,
    orientation:0.000deg,
    child:
      box(width:115.969pt,height:125.718pt,clip:true)[#place(top+left,dx:0.000pt,dy:7.222pt)[#image("assets/media/image4_940acef68e.svg",width:115.969pt,height:118.494pt,fit:"stretch")]],
  )
  // Source media: assets/media/image4_940acef68e.svg | shape: Graphic 8 | rect
  // pptx-object: layout:Layout08:9
  #Place(
    x:114.056pt,
    y:322.407pt,
    orientation:62.757deg,
    child:
      scale(x:100%,y:-100%,origin:center+horizon,reflow:false,box(width:67.912pt,height:73.621pt,clip:true)[#place(top+left,dx:0.000pt,dy:4.229pt)[#image("assets/media/image4_940acef68e.svg",width:67.912pt,height:69.391pt,fit:"stretch")]]),
  )
  // Source media: assets/media/image10_b13a086445.svg | shape: Picture 7 | rect
  // pptx-object: layout:Layout08:10
  #Place(
    x:745.634pt,
    y:450.322pt,
    orientation:0.000deg,
    child:
      box(width:138.335pt,height:89.678pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image10_b13a086445.svg",width:138.335pt,height:138.934pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 12 | rect
  // pptx-object: layout:Layout08:13
  #Place(
    x:696.421pt,
    y:3.983pt,
    orientation:0.000deg,
    child:
      box(width:102.916pt,height:104.375pt,clip:true)[#place(top+left,dx:0.001pt,dy:0.000pt)[#image("assets/media/image3_bf630332b5.svg",width:102.149pt,height:104.375pt,fit:"stretch")]],
  )
])
#let Layout09 = PptxLayout(master:Master01,fill:rgb("#E3E7ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 6
  // pptx-object: layout:Layout09:4
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
])
#let Layout10 = PptxLayout(master:Master01,fill:rgb("#E3E7ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 6
  // pptx-object: layout:Layout10:4
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
])
#let Layout11 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:48.240pt, y:126.000pt, width:865.440pt, height:288.000pt, rotation:0.000deg, align:"center", anchor:"center", font:"Calibri", size:66.000pt, weight:"bold", fill:rgb("#2E303F")),),show-master:true,children:[
  // Source media: assets/media/image11_72128ef34e.jpg | shape: Picture 5 | rect
  // pptx-object: layout:Layout11:6
  #Place(
    x:0.000pt,
    y:0.230pt,
    orientation:0.000deg,
    child:
      box(width:960.409pt,height:539.770pt,clip:true)[#place(top+left,dx:-98.998pt,dy:-69.588pt)[#image("assets/media/image11_72128ef34e.jpg",width:1101.083pt,height:618.832pt,fit:"stretch")]],
  )
])
#let Layout12 = PptxLayout(master:Master01,fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:230.000deg),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", font:"Calibri"),),show-master:true,children:[
  // Original editable PowerPoint shape: Rounded Rectangle 4
  // pptx-object: layout:Layout12:11
  #Place(
    x:19.461pt,
    y:19.461pt,
    orientation:0.000deg,
    child:
      image("assets/media/shape_c3ff340a2276.svg",width:921.079pt,height:501.710pt,fit:"stretch"),
  )
  // Source media: assets/media/image2_31635d619a.svg | shape: Picture 7 | rect
  // pptx-object: layout:Layout12:12
  #Place(
    x:502.218pt,
    y:3.156pt,
    orientation:90.000deg,
    child:
      box(width:124.386pt,height:125.991pt,clip:true)[#place(top+left,dx:0.000pt,dy:1.252pt)[#image("assets/media/image2_31635d619a.svg",width:124.202pt,height:124.739pt,fit:"stretch")]],
  )
  // Source media: assets/media/image2_31635d619a.svg | shape: Picture 7 | rect
  // pptx-object: layout:Layout12:15
  #Place(
    x:495.971pt,
    y:-12.714pt,
    orientation:-90.000deg,
    child:
      box(width:59.269pt,height:84.697pt,clip:true)[#place(top+left,dx:0.000pt,dy:4.974pt)[#image("assets/media/image2_31635d619a.svg",width:79.380pt,height:79.723pt,fit:"stretch")]],
  )
  // Source media: assets/media/image8_640dff8f45.svg | shape: Graphic 15 | rect
  // pptx-object: layout:Layout12:16
  #Place(
    x:821.977pt,
    y:326.391pt,
    orientation:0.000deg,
    child:
      box(width:140.213pt,height:170.418pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image8_640dff8f45.svg",width:166.783pt,height:170.418pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 16 | rect
  // pptx-object: layout:Layout12:17
  #Place(
    x:-2.189pt,
    y:193.144pt,
    orientation:180.000deg,
    child:
      box(width:107.932pt,height:207.277pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image3_bf630332b5.svg",width:202.858pt,height:207.277pt,fit:"stretch")]],
  )
  // Source media: assets/media/image3_bf630332b5.svg | shape: Graphic 17 | rect
  // pptx-object: layout:Layout12:18
  #Place(
    x:69.908pt,
    y:390.467pt,
    orientation:-55.230deg,
    child:
      box(width:71.671pt,height:80.355pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.001pt)[#image("assets/media/image3_bf630332b5.svg",width:71.671pt,height:73.232pt,fit:"stretch")]],
  )
])
#let Layout13 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:89.280pt, y:4.445pt, width:780.480pt, height:216.000pt, rotation:0.000deg, align:"left", anchor:"bottom", font:"Calibri", size:66.000pt, weight:"bold", fill:rgb("#2E303F")),),show-master:true,children:[
  // Source media: assets/media/image12_f403bd63ea.jpg | shape: Picture 4 | rect
  // pptx-object: layout:Layout13:5
  #Place(
    x:-0.409pt,
    y:-0.000pt,
    orientation:0.000deg,
    child:
      box(width:960.409pt,height:540.000pt,clip:true)[#place(top+left,dx:-0.202pt,dy:0.000pt)[#image("assets/media/image12_f403bd63ea.jpg",width:960.812pt,height:540.000pt,fit:"stretch")]],
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
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:48.240pt, y:39.600pt, width:862.560pt, height:255.600pt, rotation:0.000deg, anchor:"bottom", autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Growth strategies", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:71.2800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Growth strategies", font:"Calibri", size:66.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Subtitle 2 | Presented by Peyton Davis
    // pptx-object: slide:1:3
    #Place(
      x:48.240pt,
      y:295.920pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:862.560pt,
          height:102.960pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:34.5600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Presented by Peyton Davis ", font:"Calibri", size:32.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:32.000pt,
          fill:rgb("#2E303F"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"no_autofit",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
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
  fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:130.000deg),
  format:ppt-format,
  layout:Layout02,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:66.960pt, width:308.160pt, height:378.000pt, rotation:0.000deg, anchor:"center", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Agenda", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Agenda", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | GROWTH STRATEGY MARKET ANALYSIS FINANCIAL OVERVIEW INNOVATIVE SOLUTIONS FUTURE I
    // pptx-object: slide:2:3
    #Place(
      x:421.920pt,
      y:154.800pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:318.960pt,
          height:232.560pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"GROWTH STRATEGY", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"MARKET ANALYSIS", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"FINANCIAL OVERVIEW", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"INNOVATIVE SOLUTIONS", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"FUTURE INITIATIVES", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"no_autofit",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 8 | 2
    // pptx-object: slide:2:9
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"2", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
// Slide 03
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout03,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:69.120pt, y:104.400pt, width:823.680pt, height:180.000pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Strategies for growth", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:71.2800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Strategies for growth", font:"Calibri", size:66.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Subtitle 2 | NAVIGATING THE FUTURE
    // pptx-object: slide:3:3
    #Place(
      x:69.120pt,
      y:295.200pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:823.680pt,
          height:180.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:34.5600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"NAVIGATING THE FUTURE", font:"Calibri", size:32.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:32.000pt,
          fill:rgb("#2E303F"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"no_autofit",
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
  fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:320.000deg),
  format:ppt-format,
  layout:Layout04,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Current market analysis", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Current market analysis", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | We have identified important key trends that demand our attention. Data reveals
    // pptx-object: slide:4:3
    #Place(
      x:281.520pt,
      y:182.160pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:498.240pt,
          height:253.440pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"We have identified important key trends that demand our attention.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Data reveals a steady increase in consumer demand for sustainable products, presenting an opportunity for our eco-friendly offerings.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our competitors are now focusing on digital marketing strategies, suggesting a shift in consumer behavior.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Understanding these nuanced dynamics positions us to adapt and capitalize on emerging market preferences.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"no_autofit",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Slide Number Placeholder 9 | 4
    // pptx-object: slide:4:10
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"4", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
// Slide 05
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:366.480pt, y:2.160pt, width:551.520pt, height:280.800pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Market expansion", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:64.8000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Market expansion", font:"Calibri", size:60.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Subtitle 2 | UNLOCKING NEW HORIZONS
    // pptx-object: slide:5:3
    #Place(
      x:366.480pt,
      y:296.640pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:551.520pt,
          height:91.440pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:34.5600pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"UNLOCKING NEW HORIZONS", font:"Calibri", size:32.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)),),
          font:"Calibri",
          size:32.000pt,
          fill:rgb("#2E303F"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"no_autofit",
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
  width:960.000pt,
  height:540.000pt,
  fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:359.900deg),
  format:ppt-format,
  layout:Layout06,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:827.280pt, height:130.320pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Product launch", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Product launch", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // SmartArt layout drawing: Content Placeholder 13
    // pptx-object: slide:6:14
    #Place(
      x:373.000pt,
      y:151.250pt,
      orientation:0.000deg,
      child:
        image("assets/media/smartart_56b644fbc8d8.svg",width:521.250pt,height:308.125pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 2 | Currently gearing up for a ground-breaking launch Our new offerings will captiv
    // pptx-object: slide:6:3
    #Place(
      x:86.400pt,
      y:191.520pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:244.800pt,
          height:268.691pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Currently gearing up for a ground-breaking launch ", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our new offerings will captivate the market", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our marketing campaign will generate anticipation", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
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
    // Editable text: Slide Number Placeholder 20 | 6
    // pptx-object: slide:6:21
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"6", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Marketing strategies", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Marketing strategies", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Implement personalized engagement strategies Tailor campaigns to resonate with s
    // pptx-object: slide:7:3
    #Place(
      x:281.520pt,
      y:179.280pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:498.240pt,
          height:243.360pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Implement personalized engagement strategies", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Tailor campaigns to resonate with specific demographics, fostering a sense of relevance and connection", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Collaborate with influencers and thought leaders to amplify our brand message", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
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
    // Editable text: Slide Number Placeholder 7 | 7
    // pptx-object: slide:7:8
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"7", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
// Slide 08
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:280.000deg),
  format:ppt-format,
  layout:Layout08,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Financial overview", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Financial overview", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Our financial overview reflects a robust and resilient fiscal performance. Key i
    // pptx-object: slide:8:3
    #Place(
      x:281.520pt,
      y:192.240pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:283.680pt,
          height:281.520pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our financial overview reflects a robust and resilient fiscal performance.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Key indicators show consistent revenue growth over the past quarter, attributed to strategic cost management and successful marketing.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
          weight:"regular",
          anchor:"top",
          autofit-mode:"no_autofit",
          font-scale:1.00000,
          line-spacing-reduction:0.00000,
          margin-left:7.200pt,
          margin-right:7.200pt,
          margin-top:3.600pt,
          margin-bottom:3.600pt),
    )
    // Editable text: Content Placeholder 3 | Operating margins have improved, signaling operational efficiency, while strengt
    // pptx-object: slide:8:4
    #Place(
      x:604.080pt,
      y:192.240pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:283.680pt,
          height:281.520pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Operating margins have improved, signaling operational efficiency, while strengthening our reserves.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"This underscores our commitment to financial stability, positioning us for sustained growth. ", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
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
    // Editable text: Slide Number Placeholder 12 | 8
    // pptx-object: slide:8:13
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"8", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
// Slide 09
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#E3E7ED"),
  format:ppt-format,
  layout:Layout09,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Quarterly targets", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Quarterly targets", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable PowerPoint table: Table Placeholder 2
    // pptx-object: slide:9:3
    #Place(
      x:333.375pt,
      y:198.750pt,
      orientation:0.000deg,
      child:
        table(columns:(111.621pt, 122.235pt, 147.853pt, 145.291pt),rows:(55.117pt, 50.568pt, 50.568pt, 50.568pt, 50.568pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Quarter")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Revenue growth (%)")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Market share increase (%)")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Customer acquisition")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Q1")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "12")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "2")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "500")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Q2")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "15")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "3")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "600")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Q3")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "18")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "4")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "700")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Q4")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "20")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "5")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "800")]),
    )
    // Editable text: Content Placeholder 7 | Market expansion Product innovation Customer retention Operational efficiency
    // pptx-object: slide:9:8
    #Place(
      x:92.160pt,
      y:193.680pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:223.920pt,
          height:243.360pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Market expansion", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Product innovation", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Customer retention", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Operational efficiency", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
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
    // Editable text: Slide Number Placeholder 8 | 9
    // pptx-object: slide:9:9
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"9", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
// Slide 10
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:rgb("#E3E7ED"),
  format:ppt-format,
  layout:Layout10,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Financial snapshot", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Financial snapshot", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable PowerPoint table: Table Placeholder 3
    // pptx-object: slide:10:4
    #Place(
      x:95.000pt,
      y:198.750pt,
      orientation:0.000deg,
      child:
        table(columns:(191.344pt, 191.344pt, 191.344pt, 191.344pt),rows:(42.737pt, 42.737pt, 42.737pt, 42.737pt, 42.737pt, 42.737pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Metric")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Current value")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Previous quarter")],
          table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Change (%)")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Revenue")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$2,500,000")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$2,200,000")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "+14%")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Operating expenses")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$1,200,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$1,400,000")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "-14%")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Net profit")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$1,000,000")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$800,000")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "+25%")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Operating margin")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "40%")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "36%")],
          table.cell(fill:none,stroke:(left: 0.500pt + rgb("#FFFFFF"), right: 0.500pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "+4%")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "Cash reserves")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$5,000,000")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "$4,500,000")],
          table.cell(fill:rgb("#B8C2FD33"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: "Arial", size: 14.00pt, weight: "regular", fill: rgb("#2E303F"), "+11%")]),
    )
    // Editable text: Slide Number Placeholder 2 | 10
    // pptx-object: slide:10:3
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"10", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
// Slide 11
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout11,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:48.240pt, y:126.000pt, width:865.440pt, height:288.000pt, rotation:0.000deg, anchor:"center", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Innovative solutions", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:71.2800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Innovative solutions", font:"Calibri", size:66.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
])
#pagebreak()
// Slide 12
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:gradient.linear((rgb("#E8E8E8"),0.000%),(rgb("#E8E8E8"),33.000%),(rgb("#CCCFD5A6"),59.000%),(rgb("#CCCFD5A6"),100.000%),angle:230.000deg),
  format:ppt-format,
  layout:Layout12,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:84.960pt, y:28.800pt, width:809.280pt, height:130.320pt, rotation:0.000deg, anchor:"bottom", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Future initiatives", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:47.5200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Future initiatives", font:"Calibri", size:44.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Product enhancement. Introduce regular updates and features to enhance product o
    // pptx-object: slide:12:3
    #Place(
      x:281.520pt,
      y:192.240pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:283.680pt,
          height:281.520pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:19.4400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Product enhancement. Introduce regular updates and features to enhance product offerings.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:19.4400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Technology integration. Explore emerging technologies for potential integration into our operations.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:19.4400pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Collaborative partnerships. Foster collaborations with tech innovators and industry leaders to drive innovation.", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
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
    // Editable text: Content Placeholder 3 | Green supply chain Reduced carbon footprint Waste reduction Water conservation
    // pptx-object: slide:12:4
    #Place(
      x:653.040pt,
      y:192.240pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:241.200pt,
          height:281.520pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Green supply chain", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Reduced carbon footprint", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Waste reduction", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Water conservation", font:"Calibri", size:20.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:20.000pt,
          fill:rgb("#2E303F"),
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
    // Editable text: Slide Number Placeholder 13 | 12
    // pptx-object: slide:12:14
    #Place(
      x:738.261pt,
      y:516.772pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:216.000pt,
          height:18.000pt,
          paragraphs:(PptxParagraph(text:"12", level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
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
  layout:Layout13,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:89.280pt, y:4.445pt, width:780.480pt, height:216.000pt, rotation:0.000deg, anchor:"bottom", autofit-mode:"no_autofit", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Thank you", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"master_style", target-pitch:71.2800pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Thank you", font:"Calibri", size:66.000pt, fill:rgb("#2E303F"), weight:"bold", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 5 | PEYTON DAVIS 424-555-0124 PEYTON@PROSEWARE.COM WWW.PROSEWARE.COM
    // pptx-object: slide:13:6
    #Place(
      x:281.520pt,
      y:244.925pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:324.000pt,
          height:216.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:150.0000, line-source:"layout", target-pitch:43.2000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"PEYTON DAVIS", font:"Calibri", size:24.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:150.0000, line-source:"layout", target-pitch:43.2000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"424-555-0124", font:"Calibri", size:24.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:150.0000, line-source:"layout", target-pitch:43.2000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"PEYTON@PROSEWARE.COM", font:"Calibri", size:24.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:150.0000, line-source:"layout", target-pitch:43.2000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"WWW.PROSEWARE.COM", font:"Calibri", size:24.000pt, fill:rgb("#2E303F"), weight:"regular", italic:false),))),
          font:"Calibri",
          size:24.000pt,
          fill:rgb("#2E303F"),
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