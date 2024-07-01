
#let new_abstract(config) = context [
  
  #let thesis = config.thesis

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