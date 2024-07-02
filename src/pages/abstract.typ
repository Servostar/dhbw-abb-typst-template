// .--------------------------------------------------------------------------.
// |                                Abstract                                  |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_abstract(config) = context [
  
  #pagebreak(weak: true)

  #let thesis = config.thesis

  #pagebreak(weak: true)
  #align(center + horizon)[
    #if text.lang == "de" [
      = Zusammenfassung

      #thesis.summary
    ]
    
    #pagebreak(weak: true)
    = Abstract

    #thesis.abstract
  ]
]