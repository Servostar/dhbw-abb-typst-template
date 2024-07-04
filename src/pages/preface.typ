
#let new-preface(config) = {
  if config.thesis.preface != none {
    pagebreak(weak: true)
    config.thesis.preface
  }
}