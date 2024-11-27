// .--------------------------------------------------------------------------.
// |                      Preleminary release Notice                          |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_prerelease_note(config) = (
  context {

    pagebreak(weak: true)

    let thesis = config.thesis

    if text.lang == "de" [
      #heading("Vorabfassung")
    ] else if text.lang == "en" [
      #heading("Preliminary Version")
    ]

    v(1em)

    if text.lang == "de" [
      Bei dieser Ausgabe der Arbeit mit dem Thema
    ] else if text.lang == "en" [
      This edition of the work with the subject
    ]

    v(1em)

    set align(center)

    text(weight: "bold", thesis.title)

    if thesis.subtitle != none {
      linebreak()
      thesis.subtitle
    }

    set align(left)

    v(1em)

    set par(justify: true)

    if text.lang == "de" [
      handelt es sich _nicht_ um die fertige Fassung. Das Dokument kann Inhaltliche-, Grammatikalische- sowie Format-Fehler enthalten. Das Dokument ist im Rahmen der Aufgabenstellung von Seiten der #university.name nicht zur Bewertung freigegeben und ein anderer Verwendungszweck als eine Vorschau ist nicht gestattet.
    ] else if text.lang == "en" [
      is not the final version. The document may contain errors in content, grammar and formatting. The document may not be released for evaluation to #config.university.name as part of the assignment, and any use other than a preview is not permitted.
    ]
  }
)
