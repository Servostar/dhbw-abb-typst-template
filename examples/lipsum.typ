
#import "../src/template.typ": dhbw-template

#show: dhbw-template

= Lorem Ipsum

#lorem(25)

#lorem(100)

== Lorem Ipsum 2

#lorem(200)

= Lorem Ipsum 3

#lorem(15)

$ integral_2^8 4x^2 $

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