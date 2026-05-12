// Template geral UFPR para Typst
// Demonstra código → resultado para todos os recursos do pacote

#import "/lib.typ": *

#show: dados-ufpr.with(
  titulo: "Guia de Uso do Pacote ufpr-abntyp",
  subtitulo: [Estruturado com código e resultado de cada recurso],
  autor: "Nome do Autor",
  faculdade: "Setor de Ciências Exatas",
  programa: "Programa de Pós-Graduação em ...",
  local: "Curitiba",
  ano: 2026,
  texto-apresentacao: [
    Trabalho apresentado ao Programa de Pós-Graduação em ...
    da Universidade Federal do Paraná,
    como requisito parcial para aprovação na disciplina de Metodologia.
  ],
  orientador: "Prof. Dr. Nome do Orientador",
  coorientador: "Profa. Dra. Nome da Coorientadora",
  rotulo-orientador: "Orientador",
  rotulo-coorientador: "Coorientadora",
  palavras-chave: ("UFPR", "ABNT", "Typst", "Normalização"),
  palavras-chave-en: ("UFPR", "ABNT", "Typst", "Standardization"),
)

#show: ufprcc.with(
  arquivo-bibliografia: "/examples/ufpr-template-geral.bib",
  titulo-bibliografia: "REFERÊNCIAS",
  usar-margens-espelhadas: true,
  usar-numeracao-verso: true,
  evitar-heading-orfao: true,
  usar-ponto-e-virgula-palavras-chave: true,
)

#registrar-sigla("UFPR", "Universidade Federal do Paraná")
#registrar-abreviacao("ABNT", "Associação Brasileira de Normas Técnicas")
#registrar-simbolo("α", "Coeficiente de ajuste")
#registrar-simbolo("β", "Parâmetro de calibração")

#resumo[
  Este documento apresenta um roteiro prático estruturado em padrão código-resultado
  para todos os principais recursos do pacote ufpr-abntyp: citações, figuras, quadros,
  tabelas, equações e referências cruzadas. Cada seção mostra o código seguido
  imediatamente pelo resultado visual.
]

#resumo-en[
  This document provides a practical code-result pattern guide for the main
  ufpr-abntyp resources: citations, figures, frames, tables, equations and
  cross-references. Each section shows the code followed immediately by
  visual result.
]

#lista-ilustracoes()
#lista-quadros()
#lista-tabelas()
#lista-siglas()
#lista-simbolos()

#sumario()

#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução

Este guia usa um padrão estruturado em cada seção: primeiro o código, depois
o resultado visual. Assim você pode copiar o código e entender imediatamente
como funciona observando o output.

O pacote #usar-sigla("UFPR")-abntyp automatiza a aplicação de normas #usar-sigla("ABNT")
para trabalhos acadêmicos. Todos os helpers apresentados aqui simplificam
formatação e referências cruzadas.

= Citações

As citações no pacote ufpr-abntyp suportam vários formatos. Esta seção demonstra
cada um com código seguido de resultado.

== Citação em prosa (forma "Autor, ano")

A função `cprosa()` insere uma citação no meio do texto com autor e ano.

*Código:*
```typst
Segundo #cprosa("silva2023"), a normalização é importante.
```

*Resultado:*

Segundo #cprosa("silva2023"), a normalização é importante.

== Citação parentética (forma "Autor, ano" entre parênteses)

Use a sintaxe `@chave` para citações que aparecem entre parênteses no fim da frase.

*Código:*
```typst
A normalização é um requisito para trabalhos acadêmicos @silva2023.
```

*Resultado:*

A normalização é um requisito para trabalhos acadêmicos @silva2023.

== Citação parentética com página

Para incluir página na citação, adicione entre colchetes.

*Código:*
```typst
@santos2022[, p. 45]
```

*Resultado:*

Conforme a norma @santos2022[, p. 45], deve-se seguir formatação específica.

== Citação longa (mais de 3 linhas) com texto direto

Citações diretas longas recebem formatação especial: recuo de 4 cm, tamanho 10,
espaçamento simples.

