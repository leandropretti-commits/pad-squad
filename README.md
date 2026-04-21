# Squad PAD — Protocolo Ativo Digital

> Transforme o conhecimento de alguém próximo (esposa, sócio, familiar) em vendas reais em 30 dias.
>
> Squad de skills do [Claude Code](https://claude.ai/code) que conduz o operador pelos 4 pilares do PAD: extração de ouro → destilação de método → engenharia de oferta → disparo inicial → prova de venda.

---

## Instalação

1. Clone ou baixe este repositório
2. Copie as pastas para `~/.claude/skills/`

```bash
# Opção 1 — clone direto na pasta de skills
git clone https://github.com/leandropretti/pad-squad ~/.claude/skills-temp
cp -r ~/.claude/skills-temp/* ~/.claude/skills/

# Opção 2 — manual
# Arraste as pastas (protocolo-ativo-digital/, pad-raio-x/, etc.) para ~/.claude/skills/
```

3. Abra um projeto no Claude Code e rode:

```
/protocolo-ativo-digital
```

---

## Comandos

| Comando | O que faz |
|---|---|
| `/protocolo-ativo-digital` | Inicia ou retoma o protocolo |
| `/pad-raio-x` | Pilar 1 — diagnóstico do ativo |
| `/pad-destilacao-metodo` | Pilar 1.5 — extração do método |
| `/pad-engenharia-oferta` | Pilar 2 — oferta, preço e garantia |
| `/pad-disparo-inicial` | Pilar 3 — página + primeiros disparos |
| `/pad-prova-venda` | Pilar 4 — ajuste até a primeira venda |
| `/pad-escala` | Pilar 4.5 — sistematização pós-prova |
| `/agente-pagina` | Gera página HTML completa (low/mid/hi ticket) |
| `/pad_version` | Mostra a versão instalada |

---

## Para quem é

**Modo co-produção (padrão):** gestor de tráfego, dono de micro-agência ou consultor que quer transformar o conhecimento de alguém próximo (esposa, sócio, familiar) em produto digital.

**Modo especialista-solo:** você mesmo é o especialista e quer lançar seu próprio conhecimento sem intermediário. O `/protocolo-ativo-digital` detecta isso automaticamente pela sua resposta à pergunta 2 do diagnóstico.

---

## Modelos de página (fictícios, referência visual)

| Ticket | URL |
|---|---|
| Low | https://pad-modelo-low.vercel.app |
| Mid | https://pad-modelo-mid.vercel.app |
| Hi | https://pad-modelo-hi.vercel.app |

---

## Versão

`1.0.0` — ver `_pad-meta/CHANGELOG.md`

---

## Reportar problema

Abre uma issue aqui no repositório ou envia pra leandro.pretti@gmail.com com:
1. Versão instalada (`/pad_version`)
2. O que pediu, o que veio, o que esperava
