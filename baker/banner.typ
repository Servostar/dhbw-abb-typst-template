#import "@preview/shadowed:0.1.2": shadowed

#let LE = 10cm
#let shadow = 0.25cm

#set page(margin: 0pt, width: 2 * LE, height: LE, fill: rgb(0, 0, 0, 0))

#place(
  dx: 3cm,
  dy: 1.1cm,
  rotate(
    -9deg,
    shadowed(
      radius: 0pt,
      inset: 0pt,
      blur: shadow,
      image("./images/21.svg", height: LE * 0.6))))

#place(
  dx: 1cm,
  dy: 3.25cm,
  rotate(
    -20deg,
    shadowed(
      radius: 0pt,
      inset: 0pt,
      blur: shadow,
      image("./images/51.svg", height: LE * 0.55))))

#place(
  dx: 14cm,
  dy: 1.5cm,
  rotate(
    6deg,
    shadowed(
      radius: 0pt,
      inset: 0pt,
      blur: shadow,
      image("./images/41.svg", height: LE * 0.65))))

#place(
  dx: 11cm,
  dy: 2cm,
  rotate(
    25deg,
    shadowed(
      radius: 0pt,
      inset: 0pt,
      blur: shadow,
      image("./images/31.svg", height: LE * 0.6))))

#place(
  dx: 7cm,
  dy: 0.75cm,
  shadowed(
    radius: 0pt,
    inset: 0pt,
    blur: shadow,
    image("./images/11.svg", height: LE * 0.75)))
