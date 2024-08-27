
#import "../../src/lib.typ": dhbw-template

#show: dhbw-template.with((
  lang: "en",
  region: "en",
  author: (
    university: "DHBW Mannheim",
    company: "ABB AG",
    supervisor: none,
    matriculation-number: 123456789,
  ),
  thesis: (
    title: "Unofficial ABB/DHBW Typst template",
    subtitle: "for reports and thesises",
    submission-date: "23rd march 2020",
    timeframe: "1st january 2020 - 20th march 2020",
    kind: "T2000",
    summary: none,
    abstract: none,
    keywords: ("IT", "other stuff"),
    bibliography: none,
    glossary: none,
    appendices: none,
  ),
))
