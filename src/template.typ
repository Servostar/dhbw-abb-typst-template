
// .--------------------------------------------------------------------------.
// |                         Template of DHBW thesis                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// start of template pages and styles
#let dhbw-template(doc) = [

  #import "style.typ": global_styled_doc, prelude_styled

  // apply global style to every element in the argument content
  #global_styled_doc(doc: [

    #import "pages/titlepage.typ": new_title_page
    #import "pages/declaration-of-authorship.typ": new_declaration_of_authorship
    #import "pages/confidentiality-statement.typ": new_confidentiality_statement_page
    #import "pages/prerelease-note.typ": new_prerelease_note

    #set text(lang: "de", region: "de")

    #let author = (
      name: "Sven Vogel",
      semester: 4,
      program: "Informationstechnik",
      course: "TINF22IT2",
      faculty: "Technik",
      university: "DHBW Mannheim",
      company: "ABB AG",
      supervisor: "Florian Miedniak",
      matriculation-number: 1191225
    )

    #let thesis = (
      title: "Konfiguration & Integration von PROFINET",
      subtitle: "für die AC500 SPS",
      submission-date: "20. März 2024",
      timeframe: "1. Januar 2023 - 20. März 2024",
      kind: "T2000"
    )

    // preppend title page
    #new_title_page(thesis, author)

    #prelude_styled(thesis, doc: [
      #new_declaration_of_authorship(thesis, author)
      #pagebreak()
      #new_confidentiality_statement_page(thesis, author)
      #pagebreak()
      #new_prerelease_note(thesis, author)
    ])

    // code of document follows here
    #doc
  ])
]