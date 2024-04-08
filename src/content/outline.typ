
// ====================================================
//
// OUTLINE
// 
// Author: Sven Vogel
// License: MIT
// Edited: 29.03.2024
//
// This file binds and styles the outline of this document
// ====================================================

#import "../prelude.typ" as prelude

#set page(
  binding: left,
  header-ascent: 2em,
  header: locate(loc => {
    table(columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      inset: (top: 0pt, bottom: 0.5em, left: 0pt, right: 0pt),
      text(size: prelude.to_pt(prelude.format.font-size), prelude.info.titel),
      text(size: prelude.to_pt(prelude.format.font-size), counter(page).display("I.")),
      table.hline()
    )
  }),
  footer: ""
)

#set heading(supplement: [Heading])
#set page(numbering: "I.", footer: "")

#if prelude.format.language == "de" [
  = Inhaltsverzeichnis
] else if prelude.format.language == "en" [
  = Table of contents
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#par(first-line-indent: 0pt)[
  #show outline.entry.where(
    level: 1
  ): it => {
    strong(it)
  }

  #outline(title: none, indent: auto, target: heading.where(supplement: [Heading]))
]

#pagebreak()

#if prelude.format.language == "de" [
  = Abbildungsverzeichnis
] else if prelude.format.language == "en" [
  = List of figures
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#outline(
  title: none,
  target: figure.where(kind: image),
)

#pagebreak()

#if prelude.format.language == "de" [
  = Tabellensverzeichnis
] else if prelude.format.language == "en" [
  = List of tables
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#outline(
  title: none,
  target: figure.where(kind: table),
)

#pagebreak()

#if prelude.format.language == "de" [
  = Quelltextverzeichnis
] else if prelude.format.language == "en" [
  = List of source code
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#outline(
  title: none,
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
#let glossary = yaml("../../conf/glossary.yaml")
// destination array
#let glossary_entries = ()

// parse YAML entries into correct format
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

#if prelude.format.language == "de" [
  = Anhangsverzeichnis
] else if prelude.format.language == "en" [
  = List of appendencies
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#outline(
  title: none,
  target: heading.where(supplement: [Appendix]),
)

// reset page counter
#counter(page).update(0)