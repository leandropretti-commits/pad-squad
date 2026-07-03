# PAD · Protocolo do Painel (visão viva do projeto)

> **VOCÊ É UMA SKILL DO PROTOCOLO ATIVO DIGITAL. Esta leitura é a lei do painel, não pausa.**
> Princípio-mãe: o operador NÃO vai lembrar de conferir o estado. A squad empurra o painel pra frente dele — push, nunca pull.

Toda skill operacional (raio-x, destilação, oferta, disparo, prova-venda, escala, pagina, ads, posicionamento) obedece a este protocolo. O arquivo canônico é `00-contexto/PAINEL.md`.

---

## Quando o painel aparece (os 3 gatilhos de push)

1. **AO ABRIR a skill** — antes de pedir qualquer coisa, imprimir o **mini-painel** (barra + pilar ativo + "você está aqui" + próximo passo). O operador reancorada em 2 segundos onde está.
2. **AO FECHAR a skill** — atualizar `00-contexto/PAINEL.md` e imprimir o **painel completo** (o card de etapa evoluído). Sempre com o rodapé de auto-anúncio.
3. **SOB DEMANDA** — se o operador digitar "painel", "onde estou", "onde eu tô", "cadê meu projeto", "o que já fiz", "estado do projeto" (ou variação), imprimir o painel na hora, sem executar mais nada. Vale em qualquer skill.

---

## Formato visual (canônico — usar sempre este)

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PROJETO: [nome] · [protagonista] · [ticket]
 [barra]   Pilar [N] de 7
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 [icone] 1    Extração ........... [status curto]
 [icone] 1.5  Método ............. [status]
 [icone] 2    Oferta ............. [status]
 [icone] 3    Disparo ............ [status]   [← VOCÊ ESTÁ AQUI se ativo]
 [icone] 3.5  Posicionamento ..... [status]
 [icone] 4    Prova de venda ..... [status]
 [icone] 4.5  Escala ............. [status]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 ➡  PRÓXIMO: [ação concreta e específica]
 ⏱  Dia [X] de 30   ·   🎯 meta: 1ª venda
 💡 Digite "painel" pra ver isso a qualquer momento
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Ícones de status (fixos):** `✓` feito · `▶` em andamento (o ativo) · `○` pendente · `⚠` travado (buraco/pendência que impede avançar).

**Barra de progresso:** 22 blocos, proporcional aos 7 marcos (1, 1.5, 2, 3, 3.5, 4, 4.5). `█` preenchido, `░` vazio. Ex.: 3 de 7 ≈ `█████████░░░░░░░░░░░░░`.

**Mini-painel (abertura):** só as 3 primeiras linhas (projeto + barra) + a linha do pilar ativo + o `➡ PRÓXIMO`. Versão curta pra não poluir o começo da skill.

**Status curto de cada linha:** o essencial em ~4 palavras — o nome do que ficou pronto (recorte, nome do método, preço, X/20 abordagens), não frase longa.

**Dia X de 30:** contar de `00-contexto/contexto.md` (data de início do projeto) até hoje. Sem data de início registrada, omitir a linha do relógio (não inventar).

---

## Como manter o `PAINEL.md`

- É um **snapshot**, não log: cada skill SOBRESCREVE o arquivo com o estado atual ao terminar (o log cronológico continua em `log.md`).
- Ler o estado dos arquivos reais (existe `extracao.md`? `metodo.md` está validado? quantas abordagens no `disparo.md`?) — nunca chutar status. Arquivo ausente = `○`. Pendência/`[BURACO]` que trava = `⚠`.
- O `➡ PRÓXIMO` é sempre UMA ação concreta e executável (não "avançar no funil" — sim "enviar as 12 abordagens que faltam").
- Regra de voz (pad-voz.md) vale aqui: honesto. Se travou, o ícone é `⚠` e o próximo passo é destravar — não maquiar progresso.

## Gate (antes de fechar qualquer skill)

1. [ ] `00-contexto/PAINEL.md` atualizado com o estado REAL dos arquivos?
2. [ ] Painel impresso na resposta, com barra + "você está aqui" + próximo passo específico?
3. [ ] Rodapé "digite painel" presente?
