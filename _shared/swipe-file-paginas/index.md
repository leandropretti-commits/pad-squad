# Swipe File — Páginas de Venda

> Fonte única de referências visuais para `/agente-pagina` e qualquer skill do PAD que gere página.
> A **ANATOMIA** de blocos (o que entra, em que ordem, o que é obrigatório) mora em `~/.claude/skills/agente-pagina/skill.md`.
> Este `index.md` guarda as **referências visuais** e meta-informações de escolha.
> Os HTMLs aqui são read-only — servem como exemplo de execução para a IA ler CSS, estrutura HTML, e tom visual.

---

## Regra de uso

1. `/agente-pagina` identifica o ticket da oferta (low / mid / hi / pre-venda) a partir do `oferta.md` ou `03-oferta/` do projeto.
2. Lê este `index.md` e escolhe a referência **mais alinhada ao nicho** (tabela abaixo).
3. Lê a **anatomia de blocos** correspondente em `~/.claude/skills/agente-pagina/skill.md` (seções "Low ticket", "Mid ticket", "High ticket", "Pré-venda").
4. Lê o HTML da referência para entender CSS, espaçamento, tom visual.
5. **Adapta visual** à identidade do cliente (quando houver) ou ao nicho (saúde = azul/verde, jurídico = azul escuro/dourado, lifestyle = minimalista, etc.).
6. **Preserva a estrutura de blocos** — só o visual adapta. Ordem dos blocos é inegociável.

---

## Modelos fictícios publicados (referência visual end-to-end)

Três páginas fictícias, geradas seguindo a anatomia desta skill, publicadas no Vercel. São a referência **mais próxima** do output esperado — mostram o tratamento de imagens, ritmo dos blocos, placeholders de VSL, mockup de produto no hero, depoimentos text-only, foto de autor.

| Ticket | URL | Source | Design system aplicado |
|---|---|---|---|
| Low | https://pad-modelo-low.vercel.app | `modelos-ficticios/low/index.html` | Facial Academy (violeta + rosa + verde · Montserrat + Dancing Script) |
| Mid | https://pad-modelo-mid.vercel.app | `modelos-ficticios/mid/index.html` | Protocolo Venda Viral (laranja + verde CTA · Nunito + Playfair) |
| Hi | https://pad-modelo-hi.vercel.app | `modelos-ficticios/hi/index.html` | Mentoria Case (creme + dourado · Cormorant italic + Raleway) |

Esses modelos são **visual**, não template de estrutura. A arquitetura de blocos sempre vem de `skill.md` e o design system **adapta ao nicho do cliente real** (não copiar a paleta do modelo cegamente).

---

## Mapa por ticket

### Low ticket (R$27-97)

| # | Referência | Nicho | Paleta | Fonte | Quando usar |
|---|---|---|---|---|---|
| 01 | *(modelo fictício)* | Caligrafia / Estética | Violeta + rosa + verde | Montserrat + Dancing Script | Base. Use até ter uma referência real do seu nicho. |
| — | *adicione suas referências reais aqui* | — | — | — | Siga o guia "Como adicionar" abaixo. |

**Anatomia (ver skill.md):** Low ticket = **14 blocos**, sem VSL, decisão emocional rápida.

---

### Mid ticket (R$197-1.497)

| # | Referência | Nicho | Paleta | Fonte | Quando usar |
|---|---|---|---|---|---|
| 01 | *(modelo fictício)* | Confeitaria / Método | Laranja + verde CTA | Nunito + Playfair | Base. Use até ter uma referência real. |
| — | *adicione suas referências reais aqui* | — | — | — | — |

**Anatomia (ver skill.md):** Mid ticket = **16 blocos**, VSL obrigatória no bloco 01, muita prova social.

---

### Hi ticket (R$2.497+)

| # | Referência | Nicho | Paleta | Fonte | Quando usar |
|---|---|---|---|---|---|
| 01 | *(modelo fictício)* | Mentoria premium | Creme + dourado + olive | Cormorant Garamond + Raleway | Base editorial. Use até ter referência real. |
| — | *adicione suas referências reais aqui* | — | — | — | — |

**Anatomia (ver skill.md):** Hi ticket = **14 blocos**. Tom editorial/premium. Nunca mostra preço. CTA = aplicação/qualificação.

---

### Pré-venda (qualquer ticket)

