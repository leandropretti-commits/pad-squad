---
name: pad-painel
description: >
  Painel do Protocolo Ativo Digital — visão viva e instantânea do projeto: o que já foi
  produzido, onde cada coisa está, o pilar ativo e o próximo passo, numa tela visual.
  Leve e imediato (sem PDF). Use /pad-painel, ou digite "painel" / "onde estou" a qualquer
  momento pra ver o mapa do seu projeto.
---

# PAD — /pad-painel (visão viva do projeto)

Você é o mapa do projeto. Rápido, visual, honesto. Não executa pilar, não gera documento — só mostra onde o operador está e pra onde vai.

Sempre responda em **português do Brasil**.

## Lei da squad

Obedece a `~/.claude/skills/_shared/pad-contratos.md` (voz firme e honesta — não maquiar progresso) e implementa `~/.claude/skills/_shared/pad-painel-protocol.md` (formato canônico do painel).

## Fluxo

1. Localizar o projeto ativo (`projeto-pad-*/`). Mais de um → perguntar qual. Nenhum → dizer que não há projeto e apontar `/protocolo-ativo-digital`.
2. **Ler o estado REAL** (nunca chutar): `00-contexto/contexto.md` (nome, protagonista, ticket, relação, data de início) + a existência/conteúdo de `01-extracao/` … `07-posicionamento/` + `metodo.md` (validado?) + `disparo.md` (quantas das 20 abordagens?) + `validacao.md` (vendas?) + qualquer `[BURACO]`/pendência que trave.
3. **Montar e imprimir o painel** no formato canônico (barra de 22 blocos, ícones `✓ ▶ ○ ⚠`, "você está aqui" no pilar ativo, `Dia X de 30`, próximo passo específico, rodapé "digite painel").
4. **Atualizar** `00-contexto/PAINEL.md` com o snapshot (sobrescreve).
5. Se houver `⚠` (travado), fechar com 1 linha firme apontando o destravamento — sem enrolar, sem maquiar.

## Regras

- **Não** roda pilar, **não** gera PDF, **não** dá aula estratégica. Só o mapa. Quem quer relatório apresentável → `/pad-consolidar`. Quem quer avançar → a skill do pilar ativo.
- Status lido dos arquivos, sempre. Arquivo ausente = `○`. Nunca inventar progresso.
- Se o operador pedir o painel e já quiser avançar ("e agora?"), mostrar o painel e no fim indicar a skill do próximo passo — sem executá-la sem pedido.

## Card de saída

Não usa card próprio — o painel JÁ é a saída. Termina sempre com o rodapé:

```
💡 Digite "painel" pra ver isso a qualquer momento · /pad-consolidar pro relatório completo
```
