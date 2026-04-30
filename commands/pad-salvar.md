---
description: Pausa segura do PAD. Salva checkpoint de sessão + bloco Pendente no log.md do projeto PAD atual, pra retomar exatamente de onde parou.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# /pad-salvar — Pausa segura do Protocolo Ativo Digital

Esta skill executa 5 passos em ordem. Não pule nenhum. Não invente atalhos.

**Contexto:** o aluno está no meio do PAD e precisa parar agora — vai fechar tudo e voltar depois. Este comando garante que:
1. O checkpoint de sessão em `~/.claude/history/` guarda o que aconteceu na conversa (igual `/salvar`).
2. O log do projeto PAD (`log.md`) tem um bloco `🔄 Pendente` com o ponto exato de retomada.
3. Bloco Pendente antigo não-resolvido é marcado como Substituído antes de apender o novo (evita dois abertos).
4. Tudo funciona mesmo se o aluno estiver em subpasta do projeto ou usando o layout legado.

---

## Passo 1 — Localizar a raiz do projeto PAD

Execute este bloco inteiro em uma única tool call Bash. Ele tenta duas estratégias e imprime o resultado.

```bash
set -u
DIR="$PWD"
PAD_ROOT=""

# Estratégia A: subir da árvore atual procurando marker de projeto PAD
while [ "$DIR" != "/" ] && [ "$DIR" != "$HOME" ] && [ -n "$DIR" ]; do
  NAME="$(basename "$DIR")"
  # Marker 1: nome começa com projeto-pad-
  if [[ "$NAME" == projeto-pad-* ]]; then
    PAD_ROOT="$DIR"; break
  fi
  # Marker 2: tem 00-contexto/log.md (layout novo)
  if [ -f "$DIR/00-contexto/log.md" ]; then
    PAD_ROOT="$DIR"; break
  fi
  # Marker 3: layout legado — log.md na raiz + pelo menos uma pasta ou arquivo de pilar
  if [ -f "$DIR/log.md" ] && { [ -d "$DIR/01-extracao" ] || [ -f "$DIR/extracao.md" ] || [ -f "$DIR/briefing.md" ] || [ -f "$DIR/contexto.md" ]; }; then
    PAD_ROOT="$DIR"; break
  fi
  DIR="$(dirname "$DIR")"
done

# Estratégia B (fallback): aluno está UM NÍVEL ACIMA do projeto
if [ -z "$PAD_ROOT" ]; then
  MATCHES=()
  while IFS= read -r -d '' p; do
    MATCHES+=("$p")
  done < <(find "$PWD" -maxdepth 1 -mindepth 1 -type d -name 'projeto-pad-*' -print0 2>/dev/null)
  if [ "${#MATCHES[@]}" -eq 1 ]; then
    PAD_ROOT="${MATCHES[0]}"
  elif [ "${#MATCHES[@]}" -gt 1 ]; then
    echo "RESULT=MULTI"
    printf 'CANDIDATE=%s\n' "${MATCHES[@]}"
    exit 0
  fi
fi

if [ -z "$PAD_ROOT" ]; then
  echo "RESULT=NONE"
  exit 0
fi

# Detectar layout (novo vs legado)
if [ -f "$PAD_ROOT/00-contexto/log.md" ] || [ -d "$PAD_ROOT/00-contexto" ]; then
  LAYOUT="new"
  LOG_PATH="$PAD_ROOT/00-contexto/log.md"
elif [ -f "$PAD_ROOT/log.md" ]; then
  LAYOUT="legacy"
  LOG_PATH="$PAD_ROOT/log.md"
else
  # Fallback: se tem pastas NN-* → novo; senão → legado
  if ls -d "$PAD_ROOT"/[0-9][0-9]-*/ >/dev/null 2>&1; then
    LAYOUT="new"
    LOG_PATH="$PAD_ROOT/00-contexto/log.md"
  else
    LAYOUT="legacy"
    LOG_PATH="$PAD_ROOT/log.md"
  fi
fi

# Detectar pilar ativo pelo arquivo mais recentemente modificado (ordem de prioridade = pilar mais avançado)
PILAR=""
for pair in \
  "06-escala/escala.md|Pilar 4.5 — Ascensão e Escala" \
  "escala.md|Pilar 4.5 — Ascensão e Escala" \
  "05-validacao/validacao.md|Pilar 4 — Prova de Venda" \
  "validacao.md|Pilar 4 — Prova de Venda" \
  "04-disparo/disparo.md|Pilar 3 — Disparo Inicial" \
  "disparo.md|Pilar 3 — Disparo Inicial" \
  "03-oferta/oferta.md|Pilar 2 — Engenharia de Oferta" \
  "oferta.md|Pilar 2 — Engenharia de Oferta" \
  "02-metodo/metodo.md|Pilar 1.5 — Destilação de Método" \
  "metodo.md|Pilar 1.5 — Destilação de Método" \
  "01-extracao/extracao.md|Pilar 1 — Extração de Ouro" \
  "extracao.md|Pilar 1 — Extração de Ouro"; do
  REL="${pair%%|*}"
  LABEL="${pair##*|}"
  if [ -f "$PAD_ROOT/$REL" ]; then
    PILAR="$LABEL"; break
  fi
done
[ -z "$PILAR" ] && PILAR="Sem pilar iniciado (só contexto)"

echo "RESULT=OK"
echo "PAD_ROOT=$PAD_ROOT"
echo "LAYOUT=$LAYOUT"
echo "LOG_PATH=$LOG_PATH"
echo "PILAR=$PILAR"
```

