// Sumário conforme NBR 6027:2012

// Registros automáticos para listas pré-textuais
#let _siglas-registro = state("abnt-siglas-registro", (:))
#let _siglas-uso = state("abnt-siglas-uso", (:))
#let _simbolos-registro = state("abnt-simbolos-registro", (:))

#let _inserir-registro(st, chave, valor) = {
  st.update(old => {
    let novo = (:)
    novo.insert(chave, valor)
    old + novo
  })
}

#let _marcar-uso(sigla) = {
  _siglas-uso.update(old => {
    let novo = (:)
    novo.insert(sigla, true)
    old + novo
  })
}

/// Render outline entry com espaço reservado para numeração (alinhamento vertical).
/// - indent: recuo total (padrão 0em)
/// - num-width: largura reservada para o número (padrão 1.5em)
/// - corpo: conteúdo do título
#let _render-outline-entry(it, indent: 0em, num-width: 3.1em, corpo: [], numero-negrito: false) = {
  let pref = it.prefix()
  let pref-content = if numero-negrito { text(weight: "bold")[#pref] } else { [#pref] }

  link(it.element.location())[
    #h(indent)
    // Indicativo numérico alinhado à margem esquerda e
    // título alinhado na mesma coluna para todos os níveis.
    #box(width: num-width)[
      #align(left)[#pref-content]
    ]
    #h(0.4em)
    #corpo
    #box(width: 1fr, it.fill)
    #it.page()
  ]
}

#let _render-list-entry(it, num-width: 2.8em) = {
  let num = it.prefix()

  block[
    #link(it.element.location())[
      #if num != none [
        #num
        #h(0.25em)
        #text("–")
        #h(0.25em)
      ]
      #it.body()
      #box(width: 1fr, it.fill)
      #it.page()
    ]
  ]
}

// Show rules para formatar entradas do sumário conforme NBR 6027/6024.
// Compartilhado entre abnt-outline() e sumario().
#let _abnt-outline-rules(body) = {
  // Nível 1: MAIÚSCULAS + negrito
  show outline.entry.where(level: 1): it => {
    v(0.5em)
    block[
      #_render-outline-entry(
        it,
        indent: 0em,
        num-width: 4.5em,
        corpo: text(weight: "bold")[#upper(it.body())],
        numero-negrito: true,
      )
    ]
  }

  // Nível 2: MAIÚSCULAS, regular
  show outline.entry.where(level: 2): it => {
    block[
      #_render-outline-entry(it, indent: 0em, num-width: 4.5em, corpo: upper(it.body()), numero-negrito: false)
    ]
  }

  // Nível 3: Minúsculas + negrito
  show outline.entry.where(level: 3): it => {
    block[
      #_render-outline-entry(
        it,
        indent: 0em,
        num-width: 4.5em,
        corpo: it.body(),
        numero-negrito: false,
      )
    ]
  }

  // Nível 4: Minúsculas, regular
  show outline.entry.where(level: 4): it => {
    block[
      #_render-outline-entry(it, indent: 0em, num-width: 4.5em, corpo: it.body(), numero-negrito: false)
    ]
  }

  // Nível 5: Minúsculas, itálico
  show outline.entry.where(level: 5): it => {
    block[
      #_render-outline-entry(it, indent: 0em, num-width: 4.5em, corpo: emph(it.body()), numero-negrito: false)
    ]
  }

  body
}

/// Configura sumário conforme ABNT
/// - Título "SUMARIO" centralizado, negrito
/// - Indicativos de seção alinhados à esquerda
/// - Entradas espelham a formatação dos headings (NBR 6027/6024)
/// - Páginas ligadas por linha pontilhada
#let abnt-outline() = {
  // Título
  align(center)[
    #text(weight: "bold", size: 12pt, "SUMÁRIO")
  ]

  v(1.5em)

  show: _abnt-outline-rules

  outline(
    title: none,
    indent: 0pt,
    depth: 4,
  )
}

