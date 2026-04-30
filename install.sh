#!/bin/bash
# install.sh — Squad PAD (Protocolo Ativo Digital)
# Funciona tanto via git clone quanto via download de zip do GitHub

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Instalando PAD Squad..."

# Copiar skills para ~/.claude/skills/ (excluindo commands/ e pastas ocultas como .git)
find "$SCRIPT_DIR" -mindepth 1 -maxdepth 1 -type d ! -name commands ! -name '.*' \
  -exec cp -r {} ~/.claude/skills/ \;

# Copiar commands para ~/.claude/commands/
mkdir -p ~/.claude/commands
cp "$SCRIPT_DIR/commands/"*.md ~/.claude/commands/

VERSION=$(cat "$SCRIPT_DIR/_pad-meta/VERSION" 2>/dev/null || echo "?")
echo ""
echo "PAD Squad v$VERSION instalado com sucesso."
echo ""
echo "Abra o Claude Code, navegue para o seu projeto e rode:"
echo ""
echo "    /protocolo-ativo-digital"
