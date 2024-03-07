
// load general information from YAML
#let info = yaml("../info.yaml")

#box(height: 7em)

// title
#text(size: 2em, weight: "semibold", align(center, "Sperrvermerk"))

#box(height: 2em)

#set par(justify: true)

#text(size: 1.25em)[
  Der Inhalt dieser Arbeit darf weder als Ganzes noch in
  Auszügen Personen außerhalb des Prüfungsprozesses
  und des Evaluationsverfahrens zugänglich gemacht werden,
  sofern keine anders lautende Genehmigung der Ausbildungsstätte vorliegt.
]

#box(height: 7em)

#grid(
  // set width of columns
  // we need two, so make both half the page width
  columns: (50%, 50%),
  row-gutter: 0.75em,
  align(left, {line(length: 16em)}),
  align(left, {line(length: 16em)}),
  align(left, "Ort, Datum"),
  align(left, "Unterschrift")
)

#pagebreak()
