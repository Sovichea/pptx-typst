// Source-faithful PPTX conversion with original shared media and editable text.
// Source slide format, theme-resolved colors and image backgrounds.
#import "template.typ": Root, Place, GroupContent, ClipContent
#let ppt-format=(width:960.000pt,height:540.000pt)
#set page(width:960.000pt,height:540.000pt,margin:0pt,fill:white)
#set text(font:("Arial","Libertinus Serif"),size:20pt,fill:black)
#set par(leading:4pt,spacing:0pt)

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
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 28.08pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 54.00pt, weight: "regular", fill: rgb("#EAE8E8"), "Quarterly marketing meeting")
  ]
]
])
  // Editable text: Text Placeholder 4 | NORTHWIND TRADERS
  #Place(x:135.375pt,y:62.435pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 383.21pt, height: 72.00pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 14.56pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:28.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:18.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 28.00pt, weight: "regular", fill: rgb("#EBDDC3"), "NORTHWIND TRADERS")])
  ]
]
]))
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Agenda")
  ]
]
])
  // Editable text: Content Placeholder 2 | Growth strategy Market analysis Financial overview Innovative solutions Future i
  #Place(x:66.046pt,y:229.631pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 538.20pt, height: 223.97pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.72pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Growth strategy")
  ]
  #v(28.80pt)
  #align(left)[
    #set par(leading: 12.72pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Market analysis")
  ]
  #v(28.80pt)
  #align(left)[
    #set par(leading: 12.72pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Financial overview")
  ]
  #v(28.80pt)
  #align(left)[
    #set par(leading: 12.72pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Innovative solutions")
  ]
  #v(28.80pt)
  #align(left)[
    #set par(leading: 12.72pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Future initiatives")
  ]
]
]))
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
    #set par(leading: 22.88pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 44.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Strategies ")#text(font: ("Jumble", "Libertinus Serif"), size: 44.00pt, weight: "regular", fill: rgb("#F2F2F2"), "for growth")
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Current market ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "analysis")
  ]
]
])
  // Editable text: Content Placeholder 2 | Data reveals a steady increase in consumer demand for sustainable products, pres
  #Place(x:320.400pt,y:223.800pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 581.40pt, height: 229.80pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Data reveals a steady increase in consumer demand for sustainable products, presenting an opportunity for our co-friendly offerings.")
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Our competitors are now focusing on digital marketing strategies, suggesting a shift in consumer behavior.")
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Understanding these nuanced dynamics positions us to adapt and capitalize on emerging market preferences.")
  ]
]
]))
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
    #set par(leading: 22.88pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 44.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Market expansion")
  ]
]
])
  // Editable text: Subtitle 2 | Unlocking new horizons
  #Place(x:179.938pt,y:152.684pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 600.12pt, height: 72.00pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 14.56pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:28.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:18.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 28.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Unlocking new horizons")])
  ]
]
]))
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Product launch ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "timeline")
  ]
]
])
  // Editable text: Content Placeholder 2 | Currently gearing up for a ground-breaking launch  Our new offerings will captiv
  #Place(x:66.000pt,y:203.550pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 332.40pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Currently gearing up for a ground-breaking launch ")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Our new offerings will captivate the market")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Our marketing campaign will generate anticipation")])
  ]
]
]))
  // SmartArt layout drawing: Content Placeholder 16
  #Place(x:448.500pt,y:164.875pt,orientation:0.000deg,child:image("assets/media/smartart_0a46e8230802.svg",width:445.750pt,height:308.125pt,fit:"stretch"))
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Marketing ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "strategies")
  ]
]
])
  // Editable text: Content Placeholder 2 | Implement personalized engagement strategies Tailor campaigns to resonate with s
  #Place(x:66.000pt,y:229.631pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 538.20pt, height: 223.97pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Implement personalized engagement strategies")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Tailor campaigns to resonate with specific demographics, fostering a sense of relevance ")#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "and connection")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Collaborate with influencers and thought leaders ")#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "to amplify our brand message")])
  ]
]
]))
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Financial ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "overview")
  ]
]
])
  // Editable text: Content Placeholder 2 | Our financial overview reflects a robust and resilient fiscal performance. Opera
  #Place(x:66.000pt,y:203.550pt,orientation:0.000deg,child:box(width: 275.40pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 11.54pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 22.20pt, weight: "regular", fill: rgb("#EBDDC3"), "Our financial overview reflects a robust and resilient fiscal performance.")
  ]
  #v(22.20pt)
  #align(left)[
    #set par(leading: 11.54pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 22.20pt, weight: "regular", fill: rgb("#EBDDC3"), "Operating margins have improved, signaling operational efficiency, while strengthening our reserves.")
  ]
  #v(22.20pt)
  #v(22.00pt)
]
])
  // Editable text: Content Placeholder 3 | This underscores our commitment to financial stability, positioning us for susta
  #Place(x:370.800pt,y:203.550pt,orientation:0.000deg,child:box(width: 523.20pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "This underscores our commitment to financial stability, positioning us for sustained growth. ")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Key indicators show consistent revenue growth over the past quarter, attributed to strategic cost management and successful marketing.")])
  ]
  #v(24.00pt)
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Quarterly ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "targets")
  ]
]
])
  // Editable text: Content Placeholder 7 | Market expansion Product innovation Customer retention Operational efficiency
  #Place(x:66.019pt,y:208.800pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 322.78pt, height: 250.30pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Market expansion")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Product innovation")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Customer retention")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Operational efficiency")])
  ]
]
]))
  // Editable PowerPoint table: Table Placeholder 2
  #Place(x:418.250pt,y:208.750pt,orientation:0.000deg,child:table(columns:(118.937pt, 118.937pt, 118.937pt, 118.937pt),rows:(72.050pt, 45.450pt, 45.450pt, 45.450pt, 45.450pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Quarter")],
  table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Revenue ")#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "growth (%)")],
  table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Market share increase (%)")],
  table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Customer acquisition")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q1")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "12")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "2")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "500")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q2")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "15")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "3")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "600")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q3")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "18")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "4")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "700")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Q4")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "20")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "5")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "800")]))
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Financial ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "snapshot")
  ]
]
])
  // Editable PowerPoint table: Table Placeholder 3
  #Place(x:66.000pt,y:208.750pt,orientation:0.000deg,child:table(columns:(207.000pt, 207.000pt, 207.000pt, 207.000pt),rows:(42.600pt, 42.600pt, 42.600pt, 42.600pt, 42.600pt, 42.600pt),gutter:0pt,stroke:none,table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Metric")],
  table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Current value")],
  table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Previous quarter")],
  table.cell(fill:none,stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 2.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "bold", fill: rgb("#EBDDC3"), "Change (%)")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Revenue")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$2,500,000")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$2,200,000")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+14%")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Operating expenses")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$1,200,000")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$1,400,000")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "-14%")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Net profit")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$1,000,000")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$800,000")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+25%")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Operating margin")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "40%")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "36%")],
  table.cell(fill:none,stroke:(left: 1.000pt + rgb("#FFFFFF"), right: 1.000pt + rgb("#FFFFFF"), top: 1.000pt + rgb("#FFFFFF"), bottom: 1.000pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+4%")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Cash reserves")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$5,000,000")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "$4,500,000")],
  table.cell(fill:rgb("#DD8047"),stroke:(left: 0.5pt + rgb("#FFFFFF"), right: 0.5pt + rgb("#FFFFFF"), top: 0.5pt + rgb("#FFFFFF"), bottom: 0.5pt + rgb("#FFFFFF")),inset:(x:7.200pt,y:3.600pt),align:center + horizon)[#text(font: ("Arial", "Libertinus Serif"), size: 14.00pt, weight: "regular", fill: rgb("#EBDDC3"), "+11%")]))
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
    #set par(leading: 22.88pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 44.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Innovative solutions")
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "Future ")#text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#F2F2F2"), "initiatives")
  ]
]
])
  // Editable text: Content Placeholder 3 | Product enhancement. Introduce regular updates and features to enhance product o
  #Place(x:66.000pt,y:203.550pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 523.20pt, height: 274.14pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Product enhancement. Introduce regular updates and features to enhance product offerings.")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Technology integration. Explore emerging technologies for potential integration into ")#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "our operations.")])
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #list(marker:[#text(font:("Arial", "Libertinus Serif"),size:24.00pt,weight:"regular",fill:rgb("#EBDDC3"),"•")],indent:0.00pt,body-indent:27.00pt,tight:true,spacing:0pt,[#text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Collaborative partnerships. Foster collaborations with tech innovators and industry leaders to drive innovation.")])
  ]
]
]))
  // Editable text: Content Placeholder 2 | Green supply chain Reduced carbon footprint Waste reduction Water conservation
  #Place(x:618.600pt,y:203.550pt,orientation:0.000deg,child:move(dy:7.20pt, box(width: 275.40pt, height: 274.14pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Green supply chain")
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Reduced carbon footprint")
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Waste reduction")
  ]
  #v(24.00pt)
  #align(left)[
    #set par(leading: 12.48pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 24.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Water conservation")
  ]
]
]))
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
    #set par(leading: 18.72pt, spacing: 0pt)
    #text(font: ("Jumble", "Libertinus Serif"), size: 36.00pt, weight: "regular", fill: rgb("#FFFFFF"), "Thank you")
  ]
]
])
  // Editable text: Content Placeholder 5 | Peyton Davis | 424-555-0124 peyton@northwindtraders.com www.northwindtraders.com
  #Place(x:189.300pt,y:270.000pt,orientation:0.000deg,child:box(width: 581.40pt, height: 180.99pt, clip: false)[
  #pad(left:7.200pt,right:7.200pt,top:3.600pt,bottom:3.600pt)[
  #set par(spacing: 0pt)
  #align(left)[
    #set par(leading: 9.54pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 18.00pt, weight: "regular", fill: rgb("#EBDDC3"), "Peyton Davis | 424-555-0124")
  ]
  #v(21.60pt)
  #align(left)[
    #set par(leading: 9.54pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 18.00pt, weight: "regular", fill: rgb("#EBDDC3"), "peyton@northwindtraders.com")
  ]
  #v(21.60pt)
  #align(left)[
    #set par(leading: 9.54pt, spacing: 0pt)
    #text(font: ("Source Sans Pro", "Libertinus Serif"), size: 18.00pt, weight: "regular", fill: rgb("#EBDDC3"), "www.northwindtraders.com")
  ]
]
])
])