// Preset UFPR para trabalhos acadêmicos

#import "../templates/thesis.typ": abntcc
#import "../templates/article.typ": artigo
#import "../templates/technical-report.typ": relatorio
#import "../templates/research-project.typ": projeto-pesquisa
#import "../institutions/ufpr/cover.typ": capa-ufpr
#import "../elements/title-page.typ": folha-aprovacao, folha-rosto

/// Preset reutilizável UFPR.
/// Uso:
/// #show: ufprcc.with()
/// #show: dados-ufpr.with(...)
#let ufprcc(
  fonte: "Times New Roman",
  arquivo-bibliografia: none,
  titulo-bibliografia: "REFERÊNCIAS",
  usar-margens-espelhadas: false,
  usar-numeracao-verso: false,
  evitar-heading-orfao: false,
  usar-ponto-e-virgula-palavras-chave: false,
  normalizar-minusculas-palavras-chave: false,
  usar-fundo-capa: true,
  imagem-fundo-capa: none,
  fundo-ajuste-capa: "contain",
  fundo-margem-superior-capa: 0.4cm,
  fundo-margem-inferior-capa: 0.4cm,
  fundo-margem-esquerda-capa: 0.4cm,
  fundo-margem-direita-capa: 0.4cm,
  espaco-instituicao-autor-capa: 0.5fr,
  espaco-autor-titulo-capa: 0.7fr,
  espaco-titulo-rodape-capa: 1.8fr,
  incluir-folha-rosto: true,
  incluir-folha-aprovacao: false,
  banca-aprovacao: (),
  data-aprovacao: none,
  modalidade-defesa: none,
  texto-aprovacao: none,
  body,
) = {
  show: abntcc.with(
    fonte: fonte,
    arquivo-bibliografia: arquivo-bibliografia,
    titulo-bibliografia: titulo-bibliografia,
    usar-margens-espelhadas: usar-margens-espelhadas,
    usar-numeracao-verso: usar-numeracao-verso,
    evitar-heading-orfao: evitar-heading-orfao,
    usar-ponto-e-virgula-palavras-chave: usar-ponto-e-virgula-palavras-chave,
    normalizar-minusculas-palavras-chave: normalizar-minusculas-palavras-chave,
  )

  capa-ufpr(
    usar-fundo: usar-fundo-capa,
    imagem-fundo: imagem-fundo-capa,
    fundo-ajuste: fundo-ajuste-capa,
    fundo-margem-superior: fundo-margem-superior-capa,
    fundo-margem-inferior: fundo-margem-inferior-capa,
    fundo-margem-esquerda: fundo-margem-esquerda-capa,
    fundo-margem-direita: fundo-margem-direita-capa,
    espaco-instituicao-autor: espaco-instituicao-autor-capa,
    espaco-autor-titulo: espaco-autor-titulo-capa,
    espaco-titulo-rodape: espaco-titulo-rodape-capa,
  )

  if incluir-folha-rosto {
    folha-rosto()
  }

  if incluir-folha-aprovacao {
    folha-aprovacao(
      banca: banca-aprovacao,
      data-aprovacao: data-aprovacao,
      modalidade-defesa: modalidade-defesa,
      texto-aprovacao: texto-aprovacao,
    )
  }

  body
}

/// Preset UFPR específico para TESE.
///
/// Mantém `ufprcc` como base, mas ativa por padrão a folha de aprovação
/// com texto apropriado para doutorado.
#let ufpr-tese(
  texto-aprovacao: [
    Tese aprovada como requisito parcial para obtenção do título de Doutor,
    no Programa de Pós-Graduação da Universidade Federal do Paraná.
  ],
  body,
  ..args,
) = {
  show: ufprcc.with(
    incluir-folha-aprovacao: true,
    texto-aprovacao: texto-aprovacao,
    ..args,
  )

  body
}

