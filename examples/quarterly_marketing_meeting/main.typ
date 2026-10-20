// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, Place, GroupContent, ClipContent
#let ppt-format=(width:960.000pt,height:540.000pt)
#set page(width:960.000pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:"Arial",size:20pt,fill:black)
#set par(leading:3pt,spacing:0pt)

// â”€â”€ Slide 01 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Source media: assets/media/image1_1a23b57b91.svg | shape: Graphic 31 | rect
  #Place(x:356.364pt,y:262.788pt,orientation:-14.989deg,child:image("assets/media/image1_1a23b57b91.svg",width:209.424pt,height:209.424pt,fit:"stretch"))
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 32 | rect
  #Place(x:0.000pt,y:129.784pt,orientation:0.000deg,child:box(width:187.470pt,height:144.375pt,clip:true)[#place(top+left,dx:-57.298pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.768pt,height:144.375pt,fit:"stretch")]])
  // Source media: assets/media/image3_7c0e818f4a.svg | shape: Graphic 34 | rect
  #Place(x:321.073pt,y:0.000pt,orientation:0.000deg,child:box(width:120.339pt,height:145.735pt,clip:true)[#place(top+left,dx:0.000pt,dy:-17.263pt)[#image("assets/media/image3_7c0e818f4a.svg",width:120.339pt,height:162.998pt,fit:"stretch")]])
  // Original editable PowerPoint shape: Freeform: Shape 30
  #Place(x:510.615pt,y:-0.417pt,orientation:0.000deg,child:image("assets/media/shape_c436dd8ce805.svg",width:208.917pt,height:540.833pt,fit:"stretch"))
  // Original editable PowerPoint shape: Rectangle 36
  #Place(x:682.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_560596a583ee.svg",width:278.000pt,height:541.000pt,fit:"stretch"))
  // Source media: assets/media/image4_dc27eb1a84.svg | shape: Graphic 23 | rect
  #Place(x:43.875pt,y:55.310pt,orientation:0.000deg,child:image("assets/media/image4_dc27eb1a84.svg",width:84.226pt,height:84.226pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 16
  #Place(x:104.908pt,y:427.613pt,orientation:0.000deg,child:image("assets/media/shape_036db51bf8ed.svg",width:113.698pt,height:112.387pt,fit:"stretch"))
  // Editable text: Title 2 | Quarterly marketing meeting
  #Place(x:43.875pt,y:159.633pt,orientation:0.000deg,child:box(width: 474.71pt, height: 320.02pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #align(bottom)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Quarterly marketing meeting")
  ]
]
]
])
  // Editable text: Text Placeholder 4 | NORTHWIND TRADERS
  #Place(x:135.375pt,y:62.435pt,orientation:0.000deg,child:box(width: 383.21pt, height: 72.00pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #align(center + horizon)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "NORTHWIND TRADERS")
  ]
]
]
])
  // Source media: assets/media/image17_aceb3da99c.jpg | shape: Picture Placeholder 10 | complex
  #Place(x:564.250pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/clip_ce73af6474f6d8dc.png",width:395.750pt,height:540.000pt,fit:"stretch"))
])
#pagebreak()
// â”€â”€ Slide 02 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 16
  #Place(x:603.700pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_10265b29576a.svg",width:356.800pt,height:541.000pt,fit:"stretch"))
  // Source media: assets/media/image5_c40c069a6d.svg | shape: Graphic 12 | rect
  #Place(x:648.295pt,y:224.775pt,orientation:14.624deg,child:image("assets/media/image5_c40c069a6d.svg",width:144.066pt,height:175.623pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 14
  #Place(x:511.828pt,y:-0.417pt,orientation:180.000deg,child:image("assets/media/shape_0d5e939dfda0.svg",width:208.917pt,height:540.833pt,fit:"stretch"))
  // Original editable PowerPoint shape: Rectangle 15
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_19a13ae8718e.svg",width:532.000pt,height:541.000pt,fit:"stretch"))
  // Source media: assets/media/image6_37fd9fbd3c.svg | shape: Graphic 18 | rect
  #Place(x:687.900pt,y:433.331pt,orientation:0.000deg,child:box(width:165.682pt,height:106.669pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image6_37fd9fbd3c.svg",width:165.682pt,height:143.030pt,fit:"stretch")]])
  // Original editable PowerPoint shape: Freeform: Shape 10
  #Place(x:707.368pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/shape_5f521b8ee6b8.svg",width:252.632pt,height:323.160pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 19
  #Place(x:866.349pt,y:337.661pt,orientation:0.000deg,child:image("assets/media/shape_d5e2f1bcad9c.svg",width:93.651pt,height:126.795pt,fit:"stretch"))
  // Editable text: Title 1 | Agenda
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 581.40pt, height: 142.17pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Agenda")
  ]
]
])
  // Editable text: Content Placeholder 2 | Growth strategy Market analysis Financial overview Innovative solutions Future i
  #Place(x:66.046pt,y:229.631pt,orientation:0.000deg,child:box(width: 538.20pt, height: 223.97pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Growth strategy")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Market analysis")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Financial overview")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Innovative solutions")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Future initiatives")
  ]
]
])
  // Editable text: Slide Number Placeholder 3 | 2
  #Place(x:313.515pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 03 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Freeform: Shape 15
  #Place(x:468.552pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_f3ec7d23b26d.svg",width:491.948pt,height:541.000pt,fit:"stretch"))
  // Source media: assets/media/image7_42fb22fd6a.svg | shape: Graphic 49 | rect
  #Place(x:0.000pt,y:277.941pt,orientation:0.000deg,child:box(width:173.482pt,height:165.750pt,clip:true)[#place(top+left,dx:-18.518pt,dy:0.000pt)[#image("assets/media/image7_42fb22fd6a.svg",width:192.000pt,height:165.750pt,fit:"stretch")]])
  // Source media: assets/media/image8_583511fef8.svg | shape: Graphic 50 | rect
  #Place(x:233.075pt,y:116.436pt,orientation:12.045deg,child:image("assets/media/image8_583511fef8.svg",width:147.750pt,height:192.000pt,fit:"stretch"))
  // Source media: assets/media/image9_ee34313f19.svg | shape: Graphic 51 | rect
  #Place(x:310.212pt,y:364.174pt,orientation:0.000deg,child:box(width:192.000pt,height:175.826pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image9_ee34313f19.svg",width:192.000pt,height:192.000pt,fit:"stretch")]])
  // Source media: assets/media/image4_dc27eb1a84.svg | shape: Graphic 23 | rect
  #Place(x:43.875pt,y:55.310pt,orientation:0.000deg,child:image("assets/media/image4_dc27eb1a84.svg",width:84.226pt,height:84.226pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 11
  #Place(x:30.963pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/shape_584ec81e9869.svg",width:193.999pt,height:118.050pt,fit:"stretch"))
  // Editable text: Title 1 | Strategies for growth
  #Place(x:43.875pt,y:159.633pt,orientation:0.000deg,child:box(width: 474.71pt, height: 320.02pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Strategies ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "for growth")
  ]
]
])
  // Source media: assets/media/image18_b33e26a03b.jpg | shape: Picture Placeholder 14 | complex
  #Place(x:496.625pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/clip_8d48d4fb6eae9d0f.png",width:463.375pt,height:540.000pt,fit:"stretch"))
])
#pagebreak()
// â”€â”€ Slide 04 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 16
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_2a61986cc85c.svg",width:257.800pt,height:541.000pt,fit:"stretch"))
  // Source media: assets/media/image1_1a23b57b91.svg | shape: Graphic 8 | rect
  #Place(x:62.124pt,y:191.856pt,orientation:-14.989deg,child:image("assets/media/image1_1a23b57b91.svg",width:209.424pt,height:209.424pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 14
  #Place(x:166.420pt,y:-0.417pt,orientation:-0.000deg,child:image("assets/media/shape_0d5e939dfda0.svg",width:208.917pt,height:540.833pt,fit:"stretch"))
  // Original editable PowerPoint shape: Rectangle 7
  #Place(x:296.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_64a04a9b67af.svg",width:664.000pt,height:541.000pt,fit:"stretch"))
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 9 | rect
  #Place(x:0.000pt,y:23.625pt,orientation:0.000deg,child:box(width:187.470pt,height:144.375pt,clip:true)[#place(top+left,dx:-57.298pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.768pt,height:144.375pt,fit:"stretch")]])
  // Original editable PowerPoint shape: Freeform: Shape 26
  #Place(x:0.000pt,y:410.456pt,orientation:0.000deg,child:image("assets/media/shape_445df2c6bfef.svg",width:105.486pt,height:129.544pt,fit:"stretch"))
  // Editable text: Title 1 | Current market analysis
  #Place(x:320.400pt,y:67.192pt,orientation:0.000deg,child:box(width: 581.40pt, height: 142.17pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Current market ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "analysis")
  ]
]
])
  // Editable text: Content Placeholder 2 | Data reveals a steady increase in consumer demand for sustainable products, pres
  #Place(x:320.400pt,y:223.800pt,orientation:0.000deg,child:box(width: 581.40pt, height: 229.80pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Data reveals a steady increase in consumer demand for sustainable products, presenting an opportunity for our co-friendly offerings.")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Our competitors are now focusing on digital marketing strategies, suggesting a shift in consumer behavior.")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Understanding these nuanced dynamics positions us to adapt and capitalize on emerging market preferences.")
  ]
]
])
  // Editable text: Slide Number Placeholder 3 | 4
  #Place(x:606.588pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 05 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Source media: assets/media/image10_d61936ec21.svg | shape: Graphic 49 | rect
  #Place(x:0.114pt,y:311.681pt,orientation:0.000deg,child:box(width:173.482pt,height:165.750pt,clip:true)[#place(top+left,dx:-18.518pt,dy:0.000pt)[#image("assets/media/image10_d61936ec21.svg",width:192.000pt,height:165.750pt,fit:"stretch")]])
  // Source media: assets/media/image11_cada0dced8.svg | shape: Graphic 50 | rect
  #Place(x:53.065pt,y:51.640pt,orientation:12.045deg,child:image("assets/media/image11_cada0dced8.svg",width:147.750pt,height:192.000pt,fit:"stretch"))
  // Source media: assets/media/image12_4b742b9d55.svg | shape: Graphic 51 | rect
  #Place(x:189.926pt,y:421.462pt,orientation:0.000deg,child:box(width:192.000pt,height:118.538pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.002pt)[#image("assets/media/image12_4b742b9d55.svg",width:192.000pt,height:192.001pt,fit:"stretch")]])
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 4 | rect
  #Place(x:693.806pt,y:199.720pt,orientation:0.000deg,child:box(width:246.576pt,height:144.375pt,clip:true)[#place(top+left,dx:1.809pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.770pt,height:144.375pt,fit:"stretch")]])
  // Source media: assets/media/image3_7c0e818f4a.svg | shape: Graphic 6 | rect
  #Place(x:642.068pt,y:-1.537pt,orientation:0.000deg,child:box(width:120.339pt,height:145.735pt,clip:true)[#place(top+left,dx:0.000pt,dy:-17.263pt)[#image("assets/media/image3_7c0e818f4a.svg",width:120.339pt,height:162.998pt,fit:"stretch")]])
  // Source media: assets/media/image13_2d48d3985b.svg | shape: Graphic 7 | rect
  #Place(x:210.628pt,y:0.000pt,orientation:0.000deg,child:box(width:538.744pt,height:540.000pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image13_2d48d3985b.svg",width:539.997pt,height:540.000pt,fit:"stretch")]])
  // Source media: assets/media/image14_adc5562936.svg | shape: Graphic 8 | rect
  #Place(x:846.515pt,y:0.000pt,orientation:0.000deg,child:box(width:113.485pt,height:161.195pt,clip:true)[#place(top+left,dx:0.000pt,dy:-61.999pt)[#image("assets/media/image14_adc5562936.svg",width:208.371pt,height:223.193pt,fit:"stretch")]])
  // Original editable PowerPoint shape: Freeform: Shape 17
  #Place(x:208.596pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/shape_9bb623cf3145.svg",width:190.035pt,height:78.109pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 27
  #Place(x:877.679pt,y:444.037pt,orientation:0.000deg,child:image("assets/media/shape_5cbb463b6c27.svg",width:82.321pt,height:95.963pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 43
  #Place(x:644.882pt,y:419.351pt,orientation:0.000deg,child:image("assets/media/shape_d45950bec055.svg",width:113.698pt,height:120.649pt,fit:"stretch"))
  // Editable text: Title 1 | Market expansion
  #Place(x:134.187pt,y:267.724pt,orientation:0.000deg,child:box(width: 691.63pt, height: 198.61pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Market expansion")
  ]
]
])
  // Editable text: Subtitle 2 | Unlocking new horizons
  #Place(x:179.938pt,y:152.684pt,orientation:0.000deg,child:box(width: 600.12pt, height: 72.00pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Unlocking new horizons")
  ]
]
])
])
#pagebreak()
// â”€â”€ Slide 06 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 15
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"))
  // Original editable PowerPoint shape: Graphic 32
  #Place(x:18.180pt,y:16.511pt,orientation:0.000deg,child:image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"))
  // Editable text: Title 1 | Product launch timeline
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 828.00pt, height: 108.44pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Product launch ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "timeline")
  ]
]
])
  // Editable text: Content Placeholder 2 | Currently gearing up for a ground-breaking launch  Our new offerings will captiv
  #Place(x:66.000pt,y:203.550pt,orientation:0.000deg,child:box(width: 332.40pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Currently gearing up for a ground-breaking launch ")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Our new offerings will captivate the market")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Our marketing campaign will generate anticipation")
  ]
]
])
  // Editable text: Slide Number Placeholder 3 | 6
  #Place(x:458.368pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 07 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Freeform: Shape 6
  #Place(x:658.364pt,y:-0.417pt,orientation:0.000deg,child:image("assets/media/shape_3564365a8460.svg",width:302.052pt,height:540.833pt,fit:"stretch"))
  // Editable text: Title 1 | Marketing strategies
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 581.40pt, height: 142.17pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Marketing ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "strategies")
  ]
]
])
  // Editable text: Content Placeholder 2 | Implement personalized engagement strategies Tailor campaigns to resonate with s
  #Place(x:66.000pt,y:229.631pt,orientation:0.000deg,child:box(width: 538.20pt, height: 223.97pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Implement personalized engagement strategies")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Tailor campaigns to resonate with specific demographics, fostering a sense of relevance ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "and connection")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Collaborate with influencers and thought leaders ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "to amplify our brand message")
  ]
]
])
  // Editable text: Slide Number Placeholder 3 | 7
  #Place(x:313.468pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
  // Source media: assets/media/image19_366ddc801f.png | shape: Picture Placeholder 19 | complex
  #Place(x:713.750pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/clip_c8facf7e1b0d0704.png",width:246.250pt,height:540.000pt,fit:"stretch"))
])
#pagebreak()
// â”€â”€ Slide 08 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 12
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"))
  // Original editable PowerPoint shape: Graphic 32
  #Place(x:18.180pt,y:16.511pt,orientation:0.000deg,child:image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"))
  // Editable text: Title 1 | Financial overview
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 828.00pt, height: 108.44pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Financial ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "overview")
  ]
]
])
  // Editable text: Content Placeholder 2 | Our financial overview reflects a robust and resilient fiscal performance. Opera
  #Place(x:66.000pt,y:203.550pt,orientation:0.000deg,child:box(width: 275.40pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 2.96pt, spacing: 0pt)
    #text(font: "Arial", size: 18.50pt, weight: "regular", fill: rgb("#FFFFFF"), "Our financial overview reflects a robust and resilient fiscal performance.")
  ]
  #v(11.10pt)
  #align(left)[
    #set par(leading: 2.96pt, spacing: 0pt)
    #text(font: "Arial", size: 18.50pt, weight: "regular", fill: rgb("#FFFFFF"), "Operating margins have improved, signaling operational efficiency, while strengthening our reserves.")
  ]
  #v(11.10pt)
  #v(22.00pt)
]
])
  // Editable text: Content Placeholder 3 | This underscores our commitment to financial stability, positioning us for susta
  #Place(x:370.800pt,y:203.550pt,orientation:0.000deg,child:box(width: 523.20pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "This underscores our commitment to financial stability, positioning us for sustained growth. ")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Key indicators show consistent revenue growth over the past quarter, attributed to strategic cost management and successful marketing.")
  ]
  #v(12.00pt)
  #v(22.00pt)
]
])
  // Editable text: Slide Number Placeholder 4 | 8
  #Place(x:458.368pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 09 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 8
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"))
  // Original editable PowerPoint shape: Graphic 32
  #Place(x:18.180pt,y:16.511pt,orientation:0.000deg,child:image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"))
  // Editable text: Title 1 | Quarterly targets
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 828.00pt, height: 108.44pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Quarterly ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "targets")
  ]
]
])
  // Editable text: Content Placeholder 7 | Market expansion Product innovation Customer retention Operational efficiency
  #Place(x:66.019pt,y:208.800pt,orientation:0.000deg,child:box(width: 322.78pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Market expansion")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Product innovation")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Customer retention")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Operational efficiency")
  ]
]
])
  // Editable text: Slide Number Placeholder 3 | 9
  #Place(x:458.368pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 10 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 8
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"))
  // Original editable PowerPoint shape: Graphic 32
  #Place(x:18.180pt,y:16.511pt,orientation:0.000deg,child:image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"))
  // Editable text: Title 1 | Financial snapshot
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 828.00pt, height: 108.44pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Financial ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "snapshot")
  ]
]
])
  // Editable text: Slide Number Placeholder 2 | 10
  #Place(x:458.368pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 11 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Source media: assets/media/image10_d61936ec21.svg | shape: Graphic 8 | rect
  #Place(x:0.114pt,y:311.681pt,orientation:0.000deg,child:box(width:173.482pt,height:165.750pt,clip:true)[#place(top+left,dx:-18.518pt,dy:0.000pt)[#image("assets/media/image10_d61936ec21.svg",width:192.000pt,height:165.750pt,fit:"stretch")]])
  // Source media: assets/media/image11_cada0dced8.svg | shape: Graphic 9 | rect
  #Place(x:53.065pt,y:51.640pt,orientation:12.045deg,child:image("assets/media/image11_cada0dced8.svg",width:147.750pt,height:192.000pt,fit:"stretch"))
  // Source media: assets/media/image12_4b742b9d55.svg | shape: Graphic 10 | rect
  #Place(x:189.926pt,y:421.462pt,orientation:0.000deg,child:box(width:192.000pt,height:118.538pt,clip:true)[#place(top+left,dx:0.000pt,dy:-0.002pt)[#image("assets/media/image12_4b742b9d55.svg",width:192.000pt,height:192.001pt,fit:"stretch")]])
  // Source media: assets/media/image2_9c3eeb6c7e.svg | shape: Graphic 13 | rect
  #Place(x:693.806pt,y:199.720pt,orientation:0.000deg,child:box(width:246.576pt,height:144.375pt,clip:true)[#place(top+left,dx:1.809pt,dy:0.000pt)[#image("assets/media/image2_9c3eeb6c7e.svg",width:244.770pt,height:144.375pt,fit:"stretch")]])
  // Source media: assets/media/image3_7c0e818f4a.svg | shape: Graphic 15 | rect
  #Place(x:642.068pt,y:-1.537pt,orientation:0.000deg,child:box(width:120.339pt,height:145.735pt,clip:true)[#place(top+left,dx:0.000pt,dy:-17.263pt)[#image("assets/media/image3_7c0e818f4a.svg",width:120.339pt,height:162.998pt,fit:"stretch")]])
  // Source media: assets/media/image14_adc5562936.svg | shape: Graphic 16 | rect
  #Place(x:846.515pt,y:0.000pt,orientation:0.000deg,child:box(width:113.485pt,height:161.195pt,clip:true)[#place(top+left,dx:0.000pt,dy:-61.999pt)[#image("assets/media/image14_adc5562936.svg",width:208.371pt,height:223.193pt,fit:"stretch")]])
  // Source media: assets/media/image13_2d48d3985b.svg | shape: Graphic 7 | rect
  #Place(x:210.628pt,y:0.000pt,orientation:0.000deg,child:box(width:538.744pt,height:540.000pt,clip:true)[#place(top+left,dx:0.000pt,dy:0.000pt)[#image("assets/media/image13_2d48d3985b.svg",width:539.997pt,height:540.000pt,fit:"stretch")]])
  // Original editable PowerPoint shape: Freeform: Shape 21
  #Place(x:208.596pt,y:0.000pt,orientation:0.000deg,child:image("assets/media/shape_808dd51a96d4.svg",width:189.756pt,height:78.109pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 32
  #Place(x:877.679pt,y:444.037pt,orientation:0.000deg,child:image("assets/media/shape_5cbb463b6c27.svg",width:82.321pt,height:95.963pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 47
  #Place(x:644.882pt,y:419.351pt,orientation:0.000deg,child:image("assets/media/shape_3144ce6ddb1a.svg",width:113.698pt,height:120.649pt,fit:"stretch"))
  // Editable text: Title 2 | Innovative solutions
  #Place(x:134.187pt,y:170.695pt,orientation:0.000deg,child:box(width: 691.63pt, height: 198.61pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Innovative solutions")
  ]
]
])
])
#pagebreak()
// â”€â”€ Slide 12 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 12
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_002d149bece2.svg",width:961.000pt,height:541.000pt,fit:"stretch"))
  // Original editable PowerPoint shape: Graphic 32
  #Place(x:18.180pt,y:16.511pt,orientation:0.000deg,child:image("assets/media/shape_e118c916581b.svg",width:923.640pt,height:506.977pt,fit:"stretch"))
  // Editable text: Title 1 | Future initiatives
  #Place(x:66.000pt,y:67.192pt,orientation:0.000deg,child:box(width: 828.00pt, height: 108.44pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Future ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "initiatives")
  ]
]
])
  // Editable text: Content Placeholder 3 | Product enhancement. Introduce regular updates and features to enhance product o
  #Place(x:66.000pt,y:203.550pt,orientation:0.000deg,child:box(width: 523.20pt, height: 274.14pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Product enhancement. Introduce regular updates and features to enhance product offerings.")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Technology integration. Explore emerging technologies for potential integration into ")#text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "our operations.")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Collaborative partnerships. Foster collaborations with tech innovators and industry leaders to drive innovation.")
  ]
]
])
  // Editable text: Content Placeholder 2 | Green supply chain Reduced carbon footprint Waste reduction Water conservation
  #Place(x:618.600pt,y:203.550pt,orientation:0.000deg,child:box(width: 275.40pt, height: 274.14pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Green supply chain")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Reduced carbon footprint")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Waste reduction")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Water conservation")
  ]
]
])
  // Editable text: Slide Number Placeholder 4 | 12
  #Place(x:458.368pt,y:485.822pt,orientation:0.000deg,child:box(width: 43.26pt, height: 28.75pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #v(22.00pt)
]
])
])
#pagebreak()
// â”€â”€ Slide 13 â”€â”€
#Root(width:960.000pt,height:540.000pt,fill:rgb("#334031"),format:ppt-format,children:[
  // Original editable PowerPoint shape: Rectangle 16
  #Place(x:-0.500pt,y:-0.500pt,orientation:0.000deg,child:image("assets/media/shape_0a87422a1b3e.svg",width:958.764pt,height:541.000pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 31
  #Place(x:0.000pt,y:425.809pt,orientation:0.000deg,child:image("assets/media/shape_34c397a5621b.svg",width:136.069pt,height:114.191pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 40
  #Place(x:872.435pt,y:241.161pt,orientation:0.000deg,child:image("assets/media/shape_b60f083cfce3.svg",width:87.565pt,height:126.795pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 37
  #Place(x:0.000pt,y:225.746pt,orientation:0.000deg,child:image("assets/media/shape_d35b14c6015d.svg",width:189.270pt,height:126.161pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 19
  #Place(x:777.492pt,y:393.084pt,orientation:0.000deg,child:image("assets/media/shape_710d93559f07.svg",width:140.659pt,height:146.916pt,fit:"stretch"))
  // Source media: assets/media/image15_7a592df3d2.svg | shape: Graphic 11 | rect
  #Place(x:831.088pt,y:36.449pt,orientation:14.624deg,child:image("assets/media/image15_7a592df3d2.svg",width:144.066pt,height:175.623pt,fit:"stretch"))
  // Source media: assets/media/image10_d61936ec21.svg | shape: Graphic 18 | rect
  #Place(x:0.000pt,y:49.147pt,orientation:0.000deg,child:box(width:148.748pt,height:141.353pt,clip:true)[#place(top+left,dx:-16.934pt,dy:0.000pt)[#image("assets/media/image10_d61936ec21.svg",width:165.683pt,height:143.029pt,fit:"stretch")]])
  // Source media: assets/media/image16_a7107c6dad.svg | shape: Graphic 12 | rect
  #Place(x:648.295pt,y:224.775pt,orientation:14.624deg,child:image("assets/media/image16_a7107c6dad.svg",width:144.066pt,height:175.623pt,fit:"stretch"))
  // Original editable PowerPoint shape: Freeform: Shape 10
  #Place(x:80.687pt,y:-0.417pt,orientation:180.000deg,child:image("assets/media/shape_c4cd1f33172c.svg",width:798.626pt,height:540.833pt,fit:"stretch"))
  // Editable text: Title 4 | Thank you
  #Place(x:189.300pt,y:79.800pt,orientation:0.000deg,child:box(width: 581.40pt, height: 175.65pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Thank you")
  ]
]
])
  // Editable text: Content Placeholder 5 | Peyton Davis | 424-555-0124 peyton@northwindtraders.com www.northwindtraders.com
  #Place(x:189.300pt,y:270.000pt,orientation:0.000deg,child:box(width: 581.40pt, height: 180.99pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Peyton Davis | 424-555-0124")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "peyton@northwindtraders.com")
  ]
  #v(12.00pt)
  #align(left)[
    #set par(leading: 3.20pt, spacing: 0pt)
    #text(font: "Arial", size: 20.00pt, weight: "regular", fill: rgb("#FFFFFF"), "www.northwindtraders.com")
  ]
]
])
])