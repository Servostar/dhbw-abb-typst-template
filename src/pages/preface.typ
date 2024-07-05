// .--------------------------------------------------------------------------.
// |                                   Preface                                |
// '--------------------------------------------------------------------------'

// Author: Sven Vogel
// Edited: 28.06.2024
// License: MIT

#let new-preface(config) = {
  if config.thesis.preface != none {
    pagebreak(weak: true)
    config.thesis.preface
  }
}