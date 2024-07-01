
// .--------------------------------------------------------------------------.
// |                         Global style of document                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

#let HeaderPaddingBottom = 1.5em
#let LogoHeight = 3em
#let HeaderUnderlinePaddingTop = 0pt

// global style of document
#let global_styled_doc(config: dictionary, body: content) = context [
  #let thesis = config.thesis

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

  #set heading(supplement: [chapter])

  // Set header spacing
  #show heading.where(level: 1): it => v(2em) + it + v(1em)
  #show heading.where(level: 2): it => v(1em) + it + v(0.5em)
  #show heading.where(level: 3): it => v(0.5em) + it + v(0.25em)

  #set raw(tab-size: 4, theme: "res/github.tmTheme")
  #show raw.where(block: true): code => {
    show raw.line: line => {
      text(fill: gray)[#line.number]
      h(1em)
      line.body
    }
    code
  }

  #set block(spacing: 2em)
  #set par(
    justify: true,
    first-line-indent: 1em,
    leading: 1em)

  #show link: set text(fill: red.darken(15%))
  #show ref: set text(fill: red.darken(15%))

  #set heading(numbering: none)
  #set page(
    header-ascent: HeaderUnderlinePaddingTop + HeaderPaddingBottom,
    footer-descent: 1em,
    margin: (top: 2.5cm + LogoHeight + HeaderUnderlinePaddingTop + HeaderPaddingBottom, bottom: 2.5cm + 1em),
    numbering: (..nums) => {
      let current-page = here().page()
      if current-page == 1{
        []
      } else if query(<end-of-prelude>).first().location().page() > current-page {
        numbering("I", nums.pos().first())
      } else if query(<end-of-content>).first().location().page() >= current-page {
        numbering("1 / 1", ..nums)
      } else {
        numbering("a", nums.pos().first())
      }
    },
    header: context {
      set align(left)
      if here().page() == 1 {
        // logo of ABB and DHBW
        grid(
          // set width of columns
          // we need two, so make both half the page width
          columns: (50%, 50%),
          // left align logo of ABB
          align(left, image("res/ABB.svg", height: LogoHeight)),
          // right align logo of DHBW
          align(right, image("res/DHBW.svg", height: LogoHeight)))

      } else if query(<end-of-prelude>).first().location().page() <= here().page() {
        let headers-before = query(selector(heading.where(numbering: "1.", level: 1)).before(here()))

        let header-title = thesis.title

        if headers-before.len() > 0 {
          header-title = headers-before.last().body
        } else {
          let headers-after = query(selector(heading.where(numbering: "1.", level: 1)).after(here()))

          if headers-after.len() > 0 {
            header-title = headers-after.first().body
          }
        }

        grid(
          columns: (1fr, auto),
          align: (horizon, bottom),
          context [ _ #header-title _ ],
          image("res/DHBW.svg", height: LogoHeight))
        
        v(HeaderUnderlinePaddingTop - 1em)
        line(length: 100%)
      } else {
        grid(
          columns: (1fr, auto),
          align: (horizon, bottom),
          context [ _ #config.thesis.title _ ],
          image("res/DHBW.svg", height: LogoHeight)
        )
        v(HeaderUnderlinePaddingTop - 1em)
        line(length: 100%)
      }
    })

  #body
]

#let content_styled(config: dictionary, body: content) = [
  #set heading(numbering: "1.")

  #let thesis = config.thesis

  #body
]

#let end_styled(config: dictionary, body: content) = [

  #set heading(numbering: "1.")

  #let thesis = config.thesis

  #body
]
