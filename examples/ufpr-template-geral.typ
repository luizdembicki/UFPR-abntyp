// Template geral UFPR para Typst

#import "../lib.typ": *

// Metadados do trabalho: alimentam capa, folha de rosto e informações institucionais.
#show: dados-ufpr.with(
  titulo: "Template geral de uso do pacote ufpr-abntyp",
  subtitulo: [Exemplo guiado com os principais elementos acadêmicos],
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

// Preset UFPR principal: aplica capa, folhade rosto, bibliografia e opções de formatação.
#show: ufprcc.with(
  arquivo-bibliografia: "/examples/ufpr-template-geral.bib",
  titulo-bibliografia: "REFERÊNCIAS",
  usar-margens-espelhadas: true,
  usar-numeracao-verso: true,
  evitar-heading-orfao: true,
  usar-ponto-e-virgula-palavras-chave: true,
)

// Registros para listas automáticas e uso expandido na primeira ocorrência.
#registrar-sigla("UFPR", "Universidade Federal do Paraná")
#registrar-abreviacao("ABNT", "Associação Brasileira de Normas Técnicas")
#registrar-simbolo("α", "Coeficiente de ajuste")
#registrar-simbolo("β", "Parâmetro de calibração")

// Resumo em português com palavras-chave definidas nos metadados.
#resumo[
  Este documento apresenta um roteiro prático para validar os principais
  recursos do pacote ufpr-abntyp: capa institucional, folha de rosto,
  citações, figuras, equações, quadros, tabelas, gráfico, referências cruzadas,
  apêndice, anexo e referências finais.
]

// Abstract em inglês com a mesma estrutura do resumo principal.
#resumo-en[
  This document provides a practical guide to validate the main ufpr-abntyp
  features: institutional cover, title page, citations, figures, equations,
  frames, tables, chart, cross-references, appendix, annex and references.
]

// Listas pré-textuais geradas automaticamente a partir do conteúdo do documento.
#lista-ilustracoes()
#lista-quadros()
#lista-tabelas()
#lista-siglas()
#lista-simbolos()

// Sumário com hierarquia do trabalho.
#sumario()

// Início da parte textual: ativa paginação arábica para referências por página.
#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução

Este tutorial foi organizado para funcionar como documento de referência rápida
na configuração de trabalhos acadêmicos da #usar-sigla("UFPR").

Segundo @silva2023, a padronização textual melhora a
consistência editorial e a avaliação acadêmica.

Neste modelo, as regras da #usar-sigla("ABNT") já são aplicadas de forma
automática pelo preset institucional.

= Revisão Teórica

Este capítulo apresenta a fundamentação teórica e exemplos de uso dos elementos
do pacote, organizados em seções e subseções até o nível 2.1.1.1 para
demonstrar a formatação progressiva conforme NBR 6024:2012.

== Modelo

Nesta subseção são apresentados os modelos de elementos gráficos e suas
variações.

=== Modelo simplificado

O modelo simplificado cobre os casos de uso mais frequentes.

==== Modelo simplificado com figuras

A Figura @fig-fachada demonstra a imagem institucional.

#figura(
  "/src/institutions/ufpr/capaufpr.png",
  <fig-fachada>,
  "Fachada institucional utilizada no fundo da capa",
  "O autor (2026)",
)

==== Modelo detalhado

A subseção 2.1.1.1 deve aparecer no sumário com numeração e texto em estilo
regular, sem itálico.

===== Modelo simplificadíssimo

Este nível continua disponível para cenários mais profundos, mas não precisa
aparecer no sumário desta validação.

= Expressões matemáticas

Existem duas formas de expressar relações matemáticas: em linha (inline) e em
bloco.

A equação mais famosa da física é dada por #usar-sigla("ABNT"):

#equacao(
  <eq-einstein>,
  [$E = m c^2$],
)

// Referência cruzada por página da equação numerada.
Referência ao resultado: vide @eq-einstein na #ref(<eq-einstein>, form: "page").

Uma equação mais complexa pode ser descrita como:

#equacao(
  <eq-complexa>,
  [$integral_0^infinity e^{-x^2} d x = frac(sqrt(pi), 2)$],
)

= Utilização do template

Nesta seção são apresentados exemplos práticos equivalentes ao uso cotidiano do
pacote: inserção de figura, quadro, tabela e gráfico com referências cruzadas.

== Figuras

A Figura @fig-figura2 é um exemplo de elemento ilustrativo de teste.

#figura(
  "/src/institutions/ufpr/capaufpr.png",
  <fig-figura2>,
  "Exemplo adicional de imagem institucional",
  "O autor (2026)",
  nota-texto: "Esta é uma figura de teste para validação.",
  largura: 60%,
)

// Quadro didático com moldura e fonte/nota.
== Quadros

O Quadro @qua-prefixos resume convenções de identificação textual.

#quadro-simples(
  (2fr, 4fr),
  <qua-prefixos>,
  "Prefixos de referência textual",
  (
    table.hline(stroke: 1pt),
    [*Elemento*],
    [*Prefixo recomendado*],
    table.hline(stroke: 0.6pt),
    [Figura],
    [fig-...],
    [Tabela],
    [tab-...],
    [Quadro],
    [qua-...],
    [Apêndice],
    [app-...],
    [Anexo],
    [anx-...],
    table.hline(stroke: 1pt),
  ),
  fonte-texto: "O autor (2026)",
  nota-texto: "Exemplo didático para validação.",
)

