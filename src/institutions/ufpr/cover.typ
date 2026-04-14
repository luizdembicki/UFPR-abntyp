// Capa institucional UFPR
// Camada de adaptação sobre os elementos ABNT

#import "../../core/metadata.typ"

/// Cria capa UFPR com fundo institucional em página inteira.
/// Por padrão usa capaufpr.png no mesmo diretório deste módulo.
/// Para suprimir o fundo, use usar-fundo: false.
#let capa-ufpr(
  usar-fundo: true,
  imagem-fundo: none,
  fundo-ajuste: "contain",
  fundo-margem-superior: 0cm,
  fundo-margem-inferior: 0cm,
  fundo-margem-esquerda: 0cm,
  fundo-margem-direita: 0cm,
  espaco-instituicao-autor: 0.6fr,
  espaco-autor-titulo: 0.8fr,
  espaco-titulo-rodape: 1.6fr,
  instituicao: none,
  faculdade: none,
  programa: none,
  autor: none,
  titulo: none,
  subtitulo: none,
  local: none,
  ano: none,
) = {
  set page(numbering: none)

  let fundo-largura = 21cm - fundo-margem-esquerda - fundo-margem-direita
  let fundo-altura = 29.7cm - fundo-margem-superior - fundo-margem-inferior

  let fundo = if usar-fundo {
    if imagem-fundo != none { imagem-fundo } else { "capaufpr.png" }
  } else {
    none
  }

  context {
    let instituicao = metadata._resolve(instituicao, "instituicao")
    let faculdade = metadata._resolve(faculdade, "faculdade")
    let programa = metadata._resolve(programa, "programa")
    let autor = metadata._resolve(autor, "autor")
    let titulo = metadata._resolve(titulo, "titulo")
    let subtitulo = metadata._resolve(subtitulo, "subtitulo")
    let local = metadata._resolve(local, "local")
    let ano = metadata._resolve(ano, "ano")

    set align(center)

    // Fundo absoluto em A4 (não participa do fluxo de texto).
    if fundo != none {
      place(
        top + left,
        dx: -3cm + fundo-margem-esquerda,
        dy: -3cm + fundo-margem-superior,
      )[
        #image(
          fundo,
          width: fundo-largura,
          height: fundo-altura,
          fit: fundo-ajuste,
        )
      ]
    }

    if instituicao != none {
      text(size: 12pt, upper(instituicao))
      linebreak()
    }

    if faculdade != none {
      text(size: 12pt, upper(faculdade))
      linebreak()
    }

    if programa != none {
      text(size: 12pt, upper(programa))
    }

    v(espaco-instituicao-autor)

    if autor != none {
      text(size: 12pt, upper(autor))
    }

    v(espaco-autor-titulo)

    metadata._render-titulo(titulo, subtitulo: subtitulo)

    v(espaco-titulo-rodape)

    if local != none {
      text(size: 12pt, upper(local))
      linebreak()
    }

    if ano != none {
      text(size: 12pt, metadata._str-safe(ano))
    }
  }

  pagebreak()
}
