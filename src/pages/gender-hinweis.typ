
#import "../prelude.typ" as prelude

// title
#if prelude.format.language == "de" [
  = Gender-Hinweis
] else if prelude.format.language == "en" [
  = Gender note
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#prelude.largetext()[
  #if prelude.format.language == "de" [
    Zur besseren Lesbarkeit wird in dieser Arbeit das generische Maskulinum verwendet.
    Die in dieser Arbeit verwendeten Personenbezeichnungen beziehen sich, sofern nicht anders kenntlich gemacht, auf alle Geschlechter.
  ] else if prelude.format.language == "en" [
    For better readability, the generic masculine is used in this work.
    The personal designations used in this work refer to all genders, unless otherwise indicated.
  ] else [
    #panic("no translation for language: ", prelude.format.language)
  ]
]

#pagebreak()
