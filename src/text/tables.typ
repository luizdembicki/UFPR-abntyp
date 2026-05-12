// Tabelas conforme IBGE e NBR 14724:2024

/// ============================================================================
/// Funcoes genericas para formatacao de conteudo tabelado
/// ============================================================================

/// Emite caption formatado conforme ABNT (10pt, maiuscula)
#let caption-tabular(titulo, numero, kind: "tabela") = [
  #set text(size: 10pt)
  #upper(kind) #numero - #upper(titulo)
]

/// Emite bloco de fonte (alinhado)
#let footer-fonte(texto, alinhamento: left) = [
  #set par(first-line-indent: 0pt)
  #align(alinhamento)[
    #set par(justify: true)
    #text(size: 10pt)[FONTE: #texto]
  ]
]

/// Emite bloco de nota (alinhado)
#let footer-nota(texto, alinhamento: left) = [
  #set par(first-line-indent: 0pt)
  #align(alinhamento)[
    #set par(justify: true)
    #text(size: 10pt)[NOTA: #texto]
  ]
]

/// Emite bloco de legenda (alinhado)
#let footer-legenda(texto, alinhamento: left) = [
  #set par(first-line-indent: 0pt)
  #align(alinhamento)[
    #set par(justify: true)
    #text(size: 10pt)[LEGENDA: #texto]
  ]
]

/// ============================================================================
/// Tabela: wrapper simples com comportamento ABNT/IBGE
/// ============================================================================

#let tabela(
  columns,
  rotulo,
  titulo,
  corpo-tabela,
  fonte-texto: none,
  nota-texto: none,
  legenda-texto: none,
  largura: auto,
  posicionamento: auto,
  head: none,
) = {
  let is_full_width = largura == auto or repr(largura).contains("100%")
  let is_small_width = largura != auto and largura < 65%

  let should_center = if posicionamento != auto {
    posicionamento == "center"
  } else {
    is_small_width
  }

  let tabela-corpo = if head != none {
    table(stroke: none, columns: columns, table.header(..head), ..corpo-tabela)
  } else {
    table(stroke: none, columns: columns, ..corpo-tabela)
  }

  set text(size: 10pt)

  let numero = context {
    let atual = counter("tabela").get().first()
    let novo = if atual == 0 { 1 } else { atual + 1 }
    counter("tabela").update(novo)
    str(novo)
  }

  let foot_align = if should_center { center } else { left }

  let caption_line = if should_center {
    align(center, caption-tabular(titulo, numero))
  } else {
    align(left, caption-tabular(titulo, numero))
  }

  let tabela_render = if is_full_width {
    tabela-corpo
  } else if should_center {
    align(center, box(width: largura, tabela-corpo))
  } else {
    box(width: largura, tabela-corpo)
  }

  let itens = (
    caption_line,
    v(0.25em),
    tabela_render,
    v(0.5em),
  )

  if fonte-texto != none {
    itens = itens + (footer-fonte(fonte-texto, alinhamento: foot_align),)
  }
  if nota-texto != none {
    itens = itens + (footer-nota(nota-texto, alinhamento: foot_align),)
  }
  if legenda-texto != none {
    itens = itens + (footer-legenda(legenda-texto, alinhamento: foot_align),)
  }

  block(breakable: true, stack(spacing: 0pt, ..itens))
}

/// Quadro: tabela textual com bordas fechadas (conforme IBGE).
#let quadro(..args) = {
  table(..args)
}

/// Funcao simplificada para inserir quadro com referencia cruzada.
/// Uso: #quadro-simples(columns: 2, <qua-exemplo>, "Titulo", [...], "Fonte (2026)")
#let quadro-simples(
  columns,
  rotulo,
  titulo,
  corpo-quadro,
  fonte-texto: none,
  nota-texto: none,
) = {
  [
    #figure(caption: [#upper(titulo)], kind: "quadro", supplement: "QUADRO")[
      #text(size: 10pt)[
        #quadro(columns: columns, stroke: 0.6pt, ..corpo-quadro)
      ]
    ] #rotulo
    #if fonte-texto != none [
      #set par(first-line-indent: 0pt)
      #align(center)[
        #set par(justify: true)
        #text(size: 10pt)[FONTE: #fonte-texto]
      ]
    ]
    #if nota-texto != none [
      #set par(first-line-indent: 0pt)
      #align(center)[
        #set par(justify: true)
        #text(size: 10pt)[NOTA: #nota-texto]
      ]
    ]
  ]
}

/// Nota de tabela
#let nota-tabela(conteudo) = {
  align(left)[
    #set par(justify: true)
    #text(size: 10pt)[NOTA: #conteudo]
  ]
}
