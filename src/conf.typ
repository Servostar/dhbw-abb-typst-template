
// .--------------------------------------------------------------------------.
// |                         Configuration                                    |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 27.06.2024
// License: MIT

// default configuration
#let default-config = (
    lang: "en",
    region: "en",
    draft: true,
    author: (
      name: "Sven Vogel",
      semester: 4,
      program: "Informationtechnology",
      course: "TINF19IT1",
      faculty: "Technik",
      university: "DHBW Mannheim",
      company: "ABB AG",
      supervisor: "Benny Goodman",
      matriculation-number: 123456789),
    thesis: (
      title: "Unofficial ABB/DHBW Typst template",
      subtitle: "for reports and thesises",
      submission-date: "23rd march 2020",
      timeframe: "1st january 2020 - 20th march 2020",
      kind: "T2000",
      summary: none,
      abstract: none,
      preface: none,
      keywords: ( "IT", "other stuff" ),
      bibliography: none /* bibliography("refs.bib") */,
      glossary: none,
      appendices: none),
    style: (
      header: (
        bottom-padding: 1.5em,
        underline-top-padding: 0pt,
        logo-height: 3em),
      page: (
        format: "a4",
        margin: (
          left: 3cm, 
          right: 2.5cm, 
          top: 2.5cm, 
          bottom: 2.5cm)),
      text: (
        size: 12pt,
        font: "Open Sans"),
      heading: (
        font: "Montserrat"),
      link: (
        color: red.darken(15%))))

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

        if type(val) == dictionary and type(update_val) == dictionary {
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
