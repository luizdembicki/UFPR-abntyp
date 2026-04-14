// Exemplo mínimo de TESE com camada institucional UFPR

#import "../lib.typ": *

#show: dados-ufpr.with(
  titulo: "Título da tese",
  subtitulo: [Subtítulo opcional],
  autor: "Nome do Autor",
  faculdade: "Setor de Ciências Exatas",
  programa: "Programa de Pós-Graduação em ...",
  local: "Curitiba",
  ano: 2026,
  natureza: "Tese apresentada ao Programa de Pós-Graduação em ... da Universidade Federal do Paraná",
  objetivo: "como requisito parcial para obtenção do título de Doutor.",
  orientador: "Prof. Dr. Nome do Orientador",
  palavras-chave: ("Palavra 1", "Palavra 2", "Palavra 3"),
  palavras-chave-en: ("Keyword 1", "Keyword 2", "Keyword 3"),
)

#show: ufprcc.with(
  usar-fundo-capa: true,
)

#resumo[
  Resumo da tese em parágrafo único.
]

#resumo-en[
  Abstract in one paragraph.
]

#sumario()

#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução

Conteúdo de exemplo.

#heading(level: 1, numbering: none, "REFERÊNCIAS")

SOBRENOME, Nome. *Título*. Curitiba: Editora, 2026.