// Tabela com título, corpo e nota de rodapé textual.
== Tabelas

A Tabela @tab-validacao usa alinhamento automático à margem esquerda com texto
justificado.

#tabela-simples(
  (3fr, 2fr, 3fr),
  <tab-validacao>,
  "Critérios de validação do pacote",
  (
    table.hline(stroke: 1.5pt),
    [*Critério*],
    [*Status*],
    [*Observação*],
    table.hline(stroke: 0.75pt),
    [Capa UFPR em fundo full-page],
    [Conforme],
    [Imagem institucional por padrão],
    [Folha de rosto editável],
    [Conforme],
    [Texto de apresentação definido no arquivo],
    [Citações ABNT],
    [Conforme],
    [Exemplos de curta, longa e indireta],
    [Elementos pós-textuais],
    [Conforme],
    [Apêndice e anexo com letras],
    table.hline(stroke: 1.5pt),
  ),
  fonte-texto: "O autor (2026)",
  nota-texto: "Status de referência para testes manuais.",
)

// Gráfico em bloco para validar legenda, fonte e referência cruzada.
== Gráfico

A Figura @fig-grafico mostra um gráfico simples para validar título, fonte,
nota e referência cruzada.

#grafico-simples(
  <fig-grafico>,
  "Distribuição simulada de resultados de validação",
  [
    #box(width: 18cm, height: 8cm, stroke: 0.5pt, inset: 0.4cm)[
      #set text(size: 9pt)
      #v(0.2cm)
      #align(left)[
        #box(width: 2cm, height: 0.6cm, fill: rgb("7AA6FF"))[]
        #h(0.5cm)
        Resultado A
      ]
      #v(0.3cm)
      #align(left)[
        #box(width: 3.5cm, height: 0.6cm, fill: rgb("4C87FF"))[]
        #h(0.5cm)
        Resultado B
      ]
      #v(0.3cm)
      #align(left)[
        #box(width: 5cm, height: 0.6cm, fill: rgb("1E5EFF"))[]
        #h(0.5cm)
        Resultado C
      ]
      #v(0.3cm)
      #align(left)[
        #box(width: 6.5cm, height: 0.6cm, fill: rgb("173D8F"))[]
        #h(0.5cm)
        Resultado D
      ]
    ]
  ],
  "O autor (2026).",
  nota-texto: "Escala visual apenas demonstrativa.",
)

= Referências cruzadas no texto

Exemplos de referência usados neste documento:

- Figura institucional: @fig-fachada.
- Figura adicional: @fig-figura2.
- Quadro de prefixos: @qua-prefixos.
- Tabela de critérios: @tab-validacao.
- Gráfico de resultados: @fig-grafico.
- Equação de Einstein: @eq-einstein.
- Equação complexa: @eq-complexa.

= Discussão

A estrutura acima cobre os pontos de uso mais recorrentes no fluxo acadêmico:
composição dos elementos pré-textuais, demonstração de conteúdo textual com
hierarquia profunda de seções (até 2.1.1.1), exemplos de equações matemáticas,
e organização pós-textual.

As funções helpers (`figura`, `tabela-simples`, `quadro-simples`, `equacao`)
simplificam o uso do pacote, eliminando necessidade de ajustes manuais de
formatação.

Este cenário segue as boas práticas discutidas por @santos2022 e
@oliveira2021.

= Conclusão

A execução deste tutorial confirma o uso do pacote em um cenário completo e
permite comparar rapidamente o resultado com o padrão esperado pela #usar-sigla("UFPR").

// Apêndice A: itens de checagem rápida do template geral.
#heading(level: 1, numbering: none, "APÊNDICE A - CHECKLIST DE VALIDAÇÃO") <app-a>

- verificar capa com fundo em página inteira;
- verificar folha de rosto com texto de apresentação editável;
- verificar citações diretas, indiretas e longa;
- verificar figuras com novo helper;
- verificar tabelas com novo helper e alinhamento FONTE/NOTA à esquerda;
- verificar quadros com novo helper;
- verificar equações numeradas;
- verificar referências cruzadas;
- verificar alinhamento de hierarquia até 2.1.1.1;
- verificar elementos pós-textuais no sumário.

Referência ao Apêndice A: página #ref(<app-a>, form: "page").

// Anexo A: resumo sintético dos critérios usados no template geral.
#heading(level: 1, numbering: none, "ANEXO A - RESUMO DE CRITÉRIOS INSTITUCIONAIS") <anx-a>

- Títulos de figuras e quadros acima do elemento;
- Fonte abaixo do elemento, alinhada à esquerda;
- Tabelas alinhadas à esquerda com conteúdo justificado;
- FONTE e NOTA de tabelas alinhadas à margem esquerda real;
- Folha de rosto com bloco de apresentação editável;
- Apêndice e anexo identificados por letras;
- Equipações numeradas com referência cruzada;
- Funções helpers para uso simplificado.

Referência ao Anexo A: página #ref(<anx-a>, form: "page").


