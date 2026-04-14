// Exemplo mínimo de DISSERTAÇÃO com camada institucional UFPR

#import "../lib.typ": *

#show: dados-ufpr.with(
  titulo: "Título da dissertação",
  subtitulo: [Subtítulo opcional],
  autor: "Nome do Autor",
  faculdade: "Setor de Ciências Exatas",
  programa: "Programa de Pós-Graduação em ...",
  local: "Curitiba",
  ano: 2026,
  natureza: "Dissertação apresentada ao Programa de Pós-Graduação em ... da Universidade Federal do Paraná",
  objetivo: "como requisito parcial para obtenção do título de Mestre.",
  orientador: "Prof. Dr. Nome do Orientador",
  palavras-chave: ("Palavra 1", "Palavra 2", "Palavra 3"),
  palavras-chave-en: ("Keyword 1", "Keyword 2", "Keyword 3"),
)

#show: ufprcc.with(
  usar-fundo-capa: true,
)

#resumo[
  Resumo da dissertação em parágrafo único.
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
