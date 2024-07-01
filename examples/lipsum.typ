
#import "../src/template.typ": dhbw-template

#let config = (
  lang: "de",
  region: "de",
  author: (
    name: "Sven Vogel",
    semester: 4,
    program: "Informationstechnik",
    course: "TINF22IT2",
    faculty: "Technik",
    university: "DHBW Mannheim",
    company: "ABB AG",
    supervisor: "Florian Miedniak",
    matriculation-number: 1191225),
  thesis: (
    title: "Konfiguration & Integration von PROFINET",
    subtitle: "für die AC500 SPS",
    submission-date: "20. März 2024",
    timeframe: "1. Januar 2023 - 20. März 2024",
    kind: "T2000",
    summary: "",
    abstract: "",
    keywords: ( "IT", "PROFINET" ),
    bibliography: bibliography("refs.yml"),
    glossary: (
        (
          key: "oidc", 
          short: "OIDC", 
          long: "OpenID Connect", 
          desc: [OpenID is an open standard and decentralized authentication protocol promoted by the non-profit #link("https://en.wikipedia.org/wiki/OpenID#OpenID_Foundation")[OpenID Foundation].],
          group: "Akronyme",
        ),
        (
          key: "potato",
          short: "potato",
          plural: "potatoes",
          desc: [#lorem(10)],
          group: "Begriffe"
        ),
    ),
    appendices: include "appendix.typ"
))

#show: doc => dhbw-template(config: config, doc: doc)

= Lorem Ipsum

#lorem(25)
@oidc

#lorem(100)

== Lorem Ipsum 2

#lorem(200)
@texbook

= Lorem Ipsum 3

#lorem(15)

$
  angle.l a, b angle.r &= arrow(a) dot arrow(b) \
                       &= a_1 b_1 + a_2 b_2 + ... a_n b_n \
                       &= sum_(i=1)^n a_i b_i.
$

#figure(image("digitaldog.jpg", height: 480pt), caption: [ Some image caption ])

#figure(
  table(
    columns: 2,
    "Hello", "World"),
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