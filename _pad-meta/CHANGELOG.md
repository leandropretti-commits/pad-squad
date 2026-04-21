# Changelog — Squad PAD (Protocolo Ativo Digital)

Formato baseado em [Keep a Changelog](https://keepachangelog.com/).
Versionamento segue [SemVer](https://semver.org/): `MAJOR.MINOR.PATCH`.

- **PATCH** (`1.0.X`) — correção de regra, bug de copy, ajuste fino
- **MINOR** (`1.X.0`) — nova capacidade sem quebrar uso anterior
- **MAJOR** (`X.0.0`) — mudança estrutural que exige o aluno refazer fluxo

---

## [1.0.0] — 2026-04-22 — MVP público

Primeira versão pública da squad PAD. Release oficial no GitHub.

### Squad (8 skills + 2 recursos compartilhados)

**Orquestrador**
- `protocolo-ativo-digital` — conduz pelos 4 pilares

**Pilares**
- `pad-raio-x` — pilar 1: diagnóstico do ativo
- `pad-destilacao-metodo` — pilar 1.5: extração do método
- `pad-engenharia-oferta` — pilar 2: oferta + preço + garantia
- `pad-disparo-inicial` — pilar 3: primeiros contatos e testes
- `pad-prova-venda` — pilar 4: validação com venda real
- `pad-escala` — pós-prova: sistematização

**Auxiliar**
- `agente-pagina` — criação de páginas de vendas (low / mid / hi ticket)

**Compartilhado**
- `_shared/consolidador-protocol.md`
- `_shared/swipe-file-paginas/` (modelos fictícios públicos)

### Regras travadas nesta versão

- Páginas de vendas sempre em **1ª pessoa do protagonista** (inegociável)
- Fluxo de publicação em 2 rodadas: RASCUNHO com placeholders → validação + assets → versão final → deploy
- Anatomia por ticket: Low 14 blocos (sem VSL) / Mid 16 blocos (com VSL) / Hi 14 blocos
- Low ticket: sem preço no hero, sem vocabulário "mini-curso", modelo perpétuo (sem turmas)
- `pad-destilacao-metodo`: suporte a modo `especialista-solo` via Plano C (auto-destilação guiada)
- `protocolo-ativo-digital`: detecção automática de modo (`co-producao` vs `especialista-solo`) via Q2

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
