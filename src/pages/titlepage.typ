// .--------------------------------------------------------------------------.
// |                                Titlepage                                 |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_title_page(config) = (
  context [

    #let thesis = config.thesis

    // logo of ABB and DHBW
    #v(-config.style.header.content-padding)
    #grid(
      // set width of columns
      // we need two, so make both half the page width
      columns: (50%, 50%),
      // left align logo of ABB
      if config.style.header.logo-image == none {
        // error
      } else if config.style.header.logo-image.len() > 0 {
        align(left, image(config.style.header.logo-image, height: config.style.header.logo-height))
      } else {
        align(left, image("../res/DHBW.svg", height: config.style.header.logo-height))
      },
      // right align logo of DHBW
      if config.style.header.logo-image.len() > 0 {
        align(right, image("../res/DHBW.svg", height: config.style.header.logo-height))
      })

    #set align(center)

    // title
    #v(2cm)
    #par(justify: false, leading: 1.5em)[
      #text(size: 2em, weight: "bold", hyphenate: false, thesis.title)
      #linebreak()
      // subtitle
      #text(size: 2em, weight: "light", thesis.subtitle)
    ]

    #set align(center + horizon)

    // type of paper
    #text(size: 1.5em, weight: "medium", thesis.kind)

    // faculty
    #pad()[
      #if text.lang == "de" [
        aus dem Studiengang #config.university.program
      ] else if text.lang == "en" [
        from the course of studies #config.university.program
      ] else [
        #context panic("no translation for language: ", text.lang)
      ]

      #if text.lang == "de" [
        an der Fakultät #config.university.faculty
      ] else if text.lang == "en" [
        at the faculty of #config.university.faculty
      ] else [
        #context panic("no translation for language: ", text.lang)
      ]
    ]

    // university
    #pad()[
      #if text.lang == "de" [
        an der
      ] else if text.lang == "en" [
        at
      ] else [
        #context panic("no translation for language: ", text.lang)
      ]
      #config.university.name
      #linebreak()
      #if text.lang == "de" [
        in
      ] else if text.lang == "en" [
        in
      ] else [
        #context panic("no translation for language: ", text.lang)
      ]
      #config.university.campus
    ]

    #pad(top: 1.5em)[
      #let names = ()

      #if text.lang == "de" [
        von
      ] else if text.lang == "en" [
        by
      ] else [
        #context panic("no translation for language: ", text.lang)
      ]

      #v(1.5em)

      #let rows = int(config.authors.len() / 3 + 0.5)

      #for i in range(0, rows) {
        let cols = calc.min(config.authors.len() - i * 3, 3)

        grid(columns: cols, column-gutter: 1.5em, ..config
            .authors
            .slice(i * 3, i * 3 + cols)
            .map(author => grid(
            columns: 1,
            row-gutter: 1em,
            text(size: 1.25em, author.name),
            text(size: 1em, author.company),
            text(size: 1em, author.contact),
            [
              #str(author.matriculation-number),
              #author.course
            ],
          )))
      }
    ]

    #set align(bottom)

    #pad(top: 1.5em)[
      #thesis.timeframe
    ]

    #if config.supervisor-signature {
      align(
        bottom,
        grid(
        // set width of columns
        // we need two, so make both half the page width
        columns: (60%, 40%),
        align(left, if text.lang == "de" [
            Unterschrift des betrieblichen Betreuers
          ] else if text.lang == "en" [
            Signature of the company supervisor
          ] else [
            #context panic("no translation for language: ", text.lang)
          ]
        ),
        align(right, {line(length: 6cm)})),
      )
    }

    #counter(page).update(0)
  ]
)