Sem referências ainda. Usar as anatomias documentadas no `skill.md`.
Quando aparecer referência, adicionar aqui seguindo o guia abaixo.

---

## Tags de asset por bloco

### Low ticket (14 blocos)
| Bloco | Asset necessário | Observação |
|---|---|---|
| 01 Hero | **[asset: foto da especialista OU mockup do produto]** | Se nenhum for fornecido, gerar mockup SVG/CSS com nome do produto + badge "MOCKUP — substituir". Hero só-texto apenas se o operador confirmar. |
| 02 Prova visual | **[asset: 3-5 prints de depoimento]** | Placeholder gerado, mas **sempre** pedir reais |
| 07 Passo a passo | [asset: ícones/ilustrações opcionais] | SVG genérico OK |
| 08 Conteúdo incluso | — | Apenas mini-headline + descrição do benefício. **Sem valores tachados.** Ancoragem com preços fica só no bloco 10. |
| 12 Quem sou eu | **[asset: foto profissional do especialista]** | Headshot 800x1000px mínimo |
| 14 FAQ | — | Sem asset |

### Mid ticket (16 blocos)
| Bloco | Asset necessário | Observação |
|---|---|---|
| 01 Hero + VSL | **[asset: VSL — VÍDEO REAL, 8-12 min]** | Placeholder = player fake com overlay "⚠ SUBSTITUIR". |
| 05 História pessoal | [asset: 2-3 fotos pessoais do especialista] | Opcional, forte pra lifestyle/conteúdo |
| 06 Método visual | [asset: diagrama/fluxo] | Pode gerar SVG no placeholder |
| 07 Prova social | **[asset: 6-12 prints + vídeos-depoimento]** | Mix de formatos. |
| 08 Authority | [asset: logos de mídia / carousel de avatares] | Opcional |
| 10 Entregáveis | [asset: mockup 3D do produto] | Opcional |
| 11 Bônus | [asset: visual do bônus] | Opcional |
| 13 Garantia | [asset: selo/badge] | SVG gerado OK |
| 14 Quem sou eu | **[asset: foto profissional do especialista]** | Headshot |

### Hi ticket (14 blocos)
| Bloco | Asset necessário | Observação |
|---|---|---|
| 01 Hero | [asset: logo do programa — tipográfico] | Geralmente só nome serif |
| 03 Pilares | [asset: 3-5 fotos reais dos pilares] | Fotos do mentor / eventos / bastidores |
| 04 Prova social | **[asset: 4-8 fotos profissionais de alumni + resultados específicos]** | Nunca placeholder — só com material real |
| 09 Bônus (experiência) | **[asset: foto real do evento/local]** | Nunca imagem de banco |
| 10 Autor | **[asset: foto profissional do mentor]** | Headshot ou split com texto |

---

## Convenções pra placeholders (enquanto aguarda asset real)

1. **Fotos de pessoa (especialista / alumni):** SVG/CSS com avatar geométrico + overlay vermelho `⚠ SUBSTITUIR: {descrição}`.
2. **Prints de depoimento:** card gerado com texto + nome fake "{Cliente Exemplo}" + badge amarelo "EXEMPLO — substituir por print real".
3. **VSL (mid ticket):** retângulo 16:9 preto com play button branco + overlay vermelho `⚠ VSL TEMPORÁRIA — Substituir por vídeo real antes de publicar. Duração: 8-12 min.`
4. **Mockup de produto:** SVG genérico de laptop/capa + label "MOCKUP — substituir por arte real do produto (opcional)".
5. **Selo de garantia:** SVG gerado com "{X dias} de garantia" — pode ficar final, não precisa substituir.

**Regra inegociável:** todo placeholder tem overlay/label visível. Nunca sair parecendo "final" por engano.

---

## Como adicionar uma nova referência

1. Copie o HTML da nova referência pra pasta correspondente (`low/`, `mid/`, `hi/`, `pre-venda/`) com nome sequencial (`02-nome-curto.html`).
2. Adicione linha na tabela "Mapa por ticket" com: nicho, paleta, fonte, quando usar.
3. Se introduzir um bloco novo que não existe na anatomia atual do `skill.md`, documentar lá primeiro.

---

**Última atualização:** 2026-04-22 — v1.0.0 release público. Referências reais removidas (privadas). Use os modelos fictícios como base e adicione as suas próprias.
