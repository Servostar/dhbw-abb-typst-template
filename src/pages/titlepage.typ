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
        aus dem Studiengang #config.university.program | #config.university.faculty
      ] else if text.lang == "en" [
        from the course of studies #config.university.program | #config.university.faculty
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
      #config.university.campus
    ]

    #pad(top: 1em)[
      #let names = ()
      #for author in config.authors {
        names.push(author.name)
      }
      #if text.lang == "de" [
        von
      ] else if text.lang == "en" [
        by
      ] else [
        #context panic("no translation for language: ", text.lang)
      ]
      #set text(size: 16pt)
      #grid(columns: 1, row-gutter: 1em, ..names)
    ]

    #pad(top: 1em)[
      #thesis.timeframe
    ]

    #set align(bottom + left)

    #if text.lang == "de" [
      #grid(
        columns: 2,
        column-gutter: 1cm,
        row-gutter: 0.5cm,
        align: top + left,
        stroke: none,
        [Matrikelnummer, Kurs:],
        par(
          leading: 0.5em,
          for author in config.authors {
            str(author.matriculation-number) + ", " + author.course
            linebreak()
          },
        ),

        [Betrieb, Betreuer:],
        par(
          leading: 0.5em,
          for author in config.authors {
            author.company + ", " + author.supervisor
            linebreak()
          },
        ),
      )
    ] else if text.lang == "en" [
      #grid(
        columns: 2,
        column-gutter: 1cm,
        row-gutter: 0.5cm,
        align: top + left,
        stroke: none,
        [Student ID, Course:],
        par(
          leading: 0.5em,
          for author in config.authors {
            str(author.matriculation-number) + ", " + author.course
            linebreak()
          },
        ),

        [Company, Supervisor:],
        par(
          leading: 0.5em,
          for author in config.authors {
            author.company + ", " + author.supervisor
            linebreak()
          },
        ),
      )
    ] else [
      #context panic("no translation for language: ", text.lang)
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
