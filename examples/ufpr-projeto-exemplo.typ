// Exemplo UFPR de projeto de pesquisa

#import "../lib.typ": *

#show: dados-ufpr.with(
  titulo: "Projeto de pesquisa com padronização UFPR",
  autor: "Nome do Autor",
  faculdade: "Setor de Ciências Exatas",
  programa: "Programa/Curso",
  local: "Curitiba",
  ano: 2026,
  natureza: "Projeto de pesquisa apresentado à Universidade Federal do Paraná",
  objetivo: "como requisito acadêmico.",
)

#show: ufpr-projeto.with(
  titulo: "Projeto de pesquisa com padronização UFPR",
  autor: "Nome do Autor",
  instituicao: "Universidade Federal do Paraná",
  local: "Curitiba",
  ano: 2026,
  usar-fundo-capa: true,
)

#sumario()

#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução

Texto de exemplo.

= Objetivos

Texto de exemplo.

= Metodologia

Texto de exemplo.

= Cronograma

Texto de exemplo.

#heading(level: 1, numbering: none, "REFERÊNCIAS")

SOBRENOME, Nome. *Título*. Curitiba: Editora, 2026.
