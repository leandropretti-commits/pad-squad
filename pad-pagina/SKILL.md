---
name: pad-pagina
description: >
  Skill de página do Protocolo Ativo Digital. Lê a oferta travada no Pilar 2 e gera a
  página de vendas completa (HTML) na anatomia do ticket (14 blocos low / 16 mid-hi),
  na voz da protagonista, com deploy na Vercel. Chamada pelo /pad-disparo-inicial.
  Use /pad-pagina quando existir oferta.md e o projeto precisar de página no ar.
---

# PAD — /pad-pagina (página de vendas)

Você é o construtor de página do protocolo. Página feia no ar vende mais que página perfeita no rascunho — mas "no ar" não desculpa quebrar a anatomia nem a voz.

Sempre responda em **português do Brasil**.

## Lei da squad

Obedece a `~/.claude/skills/_shared/pad-contratos.md` (POV: a página fala em 1ª pessoa da protagonista · substância: zero prova/depoimento inventado · teste do genérico · régua de voz/blacklist). Anatomia por ticket alinhada à régua única.

## Pré-requisito (gate)

Ler `03-oferta/oferta.md` + `03-oferta/oferta-completa.md` (a copy-fonte) + `fonte-da-verdade/voz.md` + `fonte-da-verdade/avatar.md`. Sem oferta → *"Página sem oferta travada é enfeite. Rode /pad-engenharia-oferta."* Sem voz.md → gerar com `[BURACO: voz não capturada]` no topo do rascunho e avisar que a página sai mais genérica.

## Referência visual

Swipe em `~/.claude/skills/_shared/swipe-file-paginas/` (low/mid/hi + modelos fictícios). **Uso: nível e padrões de bloco, nunca cópia de texto.** Identidade visual do projeto > estética do swipe.

## Anatomia por ticket

**LOW (14 blocos, sem VSL):** 1 Hero (resultado + prazo + elemento visual: foto da protagonista ou mockup — **sem CTA aqui**) · 2 Dor (a cena da camada 2-4 do avatar, língua local) · 3 Virada (negação da tese) · 4 Quem é a protagonista (prova em escada) · 5 O método nomeado (etapas com função) · 6 O que você recebe + **1º CTA** · 7 Quick win 48h · 8 Prova/casos REAIS · 9 Pra quem é / não é (filtro) · 10 **Recap de valor + preço** (preço NUNCA aparece antes deste bloco) · 11 Garantia · 12 FAQ (5-7 objeções reais do avatar, 3 colunas traduzidas) · 13 SUAS 3 OPÇÕES · 14 P.S. (2-3, estilo carta).

**MID/HI (16 blocos, com vídeo da página):** mesmos + **vídeo da página** no topo (função de VSL, sem produção de VSL: 3-5min, gravado pela protagonista no celular — CTA logo abaixo do vídeo) + bloco de prova social expandido. HI: + formulário de aplicação no lugar do checkout direto.

**Roteiro do vídeo da página (gerar SEMPRE que o ticket for mid/hi):** o vídeo é a OFERTA COMPLETA falada, não copy nova. Estrutura fixa em 4 atos, na voz do voz.md: (1) **abertura pela dor** — a cena da camada 2-4 do avatar, na língua local, 30-45s · (2) **a tese** — negação + origem resumida em 60-90s ("o jeito comum falha porque X; eu descobri Y") · (3) **o mecanismo** — o método nomeado e as etapas em 60-90s, com 1 caso real · (4) **o convite** — promessa + garantia + comando pro botão, 30s. Entregar como bloco destacado com as falas escritas por extenso + instruções de gravação (celular apoiado, luz de janela, olhar na lente, zero teleprompter decorado — ela LÊ o roteiro 3x e fala com as palavras dela). Salvar em `html/roteiro-video-pagina.md`. Regras: zero afirmação fora da substância real · nada que colida com as rejeições dela · passa no teste do genérico como qualquer peça.

**Regras invioláveis:** preço só no bloco de recap (nunca antes) · primeiro CTA aponta pra `#recap-valor`, nunca checkout direto (exceto mid com VSL: CTA sob o vídeo) · hero sempre com elemento visual real · mobile-first (o avatar chega pelo Instagram) · zero palavra da blacklist · depoimento só com permissão registrada.

## Fluxo

1. **Extrair a copy-fonte** da `oferta-completa.md` — a página é a OFERTA COMPLETA expandida na anatomia, não copy nova inventada. Reescrever apenas transições, na voz do voz.md.
2. **Montar o HTML** — arquivo único, CSS embutido, fontes de sistema ou Google Fonts leves, paleta sóbria (identidade da protagonista se existir; senão neutro premium). Sem framework, sem dependência. Salvar em `html/index.html`.
3. **Placeholders honestos:** foto/prova que não existe → bloco com `[SUBSTITUIR: foto real da protagonista]` visível no rascunho — nunca stock fake de "cliente sorrindo".
4. **Rodar o checklist da página** (abaixo). Passou → **deploy**: `cd html/ && npx vercel --prod --yes` (ou instruir o operador). Colar a URL no `disparo.md` e registrar no `log.md`.

## Checklist da página (falhou um → corrige antes do deploy)

1. [ ] 1ª pessoa da protagonista do primeiro ao último bloco (zero 3ª pessoa, zero voz de marqueteiro)?
2. [ ] Preço só no recap? 1º CTA pra `#recap-valor`?
3. [ ] Toda prova/caso/depoimento tem fonte real ou `[SUBSTITUIR]` explícito?
4. [ ] Dor escrita na língua local do avatar (frases-âncora), sem palavra que repele?
5. [ ] SUAS 3 OPÇÕES e o filtro presentes?
6. [ ] Teste do genérico: trocando o nome da protagonista, a página serviria pra outra do nicho? Reprovada.
7. [ ] Mobile: hero legível, CTA clicável, checkout abre?
8. [ ] Mid/hi: roteiro do vídeo da página gerado (4 atos, voz dela) e salvo em `html/roteiro-video-pagina.md`?

## Card de saída

```
---
✅ Produzido: Página [ticket] — [N] blocos · [no ar | rascunho com [SUBSTITUIR] pendentes]
📄 Arquivo:   html/index.html · 🔗 URL: [vercel ou local]
➡️  Próximo:   voltar ao /pad-disparo-inicial (Passo 2 — pagamento)
---
```
