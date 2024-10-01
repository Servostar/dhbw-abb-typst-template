#import "../src/lib.typ": *

#import "abstract.typ": abstract, summary

#show: dhbw-template.with()

#import "@preview/wrap-it:0.1.0": wrap-content

= Lorem Ipsum

#lorem(25)

@einstein

#lorem(100)

== Lorem Ipsum 2

#lorem(230)

= Lorem Ipsum 3 <sec:hello>

#lorem(15) t `Hello, World!` #lorem(50)

$
  angle.l a, b angle.r &= arrow(a) dot arrow(b) \
  &= a_1 b_1 + a_2 b_2 + ... a_n b_n \
  &= sum_(i=1)^n a_i b_i. \
  integral_2^4(3x + 4x^2)
$

#lorem(140)

#figure(image("assets/digitaldog.jpg", width: 200pt), caption: [ Some image caption ])

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

#lorem(100)

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

= Conclusion

#lorem(320)
