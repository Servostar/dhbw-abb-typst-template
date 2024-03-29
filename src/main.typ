
#import "prelude.typ" as prelude

// set page geometry:
// paper format of A4
#set page(
  margin: (left: 3cm, right: 2cm, top: 2cm + 2em, bottom: 2cm),
  paper: "a4",
)

// set global text parameter
#set text(
  font: prelude.format.font-familty,
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

#show heading.where(level: 1): set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size) * 2,
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: prelude.format.ligratures,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language,
  weight: "regular",
  baseline: 1em
)

#show heading.where(level: 2): set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size) * 1.5,
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: prelude.format.ligratures,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language,
  weight: "regular"
)

#show heading.where(level: 3): set text(
  font: prelude.format.font-familty,
  size: prelude.to_pt(prelude.format.font-size) * 1.25,
  ligatures: prelude.format.ligratures,
  hyphenate: prelude.format.hyphenate,
  alternates: prelude.format.ligratures,
  discretionary-ligatures: prelude.format.ligratures,
  lang: prelude.format.language,
  weight: "regular"
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

#include "pages/title.typ"
#include "pages/declaration-of-indipendence.typ"
#include "pages/confidential-clause.typ"

#set page(
  binding: left,
  header-ascent: 1em,
  header: locate(loc => {
    text(size: 12pt)[
      #prelude.info.titel
      #v(-2em)
      #align(right, counter(page).display("I."))
      #v(-1em)
      #line(length: 100%)
    ]
  }),
  footer: ""
)

#include "pages/gender-note.typ"
#include "pages/working-packages.typ"

#let heading_outline_title = if prelude.format.language == "de" [
  Inhaltsverzeichnis
] else if prelude.format.language == "en" [
  Table of contents
] else [
  #panic("no translation for language: ", prelude.format.language)
]
#outline(title: heading_outline_title, indent: auto)

#pagebreak()

#let image_outline_title = if prelude.format.language == "de" [
  Abbildungsverzeichnis
] else if prelude.format.language == "en" [
  List of figures
] else [
  #panic("no translation for language: ", prelude.format.language)
]
#outline(
  title: "Abbildungsverzeichnis",
  target: figure.where(kind: image),
)

#pagebreak()

#let table_outline_title = if prelude.format.language == "de" [
  Tabellensverzeichnis
] else if prelude.format.language == "en" [
  List of tables
] else [
  #panic("no translation for language: ", prelude.format.language)
]
#outline(
  title: table_outline_title,
  target: figure.where(kind: table),
)

#pagebreak()

#let raw_outline_title = if prelude.format.language == "de" [
  Quelltextverzeichnis
] else if prelude.format.language == "en" [
  Table of source code
] else [
  #panic("no translation for language: ", prelude.format.language)
]
#outline(
  title: raw_outline_title,
  target: figure.where(kind: raw),
)

#pagebreak()

// for creating glossary
#import "@preview/glossarium:0.2.6": make-glossary, print-glossary, gls, glspl 
#show: make-glossary

#if prelude.format.language == "de" [
  = Glossar
] else if prelude.format.language == "en" [
  = Glossary
] else [
  #panic("no translation for language: ", prelude.format.language)
]

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

#set heading(numbering: "1.")

#let filter_heading(heading) = {
  heading.level == 1
}

#set page(
  binding: left,
  header-ascent: 1em,
  header: locate(loc => {
    align(left, context [
      #let current_heading = query(selector(heading).after(here())).filter(filter_heading).first()
      #let heading_depth = counter(heading).get().at(0) + 1

      #heading_depth
      #h(0.25cm)
      #current_heading.body
    ])
    v(-2em)
    align(right, counter(page).display("1"))
    v(-1em)
    line(length: 100%)
  }),
  footer: ""
)

#set page(numbering: "1.")

= Kapitel

== Überschrift 2

#pagebreak()

#lorem(200)

= Kapitel 2

=== Überschrift 3

#lorem(50)

#pagebreak()

#set heading(numbering: none)
#set page(
  header: locate(loc => {
    align(left, context [
      #let current_heading = query(selector(heading).after(here())).filter(filter_heading).first()
      #current_heading.body
    ])
    v(-2em)
    align(right, counter(page).display("1"))
    v(-1em)
    line(length: 100%)
  }),
)

#bibliography(
  style: "ieee",
  "../conf/bibliography.bib"
)