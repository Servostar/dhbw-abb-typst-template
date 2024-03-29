#import "../prelude.typ" as prelude

#set align(center)

// title
#if prelude.format.language == "de" [
  = Selbständigkeitserklärung
] else if prelude.format.language == "en" [
  = Declaration of independence
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#v(1cm)
#prelude.largetext()[
  #if prelude.format.language == "de" [
    Ich versichere hiermit, dass ich meine #linebreak() Prüfung mit dem Thema
  ] else if prelude.format.language == "en" [
    I hereby certify that I have written my #linebreak() exam with the topic
  ] else [
    #panic("no translation for language: ", prelude.format.language)
  ]
]

#v(1cm)
#prelude.title(prelude.info.titel)

// subtitle
#prelude.subtitle(prelude.info.untertitel)

#v(1cm)
#prelude.largetext()[
   #if prelude.format.language == "de" [
    selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
    Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt.
  ] else if prelude.format.language == "en" [
    independently and have not used any sources or aids other than those specified.
    I also confirm that the electronic version submitted is identical to the printed version.
  ] else [
    #panic("no translation for language: ", prelude.format.language)
  ]
]

#prelude.signature

#pagebreak()