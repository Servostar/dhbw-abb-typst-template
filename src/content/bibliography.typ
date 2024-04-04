
// ====================================================
//
// BIBLIOGRAPHY
// 
// Author: Sven Vogel
// License: MIT
// Edited: 29.03.2024
//
// This file binds and styles bibliography of this work
// ====================================================

#import "../prelude.typ" as prelude

#set heading(numbering: none)

// function for filtering out all heading which are not of level 1
#let filter_heading(heading) = {
  heading.level == 1
}

#set page(
  header: locate(loc => {
    align(left, context [
      #let current_heading = query(selector(heading).after(here())).filter(filter_heading).first()
      #current_heading.body
    ])
    v(-2em)
    align(right, counter(page).display("1"))
    v(-1em)
    line(length: 100%)
  }),
)

// load bibliography and add it to the document
#bibliography(
  style: "ieee",
  "../../conf/bibliography.bib"
)