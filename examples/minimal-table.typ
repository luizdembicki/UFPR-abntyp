#import "/lib.typ": *

= Minimal table

#set text(size: 10pt)

#table(
  stroke: none,
  columns: (1fr, 1fr),
  table.hline(stroke: 1pt),
  [*A*], [*B*],
  table.hline(stroke: 0.75pt),
  [x], [1],
  [y], [2],
  table.hline(stroke: 1pt),
)
