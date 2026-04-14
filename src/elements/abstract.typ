// Resumo e Abstract conforme NBR 6028:2021

#import "../core/metadata.typ"

#let _resumo-config = state("abnt-resumo-config", (
  usar-ponto-e-virgula-palavras-chave: false,
  normalizar-minusculas-palavras-chave: false,
))

#let configurar-resumo-ufpr(
  usar-ponto-e-virgula-palavras-chave: false,
  normalizar-minusculas-palavras-chave: false,
) = {
  _resumo-config.update(_ => (
    usar-ponto-e-virgula-palavras-chave: usar-ponto-e-virgula-palavras-chave,
    normalizar-minusculas-palavras-chave: normalizar-minusculas-palavras-chave,
  ))
}

#let _normalizar-chave(chave, normalizar: false) = {
  if normalizar and type(chave) == str {
    lower(chave)
  } else {
    chave
  }
}

/// Cria página de resumo conforme ABNT
/// - titulo: "RESUMO" ou "ABSTRACT"
/// - conteudo: texto do resumo (150-500 palavras para trabalhos acadêmicos)
/// - palavras-chave: lista de palavras-chave (3 a 5)
/// - rotulo-palavras-chave: "Palavras-chave" ou "Keywords"
#let abstract-page(
  titulo: "RESUMO",
  conteudo: none,
  palavras-chave: (),
  rotulo-palavras-chave: "Palavras-chave",
  usar-ponto-e-virgula-palavras-chave: auto,
  normalizar-minusculas-palavras-chave: auto,
) = {
  context {
    let cfg = _resumo-config.get()
    let usar-pv = if usar-ponto-e-virgula-palavras-chave == auto {
      cfg.at("usar-ponto-e-virgula-palavras-chave", default: false)
    } else {
      usar-ponto-e-virgula-palavras-chave
    }
    let normalizar = if normalizar-minusculas-palavras-chave == auto {
      cfg.at("normalizar-minusculas-palavras-chave", default: false)
    } else {
      normalizar-minusculas-palavras-chave
    }

    // Título centralizado, negrito
    align(center)[
      #text(weight: "bold", size: 12pt, titulo)
    ]

    v(1.5em)

    // Texto do resumo (parágrafo único, espaçamento simples entre linhas)
    set par(
      leading: 1.5em * 0.65,
      first-line-indent: 0pt,
      justify: true,
    )

    conteudo

    v(1.5em)

    // Palavras-chave
    if palavras-chave.len() > 0 {
      let chaves = palavras-chave.map(ch => _normalizar-chave(ch, normalizar: normalizar))
      let separador = if usar-pv { "; " } else { ". " }
      set par(first-line-indent: 0pt)
      [*#rotulo-palavras-chave:* #chaves.join(separador). ]
    }

    pagebreak()
  }
}

/// Resumo em português
#let resumo(
  conteudo,
  palavras-chave: none,
  usar-ponto-e-virgula-palavras-chave: auto,
  normalizar-minusculas-palavras-chave: auto,
) = {
  context {
    let kw = metadata._resolve(palavras-chave, "palavras-chave", fallback: ())
    abstract-page(
      titulo: "RESUMO",
      conteudo: conteudo,
      palavras-chave: kw,
      rotulo-palavras-chave: "Palavras-chave",
      usar-ponto-e-virgula-palavras-chave: usar-ponto-e-virgula-palavras-chave,
      normalizar-minusculas-palavras-chave: normalizar-minusculas-palavras-chave,
    )
  }
}

/// Abstract em inglês
#let resumo-en(
  conteudo,
  palavras-chave: none,
  usar-ponto-e-virgula-palavras-chave: auto,
  normalizar-minusculas-palavras-chave: auto,
) = {
  context {
    let kw = metadata._resolve(palavras-chave, "palavras-chave-en", fallback: ())
    abstract-page(
      titulo: "ABSTRACT",
      conteudo: conteudo,
      palavras-chave: kw,
      rotulo-palavras-chave: "Keywords",
      usar-ponto-e-virgula-palavras-chave: usar-ponto-e-virgula-palavras-chave,
      normalizar-minusculas-palavras-chave: normalizar-minusculas-palavras-chave,
    )
  }
}

/// Resumo em língua estrangeira (genérico)
#let foreign-abstract(
  titulo: "ABSTRACT",
  conteudo: none,
  palavras-chave: (),
  rotulo-palavras-chave: "Keywords",
  usar-ponto-e-virgula-palavras-chave: auto,
  normalizar-minusculas-palavras-chave: auto,
) = {
  abstract-page(
    titulo: titulo,
    conteudo: conteudo,
    palavras-chave: palavras-chave,
    rotulo-palavras-chave: rotulo-palavras-chave,
    usar-ponto-e-virgula-palavras-chave: usar-ponto-e-virgula-palavras-chave,
    normalizar-minusculas-palavras-chave: normalizar-minusculas-palavras-chave,
  )
}
