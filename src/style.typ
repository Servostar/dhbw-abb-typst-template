
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

  #doc
]

#let HeaderPaddingBottom = 3em
#let LogoHeight = 3em
#let HeaderUnderlinePaddingTop = 8pt

#let prelude_styled(doc: content, thesis) = context [
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

  #doc
]