/// Sumário customizado com mais controle
#let sumario(
  titulo: "SUMÁRIO",
  profundidade: 4,
) = {
  align(center)[
    #text(weight: "bold", size: 12pt, titulo)
  ]

  v(1.5em)

  show: _abnt-outline-rules

  outline(
    title: none,
    depth: profundidade,
    indent: 0pt,
  )

  pagebreak()
}

/// Lista de ilustrações com separador ' - ' entre número e título
#let lista-ilustracoes() = {
  align(center)[
    #text(weight: "bold", size: 12pt, "LISTA DE ILUSTRAÇÕES")
  ]

  v(1.5em)

  show outline.entry: it => _render-list-entry(it)

  outline(
    title: none,
    target: figure.where(kind: image),
  )

  pagebreak()
}

/// Lista de quadros
#let lista-quadros() = {
  align(center)[
    #text(weight: "bold", size: 12pt, "LISTA DE QUADROS")
  ]

  v(1.5em)

  show outline.entry: it => _render-list-entry(it)

  outline(
    title: none,
    target: figure.where(kind: "quadro"),
  )

  pagebreak()
}

/// Lista de tabelas com separador ' - ' entre número e título
#let lista-tabelas() = {
  align(center)[
    #text(weight: "bold", size: 12pt, "LISTA DE TABELAS")
  ]

  v(1.5em)

  show outline.entry: it => _render-list-entry(it)

  outline(
    title: none,
    target: figure.where(kind: table),
  )

  pagebreak()
}

/// Registra sigla/abreviação para lista e uso no texto.
#let registrar-sigla(sigla, significado) = {
  _inserir-registro(_siglas-registro, sigla, significado)
}

/// Alias semântico para abreviações.
#let registrar-abreviacao(abreviacao, significado) = {
  registrar-sigla(abreviacao, significado)
}

/// Usa sigla no texto com expansão na primeira ocorrência.
/// Primeira ocorrência: "Significado (SIGLA)"
/// Demais ocorrências: "SIGLA"
#let usar-sigla(sigla) = context {
  let base = _siglas-registro.get()
  if not (sigla in base.keys()) {
    panic("usar-sigla(): sigla não registrada: " + sigla)
  }

  let usos = _siglas-uso.get()
  let significado = base.at(sigla)

  if usos.at(sigla, default: false) {
    sigla
  } else {
    _marcar-uso(sigla)
    [#significado (#sigla)]
  }
}

/// Registra símbolo para lista de símbolos.
#let registrar-simbolo(simbolo, significado) = {
  _inserir-registro(_simbolos-registro, simbolo, significado)
}

/// Lista de abreviaturas e siglas
/// - itens: dicionário de sigla -> significado (opcional)
/// Se omitido, usa automaticamente os itens registrados por registrar-sigla().
#let lista-siglas(itens: auto) = context {
  let base = if itens == auto { _siglas-registro.get() } else { itens }

  align(center)[
    #text(weight: "bold", size: 12pt, "LISTA DE ABREVIATURAS E SIGLAS")
  ]

  v(1.5em)

  set par(first-line-indent: 0pt, justify: false)

  for chave in base.keys().sorted() {
    [#chave #h(1em) #base.at(chave)\ ]
  }

  pagebreak()
}

/// Lista de símbolos
/// - itens: dicionário de símbolo -> significado (opcional)
/// Se omitido, usa automaticamente os itens registrados por registrar-simbolo().
#let lista-simbolos(itens: auto) = context {
  let base = if itens == auto { _simbolos-registro.get() } else { itens }

  align(center)[
    #text(weight: "bold", size: 12pt, "LISTA DE SÍMBOLOS")
  ]

  v(1.5em)

  set par(first-line-indent: 0pt, justify: false)

  for chave in base.keys().sorted() {
    [#chave #h(1em) #base.at(chave)\ ]
  }

  pagebreak()
}

// Aliases curtos
#let siglas = lista-siglas
#let simbolos = lista-simbolos
#let quadros = lista-quadros
