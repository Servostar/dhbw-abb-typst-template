
// load general information from YAML
#let info = yaml("../info.yaml")

#set align(center)

// logo of ABB and DHBW
#pad(
  top: 3em,
  grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    // left align logo of ABB
    align(left, image("../../res/svg/ABB.svg", height: 35pt)),
    // right align logo of DHBW
    align(right, image("../../res/svg/DHBW.svg", height: 40pt))
  )
)

// title
#pad(top: 4em, text(size: 2em, weight: "semibold", info.titel))

// subtitle
#pad(top: 1em, text(size: 1.5em, info.untertitel))

// subtitle
#pad(top: 4em, text(size: 1.5em, weight: "bold", info.typ))

// number of semester
#pad(top: 2em)[
  Praxisphase des #info.semester Studienjahrs
]

// fakulty
#pad(top: 0.5em)[
  an der Fakultät für #info.fakultät
  #linebreak()
  im Studiengang #info.studiengang
]

// university
#pad(top: 1.5em)[
  an der
  #linebreak()
  #info.universität
]

#set align(bottom + left)

#table(
  columns: 2,
  align: left,
  stroke: none,
  
  "Verfasser:",
  info.autor,

  "Bearbeitungszeitraum:",
  info.bearbeitungszeitraum,

  "Matrikelnummer, Kurs:",
  str(info.matrikelnummer) + ", " + info.studiengang,

  "Ausbildungsbetrieb:",
  info.betrieb,

  "Betr. Betreuer:",
  info.betreuer,

  "Abgabedatum:",
  info.abgabe
)

#pad(
  top: 3em,
  grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    align(left, "Unterschrift des betrieblichen Betreuers"),
    align(right, {line(length: 16em)})
  )
)

#pagebreak()

#counter(page).update(1)
