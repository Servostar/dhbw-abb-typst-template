
#let new_title_page(config) = context [

  #let thesis = config.thesis
  #let author = config.author

  #set align(center)

  // title
  #v(2cm)
  #text(size: 2em, weight: "semibold", thesis.title)

  // subtitle
  #text(size: 1.5em, thesis.subtitle)

  // type of paper
  #v(1cm)
  #text(size: 1.5em, weight: "bold", thesis.kind)

  // faculty
  #pad(top: 0.5cm)[
    #if text.lang == "de" [
      Praxisphase des #author.semester Studienjahrs an der Fakultät für #author.faculty
      #linebreak()
      im Studiengang #author.program
    ] else if text.lang == "en" [
      Practical phase of the #author.semester academic year at the Faculty of #author.faculty
      #linebreak()
      in the degree program #author.program
    ] else [
      #context panic("no translation for language: ", text.lang)
    ]
  ]

  // university
  #pad(top: 0.5cm)[
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
      
      [*Verfasser:*],
      author.name,

      [*Bearbeitungszeitraum:*],
      thesis.timeframe,

      [*Matrikelnummer, Kurs:*],
      str(author.matriculation-number) + ", " + author.course,

      [*Ausbildungsbetrieb:*],
      author.company,

      [*Betrieblicher Betreuer:*],
      author.supervisor,

      [*Abgabedatum:*],
      thesis.submission-date
    )
  ] else if text.lang == "en" [
    #table(
      columns: 2,
      column-gutter: 1cm,
      align: left,
      stroke: none,
      
      [*Author:*],
      author.name,

      [*Editing period:*],
      thesis.timeframe,

      [*Matriculation number, course:*],
      str(author.matriculation-number) + ", " + author.course,

      [*Training company:*],
      author.company,

      [*Company supervisor:*],
      author.supervisor,

      [*Submission date:*],
      thesis.submission-date
    )
  ] else [
    #context panic("no translation for language: ", text.lang)
  ]

  #pad(
    top: 1cm,
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
      align(right, {line(length: 6cm)})
    )
  )

  #counter(page).update(0)
]
