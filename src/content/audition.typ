
// ====================================================
//
// AUDITION OF WORK
// 
// Author: Sven Vogel
// License: MIT
// Edited: 29.03.2024
//
// This file binds and styles pages about:
//  - title
//  - declaration of indipendence
//  - confidential clause
//  - gender note
//  - working packages
//  - abstract
// ====================================================

#import "../prelude.typ" as prelude

#set heading(numbering: none)
#set page(numbering: "I.", footer: "")

#include "../pages/title.typ"
#include "../pages/declaration-of-indipendence.typ"
#include "../pages/confidential-clause.typ"

#set page(
  binding: left,
  header-ascent: 2em,
  header: locate(loc => {
    table(columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      inset: (top: 0pt, bottom: 0.5em, left: 0pt, right: 0pt),
      text(size: prelude.to_pt(prelude.format.font-size), prelude.info.titel),
      text(size: prelude.to_pt(prelude.format.font-size), counter(page).display("I.")),
      table.hline()
    )
  }),
  footer: ""
)

#include "../pages/gender-note.typ"
#include "../pages/working-packages.typ"
#include "../pages/abstract.typ"