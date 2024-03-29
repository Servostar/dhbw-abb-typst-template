#import "../prelude.typ" as prelude

#let LogoHeight = 1.5cm

#set align(center)

// logo of ABB and DHBW
#grid(
  // set width of columns
  // we need two, so make both half the page width
  columns: (50%, 50%),
  // left align logo of ABB
  align(left, image("../../res/svg/ABB.svg", height: LogoHeight)),
  // right align logo of DHBW
  align(right, image("../../res/svg/DHBW.svg", height: LogoHeight))
)

// title
#v(2cm)
#prelude.title(prelude.info.titel)

// subtitle
#prelude.subtitle(prelude.info.untertitel)

// type of paper
#v(1cm)
#prelude.largetext(prelude.info.typ)

// number of semester
#if prelude.format.language == "de" [
  Praxisphase des #prelude.info.semester Studienjahrs
] else if prelude.format.language == "en" [
  Practical phase of the #prelude.info.semester academic year
] else [
  #panic("no translation for language: ", prelude.format.language)
]

// fakulty
#pad(top: 0.5cm)[
  #if prelude.format.language == "de" [
    an der Fakultät für #prelude.info.fakultät
    #linebreak()
    im Studiengang #prelude.info.studiengang
  ] else if prelude.format.language == "en" [
    at the Faculty of #prelude.info.fakultät
    #linebreak()
    in the degree program #prelude.info.studiengang
  ] else [
    #panic("no translation for language: ", prelude.format.language)
  ]
]

// university
#pad(top: 0.5cm)[
  #if prelude.format.language == "de" [
    an der
  ] else if prelude.format.language == "en" [
    at
  ] else [
    #panic("no translation for language: ", prelude.format.language)
  ]
  #linebreak()
  #prelude.info.universität
]

#set align(bottom + left)

#if prelude.format.language == "de" [
  #table(
    columns: 2,
    align: left,
    stroke: none,
    
    "Verfasser:",
    prelude.info.autor,

    "Bearbeitungszeitraum:",
    prelude.info.bearbeitungszeitraum,

    "Matrikelnummer, Kurs:",
    str(prelude.info.matrikelnummer) + ", " + prelude.info.studiengang,

    "Ausbildungsbetrieb:",
    prelude.info.betrieb,

    "Betrieblicher Betreuer:",
    prelude.info.betreuer,

    "Abgabedatum:",
    prelude.info.abgabe
  )
] else if prelude.format.language == "en" [
  #table(
    columns: 2,
    align: left,
    stroke: none,
    
    "Author:",
    prelude.info.autor,

    "Editing period:",
    prelude.info.bearbeitungszeitraum,

    "Matriculation number, course:",
    str(prelude.info.matrikelnummer) + ", " + prelude.info.studiengang,

    "Training company:",
    prelude.info.betrieb,

    "Company supervisor:",
    prelude.info.betreuer,

    "Submission date:",
    prelude.info.abgabe
  )
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#pad(
  top: 1cm,
  grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (60%, 40%),
    align(left, if prelude.format.language == "de" [
        Unterschrift des betrieblichen Betreuers
      ] else if prelude.format.language == "en" [
        Signature of the company supervisor
      ] else [
        #panic("no translation for language: ", prelude.format.language)
      ]
    ),
    align(right, {line(length: 6cm)})
  )
)

#pagebreak()

#counter(page).update(1)
