
#let new_confidentiality_statement_page(config) = context [

  #let thesis = config.thesis
  #let author = config.author

  #v(2em)
  #if text.lang == "de" [
    #text(size: 20pt, weight: "semibold", font: "Montserrat", "Sperrvermerk")
  ] else if text.lang == "en" [
    #text(size: 20pt, weight: "semibold", font: "Montserrat", "Confidentiality statement")
  ]

  #if text.lang == "de" [
    Der Inhalt der dieser Arbeit mit dem Thema
  ] else if text.lang == "en" [
    The content of this work with the topic
  ]

  #v(1em)

  #set align(center)

  *#thesis.title*

  #thesis.subtitle

  #set align(left)

  #v(1em)

  #set par(justify: true)

  #if text.lang == "de" [
    darf weder als Ganzes noch in Auszügen Personen außerhalb des Prüfungsprozesses und des Evalua-tionsverfahrens zugänglich gemacht werden, sofern keine anderslautende Genehmigung der Ausbildungsstätte vorliegt.
  ] else if text.lang = "en" [
    may not be made accessible to persons outside the examination process and the evaluation procedure, either as a whole or in excerpts, unless otherwise authorized by the training institution.
  ]

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