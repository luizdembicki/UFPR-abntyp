# ufpr-abntyp

`ufpr-abntyp` é um pacote filho de adaptação institucional da UFPR sobre o pacote base [ABNTyp](https://github.com/3sdras/abntyp) para Typst.

## Objetivo

Este repositório foca em normalização UFPR com:

- camada institucional reutilizável;
- fundo de capa UFPR em página inteira por padrão;
- opção para suprimir o fundo quando necessário;
- presets prontos para tipos de documento acadêmico comuns.

## Relação com ABNTyp

Este pacote **não substitui** o ABNTyp como base normativa ABNT genérica.
Ele adapta e especializa o fluxo para a UFPR.

Créditos e referência do pacote base:

- ABNTyp: [https://github.com/3sdras/abntyp](https://github.com/3sdras/abntyp)
- Licença do ABNTyp: MIT

## Instalação local

```typst
#import "caminho/para/ufpr-abntyp/lib.typ": *
```

## Uso rápido (TCC, dissertação, tese)

```typst
#import "ufpr-abntyp/lib.typ": *

#show: dados-ufpr.with(
  titulo: "Título do trabalho",
  autor: "Nome do Autor",
  // Bloco livre da folha de rosto ("trabalho apresentado ...")
  texto-apresentacao: [
    Trabalho apresentado ao Programa ... da Universidade Federal do Paraná,
    como requisito parcial para ...
  ],
  faculdade: "Setor ...",
  programa: "Programa ...",
  local: "Curitiba",
  ano: 2026,
)

#show: ufprcc.with(
  usar-fundo-capa: true,
  // suprimir fundo:
  // usar-fundo-capa: false,
  // opções adicionais (desativadas por padrão):
  // usar-margens-espelhadas: true,
  // usar-numeracao-verso: true,
  // evitar-heading-orfao: true,
  // usar-ponto-e-virgula-palavras-chave: true,
  // normalizar-minusculas-palavras-chave: true,
)

#resumo[Resumo...]
#resumo-en[Abstract...]
#sumario()

#counter(page).update(1)
#set page(numbering: "1", number-align: top + right)

= Introdução
```

## Presets UFPR disponíveis

- `ufprcc`: trabalhos acadêmicos (TCC, dissertação, tese)
- `ufpr-artigo`: artigo científico
- `ufpr-relatorio`: relatório técnico/científico
- `ufpr-projeto`: projeto de pesquisa
- `dados-ufpr`: wrapper de metadados institucionais UFPR

## Ajustes de capa UFPR

Parâmetros úteis no preset (`ufprcc`, `ufpr-relatorio`, `ufpr-projeto`):

- `usar-fundo-capa`
- `fundo-margem-superior-capa`
- `fundo-margem-inferior-capa`
- `fundo-margem-esquerda-capa`
- `fundo-margem-direita-capa`
- `espaco-instituicao-autor-capa`
- `espaco-autor-titulo-capa`
- `espaco-titulo-rodape-capa`

Parâmetros adicionais no preset `ufprcc` (todos opcionais e desativados por padrão):

- `usar-margens-espelhadas`
- `usar-numeracao-verso`
- `evitar-heading-orfao`
- `usar-ponto-e-virgula-palavras-chave`
- `normalizar-minusculas-palavras-chave`

Nota: `usar-numeracao-verso` mantém o controle da numeração habilitado para o fluxo UFPR, mas o alinhamento alternado automático por paridade depende de suporte nativo do Typst ainda indisponível nesta versão.

## Exemplos UFPR

A pasta `examples/` contém apenas exemplos UFPR:

- `ufpr-tcc-exemplo.typ`
- `ufpr-dissertacao-exemplo.typ`
- `ufpr-tese-exemplo.typ`
- `ufpr-artigo-exemplo.typ`
- `ufpr-relatorio-exemplo.typ`
- `ufpr-projeto-exemplo.typ`
- `ufpr-validacao-completa.typ` (documento completo com citações, imagem, tabela e referências)

## Estrutura principal

```text
src/
  institutions/ufpr/
    capaufpr.png
    cover.typ
    metadata.typ
  presets/
    ufpr.typ
```

## Licença e créditos

Este repositório é distribuído sob licença MIT.

Inclui créditos e referências a:

- ABNTyp (pacote base)
- abnTeX2 (inspiração histórica)
- csl-abnt (estilo CSL)
- Touying (template de slides)
