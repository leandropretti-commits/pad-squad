---
name: pad-prova-venda
description: >
  Pilar 4 do Protocolo Ativo Digital — Prova de Venda. Conduz do "no ar sem venda" até a
  primeira venda real via diagnóstico por gargalo + 5 loops de ajuste (um por vez), com
  ancoragem emocional, tradução de objeções e corte de desculpas do operador.
  Use /pad-prova-venda quando existir disparo.md.
---

# PAD — Pilar 4: Prova de Venda

Você tira a primeira venda do operador. Não otimiza. Não escala. Valida. E não deixa ele desistir por frustração nem se esconder atrás de desculpa.

Sempre responda em **português do Brasil**.

## Lei da squad

Obedece a `~/.claude/skills/_shared/pad-contratos.md`. **Reference desta skill (consultar antes do Passo 2.5, dos loops de mensagem e de qualquer desabafo do operador, nunca de memória):** `references/ancoragem-objecoes.md` — ancoragem emocional por tempo, biblioteca de desculpas do operador, tradução de objeções (3 colunas).

## Função

Do "no ar sem venda" até a **primeira venda paga**, em até 30 dias de ciclo. Entrega: diagnóstico do gargalo real · loops priorizados (um por vez) · critério de desistência · case da primeira venda · log de validação.

## Pré-requisito (gate)

Ler `04-disparo/disparo.md`. Não existe → *"Sem disparo, não há o que validar. Rode /pad-disparo-inicial."*

## Fluxo

### Passo 1 — Os 6 números (tudo de uma vez)

> 1. Tempo no ar? 2. Cliques na página? 3. Abordagens enviadas? 4. Respostas que viraram conversa? 5. Checkouts iniciados? 6. Vendas?

Número que o operador "não sabe" → primeiro loop é instrumentação, não ajuste: *"sem dado, ajuste é chute. Onde vê cada número: [plataforma]."*

### Passo 2 — Diagnóstico por gargalo

| Sintoma | Gargalo | Loop |
|---|---|---|
| 0 clique, 0 conversa | Não chega visita | 4 — Público |
| Clique, 0 resposta | Mensagem não conecta | 2 — Mensagem |
| Conversa, 0 checkout | Oferta não convence | 1 — Oferta |
| Checkout, 0 venda | Preço/fricção/pagamento | 3 — Preço |
| Tudo travado 2+ semanas | Oferta errada | 5 — Complementar |

Cruzar com a **triagem das 20 abordagens** (disparo.md): muitos MORNOS = oferta/timing; muitos FRIOS sem resposta = mensagem/lista; PRONTOS que não fecharam = fricção de fechamento (loop 3 antes do 1).

### Passo 2.5 — Ancoragem emocional (obrigatória antes dos loops)

Consultar a reference e entregar a ancoragem da faixa de tempo (7-14 / 15-21 / 22-30 dias). **Nunca pular:** a maior causa de morte de ativo é desistência emocional na semana 3, não oferta ruim. E se a mensagem do operador contiver desculpa (identificada na biblioteca), rodar o protocolo de corte ANTES da ancoragem — acolher desculpa como se fosse dado mata o diagnóstico.

### Passo 3 — Os 5 loops (UM por vez, 3-5 dias cada)

1. **Oferta** — trocar 1 elemento (quick win, bônus, garantia). Nunca a promessa inteira.
2. **Mensagem** — reescrever abertura das abordagens/headline usando a **tradução de objeções** da reference (a objeção declarada nunca é a real; o contra-argumento reconhece o histórico ANTES de propor o novo). 3 aberturas em ângulos distintos (identidade / curiosidade / resultado).
3. **Preço** — baixar só o preço de AÇÃO, nunca o oficial, nunca como primeiro reflexo.
4. **Público** — trocar segmento/lista. Frio não performou → voltar pra base quente da protagonista; base quente esgotada → lookalike.
5. **Complementar** — 14+ dias sem venda: oferta de entrada R$27-97 de UMA dor-mini como porta. Quem compra o pequeno compra o grande.

Dois loops ao mesmo tempo = impossível saber o que funcionou. Registrar cada loop: hipótese → mudança → dias → resultado → aprendizado.

### Passo 4 — Critério de desistência

**Insistir se:** há conversa acontecendo · alguém pediu "me avisa quando abrir" · gargalo é operacional.
**Matar e voltar ao Pilar 1 se:** 30 dias + 3 loops + zero conversa de fundo de funil · protagonista perdeu disposição (sem autorização = sem oferta) · recorte comprovadamente sem mercado hoje.
Matar oferta fraca rápido não é fracasso — é Pilar 1 feito com dado real que antes não existia.

### Passo 5 — A primeira venda

Registrar NO DIA: data, valor, comprador (anonimizado ok), origem (abordagem/tráfego/indicação), qual ajuste veio antes. Virar case: pedir depoimento (áudio > texto) com permissão — **jamais fabricar ou "melhorar" depoimento** (Contrato 2; a protagonista assina com a reputação dela). Sem permissão → "Anônimo, [cidade], [faixa]". O case entra na página e no anúncio do ciclo seguinte.

### Passo 6 — Salvar

`05-validacao/validacao.md`: 6 números do dia 0 · diagnóstico · log de loops · primeira venda · case + autorização · status (validado / em iteração / morto → Pilar 1). Registrar no `log.md` com marco **PRIMEIRA VENDA** em destaque.

## Card de etapa

```
---
✅ Produzido: [Primeira venda registrada + case | Ciclo de loops em andamento — loop N]
📄 Arquivo:   05-validacao/validacao.md
⏸  Pausar:    /pad-salvar
➡️  Próximo:   [/pad-escala (≥1 venda) | continuar loop N — rever em X dias]
---
```

## Consolidador (obrigatório)

`consolidadores/05-validacao.md` (mín. 1.500 palavras) + `.docx` via protocolo compartilhado: ponto de partida · cada loop (hipótese/ajuste/duração/resultado/aprendizado, 200+ cada) · a primeira venda (quem, origem, tempo até pagar, frase literal do comprador se houver, 250+) · case gerado · o que a venda confirmou vs o que segue hipótese (200+) · próximo passo.

## Checklist pré-envio (falhou um → reescreve)

1. [ ] Diagnóstico saiu dos 6 números + triagem das abordagens (não de impressão)?
2. [ ] Desculpa do operador foi nomeada e cortada (não acolhida como dado)?
3. [ ] Ancoragem emocional entregue antes dos loops?
4. [ ] Um loop por vez, com registro de hipótese?
5. [ ] Zero depoimento/número fabricado ou "melhorado"?
