// .--------------------------------------------------------------------------.
// |                            Document Outline                              |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

// render an outline of figures
// with a specific title and filter by a specifc kind of figure
// can optionally insert a pagebreak after the outline
// NOTE: will not render in case the listing is empty
#let render_filtered_outline(title: str, kind: selector) = (
  context {
    let elems = query(figure.where(kind: kind))
    let count = elems.len()

    show outline.entry: it => {
      link(it.element.location())[
        #v(12pt, weak: true)
        #it.prefix()
        #[:]
        #h(0.5em)
        #text(weight: "regular", it.body())
        #box(width: 1fr, it.fill)
        #[ #it.page()]
      ]
    }

    // only show outline if there is something to list
    if count > 0 {
      pagebreak(weak: true)
      outline(
        title: title,
        target: figure.where(kind: kind),
      )
    }
  }
)

#let render_figures_outline() = (
  context {
    let title = if (text.lang == "de") {
      "Abbildungsverzeichnis"
    } else if text.lang == "en" {
      "List of Figures"
    }

    render_filtered_outline(title: title, kind: image)
  }
)

#let render_table_outline() = (
  context {
    let title = if (text.lang == "de") {
      "Tabellenverzeichnis"
    } else if text.lang == "en" {
      "List of Tables"
    }

    render_filtered_outline(title: title, kind: table)
  }
)

#let render_raw_outline() = (
  context {
    let title = if (text.lang == "de") {
      "Quelltextverzeichnis"
    } else if text.lang == "en" {
      "Code Snippets"
    }

    render_filtered_outline(title: title, kind: raw)
  }
)

#let render_heading_outline() = (
  context {
    let title = if (text.lang == "de") {
      "Inhaltsverzeichnis"
    } else if text.lang == "en" {
      "Table of Contents"
    }

    let header-supplement = if (text.lang == "de") {
      "Kapitel"
    } else {
      "chapter"
    }

    pagebreak(weak: true)
    outline(
      target: heading.where(supplement: [#header-supplement]),
      title: title,
      indent: auto,
    )
  }
)

#let render_appendix_outline() = (
  context {
    let supplement = if text.lang == "en" {
      [Appendix]
    } else {
      [Anhang]
    }

    if query(heading.where(supplement: supplement)).len() > 0 {
      let title = if (text.lang == "de") {
        "Anhangsverzeichnis"
      } else if text.lang == "en" {
        "Table of Appendices"
      }

      pagebreak(weak: true)
      outline(
        target: heading.where(supplement: supplement),
        title: title,
        indent: auto,
      )
    }
  }
)

#let new_outline() = {
  pagebreak(weak: true)

  show outline.entry: it => {
    if it.level == 1 {
      v(1.5em, weak: true)
      strong(it)
    } else {
      v(1.0em, weak: true)
      it
    }
  }

  render_heading_outline()

  render_figures_outline()

  render_table_outline()

  render_raw_outline()

  render_appendix_outline()
}
