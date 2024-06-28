
#let new_abstract(thesis) = context [
  
  #pagebreak(weak: true)
  #align(center + horizon)[
    #if text.lang == "de" [
      = Zusammenfassung

      #thesis.summary
    ]
    
    #pagebreak(weak: true)
    = Abstract

    #thesis.abstract
  ]
]