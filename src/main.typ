
#import "prelude.typ" as prelude

// ------------------------------------------
// Set page geometry and PDF meta data
// ------------------------------------------

// set page geometry:
// paper format of A4
// top margin is 2cm (blank space) + 2em (header) + 1em (spacing)
#set page(
  margin: (left: 3cm, right: 2cm, top: 2cm + 3em, bottom: 2cm),
  paper: "a4",
)

// set PDF meta information
#set document(
  title: prelude.info.titel,
  author: prelude.info.autor,
  keywords: prelude.info.stichwörter
)

// ------------------------------------------
// Configure fonts and headings
// ------------------------------------------

// set global text parameter
#set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size),
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: false,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language
)

// set the text properties of verbatim/raw text blocks
#show raw: set text(
  font: "FiraCode Nerd Font",
  size: prelude.to_pt(prelude.format.font-size),
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: false,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language
)

#show heading.where(level: 1): set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size) * 2,
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: false,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language,
  weight: "regular"
)

#show heading.where(level: 2): set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size) * 1.5,
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: false,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language,
  weight: "regular"
)

#show heading.where(level: 3): set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size) * 1.25,
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: false,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language,
  weight: "regular"
)

// ------------------------------------------
// Setup paragraphs
// ------------------------------------------

// use block element as paragraph
// set block settings for every paragraph
#show par: set block(
  below: prelude.to_em(prelude.format.paragraph-spacing), // paragraph spacing
)

// set global paragraph settings
#set par(
  leading: prelude.to_em(prelude.format.line-spacing),
  justify: true,
  first-line-indent: prelude.to_cm(prelude.format.first-line-indent)
)

// ------------------------------------------
// Start of content
// ------------------------------------------

#include "content/audition.typ"
#include "content/preface.typ"
#include "content/outline.typ"

#set heading(numbering: "1.")

// start numbering pages with numeric digits
#set page(numbering: "1.")

#let filter_heading(heading) = {
  heading.level == 1
}

#set page(
  binding: left,
  header-ascent: 2em,
  header: locate(loc => {
    let current_heading = query(selector(heading).after(here())).filter(filter_heading).first()
    let heading_depth = counter(heading).get().at(0) + 1
    table(columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      inset: (top: 0pt, bottom: 0.5em, left: 0pt, right: 0pt),
      text(size: prelude.to_pt(prelude.format.font-size))[#heading_depth #current_heading.body],
      text(size: prelude.to_pt(prelude.format.font-size), counter(page).display("1")),
      table.hline()
    )
  }),
  footer: ""
)

#set heading(supplement: [Heading])

#include "pages/introduction.typ"

// ------------------------------------------
// Actual work pages follow here
// ------------------------------------------

#include "content/bibliography.typ"

#include "pages/appendix.typ"