
// general document information
#let format = yaml("../../conf/format.yaml")

#let TitleSize = 2
#let SubtitleSize = 1.5
#let LargetextSize = 1.25

#let to_em(x) = {
  x * 1em
}

#let to_cm(x) = {
  x * 1cm
}

#let to_pt(x) = {
  x * 1pt
}

// titles are bold and twice the size of normal text
// also they are centered and not justified
#let title(x) = {
  align(center, par(justify: false, text(weight: "regular", size: to_pt(format.font-size) * TitleSize)[#x]))
}

// subtitles are 1.5x the size of normal text
// also they are centered and not justified
#let subtitle(x) = {
  par(justify: false, text(size: to_pt(format.font-size) * SubtitleSize)[#x])
}

#let largetext(x) = {
  par(justify: false, text(size: to_pt(format.font-size) * LargetextSize)[#x])
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
