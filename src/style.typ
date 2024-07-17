
// .--------------------------------------------------------------------------.
// |                         Global style of document                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

#import "branding.typ": *

#let watermark-color = luma(50%).transparentize(70%) 

#let watermark-pattern = pattern(size: (5pt, 5pt))[
  #place(line(start: (50%, 0%), end: (50%, 100%), stroke: (paint: watermark-color, thickness: 3pt)))
]

#let watermark(config) = if config.draft {
  rotate(-22.5deg)[
    #rect(
    radius: 1em,
    inset: 1em,
    stroke: watermark-color)[
      #text(size: 4em, weight: "bold", fill: watermark-pattern, "DRAFT")
      #linebreak()
      #text(size: 1.25em, weight: "bold", fill: watermark-color)[
        This page is part of a preliminary
        #linebreak()
        document version.
        #linebreak()
        #text(size: 0.75em, "Further usage without the authors consent is not permitted.")]]]}

#let numberingH(c)={
  return numbering(c.numbering,..counter(heading).at(c.location()))
}

#let currentH(level: 1)={
  let elems = query(selector(heading.where(level: level)).after(here()))

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return (numberingH(elems.first()), elems.first().body)
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return (numberingH(elems.last()), elems.last().body)
    }
  }
  return ""
}

// global style of document
#let global_styled_doc(config, body) = {
  let thesis = config.thesis
  let style = config.style

  set text(
    size: style.text.size,
    ligatures: true,
    hyphenate: true,
    dir: ltr,
    font: style.text.font,
    fill: ABB-BLACK)

  show heading: set text(
    font: style.heading.font,
    weight: "semibold")

  set heading(supplement: [chapter])

  set math.equation(numbering: "(1)")

  // Set header spacing
  show heading.where(level: 1): it => v(2em) + it + v(1em)
  show heading.where(level: 2): it => v(1em) + it + v(0.5em)
  show heading.where(level: 3): it => v(0.5em) + it + v(0.25em)

  // set theme for code blocks
  set raw(
    tab-size: style.code.tab-size,
    theme: style.code.theme)
  show raw: set text(font: style.code.font)

  show figure: set block(breakable: true)

  // APA style table
  set table(
    inset: 0.5em,
    align: left,
    stroke: (x, y) => (
      left: none,
      right: none,
      top: if y == 0 { 1.5pt } else if y < 2 { 1pt } else { 0.5pt },
      bottom: if y == 0 { 1pt } else { 1.5pt } ))

  // make table header bold
  show table.cell.where(y: 0): set text(weight: "bold")

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
    paper: style.page.format,
    foreground: watermark(config),
    header-ascent: style.header.content-padding,
    footer-descent: style.header.content-padding,
    margin: (
      top: style.page.margin.top + style.header.underline-top-padding + style.header.content-padding,
      bottom: style.page.margin.bottom + style.footer.content-padding,
      left: style.page.margin.left,
      right: style.page.margin.right),
    numbering: (..nums) => {
      let current-page = here().page()
      if current-page == 1{
        []
      } else if query(<end-of-prelude>).first().location().page() > current-page {
        numbering("I", nums.pos().first())
      } else if query(<end-of-content>).first().location().page() >= current-page {
        numbering("1", nums.pos().first())
      } else {
        numbering("a", nums.pos().first())
      }
    },
    footer: context [
      #let page-counter = counter(page).get().first()
      #let page-number = here().page()

      #if page-number == 1 {
        []
      } else if query(<end-of-prelude>).first().location().page() > page-number {
        set align(center)
        numbering("I", page-counter)
      } else if query(<end-of-content>).first().location().page() >= page-number {
        numbering("1 / 1", page-counter, counter(page).at(<end-of-content>).last())
      } else {
        numbering("a", page-counter)
      }
    ],
    header: context {
      set align(left)
      let current-page = here().page()

      if current-page == 1 {
        // logo of ABB and DHBW
        grid(
          // set width of columns
          // we need two, so make both half the page width
          columns: (50%, 50%),
          // left align logo of ABB
          align(left, image("res/ABB.svg", height: style.header.logo-height)),
          // right align logo of DHBW
          align(right, image("res/DHBW.svg", height: style.header.logo-height)))

      } else if query(<end-of-content>).first().location().page() >= current-page and query(<end-of-prelude>).first().location().page() < current-page + 1 {
        let heading = currentH()

        heading.at(0)
        h(1em)
        heading.at(1)
        v(style.header.underline-top-padding - 1em)
        line(length: 100%)
      } else {
        config.thesis.title
        v(style.header.underline-top-padding - 1em)
        line(length: 100%)
      }
    })

  body
}

#let content_styled(config, body) = {
  set heading(numbering: "1.1.1")

  body
}

#let end_styled(config, body) = {
  set heading(numbering: "1.1.1")

  body
}
