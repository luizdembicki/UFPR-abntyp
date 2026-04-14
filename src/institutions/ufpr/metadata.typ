// Metadados institucionais UFPR

#import "../../core/metadata.typ": dados

/// Wrapper de metadados com padrão institucional UFPR.
/// Mantém compatibilidade com dados() e aplica UFPR por padrão.
#let dados-ufpr(
  instituicao: "Universidade Federal do Paraná",
  texto-apresentacao: none,
  rotulo-orientador: none,
  rotulo-coorientador: none,
  ..args,
) = {
  dados(
    instituicao: instituicao,
    texto-apresentacao: texto-apresentacao,
    rotulo-orientador: rotulo-orientador,
    rotulo-coorientador: rotulo-coorientador,
    ..args,
  )
}
