
// .--------------------------------------------------------------------------.
// |                         Configuration                                    |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

#import "branding.typ": *

// default configuration
#let default-config = (
    // language settings used to make decisions about hyphenation and others
    lang: "en",       // ISO 3166 language code of text: "de", "en"
    region: "en",     // region code
    // mark this thesis as draft
    // Adds preleminarry note page and watermark
    draft: true,
    // information about author(s)
    university: (
      program: "Informationtechnology",
      faculty: "Technik",
      name: "dualen Hochschule Baden-Württemberg",
      campus: "Eppelheim"
    ),
    authors: (
      (
        name: "Sven Vogel",
        course: "TINF19IT1",
        company: "ABB AG",
        supervisor: "Benny Goodman",
        matriculation-number: 123456789
      ),
      (
        name: "Kurt Jammer",
        course: "TINF24AI2",
        company: "Siemens",
        supervisor: "Henry Badman",
        matriculation-number: 478568763
      ),
    ),
    // information about thesis
    thesis: (
      title: "Unofficial ABB/DHBW Typst template",
      subtitle: "for reports and thesises",            // subtitle may be none
      submission-date: "23rd march 2020",
      timeframe: "1st january 2020 - 20th march 2020",
      kind: "T2000",
      // translated version of abstract, only used in case language is not english
      summary: none,
      abstract: none,
      preface: none,
      keywords: ( "IT", "other stuff" ),
      bibliography: none /* bibliography("refs.bib") */,
      glossary: none,
      appendices: none),
    style: (
      header: (
        content-padding: 1.5em,
        underline-top-padding: 0pt,
        logo-height: 5em,
        logo-image: "res/ABB.svg"),
      footer: (
        content-padding: 1.5em),
      page: (
        format: "a4",
        margin: (
          left: 3cm,
          right: 2.5cm,
          top: 2.5cm,
          bottom: 2.5cm)),
      text: (
        size: 12pt,
        font: "Fira Sans"),
      heading: (
      font: "Fira Sans"),
      code: (
        theme: "res/abb.tmTheme",
        font: "FiraCode Nerd Font",
        lines: false,
        size: 10pt,
        tab-size: 4),
      link: (
        color: ABB-GRAY-02)))

// Insert a dictionary `update` into `base` but only the entries of update that also exist in base
// Runs recursively on all sub dictionaries
#let deep-insert-checked(base, update) = {
  if base == none {
    panic("target dictionary is none")
  }

  if update == none {
    return base
  }

  for (key, val) in base {
    if key in update {
      let update_val = update.at(key)

      if type(val) == array {
        // ignore checking arraay
      } else if type(val) == dictionary and type(update_val) == dictionary {
        base.insert(key, deep-insert-checked(val, update_val))
      } else if val == none or type(val) == type(update_val) {
        base.insert(key, update_val)
      } else {
        panic("missmatched dictionary entry `" + key + "` type: expected `" + type(val) + "` got `" + type(update_val) + "`")
      }
    } else {
      base.insert(key, val)
    }
  }

  return base
}

#let validate-config(config) = {
  return deep-insert-checked(default-config, config)
}
