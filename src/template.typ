
// .--------------------------------------------------------------------------.
// |                         Template of DHBW thesis                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// start of template pages and styles
#let dhbw-template(config: dictionary, doc: content) = [

  #import "style.typ": global_styled_doc, prelude_styled, content_styled

  // apply global style to every element in the argument content
  #global_styled_doc(config: config, body: [

    #import "pages/titlepage.typ": new_title_page
    #import "pages/declaration-of-authorship.typ": new_declaration_of_authorship
    #import "pages/confidentiality-statement.typ": new_confidentiality_statement_page
    #import "pages/prerelease-note.typ": new_prerelease_note
    #import "pages/outline.typ": new_outline
    #import "pages/abstract.typ": new_abstract

    #set text(lang: "de", region: "de")

    // preppend title page
    #new_title_page(config)

    #prelude_styled(config: config, body: [
      #pagebreak(weak: true)
      #new_declaration_of_authorship(config)

      #pagebreak(weak: true)
      #new_confidentiality_statement_page(config)

      #pagebreak(weak: true)
      #new_prerelease_note(config)

      #pagebreak(weak: true)
      #new_outline()

      #pagebreak(weak: true)
      #new_abstract(config)
    ])

    #import "@preview/glossarium:0.4.1": make-glossary, print-glossary, gls, glspl
    #show: make-glossary

    #pagebreak(weak: true)
    #print-glossary(config.thesis.glossary)
    #pagebreak(weak: true)

    #metadata("prelude terminate") <end-of-prelude>

    #content_styled(config: config, body: [
      // code of document follows here
      #doc

      #if config.thesis.bibliography != none {
        pagebreak(weak: true)
        set bibliography(style: "ieee")
        config.thesis.bibliography
      }
    ])
  ])
]