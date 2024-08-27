
// .--------------------------------------------------------------------------.
// |                           Glossary Utilities                             |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 08.07.2024
// License: MIT

#let glossary(entries, config) = {

  assert(
    type(entries) == dictionary,
    message: "The glossary is not a dictionary",
  )

  let processed_glossary = (:)

  for (k, v) in entries.pairs() {
    assert(
      type(v) == dictionary,
      message: "The glossary entry `" + k + "` is not a dictionary",
    )

    for key in v.keys() {
      assert(
        key in ("short", "long", "desc", "group"),
        message: "Found unexpected key `" + key + "` in glossary entry `" + k,
      )
    }

    assert(
      type(v.short) == str,
      message: "The short form of glossary entry `" + k + "` is not a string",
    )

    if "long" in v {
      assert(
        type(v.long) == str,
        message: "The long form of glossary entry `" + k + "` is not a string",
      )
    }

    if "desc" in v {
      assert(
        type(v.desc) == str,
        message: "The description of glossary entry `" + k + "` is not a string",
      )
    }

    if "group" in v {
      assert(
        type(v.group) == str,
        message: "The optional group of glossary entry `" + k + "` is not a string",
      )
    } else {
      let acronym_group = if config.lang == "de" {
        "Abkürzungsverzeichnis"
      } else {
        "List of Acronyms"
      }

      let glossary_group = if config.lang == "de" {
        "Begriffe"
      } else {
        "Glossary"
      }

      let group = if "long" in v {
        acronym_group
      } else {
        glossary_group
      }

      // create dedicated entries for
      // acronym and glossary
      if "long" in v and "desc" in v {
        processed_glossary.insert(
          k,
          (short: v.short, long: v.long, group: acronym_group),
        )
        processed_glossary.insert(
          k + "__glossary_entry",
          (short: v.short, desc: v.desc, long: v.long, group: glossary_group),
        )
      } else {
        processed_glossary.insert(k, v)
        processed_glossary.at(k).group = group
      }
    }
  }

  return processed_glossary.pairs().map(((key, entry)) => (
    key: key,
    short: entry.short,
    long: eval(entry.at("long", default: ""), mode: "markup"),
    desc: eval(entry.at("desc", default: ""), mode: "markup"),
    group: entry.at("group", default: ""),
  ))
}
