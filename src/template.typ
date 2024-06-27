
// .--------------------------------------------------------------------------.
// |                         Template of DHBW thesis                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// start of template pages and styles
#let dhbw-template(doc) = [

  #import "style.typ": global_styled_doc

  // apply global style to every element in the argument content
  #global_styled_doc(doc: [

    #import "pages/titlepage.typ": new_title_page

    // preppend title page
    #new_title_page()

    // code of document follows here
    #doc
  ])
]