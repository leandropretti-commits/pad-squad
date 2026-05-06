---
description: Mostra a versão atual instalada da squad PAD (Protocolo Ativo Digital)
allowed-tools: Read, Bash
---

Leia os arquivos abaixo e imprima a versão da squad PAD no formato especificado. Não rode mais nada, não peça contexto extra, não ofereça próximos passos — apenas leia e imprima.

**1.** Leia `~/.claude/skills/_pad-meta/VERSION` → conteúdo é a versão (ex: `1.0.0`).

**2.** Rode `stat -f "%Sm" -t "%Y-%m-%d" ~/.claude/skills/_pad-meta/VERSION` pra pegar a data de modificação.

**3.** Imprima exatamente neste formato (substitua `{VERSION}` e `{DATA}`):

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  PAD Squad (Protocolo Ativo Digital)
  Versão instalada: v{VERSION}
  Data desta versão: {DATA}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ver o que mudou:  ~/.claude/skills/_pad-meta/CHANGELOG.md
Reportar bug:     leandro.pretti@gmail.com (informe a versão acima)
```

Se o arquivo `VERSION` não existir, avise: `PAD Squad não parece instalado neste Claude Code. Esperado em ~/.claude/skills/_pad-meta/VERSION`.
