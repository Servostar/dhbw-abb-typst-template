
#import "../../src/lib.typ": dhbw-template

#show: dhbw-template.with((
    lang: none,
    region: "en",
    author: (
      name: "Sven Vogel",
      semester: 4,
      program: "Informationtechnology",
      course: "TINF19IT1",
      faculty: "Technik",
      university: "DHBW Mannheim",
      company: "ABB AG",
      supervisor: "Benny Goodman",
      matriculation-number: 123456789),
    thesis: (
      title: "Unofficial ABB/DHBW Typst template",
      subtitle: "for reports and thesises",
      submission-date: "23rd march 2020",
      timeframe: "1st january 2020 - 20th march 2020",
      kind: "T2000",
      summary: none,
      abstract: none,
      keywords: ( "IT", "other stuff" ),
      bibliography: none,
      glossary: none,
      appendices: none)))
