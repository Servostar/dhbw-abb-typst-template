
#let gap = 0.5cm

#set page(margin: 0pt, width: 210mm * 3 + 2 * gap, height: 297mm * 2 + gap, fill: rgb(0, 0, 0, 0))

#place(
  dx: 0mm,
  dy: 0mm,
    image("./images/11.svg", height: 297mm))

#place(
  dx: 210mm + gap,
  dy: 0mm,
    image("./images/21.svg", height: 297mm))

#place(
  dx: (210mm + gap) * 2,
  dy: 0mm,
    image("./images/31.svg", height: 297mm))

#place(
  dx: 210mm * 0,
  dy: 297mm + gap,
    image("./images/71.svg", height: 297mm))

#place(
  dx: (210mm + gap) * 1,
  dy: 297mm + gap,
    image("./images/41.svg", height: 297mm))

#place(
  dx: (210mm + gap) * 2,
  dy: 297mm + gap,
    image("./images/51.svg", height: 297mm))
