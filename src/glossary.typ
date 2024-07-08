
// .--------------------------------------------------------------------------.
// |                           Glossary Utilities                             |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 08.07.2024
// License: MIT

#let glossary(entries) = {

    assert(
      type(entries) == dictionary,
      message: "The glossary is not a dictionary",
    )

    for (k, v) in entries.pairs() {
      assert(
        type(v) == dictionary,
        message: "The glossary entry `" + k + "` is not a dictionary")

      for key in v.keys() {
        assert(
          key in ("short", "long", "desc", "group"),
          message: "Found unexpected key `" + key + "` in glossary entry `" + k)
      }

      assert(
        type(v.short) == str,
        message: "The short form of glossary entry `" + k + "` is not a string")

      if "long" in v {
        assert(
          type(v.long) == str,
          message: "The long form of glossary entry `" + k + "` is not a string")
      }

      if "desc" in v {
        assert(
          type(v.desc) == str,
          message: "The description of glossary entry `" + k + "` is not a string")
      }
      
      if "group" in v {
        assert(
          type(v.group) == str,
          message: "The optional group of glossary entry `" + k + "` is not a string")
      } else {
          let group = if "long" in v {
            if (context text.lang) == "de" {
              "Akronyme"
            } else {
              "Acronyms"
            }
          } else {
            if (context text.lang) == "de" {
              "Begriffe"
            } else {
              "Terms"
            }
          }

          entries.at(k).group = group
      }
    }

  return entries.pairs().map(((key, entry)) => (
      key: key,
      short: eval(entry.short, mode: "markup"),
      long: eval(entry.at("long", default: ""), mode: "markup"),
      desc: eval(entry.at("desc", default: ""), mode: "markup"),
      group: entry.at("group", default: "")
    ))
}