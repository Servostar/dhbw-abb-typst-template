
#import "prelude.typ" as prelude

// set page geometry:
// paper format of A4
#set page(
  margin: (left: 3cm, right: 2cm, top: 2cm + 2em, bottom: 2cm),
  paper: "a4",
)

// set global text parameter
#set text(
  font: "Times New Roman",
  size: prelude.to_pt(prelude.format.font-size),
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: prelude.format.ligratures,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language
)

// set the text properties of verbatim/raw text blocks
#show raw: set text(
  font: "FiraCode Nerd Font",
  size: prelude.to_pt(prelude.format.font-size),
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: prelude.format.ligratures,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language
)

// use block element as paragraph
// set block settings for every paragraph
#show par: set block(
  below: prelude.to_em(prelude.format.paragraph-spacing), // paragraph spacing
)

// set global paragraph settings
#set par(
  leading: prelude.to_em(prelude.format.line-spacing),
  justify: true,
  first-line-indent: prelude.to_cm(prelude.format.first-line-indent)
)

// set PDF meta information
#set document(
  author: prelude.info.autor,
  date: datetime.today(),
  keywords: prelude.info.stichwörter
)

#set heading(numbering: none)
#set page(numbering: "I.", footer: "")

#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(prelude.to_pt(prelude.format.font-size) * 2, weight: "regular")
  #it.body
  #v(0.5cm)
]

#include "pages/titel.typ"
#include "pages/selbständigkeitserklärung.typ"
#include "pages/sperrvermerk.typ"

#set page(
  binding: left,
  header-ascent: 1em,
  header: locate(loc => {
    smallcaps(prelude.info.titel)
    v(-2em)
    align(right, counter(page).display("I."))
    v(-1em)
    line(length: 100%)
  }),
  footer: ""
)

#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(left)
  #set text(prelude.to_pt(prelude.format.font-size) * 2, weight: "regular")
  #v(0.25cm)
  #it.body
  #v(0.5cm)
]

#include "pages/gender-hinweis.typ"
#include "pages/übersicht-arbeitspakete.typ"

#outline(title: "Inhaltsverzeichnis", indent: auto)

#pagebreak()

#outline(
  title: "Abbildungsverzeichnis",
  target: figure.where(kind: image),
)

#pagebreak()

#outline(
  title: "Tabellensverzeichnis",
  target: figure.where(kind: table),
)

#pagebreak()

#outline(
  title: "Quelltextverzeichnis",
  target: figure.where(kind: raw),
)

#pagebreak()

// for creating glossary
#import "@preview/glossarium:0.2.6": make-glossary, print-glossary, gls, glspl 
#show: make-glossary

= Glossar

// read all entries from config file
#let glossary = yaml("../conf/glossary.yaml")
// destination array
#let glossary_entries = ()

// parse TOML entries into correct format
#if glossary.glossary != none {
  for entry in glossary.glossary {
    let short = entry.at("short", default: none)
    let long  = entry.at("long", default: none)
    let desc  = entry.at("desc", default: none)
 
    if short == none {
      panic("Key of glossary term must be specified")
    }

    glossary_entries.push((key: short, short: short, long: long, desc: desc))
  }
}

#print-glossary(glossary_entries)

#pagebreak()

// reset page counter
#counter(page).update(0)

= Abteilung

#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(left)
  #set text(prelude.to_pt(prelude.format.font-size) * 2, weight: "regular")
  #v(0.25cm)
  #it.numbering
  #it.body
  #v(0.5cm)
]

#set heading(numbering: "1.")
#set page(
  binding: left,
  header-ascent: 1em,
  header: locate(loc => {
    align(right, counter(page).display("1."))
    v(-1em)
    line(length: 100%)
  }),
  footer: ""
)

#set page(numbering: "1.")

= Kapitel
#lorem(100)

#pagebreak()

#set heading(numbering: none)

#bibliography(
  style: "ieee",
  "../conf/bibliography.bib"
)