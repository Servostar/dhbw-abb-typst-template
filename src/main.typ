
// style text
#set text(
  ligatures: true,
  size: 12pt  // global font size
)

// page geometry
#set page(
  margin: (left: 3cm, right: 2cm, top: 2cm + 2em + 2em, bottom: 2cm),
  paper: "a4",
)

#let info = yaml("info.yaml")

// set PDF meta information
#set document(
  author: info.autor,
  date: datetime.today(),
  keywords: info.stichwörter
)

#include "pages/titel.typ"
#include "pages/selbständigkeitserklärung.typ"
#include "pages/sperrvermerk.typ"
#include "pages/gender-hinweis.typ"
#include "pages/übersicht-arbeitspakete.typ"

#set page(
  binding: left,
  header-ascent: 2em,
  header: locate(loc => {
    align(right, counter(page).display("I."))
    v(-0.75em)
    line(length: 100%)
  }),
  footer: ""
)

// vorwort

#outline(title: "Inhaltsverzeichnis")

#pagebreak()

#outline(
  title: [Abbildungsverzeichnis],
  target: figure.where(kind: image),
)

#pagebreak()

#outline(
  title: [Tabellensverzeichnis],
  target: figure.where(kind: table),
)

#pagebreak()

#outline(
  title: [Quelltextverzeichnis],
  target: figure.where(kind: raw),
)

#pagebreak()

#set page(
  header: locate(loc => {
    align(right, counter(page).display("1."))
    line(length: 100%)
  }),
  footer: ""
)
