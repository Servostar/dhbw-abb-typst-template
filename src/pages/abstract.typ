#import "../prelude.typ" as prelude

= Abstract

// abstract text goes here 
#let abstract = [

]

// summary text goes here
// and is only included if the language is set to german
#if prelude.format.language == "de" [
  
  = Zusammenfassung

  
]