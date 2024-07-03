
// .--------------------------------------------------------------------------.
// |                         Global style of document                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

#let watermark-color = luma(50%).transparentize(70%) 

#let watermark() = rotate(-45deg,
      rect(radius: 1em, inset: 1em, stroke: watermark-color, {
        text(size: 48pt, weight: "bold", fill: watermark-color, "DRAFT")
        linebreak()
        text(size: 14pt, weight: "bold", fill: watermark-color)[
          This page is part of a preliminary
          #linebreak()
          document version.
          #linebreak()
          #text(size: 10pt, "Further usage without the authors consent is not permitted.")
        ]
      }))

// global style of document
#let global_styled_doc(config: dictionary, body: content) = context {
  let thesis = config.thesis
  let style = config.style

  // set page geometry
  // and paper format
  set page(
    paper: style.page.format,
    margin: style.page.margin)

  set text(
    size: style.text.size,
    ligatures: true,
    hyphenate: true,
    dir: ltr,
    font: style.text.font)

  show heading: set text(
    font: style.heading.font,
    weight: "semibold")

  set heading(supplement: [chapter])

  // Set header spacing
  show heading.where(level: 1): it => v(2em) + it + v(1em)
  show heading.where(level: 2): it => v(1em) + it + v(0.5em)
  show heading.where(level: 3): it => v(0.5em) + it + v(0.25em)

  // set theme for code blocks
  set raw(tab-size: 4, theme: "res/github.tmTheme")
  show raw.where(block: true): code => {
    show raw.line: line => {
      text(fill: gray)[#line.number]
      h(1em)
      line.body
    }
    code
  }

  set block(spacing: 2em)
  set par(
    justify: true,
    first-line-indent: 1em,
    leading: 1em)

  // give links a color
  show link: set text(fill: style.link.color)
  show ref: set text(fill: style.link.color)

  set heading(numbering: none)
  set page(
    foreground: if config.draft {
      watermark()
    },
    header-ascent: style.header.underline-top-padding + style.header.bottom-padding,
    footer-descent: 1em,
    margin: (
      top: style.page.margin.top + style.header.logo-height + style.header.underline-top-padding + style.header.bottom-padding,
      bottom: style.page.margin.bottom + 1em),
    numbering: (..nums) => {
      let current-page = here().page()
      if current-page == 1{
        []
      } else if query(<end-of-prelude>).first().location().page() > current-page {
        numbering("I", nums.pos().first())
      } else if query(<end-of-content>).first().location().page() >= current-page {
        numbering("1 / 1", nums.pos().first(), counter(page).at(<end-of-content>).last())
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
          align(left, image("res/ABB.svg", height: style.header.logo-height)),
          // right align logo of DHBW
          align(right, image("res/DHBW.svg", height: style.header.logo-height)))

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
          image("res/DHBW.svg", height: style.header.logo-height))
        
        v(style.header.underline-top-padding - 1em)
        line(length: 100%)
      } else {
        grid(
          columns: (1fr, auto),
          align: (horizon, bottom),
          context [ _ #config.thesis.title _ ],
          image("res/DHBW.svg", height: style.header.logo-height)
        )
        v(style.header.underline-top-padding - 1em)
        line(length: 100%)
      }
    })

  body
}

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
