// Exemplo UFPR de relatório técnico/científico

#import "../lib.typ": *

// Metadados do relatório: base para capa, folha de rosto e resumo.
#show: dados-ufpr.with(
  titulo: "Relatório técnico institucional",
  autor: "Nome do Autor",
  faculdade: "Setor de Ciências Exatas",
  programa: "Programa/Curso",
  local: "Curitiba",
  ano: 2026,
  natureza: "Relatório técnico apresentado à Universidade Federal do Paraná",
  objetivo: "para fins de registro institucional.",
)

// Preset de relatório com capa UFPR e folha de rosto padronizada.
#show: ufpr-relatorio.with(
  titulo: "Relatório técnico institucional",
  instituicao: "Universidade Federal do Paraná",
  autores: ("Nome do Autor",),
  local: "Curitiba",
  ano: 2026,
  usar-fundo-capa: true,
)

// Resumo obrigatório no relatório.
#resumo[
  Resumo do relatório em parágrafo único.
]

// Sumário do relatório.
#sumario()

// Início da numeração arábica.
#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução

Texto de exemplo.

= Desenvolvimento

Texto de exemplo.

= Considerações finais

Texto de exemplo.

// Referências ao final do relatório.
#heading(level: 1, numbering: none, "REFERÊNCIAS")

SOBRENOME, Nome. *Título*. Curitiba: Editora, 2026.
