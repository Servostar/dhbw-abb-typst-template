// .--------------------------------------------------------------------------.
// |                        Confidentiality Statement                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_confidentiality_statement_page(config) = (
  context {

    pagebreak(weak: true)

    let thesis = config.thesis
    let author = config.author

    if text.lang == "de" [
      #heading(level: 1, "Sperrvermerk", supplement: [special])
    ] else if text.lang == "en" [
      #heading(level: 1, "Confidentiality Statement", supplement: [special])
    ]

    if text.lang == "de" [
      Der Inhalt der dieser Arbeit mit dem Thema
    ] else if text.lang == "en" [
      The content of this work with the topic
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
      darf weder als Ganzes noch in Auszügen Personen außerhalb des Prüfungsprozesses und des Evalua-tionsverfahrens zugänglich gemacht werden, sofern keine anderslautende Genehmigung der Ausbildungsstätte vorliegt.
    ] else if text.lang == "en" [
      may not be made accessible to persons outside the examination process and the evaluation procedure, either as a whole or in excerpts, unless otherwise authorized by the training institution.
    ]

    set align(horizon)

    grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    row-gutter: 0.75em,
    align(left, {line(length: 6cm)}),
    align(left, {line(length: 6cm)}),
    align(left, if text.lang == "de" [ Ort, Datum ] else if text.lang == "en" [ Place, Date ] else { panic("no translation for language: ", text.lang) }),
    align(left, if text.lang == "de" [ Unterschrift ] else if text.lang == "en" [ Signature ] else { panic("no translation for language: ", text.lang) }))
  }
)