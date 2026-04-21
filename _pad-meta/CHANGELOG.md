# Changelog — Squad PAD (Protocolo Ativo Digital)

Formato baseado em [Keep a Changelog](https://keepachangelog.com/).
Versionamento segue [SemVer](https://semver.org/): `MAJOR.MINOR.PATCH`.

- **PATCH** (`1.0.X`) — correção de regra, bug de copy, ajuste fino
- **MINOR** (`1.X.0`) — nova capacidade sem quebrar uso anterior
- **MAJOR** (`X.0.0`) — mudança estrutural que exige o aluno refazer fluxo

---

## [1.1.1] — 2026-04-22 — Correções pontuais pós-v1.1.0

### Corrigido
- `pad-engenharia-oferta`: próximo passo apresentava menu A/B (agente-pagina vs pad-disparo-inicial) apesar do skill apontar só para pad-disparo-inicial — instrução agora prescreve texto literal + bloqueio explícito
- `agente-pagina`: design system separou "Saúde / medicina adulto" (azul clínico) de "Maternidade / pediatria / fono infantil" (rosa suave + verde menta + Nunito + Playfair Display) — fonoaudióloga infantil estava caindo na família errada

---

## [1.1.0] — 2026-04-22 — Anti-drift + design system por nicho

### Adicionado
- `protocolo-ativo-digital`: geração automática de `CLAUDE.md` na pasta do projeto ao iniciar — mantém regras ativas em toda a sessão e previne que o modelo ignore delegações para skills especializadas
- `agente-pagina`: tabela de design system por família de nicho (8 famílias — Saúde/Beleza/Negócios/Jurídico/Gastronomia/Educação/Fitness/Espiritualidade) com paleta hex e tipografia baseadas em psicologia da cor
- `agente-pagina` + `pad-engenharia-oferta`: definição completa dos 3 testes obrigatórios de copy — Teste da Vovó, Regra dos 3 Segundos, Brevidade Inteligente (com exemplos ❌/✅)
- `agente-pagina`: comportamento pós-entrega — modelo explica paleta usada, racional e convida operador a fornecer cores da marca

### Corrigido
- `pad-disparo-inicial`: bloqueios explícitos (`⛔ BLOQUEIO`) substituem os 50 linhas de estrutura de página e 3 blocos de geração de criativos que causavam geração inline em vez de delegação para `/agente-pagina` e `/agente-ads`
- `agente-pagina`: instrução bloqueando leitura de HTMLs de clientes reais na pasta `_shared/swipe-file-paginas/low|mid|hi/` — evita vazamento de design system de projetos internos (APLV) para projetos novos
- `README.md` (staging): URL de instalação corrigida (`leandropretti` → `leandropretti-commits`) e one-liner de instalação limpo

---

## [1.0.0] — 2026-04-22 — MVP público

Primeira versão pública da squad PAD. Publicada em https://github.com/leandropretti-commits/pad-squad
>
> **Acumulado desde 1.0.0 inicial:**
> - Adicionado `/pad-salvar` — pausa segura (checkpoint de sessão + bloco Pendente no log do projeto PAD ativo)

### Squad (9 skills + 2 recursos compartilhados)

**Orquestrador**
- `protocolo-ativo-digital` — conduz pelos 4 pilares

**Pilares**
- `pad-raio-x` — pilar 1: diagnóstico do ativo
- `pad-destilacao-metodo` — pilar 1: extração do método
- `pad-engenharia-oferta` — pilar 2: oferta + preço + garantia
- `pad-disparo-inicial` — pilar 3: primeiros contatos e testes
- `pad-prova-venda` — pilar 4: validação com venda real
- `pad-escala` — pós-prova: sistematização

**Auxiliar**
- `agente-pagina` — criação de páginas de vendas (low / mid / hi ticket)

**Compartilhado**
- `_shared/consolidador-protocol.md` — consolidador de protocolos
- `_shared/swipe-file-paginas/` — biblioteca de referências visuais

### Regras travadas nesta versão

- Páginas de vendas sempre em **1ª pessoa do protagonista** (regra inegociável — documentada em `agente-pagina/skill.md`)
- Fluxo de publicação em 2 rodadas: RASCUNHO com placeholders → validação + assets → versão final → deploy Vercel
- Anatomia por ticket: Low 14 blocos (sem VSL) / Mid 16 blocos (com VSL) / Hi 18+ blocos
- Voz do operador distinta da voz do protagonista (co-produção)

---

## Template pra próximas entradas

```
## [X.Y.Z] — AAAA-MM-DD — título curto

### Adicionado
- …

### Alterado
- …

### Corrigido
- …

### Removido
- …
```
