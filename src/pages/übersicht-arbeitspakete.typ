#import "../prelude.typ" as prelude

// title
#if prelude.format.language == "de" [
  = Übersicht Arbeitspakete
  Folgende Tabelle zeigt die Aktivtäten welche im Zeitraum vom #prelude.info.bearbeitungszeitraum abgehandelt wurden.
] else if prelude.format.language == "en" [
  = Work package overview
  The following table shows the activities that were covered during the #prelude.info.processing period.
] else [
  #panic("no translation for language: ", prelude.format.language)
]

#let table_align(col, row) = {
  if row == 0 {
    center
  } else {
    left
  }
}

#figure(
  kind: table,
  caption: if prelude.format.language == "de" [
      Übersicht Arbeitspakete
    ] else if prelude.format.language == "en" [
      Work package overview
    ] else [
      #panic("no translation for language: ", prelude.format.language)
    ],
  table(
    columns: (1fr, auto, auto),
    align: table_align,
    inset: 0.25cm,
    [*Thema*], [*Zeitraum*], [*Dauer (Wochen)*],
    ..for packet in prelude.info.arbeits-pakete {

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