*Código:*
```typst
#citacao-longa(
  [A normalização e padronização de trabalhos acadêmicos são fundamentais
   para a consistência editorial, permitindo que os leitores naveguem o texto
   com clareza e precisão, estabelecendo critérios objetivos de avaliação.],
  autor: "Silva",
  ano: 2023,
  pagina: 87,
)
```

*Resultado:*

#citacao-longa(
  [A normalização e padronização de trabalhos acadêmicos são fundamentais
    para a consistência editorial, permitindo que os leitores naveguem o texto
    com clareza e precisão, estabelecendo critérios objetivos de avaliação.],
  autor: "Silva",
  ano: 2023,
  pagina: 87,
)

== Citação longa com referência bibliográfica (.bib)

Você também pode usar chave de referência bibliográfica em citações longas.

*Código:*
```typst
#citacao-longa(
  [A metodologia científica requer consistência e rigor na apresentação
   dos dados, garantindo a reprodutibilidade e transparência das pesquisas
   conduzidas em instituições acadêmicas de qualidade reconhecida.],
  chave: "oliveira2021",
  pagina: 92,
)
```

*Resultado:*

#citacao-longa(
  [A metodologia científica requer consistência e rigor na apresentação
    dos dados, garantindo a reprodutibilidade e transparência das pesquisas
    conduzidas em instituições acadêmicas de qualidade reconhecida.],
  chave: "oliveira2021",
  pagina: 92,
)

= Figuras

A função `figura()` insere imagens com título, fonte e referência cruzada automática.

== Figura com caminho relativo

*Código:*
```typst
#figura(
  "/src/institutions/ufpr/capaufpr.png",
  <fig-exemplo1>,
  "Logo institucional da UFPR",
  "O autor (2026)",
)

Referência: @fig-exemplo1
```

*Resultado:*

#figura(
  "/src/institutions/ufpr/capaufpr.png",
  <fig-exemplo1>,
  "Logo institucional da UFPR",
  "O autor (2026)",
)

Referência: @fig-exemplo1

== Figura com nota adicional

*Código:*
```typst
#figura(
  "/src/institutions/ufpr/capaufpr.png",
  <fig-exemplo2>,
  "Logo com nota de contexto",
  "O autor (2026)",
  nota-texto: "Imagem usada como fundo na capa do trabalho.",
  largura: 50%,
)
```

*Resultado:*

#figura(
  "/src/institutions/ufpr/capaufpr.png",
  <fig-exemplo2>,
  "Logo com nota de contexto",
  "O autor (2026)",
  nota-texto: "Imagem usada como fundo na capa do trabalho.",
  largura: 50%,
)

= Quadros

A função `quadro-simples()` formata quadros com moldura, títulos em negrito
e fonte/nota alinhadas à esquerda.

== Quadro de referência

*Código:*
```typst
#quadro-simples(
  (2fr, 4fr),
  <qua-ref>,
  "Prefixos de referência textual",
  (
    table.hline(stroke: 1pt),
    [*Elemento*], [*Prefixo*],
    table.hline(stroke: 0.6pt),
    [Figura], [fig-...],
    [Tabela], [tab-...],
    [Quadro], [qua-...],
    table.hline(stroke: 1pt),
  ),
  fonte-texto: "O autor (2026)",
)

Referência: @qua-ref
```

*Resultado:*

#quadro-simples(
  (2fr, 4fr),
  <qua-ref>,
  "Prefixos de referência textual",
  (
    table.hline(stroke: 1pt),
    [*Elemento*],
    [*Prefixo*],
    table.hline(stroke: 0.6pt),
    [Figura],
    [fig-...],
    [Tabela],
    [tab-...],
    [Quadro],
    [qua-...],
    table.hline(stroke: 1pt),
  ),
  fonte-texto: "O autor (2026)",
)

Referência: @qua-ref

== Quadro com nota

*Código:*
```typst
#quadro-simples(
  (1fr, 1fr, 1fr),
  <qua-notas>,
  "Status de validação",
  (
    table.hline(stroke: 1pt),
    [*Componente*], [*Status*], [*Observação*],
    table.hline(stroke: 0.6pt),
    [Capa], [✓], [Conforme],
    [Citações], [✓], [Todas as formas],
    table.hline(stroke: 1pt),
  ),
  fonte-texto: "O autor (2026)",
  nota-texto: "Checklist de componentes do pacote.",
)
```