/// Preset UFPR específico para TCC.
///
/// Mantém `ufprcc` como base, mas ativa por padrão a folha de aprovação
/// com texto apropriado para conclusão de curso.
#let ufpr-tcc(
  texto-aprovacao: [
    Trabalho de Conclusão de Curso aprovado como requisito parcial para
    obtenção do grau correspondente na Universidade Federal do Paraná.
  ],
  body,
  ..args,
) = {
  show: ufprcc.with(
    incluir-folha-aprovacao: true,
    texto-aprovacao: texto-aprovacao,
    ..args,
  )

  body
}

/// Preset UFPR para artigo científico.
#let ufpr-artigo(
  fonte: "Times New Roman",
  ..args,
) = {
  artigo(fonte: fonte, ..args)
}

/// Preset UFPR para relatório técnico/científico.
/// Pode incluir capa UFPR em fundo e folha de rosto padrão.
#let ufpr-relatorio(
  fonte: "Times New Roman",
  usar-fundo-capa: true,
  imagem-fundo-capa: none,
  fundo-ajuste-capa: "contain",
  fundo-margem-superior-capa: 0cm,
  fundo-margem-inferior-capa: 0cm,
  fundo-margem-esquerda-capa: 0cm,
  fundo-margem-direita-capa: 0cm,
  espaco-instituicao-autor-capa: 0.6fr,
  espaco-autor-titulo-capa: 0.8fr,
  espaco-titulo-rodape-capa: 1.6fr,
  incluir-folha-rosto: true,
  body,
  ..args,
) = {
  show: relatorio.with(fonte: fonte, ..args)

  capa-ufpr(
    usar-fundo: usar-fundo-capa,
    imagem-fundo: imagem-fundo-capa,
    fundo-ajuste: fundo-ajuste-capa,
    fundo-margem-superior: fundo-margem-superior-capa,
    fundo-margem-inferior: fundo-margem-inferior-capa,
    fundo-margem-esquerda: fundo-margem-esquerda-capa,
    fundo-margem-direita: fundo-margem-direita-capa,
    espaco-instituicao-autor: espaco-instituicao-autor-capa,
    espaco-autor-titulo: espaco-autor-titulo-capa,
    espaco-titulo-rodape: espaco-titulo-rodape-capa,
  )

  if incluir-folha-rosto {
    folha-rosto()
  }

  body
}

/// Preset UFPR para projeto de pesquisa.
/// Mantém estilo ABNT do template base com capa UFPR opcional.
#let ufpr-projeto(
  fonte: "Times New Roman",
  usar-fundo-capa: true,
  imagem-fundo-capa: none,
  fundo-ajuste-capa: "contain",
  fundo-margem-superior-capa: 0cm,
  fundo-margem-inferior-capa: 0cm,
  fundo-margem-esquerda-capa: 0cm,
  fundo-margem-direita-capa: 0cm,
  espaco-instituicao-autor-capa: 0.6fr,
  espaco-autor-titulo-capa: 0.8fr,
  espaco-titulo-rodape-capa: 1.6fr,
  incluir-folha-rosto: true,
  body,
  ..args,
) = {
  show: projeto-pesquisa.with(fonte: fonte, ..args)

  capa-ufpr(
    usar-fundo: usar-fundo-capa,
    imagem-fundo: imagem-fundo-capa,
    fundo-ajuste: fundo-ajuste-capa,
    fundo-margem-superior: fundo-margem-superior-capa,
    fundo-margem-inferior: fundo-margem-inferior-capa,
    fundo-margem-esquerda: fundo-margem-esquerda-capa,
    fundo-margem-direita: fundo-margem-direita-capa,
    espaco-instituicao-autor: espaco-instituicao-autor-capa,
    espaco-autor-titulo: espaco-autor-titulo-capa,
    espaco-titulo-rodape: espaco-titulo-rodape-capa,
  )

  if incluir-folha-rosto {
    folha-rosto()
  }

  body
}
