---
name: pad-squad-manifest
description: Lista oficial das skills que compõem a squad PAD — usada pelo /pad_version e pelo processo de release.
---

# Manifesto da Squad PAD

> Versão atual: ver `VERSION` (mesmo diretório).
> Changelog: ver `CHANGELOG.md`.

## Skills que compõem a squad

### Orquestrador
- `protocolo-ativo-digital/` — conduz o operador pelos 4 pilares

### Pilares
- `pad-raio-x/` — Pilar 1: diagnóstico do ativo
- `pad-destilacao-metodo/` — Pilar 1.5: extração do método
- `pad-engenharia-oferta/` — Pilar 2: oferta + preço + garantia
- `pad-disparo-inicial/` — Pilar 3: primeiros disparos
- `pad-prova-venda/` — Pilar 4: validação com venda real
- `pad-escala/` — Pilar 4.5: sistematização pós-prova

### Auxiliar
- `agente-pagina/` — criação de páginas de vendas (low/mid/hi ticket)

### Recursos compartilhados
- `_shared/consolidador-protocol.md`
- `_shared/swipe-file-paginas/`

### Metadata (este diretório)
- `_pad-meta/VERSION`
- `_pad-meta/CHANGELOG.md`
- `_pad-meta/manifest.md` (este arquivo)
- `_pad-meta/README.md`

---

## O que NÃO faz parte da squad PAD

- `o-sistema/` — outra squad (projeto Money Brand / posicionamento)
- `agente-ads`, `agente-funil`, `agente-metodo`, `agente-oferta`, `agente-produto`, `agente-validacao`, `agente-vsl`, `posicionamento` — squad "oferta" antiga (antiga `agente-storyads` substituída por `posicionamento`)
- `design-system/`, `find-skills/`, `skill-creator/`, `salvar/`, `sexta/`, etc. — utilitários gerais
