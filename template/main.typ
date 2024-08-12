#import "../src/lib.typ": *

#import "abstract.typ": abstract, summary

#show: dhbw-template.with((
  lang: "en",
  region: "en",
  draft: false,
  author: (
    name: "Sven Vogel",
    semester: 4,
    program: "Informationtechnology",
    course: "TINF19IT1",
    faculty: "Technik",
    university: "DHBW Mannheim",
    company: "ABB AG",
    supervisor: "Benny Goodman",
    matriculation-number: 123456789,
  ),
  thesis: (
    title: "Unofficial ABB/DHBW Typst template",
    subtitle: "for reports and thesises",
    submission-date: "23rd march 2020",
    timeframe: "1st january 2020 - 20th march 2020",
    kind: "T2000",
    summary: summary,
    abstract: abstract,
    preface: include "preface.typ",
    keywords: ("IT", "other stuff"),
    bibliography: bibliography("refs.bib"),
    glossary: yaml("glossary.yml"),
    appendices: include "appendix.typ",
  ),
))

#import "@preview/wrap-it:0.1.0": wrap-content

= Lorem Ipsum

#text(fill: ABB-RED, "Hello ABB branding")

#lorem(25)
@oidc
@potato

#lorem(100)
@Anhang-A

== Lorem Ipsum 2

#lorem(200)
@einstein

= Lorem Ipsum 3

#lorem(15) t `Hello, World!` #lorem(50)

$
  angle.l a, b angle.r &= arrow(a) dot arrow(b) \
  &= a_1 b_1 + a_2 b_2 + ... a_n b_n \
  &= sum_(i=1)^n a_i b_i.
$

#lorem(140)

#wrap-content(
  figure(image("assets/digitaldog.jpg", width: 200pt), caption: [ Some image caption ]),
  lorem(200),
)

#figure(
  table(
    columns: 3,
    table.header[Date][Exercise Type][Calories Burned],
    [2023-03-15], [Swimming], [400],
    [2023-03-17], [Weightlifting], [250],
    [2023-03-18], [Yoga], [200],
    [2023-03-15], [Swimming], [400],
    [2023-03-17], [Weightlifting], [250],
    [2023-03-18], [Yoga], [200],
    [2023-03-15], [Swimming], [400],
    [2023-03-17], [Weightlifting], [250],
    [2023-03-18], [Yoga], [200],
  ),
  caption: [ Some table ],
)

#pagebreak()

#lorem(100)
#inline-color("#ff0000", "red")

#figure(
  ```rust
  use std::env;
  use std::fs::OpenOptions;
  use std::io::Write;

  fn main() {
      println!("Hello, World!!!");
  }
  ```,
  caption: [Some code],
)

#lorem(100)

#pagebreak()


= Conclusion

#lorem(320)
