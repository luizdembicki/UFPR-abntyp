// Exemplo mínimo de TCC com camada institucional UFPR

#import "../lib.typ": *

// Metadados institucionais que alimentam a capa e a folha de rosto.
#show: dados-ufpr.with(
  titulo: "Título do trabalho",
  subtitulo: [Subtítulo opcional],
  autor: "Nome do Autor",
  faculdade: "Setor de Ciências Exatas",
  programa: "Programa/Curso",
  local: "Curitiba",
  ano: 2026,
  natureza: "Trabalho de Conclusão de Curso apresentado ao curso ...",
  objetivo: "como requisito parcial para obtenção do grau ...",
  orientador: "Prof. Dr. Nome do Orientador",
  palavras-chave: ("Palavra 1", "Palavra 2", "Palavra 3"),
  palavras-chave-en: ("Keyword 1", "Keyword 2", "Keyword 3"),
)

// Preset acadêmico UFPR com fundo de capa institucional.
#show: ufprcc.with(
  fonte: "Times New Roman",
  // O fundo usa automaticamente src/institutions/ufpr/capaufpr.png
  usar-fundo-capa: true,
  // Margens do fundo (em volta da imagem de capa):
  // fundo-margem-superior-capa: 0.6cm,
  // fundo-margem-inferior-capa: 0.6cm,
  // fundo-margem-esquerda-capa: 0.6cm,
  // fundo-margem-direita-capa: 0.6cm,
  // Posição vertical do conteúdo da capa:
  // espaco-instituicao-autor-capa: 0.5fr,
  // espaco-autor-titulo-capa: 0.75fr,
  // espaco-titulo-rodape-capa: 1.7fr,
  // Para suprimir o fundo institucional, use:
  // usar-fundo-capa: false,
)

// Resumo e abstract usados para validar a estrutura pré-textual.
#resumo[
  Resumo do trabalho em parágrafo único.
]
#resumo-en[
  Abstract in one paragraph.
]
#resumo-en[
  Abstract in one paragraph.
]

// Sumário automático do TCC.
#sumario()

// Paginação textual da parte principal.
#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução

Conteúdo de exemplo.

// Referências ao final do TCC.
#heading(level: 1, numbering: none, "REFERÊNCIAS")

SOBRENOME, Nome. *Título*. Curitiba: Editora, 2026.