Interpretando a saída:

- **`RESULT=OK`** → siga adiante. Guarde mentalmente `PAD_ROOT`, `LAYOUT`, `LOG_PATH`, `PILAR`.
- **`RESULT=MULTI`** → múltiplos projetos como subpasta direta. Liste os `CANDIDATE=...` pro aluno e pergunte qual é o ativo. Depois volte a rodar este passo mentalmente com `PAD_ROOT` fixo como o escolhido (detecte layout/pilar no próximo passo via um Bash curto).
- **`RESULT=NONE`** → avise o aluno:
  > `/pad-salvar` só funciona dentro de (ou adjacente a) um projeto PAD. Não achei `projeto-pad-*` nem `log.md` na árvore a partir de `$PWD`. Abra um terminal dentro da pasta do projeto e rode de novo.
  >
  E pare. Não execute os passos seguintes.

---

## Passo 2 — Marcar bloco Pendente antigo como Substituído (se houver)

Leia `LOG_PATH` com a tool **Read**.

Se o arquivo **não existe**: pular para o Passo 3 (o Passo 4 vai criá-lo).

Se existe: procure o **último** bloco que começa com `## 🔄 Pendente` no arquivo. Se esse bloco **não** é seguido por um marcador de resolução (`## ✅ Resolvido` ou `## ⏸ Substituído`) antes do fim do arquivo, ele está aberto. Use a tool **Edit** pra alterar APENAS a linha do header dele:

- `old_string`: a linha exata, ex: `## 🔄 Pendente (2026-04-18 11:30)`
- `new_string`: `## ⏸ Substituído em {AAAA-MM-DD HH:MM atual} — era: 🔄 Pendente ({timestamp antigo})`

Regras:
- Edite **somente** o último header Pendente que está aberto. Não toque nos anteriores.
- Se todos os Pendentes antigos já foram resolvidos/substituídos, pule para o Passo 3.
- Se houver dúvida sobre qual é o "último aberto" (arquivo bagunçado), apenas prossiga sem editar — apender o novo bloco é suficiente. Não arrisque corromper histórico.

---

## Passo 3 — Criar checkpoint de sessão (com PWD do projeto)

Execute em uma única tool call Bash, substituindo `{PAD_ROOT}` pelo valor absoluto capturado no Passo 1:

```bash
HIST_DIR="$HOME/.claude/history/$(date +"%Y/%m")"
mkdir -p "$HIST_DIR"
FALLBACK="$HIST_DIR/$(basename "{PAD_ROOT}")-$(date +"%Y%m%d-%H%M%S").md"

if [ -f "$HOME/.claude/hooks/session-history.sh" ]; then
  (cd "{PAD_ROOT}" && bash "$HOME/.claude/hooks/session-history.sh") 2>/dev/null
  CHECKPOINT_PATH=$(ls -t "$HIST_DIR"/*.md 2>/dev/null | head -1)
  [ -z "$CHECKPOINT_PATH" ] && CHECKPOINT_PATH="$FALLBACK" && touch "$FALLBACK"
else
  touch "$FALLBACK"
  CHECKPOINT_PATH="$FALLBACK"
fi

echo "CHECKPOINT_PATH=$CHECKPOINT_PATH"
```

O `(cd ... && ...)` garante que o hook usa `{PAD_ROOT}` como `$PWD` — então `basename` retorna o nome correto (`projeto-pad-silvi`, não a subpasta onde o aluno estava). Se o hook não existir (instalação nova), o fallback cria o arquivo diretamente em `~/.claude/history/`.

A última linha da saída é o caminho do checkpoint. Guarde como `CHECKPOINT_PATH`.

