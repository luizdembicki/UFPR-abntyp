#import "/lib.typ": *

= Teste: tabela pequena (isolado)

Mostramos abaixo o helper `#tabela` (esperamos centralizada) e uma tabela crua abaixo para comparação.
#tabela(
  (1fr, 1fr),
  <test-tab-small>,
  "Tabela pequena de teste",
  (
    table.hline(stroke: 1pt),
    [*Item*],
    [*Valor*],
    table.hline(stroke: 0.75pt),
    [A],
    [1],
    [B],
    [2],
    table.hline(stroke: 1pt),
  ),
  fonte-texto: "Fonte: teste",
  largura: 40%,
  posicionamento: "center",
)
== Tabela crua (sem helper)

#set text(size: 10pt)

#table(
  stroke: none,
  columns: (1fr, 1fr),
  table.hline(stroke: 1pt),
  [*Item*], [*Valor*],
  table.hline(stroke: 0.75pt),
  [A], [1],
  [B], [2],
  table.hline(stroke: 1pt),
)
