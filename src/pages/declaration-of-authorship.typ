// .--------------------------------------------------------------------------.
// |                        Declaration of Authorship                         |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_declaration_of_authorship(config) = (
  context {

    pagebreak(weak: true)

    let thesis = config.thesis
    let author = config.author

    if text.lang == "de" [
      #heading("Selbständigkeitserklärung")
    ] else if text.lang == "en" [
      #heading("Declaration of Authorship")
    ]

    v(1em)

    if text.lang == "de" [
      Ich versichere hiermit, dass ich meine Prüfung mit dem Thema
    ] else if text.lang == "en" [
      I hereby confirm that I have written this thesis with the subject
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
      selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe. Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt.
    ] else if text.lang == "en" [
      independently and have not used any sources or aids other than those specified. I also confirm that the electronic version submitted is identical to the printed version.
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
