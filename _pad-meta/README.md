# Squad PAD — Protocolo Ativo Digital

> Sistema completo pra transformar o conhecimento de alguém próximo (esposa, sócio, familiar) em vendas reais em 30 dias.
> Squad de skills do Claude Code que conduz o operador pelos 4 pilares do PAD.

---

## Como usar

Dentro do Claude Code, digite:

```
/protocolo-ativo-digital
```

O orquestrador te recebe e conduz pelos pilares. Cada pilar tem sua skill própria, invocada automaticamente conforme o fluxo avança.

---

## Comandos úteis

| Comando | O que faz |
|---|---|
| `/protocolo-ativo-digital` | Inicia ou retoma o protocolo |
| `/pad-salvar` | Pausa segura — salva checkpoint + bloco Pendente no log do projeto, pra retomar depois |
| `/pad_version` | Mostra a versão instalada (pra reportar bug) |

---

## Versão instalada

Ver arquivo `VERSION` neste diretório, ou rode `/pad_version`.

---

## Como atualizar

> **Nota:** MVP ainda não publicado. Quando sair a release oficial, este README vai trazer o comando exato de update (`bash update.sh` ou similar).

---

## Estrutura da squad

Ver `manifest.md` — lista oficial das skills que compõem o PAD.

---

## Reportar problema

Quando rodar contra algum problema:

1. Rode `/pad_version` e anote a versão
2. Descreva o bug (o que pediu, o que veio, o que esperava)
3. Envia pro Leandro (WhatsApp ou e-mail leandro.pretti@gmail.com)

O Leandro ajusta a skill, publica uma PATCH (ex: 1.0.0 → 1.0.1) e te passa o comando de update.
