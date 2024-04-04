
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
  title: image_outline_title,
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
#let glossary = yaml("../../conf/glossary.yaml")
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

// reset page counter
#counter(page).update(0)