*Resultado:*

#quadro-simples(
  (1fr, 1fr, 1fr),
  <qua-notas>,
  "Status de validação",
  (
    table.hline(stroke: 1pt),
    [*Componente*],
    [*Status*],
    [*Observação*],
    table.hline(stroke: 0.6pt),
    [Capa],
    [✓],
    [Conforme],
    [Citações],
    [✓],
    [Todas as formas],
    table.hline(stroke: 1pt),
  ),
  fonte-texto: "O autor (2026)",
  nota-texto: "Checklist de componentes do pacote.",
)

= Tabelas
A função `tabela()` agora suporta posicionamento (`left`/`center`),
`largura` e `legenda-texto`. A seguir: três testes práticos — tabela pequena
centralizada, tabela grande alinhada à esquerda, e tabela longa multipágina com
repete de cabeçalho.

== Tabela pequena (centralizada)

*Código:*
```typst
#tabela(
  (1fr, 1fr),
  <tab-pequena>,
  "Exemplo de tabela pequena",
  (
    table.hline(stroke: 1.5pt),
    [*Item*], [*Valor*],
    table.hline(stroke: 0.75pt),
    [A], [1],
    [B], [2],
    table.hline(stroke: 1.5pt),
  ),
  fonte-texto: "O autor (2026)",
  largura: 40%,
  posicionamento: "center",
  legenda-texto: "Tabela pequena centralizada",
)
```

*Resultado:*

#tabela(
  (1fr, 1fr),
  <tab-pequena>,
  "Exemplo de tabela pequena",
  (
    table.hline(stroke: 1.5pt),
    [*Item*],
    [*Valor*],
    table.hline(stroke: 0.75pt),
    [A],
    [1],
    [B],
    [2],
    table.hline(stroke: 1.5pt),
  ),
  fonte-texto: "O autor (2026)",
  largura: 40%,
  posicionamento: "center",
  legenda-texto: "Tabela pequena centralizada",
)

== Tabela grande (alinhada à esquerda)

*Código:*
```typst
#tabela(
  (3fr, 2fr, 3fr),
  <tab-grande>,
  "Tabela de demonstração grande",
  (
    table.hline(stroke: 1.5pt),
    [*Coluna A*], [*Coluna B*], [*Coluna C*],
    table.hline(stroke: 0.75pt),
    [Linha 1A], [1B], [1C],
    [Linha 2A], [2B], [2C],
    [Linha 3A], [3B], [3C],
    table.hline(stroke: 1.5pt),
  ),
  fonte-texto: "O autor (2026)",
  largura: 100%,
  posicionamento: "left",
)
```

*Resultado:*

#tabela(
  (3fr, 2fr, 3fr),
  <tab-grande>,
  "Tabela de demonstração grande",
  (
    table.hline(stroke: 1.5pt),
    [*Coluna A*],
    [*Coluna B*],
    [*Coluna C*],
    table.hline(stroke: 0.75pt),
    [Linha 1A],
    [1B],
    [1C],
    [Linha 2A],
    [2B],
    [2C],
    [Linha 3A],
    [3B],
    [3C],
    table.hline(stroke: 1.5pt),
  ),
  fonte-texto: "O autor (2026)",
  largura: 100%,
  posicionamento: "left",
)

== Tabela longa (multipágina com cabeçalho repetido)

*Código:*
```typst
#tabela(
  (2fr, 1fr, 2fr),
  <tab-multipag>,
  "Tabela longa de exemplo",
  (
    table.hline(stroke: 1pt),
    // 80 linhas de dados para testar quebra de página e repetição de cabeçalho
    [Registro 1], [100], [Obs 1],
    [Registro 2], [101], [Obs 2],
    // ... (continua até 80)
    [Registro 80], [179], [Obs 80],
    table.hline(stroke: 1pt),
  ),
  head: (
    [*Registro*], [*Valor*], [*Observação*],
    table.hline(stroke: 0.75pt),
  ),
  fonte-texto: "IBGE (1993)",
  largura: 100%,
  posicionamento: "left",
)
```