Agora use **Read** pra ler `CHECKPOINT_PATH` e em seguida **Write** pra sobrescrevê-lo com o conteúdo abaixo, preenchido com contexto **real** da conversa atual:

```markdown
---
projeto: {basename de PAD_ROOT}
data: {AAAA-MM-DD HH:MM atual}
diretorio: {PAD_ROOT absoluto}
tipo: checkpoint-pad
projeto-pad: {basename de PAD_ROOT}
pilar-ativo: {PILAR capturado no Passo 1}
layout: {LAYOUT capturado no Passo 1}
---

# Sessão PAD: {basename de PAD_ROOT} — {data}

## O que foi feito nesta sessão
- {ação concreta 1 — ex: "Definido preço do Programa em R$1.497 com garantia de 7 dias"}
- {ação concreta 2}
- {...}

## Arquivos do projeto modificados
- {caminho relativo — o que mudou}
- {...}
- Se nenhum: "Nenhum arquivo modificado nesta sessão (discussão apenas)"

## Pilar ativo
{PILAR}. {1 frase sobre onde parou dentro do pilar}

## Fio da meada (o que ficou em aberto)
{Descrição específica: decisão pendente, número em teste, nome em debate, próxima ação. Não genérico.}

## Como retomar
Abrir `{PAD_ROOT}` e rodar `/protocolo-ativo-digital`. O orquestrador lê `{LOG_PATH}` e leva direto pro ponto. Atalho: `/{skill-específica-do-pilar}`.
```

**Regras de qualidade:**
- Cada item é algo **real** que aconteceu. Sem placeholder. Sem "continuar depois".
- "Fio da meada" precisa passar este teste: um agente novo lendo só isso consegue retomar sem perguntar nada? Se não → detalhe mais.

---

## Passo 4 — Apender bloco Pendente no log do projeto

Se `LOG_PATH` **não existe** (projeto sem log), crie-o com **Write** e inclua cabeçalho mínimo antes do bloco Pendente:

```markdown
# Log — {basename de PAD_ROOT}

> Log append-only. Cada entrada = ação de uma skill. Nunca editar entradas antigas.

```

Se **existe**, use **Edit** ou leia+concatene+escreva pra apender (nunca substitua o conteúdo existente).

Bloco a apender (sempre no fim do arquivo, com linha em branco antes):

```markdown

## 🔄 Pendente ({AAAA-MM-DD HH:MM atual})
**Skill ativa:** /{skill-do-pilar-atual, ex: /pad-engenharia-oferta}
**Discussão em aberto:** {resumo 1-3 frases do que ficou pendente}
**Contexto:** {decisões parciais tomadas, números mencionados, nomes em teste, preferências declaradas pelo aluno — tudo que um agente novo precisa saber pra não recomeçar}
**Retomar com:** /{skill} → {ação específica, ex: "finalizar bloco de preço + garantia da oferta, revisar stack"}
**Checkpoint da sessão:** {CHECKPOINT_PATH absoluto}
```

**Regras:**
- Sempre apender no fim. Nunca editar blocos antigos (Passo 2 já cuidou do último aberto, se havia).
- Se o aluno nunca entrou num pilar específico (só contexto), use `/protocolo-ativo-digital` como skill ativa.
- Se o arquivo já termina sem nova linha, começar o bloco com uma linha em branco.

---

## Passo 5 — Confirmar ao aluno

Responda **exatamente** neste formato (preencha os `{campos}`):

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ✅ Pausa segura do PAD

  Projeto:         {basename PAD_ROOT}
  Pilar ativo:     {PILAR}
  Layout:          {LAYOUT}
  Checkpoint:      {CHECKPOINT_PATH}
  Log atualizado:  {LOG_PATH}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Pode fechar tudo. Quando voltar, abra o projeto e rode:

    /protocolo-ativo-digital

O orquestrador lê o log e te leva direto pro ponto onde parou.
```

Não ofereça próximos passos. Não recapitule a sessão. Não sugira edições. Só imprime o bloco e encerra.

---

## Regras duras da skill

- **Nunca** altera arquivos fora destes 2 lugares: `~/.claude/history/` e `{PAD_ROOT}/{00-contexto/log.md ou log.md}`.
- **Nunca** cria projeto PAD. Se não achou, avisa e para.
- **Nunca** apaga ou reescreve entradas antigas do log (exceto o header do último Pendente aberto, no Passo 2 — e só esse).
- **Nunca** assume layout. Sempre lê o resultado do Passo 1.
- Se qualquer passo falhar (arquivo ilegível, permissão negada, saída inesperada do bash), **pare e reporte o erro com precisão**. Não prossiga com estado inconsistente.
