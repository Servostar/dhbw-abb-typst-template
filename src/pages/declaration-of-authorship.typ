
#let new_declaration_of_authorship(thesis, author) = context [

  #if text.lang == "de" [
    #text(size: 20pt, weight: "semibold", font: "Montserrat", "Selbständigkeitserklärung")
  ] else if text.lang == "en" [
    #text(size: 20pt, weight: "semibold", font: "Montserrat", "Declaration of authorship")
  ]

  #v(1em)

  #if text.lang == "de" [
    Ich versichere hiermit, dass ich meine Prüfung mit dem Thema
  ] else if text.lang == "en" [
    I hereby certify that I have passed my examination with the subject
  ]

  #v(1em)

  #set align(center)

  *#thesis.title*

  #thesis.subtitle

  #set align(left)

  #v(1em)

  #set par(justify: true)

  selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe. Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt.

  #v(25%)

  #grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    row-gutter: 0.75em,
    align(left, {line(length: 6cm)}),
    align(left, {line(length: 6cm)}),
    align(left, if text.lang == "de" [ Ort, Datum ] else if text.lang == "en" [ place, date ] else { panic("no translation for language: ", text.lang) }),
    align(left, if text.lang == "de" [ Unterschrift ] else if text.lang == "en" [ Signature ] else { panic("no translation for language: ", text.lang) }))

]