#tabela(
  (2fr, 1fr, 2fr),
  <tab-multipag>,
  "Tabela longa de exemplo",
  (
    [Registro 1],
    [100],
    [Obs 1],
    [Registro 2],
    [101],
    [Obs 2],
    [Registro 3],
    [102],
    [Obs 3],
    [Registro 4],
    [103],
    [Obs 4],
    [Registro 5],
    [104],
    [Obs 5],
    [Registro 6],
    [105],
    [Obs 6],
    [Registro 7],
    [106],
    [Obs 7],
    [Registro 8],
    [107],
    [Obs 8],
    [Registro 9],
    [108],
    [Obs 9],
    [Registro 10],
    [109],
    [Obs 10],
    [Registro 11],
    [110],
    [Obs 11],
    [Registro 12],
    [111],
    [Obs 12],
    [Registro 13],
    [112],
    [Obs 13],
    [Registro 14],
    [113],
    [Obs 14],
    [Registro 15],
    [114],
    [Obs 15],
    [Registro 16],
    [115],
    [Obs 16],
    [Registro 17],
    [116],
    [Obs 17],
    [Registro 18],
    [117],
    [Obs 18],
    [Registro 19],
    [118],
    [Obs 19],
    [Registro 20],
    [119],
    [Obs 20],
    [Registro 21],
    [120],
    [Obs 21],
    [Registro 22],
    [121],
    [Obs 22],
    [Registro 23],
    [122],
    [Obs 23],
    [Registro 24],
    [123],
    [Obs 24],
    [Registro 25],
    [124],
    [Obs 25],
    [Registro 26],
    [125],
    [Obs 26],
    [Registro 27],
    [126],
    [Obs 27],
    [Registro 28],
    [127],
    [Obs 28],
    [Registro 29],
    [128],
    [Obs 29],
    [Registro 30],
    [129],
    [Obs 30],
    [Registro 31],
    [130],
    [Obs 31],
    [Registro 32],
    [131],
    [Obs 32],
    [Registro 33],
    [132],
    [Obs 33],
    [Registro 34],
    [133],
    [Obs 34],
    [Registro 35],
    [134],
    [Obs 35],
    [Registro 36],
    [135],
    [Obs 36],
    [Registro 37],
    [136],
    [Obs 37],
    [Registro 38],
    [137],
    [Obs 38],
    [Registro 39],
    [138],
    [Obs 39],
    [Registro 40],
    [139],
    [Obs 40],
    [Registro 41],
    [140],
    [Obs 41],
    [Registro 42],
    [141],
    [Obs 42],
    [Registro 43],
    [142],
    [Obs 43],
    [Registro 44],
    [143],
    [Obs 44],
    [Registro 45],
    [144],
    [Obs 45],
    [Registro 46],
    [145],
    [Obs 46],
    [Registro 47],
    [146],
    [Obs 47],
    [Registro 48],
    [147],
    [Obs 48],
    [Registro 49],
    [148],
    [Obs 49],
    [Registro 50],
    [149],
    [Obs 50],
    [Registro 51],
    [150],
    [Obs 51],
    [Registro 52],
    [151],
    [Obs 52],
    [Registro 53],
    [152],
    [Obs 53],
    [Registro 54],
    [153],
    [Obs 54],
    [Registro 55],
    [154],
    [Obs 55],
    [Registro 56],
    [155],
    [Obs 56],
    [Registro 57],
    [156],
    [Obs 57],
    [Registro 58],
    [157],
    [Obs 58],
    [Registro 59],
    [158],
    [Obs 59],
    [Registro 60],
    [159],
    [Obs 60],
    [Registro 61],
    [160],
    [Obs 61],
    [Registro 62],
    [161],
    [Obs 62],
    [Registro 63],
    [162],
    [Obs 63],
    [Registro 64],
    [163],
    [Obs 64],
    [Registro 65],
    [164],
    [Obs 65],
    [Registro 66],
    [165],
    [Obs 66],
    [Registro 67],
    [166],
    [Obs 67],
    [Registro 68],
    [167],
    [Obs 68],
    [Registro 69],
    [168],
    [Obs 69],
    [Registro 70],
    [169],
    [Obs 70],
    [Registro 71],
    [170],
    [Obs 71],
    [Registro 72],
    [171],
    [Obs 72],
    [Registro 73],
    [172],
    [Obs 73],
    [Registro 74],
    [173],
    [Obs 74],
    [Registro 75],
    [174],
    [Obs 75],
    [Registro 76],
    [175],
    [Obs 76],
    [Registro 77],
    [176],
    [Obs 77],
    [Registro 78],
    [177],
    [Obs 78],
    [Registro 79],
    [178],
    [Obs 79],
    [Registro 80],
    [179],
    [Obs 80],
    table.hline(stroke: 1pt),
  ),
  head: (
    [*Registro*],
    [*Valor*],
    [*Observação*],
    table.hline(stroke: 0.75pt),
  ),
  fonte-texto: "IBGE (1993)",
  largura: 100%,
  posicionamento: "left",
)

