
#box(height: 7em)

// title
#text(size: 2em, weight: "semibold", align(center, "Übersicht Arbeitspakete"))

#box(height: 5em)

#let info = yaml("../info.yaml")

#figure(
  kind: table,
  caption: "Übersicht Arbeitspakete",
  table(
    columns: 3,
    align: right,
    inset: 1em,
    [*Thema*], [*Zeitraum*], [*Dauer (Wochen)*],
    ..for packet in info.arbeits-pakete {

      let start_split = packet.start.split(".")
      let start = datetime(day: int(start_split.at(0)), month: int(start_split.at(1)), year: int(start_split.at(2)))
      
      let end_split = packet.ende.split(".")
      let end = datetime(day: int(end_split.at(0)), month: int(end_split.at(1)), year: int(end_split.at(2)))

      let dur = end - start
      
      (packet.thema, packet.start + " - " + packet.ende, str(calc.round(dur.weeks())))
    }
  )
)

#pagebreak()