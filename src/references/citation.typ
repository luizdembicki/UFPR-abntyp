// Sistema de citacoes e referencias conforme NBR 6023:2018 e NBR 10520:2023
//
// ============================================================================
// SISTEMAS DE CHAMADA (NBR 10520:2023, secao 4)
// ============================================================================
//
// A NBR 10520:2023 permite dois sistemas de chamada para citacoes:
//
// 1. SISTEMA AUTOR-DATA (este arquivo)
//    - Formato: (Autor, ano) ou (Autor, ano, p. X)
//    - Mais comum em trabalhos academicos no Brasil
//    - Pode ser usado com notas de rodape
//
// 2. SISTEMA NUMERICO (ver numeric.typ)
//    - Formato: (1) ou (1, p. X) ou sobrescrito
//    - Permitido pela norma, inspirado no abntex2-num.bst
//    - NAO pode ser usado com notas de rodape
//
// Escolha UM sistema e use consistentemente em todo o trabalho.
//
// ============================================================================

// Este modulo fornece funcoes auxiliares para o sistema AUTOR-DATA
// Para referências completas, usar arquivo .bib com estilo CSL ABNT
// Para sistema numerico, ver: numeric.typ

/// Formata citação autor-data
/// - autor: sobrenome do autor (string)
/// - ano: ano da publicação (int ou string)
/// - pagina: página (int ou string, opcional)
#let citar(autor, ano, pagina: none) = {
  [(#upper(autor), #ano#if pagina != none [, p. #pagina])]
}

/// Citação com autor no texto
/// "Segundo Silva (2023)..."
/// - ano: int ou string
#let citar-autor(autor, ano) = {
  [#autor (#ano)]
}

/// Citação em prosa baseada em chave bibliográfica.
/// Produz saída no fluxo do texto, como "Silva (2024)".
#let citar-prosa(chave) = {
  [#cite(label(chave), form: "prose")]
}

/// Citação indireta (parafraseada)
/// Apenas menciona o autor e ano
#let citar-indireto(autor, ano) = {
  [(#upper(autor), #ano)]
}

/// Citação de citação (apud)
/// Autor original apud autor da obra consultada
/// - anos: int ou string
/// - pagina: int ou string (opcional)
#let citar-apud(
  autor-original,
  ano-original,
  autor-secundario,
  ano-secundario,
  pagina: none,
) = {
  [(#upper(autor-original), #ano-original apud #upper(autor-secundario), #ano-secundario#if pagina != none [, p. #pagina])]
}

/// Citação com múltiplos autores (até 3)
#let citar-multiplos(autores, ano, pagina: none) = {
  let formatted = autores.map(a => upper(a)).join("; ")
  [(#formatted, #ano#if pagina != none [, p. #pagina])]
}

/// Citação com mais de 3 autores (et al.)
#let citar-etal(primeiro-autor, ano, pagina: none) = {
  [(#upper(primeiro-autor) et al., #ano#if pagina != none [, p. #pagina])]
}

/// Citação de entidade coletiva
#let citar-entidade(entidade, ano, pagina: none) = {
  [(#upper(entidade), #ano#if pagina != none [, p. #pagina])]
}

/// Citação de obra sem autoria
#let citar-titulo(titulo, ano, pagina: none) = {
  [(#upper(titulo), #ano#if pagina != none [, p. #pagina])]
}

/// Título da seção de referências
#let referencias-titulo() = {
  heading(level: 1, numbering: none, "REFERÊNCIAS")
}

// Funções para formatação manual de referências
// (usar quando não for possível usar .bib)

/// Formata referência de livro
#let ref-livro(
  autor: none,
  titulo: none,
  subtitulo: none,
  edicao: none,
  local: none,
  editora: none,
  ano: none,
) = {
  set par(
    hanging-indent: 1.25cm,
    first-line-indent: 0pt,
  )

  if autor != none {
    upper(autor)
    [. ]
  }
  if titulo != none { strong(titulo) }
  if subtitulo != none { [: #subtitulo] }
  [. ]
  if edicao != none { [#edicao. ed. ] }
  if local != none { [#local: ] }
  if editora != none { editora }
  if ano != none { [, #ano.] }
}

/// Formata referência de artigo de periódico
#let ref-artigo(
  autor: none,
  titulo: none,
  revista: none,
  local: none,
  volume: none,
  numero: none,
  paginas: none,
  mes: none,
  ano: none,
) = {
  set par(
    hanging-indent: 1.25cm,
    first-line-indent: 0pt,
  )

  if autor != none {
    upper(autor)
    [. ]
  }
  if titulo != none { [#titulo. ] }
  if revista != none { strong(revista) }
  if local != none { [, #local] }
  if volume != none { [, v. #volume] }
  if numero != none { [, n. #numero] }
  if paginas != none { [, p. #paginas] }
  if mes != none { [, #mes] }
  if ano != none { [. #ano.] }
}

/// Formata referência de documento eletrônico
#let ref-online(
  autor: none,
  titulo: none,
  site: none,
  ano: none,
  url: none,
  data-acesso: none,
) = {
  set par(
    hanging-indent: 1.25cm,
    first-line-indent: 0pt,
  )

  if autor != none {
    upper(autor)
    [. ]
  }
  if titulo != none {
    strong(titulo)
    [. ]
  }
  if site != none { [#site, ] }
  if ano != none { ano }
  [. ]
  if url != none { [Disponível em: #url. ] }
  if data-acesso != none { [Acesso em: #data-acesso.] }
}

/// Citação longa (mais de 3 linhas) conforme NBR 8.3.1.2
/// Pode ser usada de duas formas:
/// 1. Com texto direto: #citacao-longa([texto...], autor: "Silva", ano: 2023, pagina: 45)
/// 2. Com chave .bib: #citacao-longa([texto...], chave: "silva2023", pagina: 45)
///
/// Características:
/// - Parágrafo distinto (separado por linhas em branco)
/// - Recuo de 4 cm da margem esquerda
/// - Sem aspas
/// - Tamanho 10 e espaçamento simples
/// - Página obrigatória
/// - Ponto final após citação e após autoria
#let citacao-longa(
  texto,
  autor: none,
  ano: none,
  chave: none,
  pagina: none,
) = {
  set text(size: 10pt)

  block(
    width: 100%,
    inset: (left: 4cm, right: 0pt),
  )[
    #set par(leading: 0.6em, spacing: 0pt)
    #texto
  ]

  let autoria = if chave != none {
    [#cite(label(chave))]
  } else if autor != none and ano != none {
    [#upper(autor), #ano]
  } else {
    []
  }

  let pag-text = if pagina != none {
    [, p. #pagina.]
  } else {
    [.]
  }

  align(left)[
    #h(4cm) – #autoria#pag-text
  ]
}

// Aliases curtos
#let cautor = citar-autor
#let cprosa = citar-prosa
#let cindireto = citar-indireto
#let capud = citar-apud
#let cmultiplos = citar-multiplos
#let cetal = citar-etal
#let centidade = citar-entidade
#let ctitulo = citar-titulo
#let ref-titulo = referencias-titulo
#let clonga = citacao-longa
