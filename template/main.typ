#import "../src/lib.typ": *

#import "abstract.typ": abstract, summary

#show: dhbw-template.with((
  lang: "de",
  region: "de",
  draft: false,
  authors: (
      (
        name: "Sven Vogel",
        course: "TINF19IT1",
        company: none,
        supervisor: "Benny Goodman",
        matriculation-number: 123456789,
        contact: "sven.vogel123@web.de"
      ),
      (
        name: "Sven Vogel",
        course: "TINF19IT1",
        company: "ABB AG",
        supervisor: "Benny Goodman",
        matriculation-number: 123456789,
        contact: "sven.vogel123@web.de"
      )
  ),
  coauthors: (
    "Gorbatschew"
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
  style: (
    header: (
      logo-image: ""
    )
  )
))

#import "@preview/wrap-it:0.1.1": wrap-content

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

= Lorem Ipsum 3 <sec:hello>

#lorem(15) t `Hello, World!` #lorem(50)

$
  angle.l a, b angle.r &= arrow(a) dot arrow(b) \
  &= a_1 b_1 + a_2 b_2 + ... a_n b_n \
  &= sum_(i=1)^n a_i b_i. \
  integral_2^4(3x + 4x^2)
$

#lorem(140)

#wrap-content(
  figure(image("assets/digitaldog.jpg", width: 200pt), caption: [ Some image caption ]),
  lorem(200),
)

#url("https://github.com", "text") @sec:hello

#lorem(50)

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
#inline-color("#ff0000", "red") @HTTP

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
