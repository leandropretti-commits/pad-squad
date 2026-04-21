# Protocolo do Consolidador — O Sistema e PAD

> Fonte única de verdade pra como cada skill gera seu **consolidador denso** ao
> final da etapa, salva em markdown + Word (.docx), e mantém a estrutura do
> projeto organizada.
>
> Inspirado no padrão DOUG.EXE GANG — Módulo 1 Money Skills. Adaptado pros
> projetos do Leandro.

---

## Princípio: densidade > brevidade

Cada etapa termina com **um documento denso em prosa** (não bullet solto) que:

1. Qualquer IA lendo entende o projeto profundamente sem mais contexto
2. Serve de matéria-prima permanente pra copy, oferta, conteúdo e próximas etapas
3. Documenta as decisões de forma que o Leandro não dependa de memória

Se vier raso, refaz. Se ficar bonito, suspeita — densidade real vem com peso.

---

## Onde salva

Cada skill escreve **dois arquivos** dentro de `projeto-[nome]/consolidadores/`:

```
projeto-[nome]/
└── consolidadores/
    ├── NN-[nome-etapa].md    ← fonte markdown (versão canônica)
    └── NN-[nome-etapa].docx  ← conversão Word (gerada via pandoc)
```

- **`NN`** = número da etapa, com zero à esquerda (`01`, `02`, …)
- **`[nome-etapa]`** = slug em minúsculas com hífen (`avatar`, `oferta`, `metodo`)
- **Mantém o .md E o .docx.** O .md é a versão canônica (editável, lida por
  IA); o .docx é pro Leandro abrir, imprimir, compartilhar.

---

## Template do consolidador (estrutura base)

Cada skill tem tópicos próprios (definidos no seu SKILL.md), mas todos seguem
o esqueleto:

```markdown
# [NOME DA ETAPA EM MAIÚSCULAS] CONSOLIDADO — [nome do projeto]

> Documento denso de [X] palavras. Matéria-prima permanente do projeto.
> Gerado em [data] pelo agente [nome-skill] como parte do
> [nome do orquestrador] — etapa [N].

## 1. [Primeiro tópico — definido na skill]

[Parágrafo denso em prosa, mínimo de palavras definido pela skill.]

## 2. [Segundo tópico]

[...]

## [N]. [Último tópico — geralmente "Próximos passos" ou "O que foi travado"]

[...]

---

**Gerado por:** `[nome-skill]`
**Projeto:** `[nome do projeto]`
**Data:** `[data ISO]`
```

## Regras de escrita (inegociáveis)

- **Prosa densa.** Não bullet point solto, não listas de 1 linha.
- **Português brasileiro, tom direto.** Sem "espero ter ajudado", sem fluff.
- **Preserve vocabulário literal do nicho/avatar** — não traduz pra
  "marketingês".
- **Zero emoji.**
- **Mínimo de palavras** definido por skill. Se vier curto, refaz.
- **Um único bloco** — o consolidador é autossuficiente.
- **Data em ISO** (`2026-04-19`) — facilita versionamento futuro.

---

## Como gerar o .docx (pandoc)

Depois de salvar o `.md`, converter pra Word usando pandoc:

```bash
pandoc \
  "projeto-[nome]/consolidadores/NN-[nome-etapa].md" \
  -o "projeto-[nome]/consolidadores/NN-[nome-etapa].docx" \
  --reference-doc="$HOME/.claude/skills/_shared/consolidador-reference.docx" \
  --standalone
```

Se o arquivo de referência `consolidador-reference.docx` não existir, rodar
sem `--reference-doc` (usa o estilo padrão do pandoc).

### Se pandoc não estiver instalado

Antes de rodar qualquer conversão, testar:

```bash
which pandoc
```

Se retornar vazio, **parar** e avisar o usuário:

> ⚠ **pandoc não está instalado.** Os consolidadores .md foram gerados, mas
> a conversão pra .docx falhou. Pra habilitar:
>
> ```bash
> brew install pandoc
> ```
>
> Depois, rodar novamente a skill ou usar o script de reconversão.

Nesse caso, só o `.md` é criado — não falhar a skill inteira por causa disso.

---

## Dossiê consolidado final (só skills de fechamento)

Skills de fechamento (`agente-validacao` no O Sistema, `pad-escala` no PAD)
geram um **dossiê completo** em `exports/`:

```
projeto-[nome]/
└── exports/
    ├── dossie-completo.md    ← todos os consolidadores concatenados
    ├── dossie-completo.docx  ← versão Word
    └── dossie-completo.pdf   ← versão PDF (via pandoc + wkhtmltopdf OU playwright)
```

