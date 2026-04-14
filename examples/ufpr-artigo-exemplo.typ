// Exemplo UFPR de artigo científico

#import "../lib.typ": *

#show: ufpr-artigo.with(
  titulo: "Modelo de artigo com padronização UFPR",
  autores: (
    (name: "Nome Sobrenome", affiliation: "Universidade Federal do Paraná"),
  ),
  resumo: [Resumo do artigo em parágrafo único.],
  palavras-chave: ("UFPR", "ABNT", "Typst"),
  resumo-en: [Abstract in one paragraph.],
  palavras-chave-en: ("UFPR", "ABNT", "Typst"),
)

= Introdução

Texto de exemplo.

= Desenvolvimento

Texto de exemplo.

= Conclusão

Texto de exemplo.

#heading(level: 1, numbering: none, "REFERÊNCIAS")

SOBRENOME, Nome. *Título*. Curitiba: Editora, 2026.
