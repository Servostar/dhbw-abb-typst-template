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
Praxisphase des #prelude.info.semester Studienjahrs

// fakulty
#pad(top: 0.5cm)[
  an der Fakultät für #prelude.info.fakultät
  #linebreak()
  im Studiengang #prelude.info.studiengang
]

// university
#pad(top: 0.5cm)[
  an der
  #linebreak()
  #prelude.info.universität
]

#set align(bottom + left)

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

#pad(
  top: 1cm,
  grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    align(left, "Unterschrift des betrieblichen Betreuers"),
    align(right, {line(length: 6cm)})
  )
)

#pagebreak()

#counter(page).update(1)
