// Figuras, quadros, tabelas e ilustrações conforme NBR 14724:2024 e IBGE

/// Configuração de figuras conforme ABNT
/// - Legenda na parte superior: tipo, número, traço, título
/// - Fonte na parte inferior
/// - Centralizadas
#let abnt-figure-setup() = {
  show figure: it => {
    set align(center)
    it
  }

  show figure.caption: it => {
    set text(size: 10pt)
    it
  }
}

/// Container genérico para elementos com título, numeração e fonte (ABNT).
/// É a única forma de criar um `figure()` no ABNTyp.
/// O `suplemento` é inferido automaticamente a partir do `tipo`:
/// - `"imagem"` → "Figura" (padrão)
/// - `"tabela"` → "Tabela"
/// - `"quadro"` → "Quadro"
///
#let container(
  body,
  legenda: none,
  origem: none,
  nota: none,
  tipo: "imagem",
  suplemento: auto,
  ..args,
) = {
  // Traduz strings em português para os tipos nativos do Typst.
  let resolved-kind = if tipo == "imagem" or tipo == image { image } else if tipo == "tabela" or tipo == table {
    table
  } else { tipo }

  let supp = if suplemento != auto { suplemento } else if resolved-kind == image { "Figura" } else if (
    resolved-kind == table
  ) { "Tabela" } else if resolved-kind == "quadro" { "Quadro" } else { "Figura" }

  let alinhamento = if resolved-kind == table { left } else { center }

  set align(alinhamento)

  // Construímos a legenda completa para evitar quebra entre "TABELA N –" e o título.
  let caption_full = if legenda != none {
    [#text(size: 10pt)[#upper(supp) + " – " + #upper(legenda)]]
  } else {
    [#text(size: 10pt)[#upper(supp)]]
  }

  figure(
    body,
    caption: caption_full,
    kind: resolved-kind,
    supplement: none,
    ..args,
  )

  if origem != none {
    align(alinhamento)[
      #set par(justify: true)
      #text(size: 10pt)[FONTE: #origem]
    ]
  }

  if nota != none {
    align(alinhamento)[
      #set par(justify: true)
      #text(size: 10pt)[NOTA: #nota]
    ]
  }
}

/// Wrapper para `image()` em português.
///
/// Parâmetros nomeados:
/// - largura: largura (auto, relativa ou fração)
/// - altura: altura (auto, relativa ou fração)
/// - ajuste: modo de ajuste ("cobrir", "conter", "esticar")
/// - alternativo: texto alternativo para acessibilidade
/// - pagina: página do PDF a extrair (auto = primeira)
/// - formato: formato da imagem (auto ou string)
/// - escala: escala de renderização (auto ou string)
/// - icc: perfil de cor ICC (auto, string ou bytes)
/// - ..outros: parâmetros adicionais repassados a `image()`
///
/// Uso (dentro de um `container`):
/// ```typst
/// #container(legenda: "Logo", origem: "O autor")[
///   #imagem("logo.png", largura: 80%)
/// ]
/// ```
#let resolver-caminho-imagem(caminho) = {
  if type(caminho) != str {
    caminho
  } else if (
    caminho.starts-with("/")
      or caminho.starts-with("http://")
      or caminho.starts-with("https://")
      or caminho.starts-with("file:")
  ) {
    caminho
  } else {
    "/" + caminho
  }
}

#let imagem(
  caminho,
  largura: auto,
  altura: auto,
  ajuste: "cobrir",
  alternativo: none,
  pagina: auto,
  formato: auto,
  escala: auto,
  icc: auto,
  ..outros,
) = {
  // Traduz valores de ajuste para o Typst
  let resolved-fit = if ajuste == "cobrir" { "cover" } else if ajuste == "conter" { "contain" } else if (
    ajuste == "esticar"
  ) { "stretch" } else { ajuste }
  let resolved-source = resolver-caminho-imagem(caminho)

  if pagina == auto {
    image(
      resolved-source,
      width: largura,
      height: altura,
      fit: resolved-fit,
      alt: alternativo,
      format: formato,
      scaling: escala,
      icc: icc,
      ..outros,
    )
  } else {
    image(
      resolved-source,
      width: largura,
      height: altura,
      fit: resolved-fit,
      alt: alternativo,
      page: pagina,
      format: formato,
      scaling: escala,
      icc: icc,
      ..outros,
    )
  }
}

/// Fonte da figura (para usar avulso abaixo de um elemento)
#let fonte(conteudo, alinhamento: center) = {
  set par(first-line-indent: 0pt)
  align(alinhamento)[
    #set par(justify: true)
    #text(size: 10pt)[FONTE: #conteudo]
  ]
}

/// Nota da figura (para usar avulso abaixo de um elemento)
#let nota-figura(conteudo, alinhamento: left) = {
  set par(first-line-indent: 0pt)
  align(alinhamento)[
    #set par(justify: true)
    #text(size: 10pt)[NOTA: #conteudo]
  ]
}

/// Função simplificada para inserir figura com referência cruzada.
/// Uso: #figura("caminho.png", <fig-exemplo>, "Título da figura", "Autor (2026)")
#let figura(
  caminho,
  rotulo,
  titulo,
  fonte-texto,
  nota-texto: none,
  largura: 75%,
  ajuste: "conter",
) = {
  [
    #figure(caption: [#upper(titulo)], kind: image, supplement: "FIGURA")[
      #imagem(caminho, largura: largura, ajuste: ajuste)
    ] #rotulo
    #fonte(fonte-texto, alinhamento: center)
    #if nota-texto != none [
      #nota-figura(nota-texto, alinhamento: center)
    ]
  ]
}

/// Função para equações numeradas com referência cruzada.
/// Uso: #equacao(<eq-exemplo>, [x^2 + y^2 = z^2])
#let equacao(rotulo, corpo) = {
  [#math.equation(block: true, numbering: "(1)", supplement: "EQUAÇÃO")[#corpo] #rotulo]
}

/// Função simplificada para gráfico em bloco com referência cruzada.
/// Uso: #grafico-simples(<fig-grafico>, "Título", [conteúdo], "Fonte", nota-texto: "...")
#let grafico-simples(
  rotulo,
  titulo,
  corpo,
  fonte-texto,
  nota-texto: none,
) = {
  [
    #figure(caption: [#upper(titulo)], kind: image, supplement: "FIGURA")[
      #corpo
    ] #rotulo
    #fonte(fonte-texto, alinhamento: center)
    #if nota-texto != none [
      #nota-figura(nota-texto, alinhamento: center)
    ]
  ]
}
