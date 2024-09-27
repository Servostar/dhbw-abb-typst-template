
// .--------------------------------------------------------------------------.
// |                         Template of DHBW thesis                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// start of template pages and styles
#let dhbw-template(body) = [

  #set page(columns: 2, margin: 2.5cm)
  #set text(size: 10pt, font: "Times New Roman")
  #set par(justify: true)
  #set columns(gutter: 0.95cm)

  #show heading: it => align(center, pad(top: 0.85cm, text(size: 12pt, it)))

  #body
]