= Equações

A função `equacao()` numera equações automaticamente e permite referência cruzada.

== Equação em bloco

*Código:*
```typst
A famosa fórmula de Einstein é:

#equacao(
  <eq-einstein>,
  [$E = m c^2$],
)

Referência: @eq-einstein na página #ref(<eq-einstein>, form: "page").
```

*Resultado:*

A famosa fórmula de Einstein é:

#equacao(
  <eq-einstein>,
  [$E = m c^2$],
)

Referência: @eq-einstein na página #ref(<eq-einstein>, form: "page").

== Equação complexa

*Código:*
```typst
A integral gaussiana é:

#equacao(
  <eq-gauss>,
  [$integral_{-infinity}^{infinity} e^{-x^2} d x = sqrt(pi)$],
)
```

*Resultado:*

A integral gaussiana é:

#equacao(
  <eq-gauss>,
  [$integral_{-infinity}^{infinity} e^{-x^2} d x = sqrt(pi)$],
)

= Referências cruzadas

O Typst permite referenciar qualquer elemento etiquetado com `<label>`.

== Usando referências

*Código:*
```typst
Veja a Figura <fig-exemplo1>, o Quadro <qua-ref> e a Tabela <tab-grande>.

Referência por página: página #ref(<eq-einstein>, form: "page").
```

*Resultado:*

Veja a Figura, o Quadro e a Tabela.

Referência por página: #ref(<eq-einstein>, form: "page").

= Conclusão

Este template demonstra todos os recursos principais do pacote ufpr-abntyp
seguindo o padrão código-resultado. Copie o código de cada seção e adapte
para seu trabalho.

As funções helpers automatizam:
- Formatação de citações curtas, parentéticas e longas
- Inserção de figuras com fonte e referência
- Criação de tabelas e quadros com regras #usar-sigla("ABNT")
- Numeração automática de equações
- Referências cruzadas por página e conteúdo

#heading(level: 1, numbering: none, "APÊNDICE A - CHECKLIST RÁPIDO") <app-checklist>

- #lorem(5) com `#cprosa()` para prosa
- #lorem(5) com `@chave` para parentética
- Figura inserida com `#figura()`
- Quadro formatado com `#quadro-simples()`
- Tabela formatada com `#tabela()`
- Equação numerada com `#equacao()`
- Citação longa com `#citacao-longa()`
- Referências cruzadas validadas

#heading(level: 1, numbering: none, "ANEXO A - SINTAXE RÁPIDA") <anx-sintaxe>

*Citações:*
- Prosa: `#cprosa("chave")`
- Parentética: `@chave`
- Longa direto: `#citacao-longa([texto], autor: "X", ano: Y, pagina: Z)`
- Longa com .bib: `#citacao-longa([texto], chave: "xyz", pagina: Z)`

*Elementos:*
- `#figura(caminho, <label>, "título", "fonte")`
- `#tabela(cols, <label>, "título", (corpo), fonte-texto: "...")`
- `#quadro-simples(cols, <label>, "título", (corpo), fonte-texto: "...")`
- `#equacao(<label>, [$math$])`
