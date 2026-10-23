// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, PptxMaster, PptxLayout, PptxSlide, PptxPlaceholderSlot, PptxPlaceholder, PptxParagraph, PptxTextFrame, PptxPlaceholderParagraph, PptxPlaceholderRun, PptxLine, Place, GroupContent, ClipContent
#let ppt-format=(width:960.000pt,height:540.000pt)
#set page(width:960.000pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:"Arial",size:20pt,fill:black)

#let Master01 = PptxMaster(fill:rgb("#E6E3DD"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:48.240pt, y:43.200pt, width:838.864pt, height:89.154pt, rotation:0.000deg, align:"left", margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, anchor:"top", font:"Felix Titling"), PptxPlaceholderSlot(id:"body-1", type:"body", idx:1, x:48.240pt, y:135.081pt, width:838.864pt, height:361.719pt, rotation:0.000deg, align:"left", margin-left:7.200pt, margin-right:7.200pt, margin-top:3.600pt, margin-bottom:3.600pt, font:"Goudy Old Style")),children:[
])
#let Layout01 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:93.117pt, y:77.525pt, width:594.576pt, height:241.846pt, rotation:0.000deg, align:"left", anchor:"center", font:"Felix Titling", size:60.000pt),),show-master:true,children:[
  // Group: Group 12 | id: g1_13
  #Place(
    x:0.060pt,
    y:340.450pt,
    child:GroupContent(width:959.880pt,height:18.146pt,children:[
      // Native editable PowerPoint connector: Straight Connector 13
      // pptx-object: layout:Layout01:14
      #Place(
        x:0.120pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 14
      // pptx-object: layout:Layout01:15
      #Place(
        x:0.000pt,
        y:18.146pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
  // Native editable PowerPoint connector: Straight Connector 16
  // pptx-object: layout:Layout01:17
  #Place(
    x:615.998pt,
    y:358.596pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,181.404pt), stroke:1.250pt + rgb("#000000")),
  )
  // Group: Group 3 | id: g1_4
  #Place(
    x:0.120pt,
    y:38.300pt,
    child:GroupContent(width:959.880pt,height:18.146pt,children:[
      // Native editable PowerPoint connector: Straight Connector 4
      // pptx-object: layout:Layout01:5
      #Place(
        x:0.120pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 7
      // pptx-object: layout:Layout01:8
      #Place(
        x:0.000pt,
        y:18.146pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
])
#let Layout02 = PptxLayout(master:Master01,fill:rgb("#DCE4E7"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:44.431pt, y:170.153pt, width:230.400pt, height:197.619pt, rotation:0.000deg, align:"center", anchor:"center", font:"Felix Titling", size:44.000pt),),show-master:true,children:[
  // Group: Group 18 | id: g2_19
  #Place(
    x:0.120pt,
    y:411.865pt,
    child:GroupContent(width:959.880pt,height:18.146pt,children:[
      // Native editable PowerPoint connector: Straight Connector 19
      // pptx-object: layout:Layout02:20
      #Place(
        x:0.120pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 20
      // pptx-object: layout:Layout02:21
      #Place(
        x:0.000pt,
        y:18.146pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
  // Group: Group 5 | id: g2_6
  #Place(
    x:0.120pt,
    y:108.606pt,
    child:GroupContent(width:959.880pt,height:18.146pt,children:[
      // Native editable PowerPoint connector: Straight Connector 7
      // pptx-object: layout:Layout02:8
      #Place(
        x:0.120pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 8
      // pptx-object: layout:Layout02:9
      #Place(
        x:0.000pt,
        y:18.146pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
  // Native editable PowerPoint connector: Straight Connector 13
  // pptx-object: layout:Layout02:14
  #Place(
    x:319.261pt,
    y:-0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.250pt + rgb("#000000")),
  )
])
#let Layout03 = PptxLayout(master:Master01,fill:rgb("#F2F0ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:35.135pt, y:46.580pt, width:248.689pt, height:241.647pt, rotation:0.000deg, align:"center", anchor:"center", font:"Felix Titling", size:44.000pt),),show-master:true,children:[
  // Group: Group 2 | id: g3_3
  #Place(
    x:0.120pt,
    y:0.000pt,
    child:GroupContent(width:959.880pt,height:353.820pt,children:[
      // Native editable PowerPoint connector: Straight Connector 12
      // pptx-object: layout:Layout03:13
      #Place(
        x:0.120pt,
        y:335.674pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 13
      // pptx-object: layout:Layout03:14
      #Place(
        x:0.000pt,
        y:353.820pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 15
      // pptx-object: layout:Layout03:16
      #Place(
        x:318.840pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(0.000pt,335.187pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
])
#let Layout04 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:374.400pt, y:37.702pt, width:526.013pt, height:120.146pt, rotation:0.000deg, anchor:"bottom", font:"Felix Titling", size:44.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 20
  // pptx-object: layout:Layout04:21
  #Place(
    x:0.240pt,
    y:181.541pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 21
  // pptx-object: layout:Layout04:22
  #Place(
    x:0.120pt,
    y:199.687pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 6
  // pptx-object: layout:Layout04:7
  #Place(
    x:0.180pt,
    y:483.454pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 14
  // pptx-object: layout:Layout04:15
  #Place(
    x:0.060pt,
    y:501.600pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout04:6
  #Place(
    x:318.960pt,
    y:-0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.250pt + rgb("#000000")),
  )
])
#let Layout05 = PptxLayout(master:Master01,fill:rgb("#DCE4E7"),background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:51.762pt, y:158.001pt, width:475.589pt, height:223.998pt, rotation:0.000deg, align:"left", anchor:"center", font:"Felix Titling", size:60.000pt),),show-master:true,children:[
  // Group: Group 18 | id: g5_19
  #Place(
    x:0.120pt,
    y:48.972pt,
    child:GroupContent(width:959.820pt,height:442.056pt,children:[
      // Native editable PowerPoint connector: Straight Connector 9
      // pptx-object: layout:Layout05:10
      #Place(
        x:0.000pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 11
      // pptx-object: layout:Layout05:12
      #Place(
        x:0.060pt,
        y:442.056pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Group: Group 13 | id: g5_14
      #Place(
        x:372.735pt,
        y:221.441pt,
        child:GroupContent(width:461.218pt,height:0.055pt,children:[
          // Native editable PowerPoint connector: Straight Connector 14
          // pptx-object: layout:Layout05:15
          #Place(
            x:0.000pt,
            y:0.000pt,
            orientation:-90.000deg,
            child:
              PptxLine(start:(0pt,0.000pt), end:(442.745pt,0.000pt), stroke:1.250pt + rgb("#000000")),
          )
          // Native editable PowerPoint connector: Straight Connector 15
          // pptx-object: layout:Layout05:16
          #Place(
            x:18.473pt,
            y:0.055pt,
            orientation:-90.000deg,
            child:
              PptxLine(start:(0pt,0.000pt), end:(442.745pt,0.000pt), stroke:1.250pt + rgb("#000000")),
          )
        ]))
    ]))
])
#let Layout06 = PptxLayout(master:Master01,fill:rgb("#F2F0ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:241.768pt, y:43.200pt, width:661.135pt, height:108.000pt, rotation:0.000deg, anchor:"bottom", font:"Felix Titling", size:44.000pt), PptxPlaceholderSlot(id:"body-13", type:"body", idx:13, x:235.213pt, y:201.600pt, width:316.800pt, height:288.000pt, rotation:0.000deg, font:"Goudy Old Style"), PptxPlaceholderSlot(id:"body-14", type:"body", idx:14, x:586.103pt, y:201.600pt, width:316.800pt, height:288.000pt, rotation:0.000deg, font:"Goudy Old Style")),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 13
  // pptx-object: layout:Layout06:14
  #Place(
    x:-69.182pt,
    y:269.747pt,
    orientation:90.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(539.933pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 14
  // pptx-object: layout:Layout06:15
  #Place(
    x:-87.328pt,
    y:269.679pt,
    orientation:90.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(539.933pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 5
  // pptx-object: layout:Layout06:6
  #Place(
    x:200.784pt,
    y:176.375pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(759.973pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
])
#let Layout07 = PptxLayout(master:Master01,fill:rgb("#E6E3DD"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:48.240pt, y:-89.280pt, width:838.800pt, height:89.280pt, rotation:0.000deg, align:"left", font:"Felix Titling"),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 9
  // pptx-object: layout:Layout07:10
  #Place(
    x:-185.862pt,
    y:270.034pt,
    orientation:90.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(539.933pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 10
  // pptx-object: layout:Layout07:11
  #Place(
    x:-203.862pt,
    y:269.966pt,
    orientation:90.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(539.933pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 12
  // pptx-object: layout:Layout07:13
  #Place(
    x:624.872pt,
    y:270.034pt,
    orientation:90.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(539.933pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 13
  // pptx-object: layout:Layout07:14
  #Place(
    x:606.872pt,
    y:269.966pt,
    orientation:90.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(539.933pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
])
#let Layout08 = PptxLayout(master:Master01,fill:rgb("#DCE4E7"),background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:417.600pt, y:158.001pt, width:475.589pt, height:223.998pt, rotation:0.000deg, align:"left", anchor:"center", font:"Felix Titling", size:60.000pt),),show-master:true,children:[
  // Group: Group 4 | id: g8_5
  #Place(
    x:0.120pt,
    y:48.972pt,
    child:GroupContent(width:959.820pt,height:442.056pt,children:[
      // Native editable PowerPoint connector: Straight Connector 9
      // pptx-object: layout:Layout08:10
      #Place(
        x:0.000pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 11
      // pptx-object: layout:Layout08:12
      #Place(
        x:0.060pt,
        y:442.056pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Group: Group 13 | id: g8_14
      #Place(
        x:125.217pt,
        y:221.441pt,
        child:GroupContent(width:460.891pt,height:0.055pt,children:[
          // Native editable PowerPoint connector: Straight Connector 14
          // pptx-object: layout:Layout08:15
          #Place(
            x:0.000pt,
            y:0.000pt,
            orientation:-90.000deg,
            child:
              PptxLine(start:(0pt,0.000pt), end:(442.745pt,0.000pt), stroke:1.250pt + rgb("#000000")),
          )
          // Native editable PowerPoint connector: Straight Connector 15
          // pptx-object: layout:Layout08:16
          #Place(
            x:18.146pt,
            y:0.055pt,
            orientation:-90.000deg,
            child:
              PptxLine(start:(0pt,0.000pt), end:(442.745pt,0.000pt), stroke:1.250pt + rgb("#000000")),
          )
        ]))
    ]))
])
#let Layout09 = PptxLayout(master:Master01,fill:rgb("#F2F0ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:72.153pt, y:144.000pt, width:495.475pt, height:120.240pt, rotation:0.000deg, anchor:"bottom", font:"Felix Titling", size:44.000pt),),show-master:true,children:[
  // Group: Group 2 | id: g9_3
  #Place(
    x:0.120pt,
    y:0.000pt,
    child:GroupContent(width:959.880pt,height:540.000pt,children:[
      // Native editable PowerPoint connector: Straight Connector 12
      // pptx-object: layout:Layout09:13
      #Place(
        x:0.120pt,
        y:109.138pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 13
      // pptx-object: layout:Layout09:14
      #Place(
        x:0.000pt,
        y:127.284pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 15
      // pptx-object: layout:Layout09:16
      #Place(
        x:639.341pt,
        y:411.460pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(320.539pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 16
      // pptx-object: layout:Layout09:17
      #Place(
        x:639.301pt,
        y:429.606pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(320.539pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 18
      // pptx-object: layout:Layout09:19
      #Place(
        x:639.751pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
])
#let Layout10 = PptxLayout(master:Master01,fill:none,background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:48.240pt, y:8.765pt, width:838.864pt, height:89.154pt, rotation:0.000deg, anchor:"bottom", font:"Felix Titling", size:44.000pt),),show-master:true,children:[
])
#let Layout11 = PptxLayout(master:Master01,fill:rgb("#DCE4E7"),background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:51.762pt, y:321.368pt, width:845.187pt, height:162.187pt, rotation:0.000deg, align:"left", anchor:"bottom", font:"Felix Titling", size:60.000pt),),show-master:true,children:[
  // Group: Group 2 | id: g11_3
  #Place(
    x:0.120pt,
    y:30.960pt,
    child:GroupContent(width:959.880pt,height:18.146pt,children:[
      // Native editable PowerPoint connector: Straight Connector 3
      // pptx-object: layout:Layout11:4
      #Place(
        x:0.120pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 4
      // pptx-object: layout:Layout11:5
      #Place(
        x:0.000pt,
        y:18.146pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
  // Group: Group 5 | id: g11_6
  #Place(
    x:0.060pt,
    y:277.694pt,
    child:GroupContent(width:959.880pt,height:18.146pt,children:[
      // Native editable PowerPoint connector: Straight Connector 6
      // pptx-object: layout:Layout11:7
      #Place(
        x:0.120pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 16
      // pptx-object: layout:Layout11:17
      #Place(
        x:0.000pt,
        y:18.146pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
    ]))
])
#let Layout12 = PptxLayout(master:Master01,fill:rgb("#F2F0ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:282.000pt, y:402.382pt, width:396.000pt, height:43.200pt, rotation:0.000deg, align:"center", anchor:"center", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000")),),show-master:true,children:[
])
#let Layout13 = PptxLayout(master:Master01,fill:rgb("#E6E3DD"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:372.548pt, y:229.161pt, width:542.575pt, height:178.896pt, rotation:0.000deg, anchor:"center", font:"Goudy Old Style", size:28.000pt, weight:"regular", fill:rgb("#000000")),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 12
  // pptx-object: layout:Layout13:13
  #Place(
    x:0.180pt,
    y:455.883pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 13
  // pptx-object: layout:Layout13:14
  #Place(
    x:0.060pt,
    y:474.029pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 7
  // pptx-object: layout:Layout13:8
  #Place(
    x:0.240pt,
    y:161.398pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 14
  // pptx-object: layout:Layout13:15
  #Place(
    x:0.120pt,
    y:179.544pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 19
  // pptx-object: layout:Layout13:20
  #Place(
    x:319.886pt,
    y:-0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.250pt + rgb("#000000")),
  )
])
#let Layout14 = PptxLayout(master:Master01,fill:rgb("#DCE4E7"),background:none,placeholders:(PptxPlaceholderSlot(id:"title-0", type:"title", idx:0, x:225.702pt, y:140.841pt, width:663.840pt, height:145.041pt, rotation:0.000deg, anchor:"bottom", font:"Felix Titling", size:44.000pt),),show-master:true,children:[
  // Native editable PowerPoint connector: Straight Connector 8
  // pptx-object: layout:Layout14:9
  #Place(
    x:0.240pt,
    y:108.606pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 9
  // pptx-object: layout:Layout14:10
  #Place(
    x:0.120pt,
    y:126.752pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 11
  // pptx-object: layout:Layout14:12
  #Place(
    x:0.240pt,
    y:411.865pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 12
  // pptx-object: layout:Layout14:13
  #Place(
    x:0.120pt,
    y:430.011pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
  )
  // Native editable PowerPoint connector: Straight Connector 20
  // pptx-object: layout:Layout14:21
  #Place(
    x:180.885pt,
    y:-0.000pt,
    orientation:0.000deg,
    child:
      PptxLine(start:(0pt,0.000pt), end:(0.000pt,540.000pt), stroke:1.250pt + rgb("#000000")),
  )
])
#let Layout15 = PptxLayout(master:Master01,fill:rgb("#F2F0ED"),background:none,placeholders:(PptxPlaceholderSlot(id:"centered-title-0", type:"centered-title", idx:0, x:58.938pt, y:122.760pt, width:352.800pt, height:294.480pt, rotation:0.000deg, align:"center", anchor:"center", font:"Felix Titling", size:60.000pt),),show-master:true,children:[
  // Group: Group 5 | id: g15_6
  #Place(
    x:0.120pt,
    y:48.972pt,
    child:GroupContent(width:959.820pt,height:442.056pt,children:[
      // Native editable PowerPoint connector: Straight Connector 18
      // pptx-object: layout:Layout15:19
      #Place(
        x:0.000pt,
        y:0.000pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Native editable PowerPoint connector: Straight Connector 15
      // pptx-object: layout:Layout15:16
      #Place(
        x:0.060pt,
        y:442.056pt,
        orientation:0.000deg,
        child:
          PptxLine(start:(0pt,0.000pt), end:(959.760pt,0.000pt), stroke:1.250pt + rgb("#000000")),
      )
      // Group: Group 12 | id: g15_13
      #Place(
        x:249.184pt,
        y:221.442pt,
        child:GroupContent(width:460.892pt,height:0.055pt,children:[
          // Native editable PowerPoint connector: Straight Connector 13
          // pptx-object: layout:Layout15:14
          #Place(
            x:0.000pt,
            y:0.000pt,
            orientation:-90.000deg,
            child:
              PptxLine(start:(0pt,0.000pt), end:(442.745pt,0.000pt), stroke:1.250pt + rgb("#000000")),
          )
          // Native editable PowerPoint connector: Straight Connector 14
          // pptx-object: layout:Layout15:15
          #Place(
            x:18.147pt,
            y:0.055pt,
            orientation:-90.000deg,
            child:
              PptxLine(start:(0pt,0.000pt), end:(442.745pt,0.000pt), stroke:1.250pt + rgb("#000000")),
          )
        ]))
    ]))
])
// Slide 01
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout01,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:93.117pt, y:77.525pt, width:594.576pt, height:241.846pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Growth marketing strategy", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"layout", target-pitch:54.0000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Growth marketing strategy", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image33_c46b104295.png | shape: Picture Placeholder 6 | polygon
    // pptx-object: slide:1:7
    #Place(
      x:0.000pt,
      y:360.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_71edbebdb344c356.png",width:960.000pt,height:180.000pt,fit:"stretch"),
    )
    // Editable text: Subtitle 3 | Presented by Ellis Turner
    // pptx-object: slide:1:4
    #Place(
      x:93.117pt,
      y:375.714pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:468.000pt,
          height:93.600pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:21.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Presented by Ellis Turner", font:"Goudy Old Style", size:24.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)),),
          font:"Goudy Old Style",
          size:24.000pt,
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
    // Editable text: Date Placeholder 1 | 10/23/2026
    // pptx-object: slide:1:2
    #Place(
      x:722.199pt,
      y:426.558pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:129.600pt,
          height:45.360pt,
          paragraphs:(PptxParagraph(text:"10/23/2026", level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt),),
          font:"Goudy Old Style",
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
// Slide 02
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout02,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:44.431pt, y:170.153pt, width:230.400pt, height:197.619pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"agenda", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"agenda", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image34_3bce28cb99.png | shape: Picture Placeholder 11 | polygon
    // pptx-object: slide:2:12
    #Place(
      x:320.008pt,
      y:-0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_34271e3cfae0983c.png",width:639.992pt,height:539.999pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 2 | Overview Market analysis Campaign success Metrics & KPIs Q & A
    // pptx-object: slide:2:3
    #Place(
      x:372.476pt,
      y:169.963pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:534.310pt,
          height:198.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Overview", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Market analysis", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Campaign success", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Metrics & KPIs", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Q & A", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true),))),
          font:"Goudy Old Style",
          size:18.000pt,
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
// Slide 03
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout03,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:35.135pt, y:46.580pt, width:248.689pt, height:241.647pt, rotation:0.000deg, anchor:"center", autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Overview", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Overview", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image35_98a3aee8b5.png | shape: Picture Placeholder 8 | rect
    // pptx-object: slide:3:8
    #Place(
      x:0.000pt,
      y:354.689pt,
      orientation:0.000deg,
      child:
        image("assets/media/image35_98a3aee8b5_alpha6000.png",width:960.000pt,height:185.311pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 3 | This presentation is focused on our growth marketing strategy. We'll cover key a
    // pptx-object: slide:3:4
    #Place(
      x:374.047pt,
      y:46.580pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:530.867pt,
          height:241.646pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"This presentation is focused on our growth marketing strategy. We'll cover key areas such as market analysis, campaign success, metrics & KPIs, and more.", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Goudy Old Style",
          size:18.000pt,
          fill:rgb("#000000"),
          weight:"regular",
          anchor:"center",
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
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:374.400pt, y:37.702pt, width:526.013pt, height:120.146pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Our goal", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Our goal", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | We aim to align our efforts and drive success through effective marketing strate
    // pptx-object: slide:4:3
    #Place(
      x:374.400pt,
      y:256.993pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:526.013pt,
          height:193.680pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"We aim to align our efforts and drive success through effective marketing strategies.  This involves a comprehensive approach where every team member collaborates to achieve our growth objectives. By leveraging data-driven insights and innovative techniques, we can create impactful campaigns that resonate with our target audience. Let's dive in and explore how we can achieve our growth objectives together.", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Goudy Old Style", bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Goudy Old Style", bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt)),
          font:"Goudy Old Style",
          size:18.000pt,
          fill:rgb("#000000"),
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
#pagebreak()
// Slide 05
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout05,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:51.762pt, y:158.001pt, width:475.589pt, height:223.998pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Navigating the landscape", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"layout", target-pitch:54.0000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Navigating the landscape", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image36_24d2ef9a1a.png | shape: Picture Placeholder 4 | rect
    // pptx-object: slide:5:5
    #Place(
      x:613.938pt,
      y:49.905pt,
      orientation:0.000deg,
      child:
        image("assets/media/image36_24d2ef9a1a_alpha2500.png",width:346.062pt,height:440.190pt,fit:"stretch"),
    )
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
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:241.768pt, y:43.200pt, width:661.135pt, height:108.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Consumer expectations", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Consumer expectations", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
    PptxPlaceholder(id:"body-13", type:"body", idx:13, x:235.213pt, y:201.600pt, width:316.800pt, height:288.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Seamless omnichannel experience: Consumers expect a seamless experience across all touchpoints, whether they are interacting with a brand online, in-store, or through a mobile app. \nTransparency and trust: Consumers expect brands to be transparent about their practices, values, and product information. \n", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Seamless omnichannel experience", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true), PptxPlaceholderRun(text:": Consumers expect a seamless experience across all touchpoints, whether they are interacting with a brand online, in-store, or through a mobile app. ", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false))), PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Transparency and trust", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true), PptxPlaceholderRun(text:": Consumers expect brands to be transparent about their practices, values, and product information. ", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false))), PptxPlaceholderParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Goudy Old Style", bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt))),
    PptxPlaceholder(id:"body-14", type:"body", idx:14, x:586.103pt, y:201.600pt, width:316.800pt, height:288.000pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Personalization: Consumers today expect brands to offer personalized experiences tailored to their individual preferences and behaviors.\nSustainability: Modern consumers are increasingly concerned about environmental impact and sustainability.  ", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Personalization", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true), PptxPlaceholderRun(text:": Consumers today expect brands to offer personalized experiences tailored to their individual preferences and behaviors.", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false))), PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Sustainability", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true), PptxPlaceholderRun(text:": Modern consumers are increasingly concerned about environmental impact and sustainability.  ", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false))))),
  ),
  children:[
    // Source media: assets/media/image37_d81ab2241a.png | shape: Picture Placeholder 17 | rect
    // pptx-object: slide:6:18
    #Place(
      x:0.000pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/image37_d81ab2241a_alpha2500.png",width:182.118pt,height:540.000pt,fit:"stretch"),
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
    PptxPlaceholder(id:"title-0", type:"title", idx:0, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Quote", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:32.4000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Quote", font:"Felix Titling", size:36.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | Successful brands evolve with their audience, not despite them.
    // pptx-object: slide:7:3
    #Place(
      x:154.560pt,
      y:106.920pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:650.880pt,
          height:326.160pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:57.6000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Successful brands evolve with their audience, not despite them.", font:"Felix Titling", size:48.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Felix Titling",
          size:48.000pt,
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
  layout:Layout08,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:417.600pt, y:158.001pt, width:475.589pt, height:223.998pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Who is our target audience?", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"layout", target-pitch:54.0000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Who is our target audience?", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image38_17e23e4dce.png | shape: Picture Placeholder 6 | rect
    // pptx-object: slide:8:7
    #Place(
      x:0.000pt,
      y:49.905pt,
      orientation:0.000deg,
      child:
        image("assets/media/image38_17e23e4dce_alpha3500.png",width:346.062pt,height:440.190pt,fit:"stretch"),
    )
])
#pagebreak()
// Slide 09
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout09,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:72.153pt, y:144.000pt, width:495.475pt, height:120.240pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Our customers", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Our customers", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image39_ba3439e4b8.png | shape: Picture Placeholder 8 | rect
    // pptx-object: slide:9:9
    #Place(
      x:640.320pt,
      y:127.200pt,
      orientation:0.000deg,
      child:
        image("assets/media/image39_ba3439e4b8_alpha3500.png",width:319.680pt,height:284.015pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 2 | Key demographics Understanding key demographics is crucial for tailoring success
    // pptx-object: slide:9:3
    #Place(
      x:68.880pt,
      y:273.600pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:502.675pt,
          height:216.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Key demographics", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Understanding key demographics is crucial for tailoring successful marketing strategies. ", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"Challenges & needs", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:true))), PptxParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"Our target audience faces several challenges and needs that our marketing strategies aim to address. ", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)), PptxParagraph(text:"", level:0, empty-size:18.000pt, empty-font:"Goudy Old Style", bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", margin-left-source:"master_style", indent-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:25.9200pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt)),
          font:"Goudy Old Style",
          size:18.000pt,
          fill:rgb("#000000"),
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
#pagebreak()
// Slide 10
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout10,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:48.240pt, y:8.765pt, width:838.864pt, height:89.154pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Marketing strategy", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Marketing strategy", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable PowerPoint table: Content Placeholder 6
    // pptx-object: slide:10:4
    #Place(
      x:48.250pt,
      y:135.125pt,
      orientation:0.000deg,
      child:
        table(columns:(287.917pt, 287.917pt, 287.917pt),rows:(57.600pt, 57.600pt, 57.600pt, 57.600pt, 57.600pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 24.00pt, weight: "regular", fill: rgb("#111111"), "Focus area")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 24.00pt, weight: "regular", fill: rgb("#111111"), "Approach")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 24.00pt, weight: "regular", fill: rgb("#111111"), "Goal")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Brand awareness")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Social media campaigns")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Increase engagement by 30%")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Lead generation")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Email marketing & PPC")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Grow qualified leads by 20%")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Customer retention")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Loyalty programs, automation")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Boost purchases")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Content marketing")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "SEO optimized short-form videos")],
          table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:14.400pt,y:3.600pt),align:left + horizon)[#text(font: ("Goudy Old Style"), size: 14.00pt, weight: "regular", fill: rgb("#111111"), style: "italic", "Improve organic reach")]),
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
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:51.762pt, y:321.368pt, width:845.187pt, height:162.187pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Marketing mix: \nThe 4 Ps", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"layout", target-pitch:54.0000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Marketing mix: ", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"The 4 Ps", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false))),)),
  ),
  children:[
    // Source media: assets/media/image40_d578109af2.jpeg | shape: Picture Placeholder 6 | rect
    // pptx-object: slide:11:7
    #Place(
      x:-0.000pt,
      y:49.739pt,
      orientation:0.000deg,
      child:
        image("assets/media/image40_d578109af2_alpha2500.png",width:960.000pt,height:227.054pt,fit:"stretch"),
    )
])
#pagebreak()
// Slide 12
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout12,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:282.000pt, y:402.382pt, width:396.000pt, height:43.200pt, rotation:0.000deg, autofit-mode:"shrink", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Ana Bowman, Director of Marketing", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:21.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Ana Bowman, Director of Marketing", font:"Goudy Old Style", size:18.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 2 | “Our latest campaign drove a 35% increase in engagement, proving that strategic
    // pptx-object: slide:12:3
    #Place(
      x:117.840pt,
      y:100.702pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:724.320pt,
          height:288.000pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:100.0000, line-source:"layout", target-pitch:48.0000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:12.9600pt, indent:-12.9600pt, runs:(PptxPlaceholderRun(text:"“Our latest campaign drove a 35% increase in engagement, proving that strategic storytelling resonates.”", font:"Felix Titling", size:40.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Felix Titling",
          size:40.000pt,
          fill:rgb("#000000"),
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
#pagebreak()
// Slide 13
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout13,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:372.548pt, y:229.161pt, width:542.575pt, height:178.896pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"increase in conversion rates through recent marketing efforts", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:120.0000, line-source:"layout", target-pitch:40.3200pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"increase in conversion rates through recent marketing efforts", font:"Goudy Old Style", size:28.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Editable text: Content Placeholder 8 | 28%
    // pptx-object: slide:13:9
    #Place(
      x:40.543pt,
      y:229.161pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:226.680pt,
          height:178.897pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"center", align-source:"layout", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:90.0000, line-source:"layout", target-pitch:113.4000pt, before-kind:"points", before-value:0.0000, before-source:"layout", before:0.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"28%", font:"Felix Titling", size:105.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),),
          font:"Felix Titling",
          size:105.000pt,
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
  layout:Layout14,
  placeholders:(
    PptxPlaceholder(id:"title-0", type:"title", idx:0, x:225.702pt, y:140.841pt, width:663.840pt, height:145.041pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Marketing that\ndrives results", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"left", align-source:"master_style", line-kind:"percent", line-value:75.0000, line-source:"master_style", target-pitch:39.6000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Marketing that", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"\n", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false), PptxPlaceholderRun(text:"drives results", font:"Felix Titling", size:44.000pt, fill:rgb("#000000"), weight:"regular", italic:false))),)),
  ),
  children:[
    // Source media: assets/media/image41_656bb7c7ba.png | shape: Picture Placeholder 8 | polygon
    // pptx-object: slide:14:9
    #Place(
      x:181.770pt,
      y:0.000pt,
      orientation:0.000deg,
      child:
        image("assets/media/clip_9ae42018ac376ec6.png",width:778.230pt,height:540.000pt,fit:"stretch"),
    )
    // Editable text: Content Placeholder 3 | By staying data-driven and adaptable, our marketing strategy continues to suppor
    // pptx-object: slide:14:4
    #Place(
      x:225.712pt,
      y:297.956pt,
      orientation:0.000deg,
      child:
        PptxTextFrame(width:663.830pt,
          height:100.757pt,
          paragraphs:(PptxParagraph(level:0, bullet-kind:"none", bullet-source:"layout", align:"left", align-source:"master_style", margin-left-source:"layout", indent-source:"layout", line-kind:"percent", line-value:120.0000, line-source:"master_style", target-pitch:28.8000pt, before-kind:"points", before-value:10.0000, before-source:"master_style", before:10.0000pt, margin-left:0.0000pt, indent:0.0000pt, runs:(PptxPlaceholderRun(text:"By staying data-driven and adaptable, our marketing strategy continues to support growth and long-term success.", font:"Goudy Old Style", size:20.000pt, fill:rgb("#000000"), weight:"regular", italic:true),)),),
          font:"Goudy Old Style",
          size:20.000pt,
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
// Slide 15
#PptxSlide(
  width:960.000pt,
  height:540.000pt,
  fill:none,
  format:ppt-format,
  layout:Layout15,
  placeholders:(
    PptxPlaceholder(id:"centered-title-0", type:"centered-title", idx:0, x:58.938pt, y:122.760pt, width:352.800pt, height:294.480pt, rotation:0.000deg, autofit-mode:"none", font-scale:1.00000, line-spacing-reduction:0.00000, text:"Q&A", paragraphs:(PptxPlaceholderParagraph(level:0, bullet-kind:"none", bullet-source:"master_style", align:"center", align-source:"layout", line-kind:"percent", line-value:75.0000, line-source:"layout", target-pitch:54.0000pt, before-kind:"percent", before-value:0.0000, before-source:"master_style", before:0.0000pt, runs:(PptxPlaceholderRun(text:"Q&A", font:"Felix Titling", size:60.000pt, fill:rgb("#000000"), weight:"regular", italic:false),)),)),
  ),
  children:[
    // Source media: assets/media/image42_eddaac5e77.png | shape: Picture Placeholder 4 | rect
    // pptx-object: slide:15:5
    #Place(
      x:488.824pt,
      y:49.403pt,
      orientation:0.000deg,
      child:
        image("assets/media/image42_eddaac5e77_alpha2500.png",width:471.176pt,height:440.640pt,fit:"stretch"),
    )
])