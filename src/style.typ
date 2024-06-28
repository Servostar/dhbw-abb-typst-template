
// .--------------------------------------------------------------------------.
// |                         Global style of document                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// global style of document
#let global_styled_doc(doc: content) = context [
  // set page geometry
  // paper format of A4
  #set page(
    paper: "a4",
    margin: (left: 3cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm))

  #set text(
    size: 12pt,
    ligatures: true,
    hyphenate: true,
    dir: ltr,
    font: "Open Sans")

  #show heading: set text(
    font: "Montserrat",
    weight: "semibold")

  // Set header spacing
  #show heading.where(level: 1): it => v(2em) + it + v(1em)
  #show heading.where(level: 2): it => v(1em) + it + v(0.5em)
  #show heading.where(level: 3): it => v(0.5em) + it + v(0.25em)

  #set raw(tab-size: 4)

  #set block(spacing: 2em)
  #set par(
    justify: true,
    first-line-indent: 1em,
    leading: 1em)

  #doc
]

#let HeaderPaddingBottom = 1.5em
#let LogoHeight = 3em
#let HeaderUnderlinePaddingTop = 0pt

#let prelude_styled(body: content, thesis) = context [
  #set page(
    header-ascent: HeaderUnderlinePaddingTop + HeaderPaddingBottom,
    numbering: "I",
    margin: (top: 2.5cm + LogoHeight + HeaderUnderlinePaddingTop + HeaderPaddingBottom),
    header: [
      #grid(
        columns: (1fr, auto),
        align: (horizon, bottom),
        context [ _ #thesis.title _ ],
        image("pages/res/DHBW.svg", height: LogoHeight)
      )
      #v(HeaderUnderlinePaddingTop - 1em)
      #line(length: 100%)
    ])

  #body
]

#let content_styled(body: content, thesis) = [
  #set heading(numbering: "1.")
  #page(
    header-ascent: HeaderUnderlinePaddingTop + HeaderPaddingBottom,
    numbering: "1/1",
    footer-descent: 1em,
    margin: (top: 2.5cm + LogoHeight + HeaderUnderlinePaddingTop + HeaderPaddingBottom, bottom: 2.5cm + 1em),
    header: context [
      #let headers-before = query(selector(heading.where(numbering: "1.", level: 1)).before(here()))

      #let header-title = thesis.title

      #if headers-before.len() > 0 {
        header-title = headers-before.last().body
      } else {
        let headers-after = query(selector(heading.where(numbering: "1.", level: 1)).after(here()))

        if headers-after.len() > 0 {
          header-title = headers-after.first().body
        }
      }

      #grid(
        columns: (1fr, auto),
        align: (horizon, bottom),
        context [ _ #header-title _ ],
        image("pages/res/DHBW.svg", height: LogoHeight)
      )
      #v(HeaderUnderlinePaddingTop - 1em)
      #line(length: 100%)
    ])[
    #body
  ]
]
