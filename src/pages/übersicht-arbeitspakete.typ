#import "../prelude.typ" as prelude

// title
= Übersicht Arbeitspakete

Folgende Tabelle zeigt die Aktivtäten welche im Zeitraum vom #prelude.info.bearbeitungszeitraum abgehandelt wurden.

#figure(
  kind: table,
  caption: "Übersicht Arbeitspakete",
  table(
    columns: (1fr, auto, auto),
    align: center,
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