// .--------------------------------------------------------------------------.
// |                                Titlepage                                 |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new_title_page(config) = (
  context [

    #let thesis = config.thesis
    #let author = config.author

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
        Praxisphase des #author.semester Semesters an der Fakultät für #author.faculty
        #linebreak()
        im Studiengang #author.program
      ] else if text.lang == "en" [
        Practical phase of the #author.semester semester at the Faculty of #author.faculty
        #linebreak()
        in the degree program #author.program
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
      #linebreak()
      #author.university
    ]

    #set align(bottom + left)

    #if text.lang == "de" [
      #table(
        columns: 2,
        column-gutter: 1cm,
        align: left,
        stroke: none,
        [*Verfasser:*], author.name,
        [*Bearbeitungszeitraum:*], thesis.timeframe,
        [*Matrikelnummer, Kurs:*],
        str(author.matriculation-number) + ", " + author.course,

        [*Ausbildungsbetrieb:*], author.company,
        [*Betrieblicher Betreuer:*], author.supervisor,
        [*Abgabedatum:*], thesis.submission-date,
      )
    ] else if text.lang == "en" [
      #table(
        columns: 2,
        column-gutter: 1cm,
        align: left,
        stroke: none,
        [*Author:*], author.name,
        [*Editing period:*], thesis.timeframe,
        [*Matriculation number, course:*],
        str(author.matriculation-number) + ", " + author.course,

        [*Training company:*], author.company,
        [*Company supervisor:*], author.supervisor,
        [*Submission date:*], thesis.submission-date,
      )
    ] else [
      #context panic("no translation for language: ", text.lang)
    ]

    #align(
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

    #counter(page).update(0)
  ]
)
