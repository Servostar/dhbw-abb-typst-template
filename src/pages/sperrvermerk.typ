#import "../prelude.typ" as prelude

// title
#if prelude.format.language == "de" [
  = Sperrvermerk
] else if prelude.format.language == "en" [
  = Confidential Clause
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#v(1cm)

#prelude.largetext()[
  #if prelude.format.language == "de" [
    Der Inhalt dieser Arbeit darf weder als Ganzes noch in
    Auszügen Personen außerhalb des Prüfungsprozesses
    und des Evaluationsverfahrens zugänglich gemacht werden,
    sofern keine anders lautende Genehmigung der Ausbildungsstätte vorliegt.
  ] else if prelude.format.language == "en" [
    The content of this thesis may not be made accessible
    to persons outside the examination process and the evaluation procedure,
    either in whole or in part, unless otherwise authorized by the institution.
  ] else [
    #panic("no translation for language: ", prelude.format.language)
  ]
]

#prelude.signature

#pagebreak()
