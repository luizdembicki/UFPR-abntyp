// Guia de Adaptação UFPR do ABNTyp
// Objetivo: separar a base ABNT da camada institucional UFPR

#set document(title: "Guia de Adaptação UFPR - ABNTyp")
#set page(paper: "a4", margin: 2cm)
#set text(font: "Times New Roman", size: 11pt, lang: "pt")
#set par(justify: true)

#align(center)[
  #text(size: 18pt, weight: "bold")[Guia de Adaptação UFPR]
  #v(0.5em)
  #text(size: 11pt)[Camada institucional sobre a base ABNTyp]
]

#v(1em)

== Objetivo da camada UFPR

A adaptação para a Universidade Federal do Paraná deve ser tratada como uma camada institucional sobre a base ABNT já existente.

A regra prática é simples:

- manter em comum tudo o que continuar aderente à ABNT;
- isolar em módulos próprios tudo o que for específico da UFPR;
- evitar espalhar texto institucional diretamente nos templates genéricos.

== Checklist de adaptação

=== 1. Identidade institucional

- validar o nome oficial da instituição exatamente como deve aparecer na capa e na folha de rosto;
- definir como a UFPR deve ser representada: universidade, setor, programa, curso, campus e unidade;
- decidir quais campos serão obrigatórios, opcionais ou derivados de outro dado.

=== 2. Capa

- confirmar o modelo visual oficial da UFPR;
- definir se a capa usa imagem raster, PDF vetorial ou composição tipográfica nativa;
- preparar a imagem com proporção estável e sem distorção;
- centralizar o ponto de encaixe da capa em um único módulo para facilitar troca futura.

=== 3. Folha de rosto

- revisar a redação da natureza do trabalho;
- verificar a posição exata do bloco de apresentação;
- checar se a UFPR exige variações por tipo de documento: TCC, dissertação, tese, relatório ou projeto.

=== 4. Ficha catalográfica e aprovação

- confirmar se a versão UFPR exige ficha catalográfica no verso da folha de rosto;
- verificar se a folha de aprovação é obrigatória no fluxo alvo;
- separar esses blocos da folha de rosto para não misturar regras institucionais e regras ABNT.

=== 5. Pré-textuais

- revisar a ordem de capa, folha de rosto, ficha catalográfica, dedicatória, agradecimentos, epígrafe, resumos, listas e sumário;
- confirmar quais elementos são obrigatórios, opcionais ou dependentes do tipo de trabalho;
- validar numeração visível e numeração contada nas páginas pré-textuais.

=== 6. Resumo e abstract

- conferir se a UFPR mantém o formato ABNT do resumo;
- validar se há exigência de palavras-chave, keywords ou referência do trabalho;
- manter os blocos de resumo em português e inglês reaproveitáveis.

=== 7. Citações e referências

- manter a base ABNT enquanto não houver divergência formal no manual UFPR;
- validar se existe exigência institucional para notas, citações de citação ou referências complementares;
- evitar duplicar lógica já consolidada em `src/references/`.

=== 8. Sumário, apêndices e anexos

- confirmar a nomenclatura institucional dos elementos pós-textuais;
- validar ordem de listagem no sumário;
- revisar se apêndice e anexo seguem a mesma lógica de letras e paginação da base atual.

=== 9. Temas de página e paginação

- validar margens, fonte, espaçamento e recuos contra o manual UFPR;
- conferir se páginas iniciais devem ficar sem numeração visível;
- confirmar se a UFPR usa alguma exceção para trabalhos encadernados ou impressos.

=== 10. Exemplos e documentação

- criar um exemplo UFPR separado dos exemplos ABNT genéricos;
- documentar claramente o que é comum e o que é específico;
- registrar onde colocar a capa oficial enviada pelo usuário.

== Organização recomendada do repositório

A estrutura mais limpa é manter a base ABNT intacta e criar uma camada UFPR por cima.

```text
src/
  core/
    page.typ
    metadata.typ
  elements/
    cover.typ
    title-page.typ
    abstract.typ
    toc.typ
  references/
    citation.typ
    bibliography.typ
  templates/
    thesis.typ
    article.typ
    report.typ
  presets/
    ufpr.typ
    ufpr-thesis.typ
    ufpr-article.typ
    ufpr-report.typ
  institutions/
    ufpr/
      cover.typ
      title-page.typ
      approval.typ
      catalog.typ
      metadata.typ

docs/
  ufpr-adaptacao.typ
  ufpr-manual-de-uso.typ

examples/
  ufpr-artigo-exemplo.typ
  ufpr-relatorio-exemplo.typ
  ufpr-projeto-exemplo.typ
  ufpr-tcc-exemplo.typ
  ufpr-dissertacao-exemplo.typ
  ufpr-tese-exemplo.typ
```

== Decisões de implementação

- `src/core/` deve continuar sendo a base compartilhada;
- `src/presets/` pode concentrar a seleção UFPR sem poluir a base ABNT;
- `src/institutions/ufpr/` deve conter apenas o que muda por instituição;
- `src/templates/` pode reutilizar os templates existentes com sobrecarga mínima;
- `assets/ufpr/` é o local natural para a imagem de capa oficial quando ela for enviada.

== Prioridade de alteração

1. capa e folha de rosto;
2. metadados institucionais;
3. ficha catalográfica e folha de aprovação;
4. ordem dos pré-textuais;
5. exemplo UFPR completo;
6. ajuste fino de títulos, sumário e paginação;
7. revisão de citações e referências apenas se o manual UFPR divergir da ABNT.

== Próximo passo

Quando a imagem de capa da UFPR for enviada, o encaixe ideal é transformá-la em um componente dedicado no módulo `src/institutions/ufpr/cover.typ`, sem alterar o restante da base ABNT.

== Integração da imagem da capa

A integração já está preparada com um componente dedicado de capa UFPR.

- função criada: `capa-ufpr` em `src/institutions/ufpr/cover.typ`;
- preset reutilizável: `ufprcc` em `src/presets/ufpr.typ`;
- presets adicionais: `ufpr-artigo`, `ufpr-relatorio`, `ufpr-projeto` em `src/presets/ufpr.typ`;
- wrapper de metadados: `dados-ufpr` em `src/institutions/ufpr/metadata.typ`;
- exemplos criados na pasta `examples/` apenas com modelos UFPR;
- caminho atual do arquivo de imagem padrão: `src/institutions/ufpr/capaufpr.png`.

Passos para uso:

1. salvar a imagem de capa nesse caminho;
2. compilar qualquer exemplo da pasta `examples/`;
3. se quiser ocultar o fundo, usar `#show: ufprcc.with(usar-fundo-capa: false)`.

Onde editar os ajustes pedidos:

- margens do fundo da imagem na capa: parâmetros `fundo-margem-superior-capa`, `fundo-margem-inferior-capa`, `fundo-margem-esquerda-capa`, `fundo-margem-direita-capa` no preset `ufprcc`;
- posição do nome do autor para cima/baixo: parâmetro `espaco-instituicao-autor-capa`;
- posição do título para mais centralizado: parâmetros `espaco-autor-titulo-capa` e `espaco-titulo-rodape-capa`.
