#import "../src/lib.typ": dhbw-template

#import "glossary.typ": glossary
#import "abstract.typ": abstract, summary

#show: dhbw-template.with((
  lang: "en",
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
    summary: summary,
    abstract: abstract,
    preface: include "preface.typ",
    keywords: ( "IT", "other stuff" ),
    bibliography: bibliography("refs.bib"),
    glossary: glossary,
    appendices: include "appendix.typ")))

#import "@preview/wrap-it:0.1.0": wrap-content

= Lorem Ipsum

#lorem(25)
@oidc

#lorem(100)
@Anhang-A

== Lorem Ipsum 2

#lorem(200)
@einstein

= Lorem Ipsum 3

#lorem(15)

$
  angle.l a, b angle.r &= arrow(a) dot arrow(b) \
                       &= a_1 b_1 + a_2 b_2 + ... a_n b_n \
                       &= sum_(i=1)^n a_i b_i.
$

#lorem(140)

#wrap-content(
  figure(image("assets/digitaldog.jpg", width: 200pt), caption: [ Some image caption ]),
  lorem(200))

#figure(
  table(
    columns: 3,
    table.header[Date][Exercise Type][Calories Burned],
    [2023-03-15], [Swimming], [400],
    [2023-03-17], [Weightlifting], [250],
    [2023-03-18], [Yoga], [200]),
    caption: [ Some table ])

#pagebreak()

#figure(
  ```rust
use std::env;
use std::fs::OpenOptions;
use std::io::Write;

fn main() {
    // Get the file path from the environment variable
    let file_path = match env::var("OUTPUT_FILE") {
        Ok(path) => path,
        Err(_) => {
            eprintln!("Error: OUTPUT_FILE environment variable is not set");
            return;
        }
    };

    // Open the file in append mode, create it if it doesn't exist
    let mut file = match OpenOptions::new()
        .append(true)
        .create(true)
        .open(&file_path)
    {
        Ok(file) => file,
        Err(e) => {
            eprintln!("Error opening file {}: {}", file_path, e);
            return;
        }
    };

    // Write "Hello, World" to the file
    if let Err(e) = writeln!(file, "Hello, World") {
        eprintln!("Error writing to file: {}", e);
    } else {
        println!("Successfully appended 'Hello, World' to {}", file_path);
    }
}
  ```, caption: [Some code])

= Conclusion

#lorem(320)