
#let new_prerelease_note(config) = context [

  #let thesis = config.thesis
  #let author = config.author

  #v(2em)
  #if text.lang == "de" [
    #text(size: 20pt, weight: "semibold", font: "Montserrat", "Vorabfassung")
  ] else if text.lang == "en" [
    #text(size: 20pt, weight: "semibold", font: "Montserrat", "Preliminary version")
  ]

  #v(1em)

  #if text.lang == "de" [
    Bei dieser Ausgabe der Arbeit mit dem Thema
  ] else if text.lang == "en" [
    This edition of the work with the subject
  ]

  #v(1em)

  #set align(center)

  *#thesis.title*

  #thesis.subtitle

  #set align(left)

  #v(1em)

  #set par(justify: true)

  #if text.lang == "de" [
    handelt es sich _nicht_ um die fertige Fassung. Das Dokument kann Inhaltliche-, Grammatikalische- sowie Format-Fehler enthalten. Das Dokument ist im Rahmen der Aufgabenstellung von Seiten der #author.university nicht zur Bewertung freigegeben und ein anderer Verwendungszweck als eine Vorschau ist nicht gestattet.
  ] else if text.lang == "en" [
    is not the final version. The document may contain errors in content, grammar and formatting. The document may not be released for evaluation to #author.university as part of the assignment, and any use other than a preview is not permitted.
  ]

  #v(1em)
  #h(1em) #author.name, #datetime.today().display()

]