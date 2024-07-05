// .--------------------------------------------------------------------------.
// |                                Appendix                                  |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let show-appendix(config: dictionary) = context {
  counter(heading).update(0)

  let title = if text.lang == "en" {
    "Appendix"
  } else {
    "Anhang"
  }

  if "appendices" in config.thesis {
    pagebreak(weak: true)

    heading(level: 1, numbering: none, title)
    v(-2em)

    // APA style appendix
    show heading: it => {
      let number = if it.numbering != none {
        counter(heading).display(it.numbering)
      }
      block()[
        #title #number - #it.body
      ]
    }

    show heading.where(level: 1): it => v(2em) + it + v(1em)
    show heading.where(level: 2): it => v(1em) + it + v(0.5em)
    show heading.where(level: 3): it => v(0.5em) + it + v(0.25em)

    set heading(numbering: "A.1", supplement: title)

    config.thesis.appendices
  }
}
