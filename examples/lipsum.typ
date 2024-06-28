
#import "../src/template.typ": dhbw-template

#show: dhbw-template

= Lorem Ipsum

#lorem(25)

#lorem(100)

== Lorem Ipsum 2

#lorem(200)

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

#figure(
  ```rust
  fn main() -> {

  }
  ```, caption: [Some code])