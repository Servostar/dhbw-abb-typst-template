
// .--------------------------------------------------------------------------.
// |                         Template of DHBW thesis                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 01.10.2024
// License: MIT

// start of template pages and styles
#let dhbw-template(body) = [

  #set page(margin: 2.5cm, footer: counter(page).display())
  #set text(size: 10pt, font: "Times New Roman")
  #set par(justify: true)
  #set block(below: 1em, above: 0pt)

  #show heading.where(level: 1): it => align(center, pad(top: 0.85cm, text(size: 12pt, it)))
  #show heading.where(level: 2): it => text(size: 10pt, it)

  #show raw: it => text(font: "Consolas", size: 8pt, it)

  #set align(center)
  #block(below: 0.85cm, text(size: 16pt, weight: "bold", "Title"))

  #let authors = (
    (
      name: "Johann Goethe",
      matriculation-number: 123456789,
      company: "SAP",
      e-mail: "johann-goether@sap.de",
    ),
  )

  #grid(columns: authors.len(), column-gutter: 0.95cm, rows: 1, ..authors.map(author => block()[
      #text(size: 10pt, weight: "bold", author.name)
      #set text(size: 9pt)
      #linebreak()
      #author.matriculation-number, #author.company
      #linebreak()
      #author.e-mail
    ]))

  #v(10pt)

  #set align(left)
  #columns(gutter: 0.95cm)[
    #align(center, text(weight: "bold", size: 10pt, "Abstract"))
    #lorem(20)

    #body

    #align(center, pad(top: 1em, text(weight: "bold", size: 10pt, "Citations and references")))

    #bibliography("../template/refs.bib", title: none, style: "annual-reviews-author-date")
  ]
]
