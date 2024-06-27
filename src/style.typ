
// .--------------------------------------------------------------------------.
// |                         Global style of document                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// global style of document
#let global_styled_doc(doc: content) = [
  // set page geometry
  // paper format of A4
  #set page(
    paper: "a4",
    margin: (left: 3cm, right: 2cm, top: 2cm, bottom: 2cm))

  

  #doc
]

