// Folha de rosto conforme NBR 14724:2024
// Anverso: autor, título, natureza, orientador, local, ano

#import "../core/spacing.typ": nature-block
#import "../core/metadata.typ"

/// Cria folha de rosto conforme ABNT
#let folha-rosto(
  autor: none,
  titulo: none,
  subtitulo: none,
  natureza: none, // Natureza do trabalho (dissertação, tese, TCC)
  objetivo: none, // Objetivo (obtenção de grau)
  texto-apresentacao: none, // Texto livre do bloco de apresentação
  instituicao: none,
  area: none, // Área de concentração
  orientador: none, // Orientador
  coorientador: none, // Coorientador
  rotulo-orientador: none,
  rotulo-coorientador: none,
  local: none,
  ano: none,
) = {
  set page(numbering: none)

  context {
    let autor = metadata._resolve(autor, "autor")
    let titulo = metadata._resolve(titulo, "titulo")
    let subtitulo = metadata._resolve(subtitulo, "subtitulo")
    let natureza = metadata._resolve(natureza, "natureza")
    let objetivo = metadata._resolve(objetivo, "objetivo")
    let texto-apresentacao = metadata._resolve(texto-apresentacao, "texto-apresentacao")
    let instituicao = metadata._resolve(instituicao, "instituicao")
    let area = metadata._resolve(area, "area")
    let orientador = metadata._resolve(orientador, "orientador")
    let coorientador = metadata._resolve(coorientador, "coorientador")
    let rotulo-orientador = metadata._resolve(rotulo-orientador, "rotulo-orientador", fallback: "Orientador")
    let rotulo-coorientador = metadata._resolve(rotulo-coorientador, "rotulo-coorientador", fallback: "Coorientador")
    let local = metadata._resolve(local, "local")
    let ano = metadata._resolve(ano, "ano")

    set align(center)

    // Autor
    if autor != none {
      text(size: 12pt, upper(autor))
    }

    v(1fr)

    // Título (maiúsculas, negrito) + subtítulo
    metadata._render-titulo(titulo, subtitulo: subtitulo)

    v(2cm)

    // Natureza do trabalho (recuo de 8cm, espaço simples)
    if texto-apresentacao != none or natureza != none or objetivo != none or orientador != none {
      set align(right)
      box(width: 8cm)[
        #set align(left)
        #set par(
          leading: 1em * 0.65,
          first-line-indent: 0pt,
          justify: true,
        )
        #set text(size: 10pt)

        #if texto-apresentacao != none {
          texto-apresentacao
        } else {
          if natureza != none { natureza }
          if objetivo != none { [ #objetivo] }
          if instituicao != none {
            linebreak()
            instituicao
          }
          if area != none {
            linebreak()
            [Área de concentração: #area]
          }
        }

        #if orientador != none {
          linebreak()
          linebreak()
          [#rotulo-orientador: #orientador]
        }

        #if coorientador != none {
          linebreak()
          [#rotulo-coorientador: #coorientador]
        }
      ]
    }

    v(1fr)

    // Local e ano
    set align(center)
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

/// Verso da folha de rosto (ficha catalográfica)
/// Deve ocupar a parte inferior da página
#let ficha-catalografica(conteudo) = {
  set page(numbering: none)
  v(1fr)

  align(center)[
    #box(
      width: 12.5cm,
      height: 7.5cm,
      stroke: 0.5pt,
      inset: 0.5cm,
    )[
      #set text(size: 10pt)
      #set par(leading: 1em * 0.65)
      #conteudo
    ]
  ]

  pagebreak()
}

/// Folha de aprovação conforme manual UFPR (seção 4.7)
///
/// Elemento obrigatório para trabalhos acadêmicos, com layout customizável
/// conforme coordenação do curso.
#let folha-aprovacao(
  autor: none,
  titulo: none,
  subtitulo: none,
  natureza: none,
  objetivo: none,
  instituicao: none,
  area: none,
  orientador: none,
  banca: (), // tupla de membros: ("Nome") ou (nome: "...", instituicao: "...", papel: "...")
  local: none,
  data-aprovacao: none,
  modalidade-defesa: none, // ex.: "Videoconferência"
  texto-aprovacao: none,
  titulo-folha: "FOLHA DE APROVAÇÃO",
  mostrar-linha-assinatura: true,
) = {
  set page(numbering: none)

  context {
    let autor = metadata._resolve(autor, "autor")
    let titulo = metadata._resolve(titulo, "titulo")
    let subtitulo = metadata._resolve(subtitulo, "subtitulo")
    let natureza = metadata._resolve(natureza, "natureza")
    let objetivo = metadata._resolve(objetivo, "objetivo")
    let instituicao = metadata._resolve(instituicao, "instituicao")
    let area = metadata._resolve(area, "area")
    let orientador = metadata._resolve(orientador, "orientador")
    let local = metadata._resolve(local, "local")

    align(center)[
      #text(weight: "bold", size: 12pt)[#upper(titulo-folha)]
    ]

    v(1.5em)

    if autor != none {
      align(center)[
        #text(size: 12pt)[#upper(autor)]
      ]
      v(1.5em)
    }

    if titulo != none {
      align(center)[
        #if subtitulo != none {
          text(weight: "bold", size: 12pt)[#upper(titulo + ": " + subtitulo)]
        } else {
          text(weight: "bold", size: 12pt)[#upper(titulo)]
        }
      ]
      v(1.5em)
    }

    align(right)[
      #box(width: 8cm)[
        #set align(left)
        #set text(size: 10pt)
        #set par(
          leading: 1em * 0.65,
          first-line-indent: 0pt,
          justify: true,
        )

        #if texto-aprovacao != none {
          texto-aprovacao
        } else {
          [Trabalho aprovado como #if natureza != none { natureza } else { [trabalho acadêmico] }
            #if objetivo != none { [ #objetivo] }.
            #if instituicao != none {
              linebreak()
              [Instituição: #instituicao]
            }
            #if area != none {
              linebreak()
              [Área de concentração: #area]
            }]
        }

        #if modalidade-defesa != none {
          linebreak()
          linebreak()
          [Modalidade da defesa: #modalidade-defesa.]
        }
      ]
    ]

    v(2cm)

    let orient = if orientador != none {
      ((nome: orientador, instituicao: instituicao, papel: "Orientador(a)"),)
    } else {
      ()
    }
    let participantes = orient + banca

    for participante in participantes {
      if mostrar-linha-assinatura {
        align(center)[#line(length: 9cm, stroke: 0.5pt)]
      }

      v(0.2cm)

      if type(participante) == dictionary {
        align(center)[
          #text(size: 10pt)[#participante.at("nome", default: "")]
          #if participante.at("papel", default: none) != none {
            linebreak()
            text(size: 10pt)[#participante.at("papel")]
          }
          #if participante.at("instituicao", default: none) != none {
            linebreak()
            text(size: 10pt)[#participante.at("instituicao")]
          }
        ]
      } else {
        align(center)[#text(size: 10pt)[#participante]]
      }

      v(1.2cm)
    }

    if local != none or data-aprovacao != none {
      align(center)[
        #if local != none {
          text(size: 12pt)[#local]
          if data-aprovacao != none { [, ] }
        }
        #if data-aprovacao != none {
          text(size: 12pt)[#metadata._str-safe(data-aprovacao)]
        }
      ]
    }
  }

  pagebreak()
}

// Aliases curtos
#let rosto = folha-rosto
#let ficha = ficha-catalografica
#let aprovacao = folha-aprovacao
