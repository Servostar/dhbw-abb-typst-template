#import "../prelude.typ" as prelude

// ------------------------------------------
// Appendix setup
// ------------------------------------------

// function for filtering out all heading which are not of level 1
#let filter_heading(heading) = {
  heading.level == 1
}

#set page(
  binding: left,
  header-ascent: 2em,
  header: locate(loc => {
    let current_heading = query(selector(heading).after(here())).filter(filter_heading).first()
    table(columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      inset: (top: 0pt, bottom: 0.5em, left: 0pt, right: 0pt),
      text(size: prelude.to_pt(prelude.format.font-size))[#current_heading.body],
      text(size: prelude.to_pt(prelude.format.font-size), counter(page).display("1")),
      table.hline()
    )
  }),
  footer: ""
)

#set heading(numbering: none)

#if prelude.format.language == "de" [
  = Anhang
] else if prelude.format.language == "en" [
  = Appendix
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#set heading(numbering: "A.1")

// reset page counter
#counter(heading).update(1)

#let appendix(text) = [
  #heading(
    supplement: [Appendix],
    level: 2,
    numbering: "A.1",
  )[#text]
  <#text>
]

// ------------------------------------------
// Put your appendencies here and link them
// to correclty reference them in the document
// ------------------------------------------

// Example:
//
// #appendix([Titel])
//
// Some appendix content goes here

// Then reference it in the document:
// @Titel
