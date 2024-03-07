
// load general information from YAML
#let info = yaml("../info.yaml")

#set align(center)

// title
#pad(top: 7em, text(size: 2em, weight: "semibold", "Selbständigkeitserklärung"))

#pad(top: 7em, text(size: 1.25em)[
  Ich versichere hiermit, dass ich meine #linebreak() Prüfung mit dem Thema
])

#pad(
  top: 4em, 
  {
    text(size: 1.5em, weight: "semibold", info.titel)
    linebreak()
    text(size: 1.5em, info.untertitel)
  }
)

#pad(top: 6em, text(size: 1.5em)[
  selbständig verfasst und keine anderen als die angegebenen
  Quellen und Hilfsmittel benutzt habe. Ich versichere zudem, dass die
  eingereichte elektronische Fassung mit der gedruckten Fassung
  übereinstimmt.
])

#set align(bottom)

#pad(
  top: 3em,
  grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    row-gutter: 0.75em,
    align(left, {line(length: 16em)}),
    align(left, {line(length: 16em)}),
    align(left, "Ort, Datum"),
    align(left, "Unterschrift")
  )
)

#pagebreak()