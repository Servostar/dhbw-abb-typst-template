
#let new-glossar(glossary) = {
  import "@preview/glossarium:0.4.1": make-glossary, print-glossary, gls, glspl
  show: make-glossary

  print-glossary(glossary)
}