Estrutura do `dossie-completo.md`:

```markdown
# DOSSIÊ COMPLETO — [nome do projeto]

> Gerado em [data ISO]. Concatenação de todos os consolidadores do projeto.

## Sumário

1. [Link pro consolidador 01]
2. [Link pro consolidador 02]
...

---

<!-- conteúdo do 01-[nome].md aqui -->

---

<!-- conteúdo do 02-[nome].md aqui -->

...
```

Comando de geração:

```bash
# concatenar
cat "projeto-[nome]/consolidadores/"*.md > "projeto-[nome]/exports/dossie-completo.md"

# gerar .docx
pandoc "projeto-[nome]/exports/dossie-completo.md" \
  -o "projeto-[nome]/exports/dossie-completo.docx" --toc --standalone

# gerar .pdf
pandoc "projeto-[nome]/exports/dossie-completo.md" \
  -o "projeto-[nome]/exports/dossie-completo.pdf" --toc --standalone \
  --pdf-engine=xelatex
```

Se `xelatex` não estiver instalado, usar fallback Playwright (o mesmo usado
em `/tmp/pad-pdfs.mjs`) — renderiza o .md como HTML e imprime pra PDF.

---

## Check de estrutura (usado pelos orquestradores)

Quando `/o-sistema` ou `/protocolo-ativo-digital` for invocado, verificar se
a estrutura existe. Criar só o que falta:

```bash
# Lista canônica de subpastas
SUBPASTAS=(
  "00-contexto"
  "consolidadores"
  "assets"
  "html"
  "pdf"
  "exports"
  # + as subpastas específicas de cada etapa (01-metodo, 02-oferta, etc)
)

# Criar só o que não existe
for p in "${SUBPASTAS[@]}"; do
  mkdir -p "projeto-[nome]/$p"
done
```

**Nunca sobrescrever** arquivos já existentes. Se `00-contexto/contexto.md`
já existe, apenas carregar o conteúdo. Se não existe, criar com template.

---

## Estrutura de pastas canônica

### O Sistema

```
projeto-[nome]/
├── 00-contexto/
│   ├── contexto.md          ← o quê + pra quem + decisões macro
│   ├── log.md               ← log append-only de decisões
│   └── briefing.md          ← onboarding 1 página
├── 01-metodo/               ← agente-metodo
├── 02-oferta/               ← agente-oferta
├── 03-produto/              ← agente-produto
├── 04-vsl/                  ← agente-vsl
├── 05-pagina/               ← agente-pagina (+ html/ aqui)
├── 06-posicionamento/       ← posicionamento
├── 07-ads/                  ← agente-ads
├── 08-funil/                ← agente-funil
├── 09-validacao/            ← agente-validacao
├── consolidadores/          ← .md + .docx densos
├── assets/                  ← pngs, screenshots, swipe file
├── html/                    ← HTML gerado fora de 05-pagina
├── pdf/                     ← PDFs gerados
└── exports/                 ← dossiê final .md/.docx/.pdf
```

### PAD

```
projeto-pad-[nome]/
├── 00-contexto/
│   ├── contexto.md
│   ├── log.md
│   └── briefing.md
├── 01-extracao/             ← pad-raio-x
├── 02-metodo/               ← pad-destilacao-metodo
├── 03-oferta/               ← pad-engenharia-oferta
├── 04-disparo/              ← pad-disparo-inicial
├── 05-validacao/            ← pad-prova-venda
├── 06-escala/               ← pad-escala
├── consolidadores/
├── assets/
├── html/
├── pdf/
└── exports/
```

---

## Política de regeneração

- Cada skill, ao rodar novamente, **regenera** o `.md` + `.docx` do seu consolidador.
- O consolidador antigo é sobrescrito (não há versionamento automático).
- Se o Leandro quiser versionar, ele faz manualmente: `cp 02-oferta.md 02-oferta-v1.md`.
- O `log.md` em `00-contexto/` registra toda regeneração com data e motivo.

---

## Checklist rápido por skill

Ao final de cada skill, antes de retornar pro orquestrador:

- [ ] Dados operacionais salvos na subpasta numerada correta (ex: `02-oferta/`)
- [ ] Consolidador denso salvo em `consolidadores/NN-nome.md`
- [ ] Pandoc rodado → `.docx` gerado OU mensagem de fallback clara
- [ ] `log.md` em `00-contexto/` recebeu entrada nova
- [ ] `contexto.md` atualizado com próximo passo
