
#let TitleSize = 24pt
#let SubtitleSize = 18pt
#let LargetextSize = 14pt

// titles are bold and twice the size of normal text
// also they are centered and not justified
#let title(x) = {
  align(center, par(justify: false, text(weight: "regular", size: TitleSize)[#x]))
}

// subtitles are 1.5x the size of normal text
// also they are centered and not justified
#let subtitle(x) = {
  par(justify: false, text(size: SubtitleSize)[#x])
}

#let largetext(x) = {
  par(justify: false, text(size: LargetextSize)[#x])
}

#let signature = {
  set align(bottom)

  grid(
    // set width of columns
    // we need two, so make both half the page width
    columns: (50%, 50%),
    row-gutter: 0.75em,
    align(left, {line(length: 6cm)}),
    align(left, {line(length: 6cm)}),
    align(left, "Ort, Datum"),
    align(left, "Unterschrift")
  )
}

#let to_em(x) = {
  x * 1em
}

#let to_cm(x) = {
  x * 1cm
}

#let to_pt(x) = {
  x * 1pt
}