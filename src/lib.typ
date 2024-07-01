
// .--------------------------------------------------------------------------.
// |                         Template of DHBW thesis                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// start of template pages and styles
#let dhbw-template(config: dictionary, body) = [

  #import "style.typ": global_styled_doc, content_styled, end_styled

  #let doc = body

  // set document properties
  #set document(
    author: config.author.name,
    keywords: config.thesis.keywords,
    title: config.thesis.title)

  // apply global style to every element in the argument content
  #global_styled_doc(config: config, body: [

    #import "pages/titlepage.typ": new_title_page
    #import "pages/declaration-of-authorship.typ": new_declaration_of_authorship
    #import "pages/confidentiality-statement.typ": new_confidentiality_statement_page
    #import "pages/prerelease-note.typ": new_prerelease_note
    #import "pages/outline.typ": new_outline
    #import "pages/abstract.typ": new_abstract
    #import "pages/appendix.typ": show-appendix

    // configure text locale
    #set text(lang: config.lang, region: config.region)

    // preppend title page
    #new_title_page(config)

    // prelude includes: title, declaration of authorship, confidentiality statement, outline and abstract
    // these will have roman page numbers

    #pagebreak(weak: true)
    #new_declaration_of_authorship(config)

    #pagebreak(weak: true)
    #new_confidentiality_statement_page(config)

    #pagebreak(weak: true)
    #new_prerelease_note(config)

    #pagebreak(weak: true)
    #new_abstract(config)

    #pagebreak(weak: true)
    #new_outline()

    // glossary is built inline here because the links must be 
    // exposed to the entire document
    #import "@preview/glossarium:0.4.1": make-glossary, print-glossary, gls, glspl
    #show: make-glossary

    #pagebreak(weak: true)

    #if "glossary" in config.thesis and config.thesis.glossary != none {
      heading(supplement: [outline], "Glossar")

      print-glossary(config.thesis.glossary)

      pagebreak(weak: true)
      counter(page).update(1)
    } 

    // mark end of prelude
    #metadata("prelude terminate") <end-of-prelude>

    #content_styled(config: config, body: [
      // code of document follows here
      #doc
    ])

    #metadata("content terminate") <end-of-content>

    #end_styled(config: config, body: [
      // add bibliography if set
      #if config.thesis.bibliography != none {
        pagebreak(weak: true)
        set bibliography(style: "ieee")
        config.thesis.bibliography
        counter(page).update(1)
      }

      // appendix
      #show-appendix(config: config)
    ])
  ])
]