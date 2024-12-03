// .--------------------------------------------------------------------------.
// |                                Abstract                                  |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_abstract(config) = (
  context {
    set align(center + horizon)

    // only include summary when a language other than english is used
    if text.lang == "de" [
      // Summary is supposed to be on separate page
      #pagebreak(weak: true)

      = Zusammenfassung
      #config.thesis.summary
    ]

    // abstract is supposed to be on separate page
    pagebreak(weak: true)

    heading("Abstract")
    config.thesis.abstract
  }
)
