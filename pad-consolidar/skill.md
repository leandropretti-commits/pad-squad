---
name: pad-consolidar
description: >
  Gera o resumo consolidado do projeto PAD — oferta, página, tráfego, pendências e próximos passos —
  em PDF direto na pasta do projeto. Roda a qualquer momento para ter uma visão completa do que foi feito.
  Use /pad-consolidar quando quiser saber onde o projeto está ou antes de pausar.
---

# PAD — Consolidador Global

Você é o espelho do projeto. Lê tudo que foi produzido e entrega um PDF humano, limpo e acionável.

Sempre responda em **português do Brasil**.

---

## Função

Ler os arquivos do projeto e gerar:
1. `consolidadores/resumo-projeto.md` — versão texto estruturada
2. `consolidadores/resumo-projeto.pdf` — PDF gerado via Python (fpdf2)

---

## Leitura obrigatória (lê o que existir, ignora o que não existir)

- `00-contexto/contexto.md` — protagonista, nicho, avatar
- `03-oferta/oferta.md` — nome, promessa, preço, mecanismo único, stack
- `04-disparo/disparo.md` — página, checkout, tráfego, prospecção
- `pagina/index.html` ou `html/index-RASCUNHO.html` — detectar se página existe e qual o caminho
- `00-contexto/log.md` — histórico de ações
- `consolidadores/*.md` — consolidadores já gerados por etapa

---

## Estrutura do resumo

Gerar o `resumo-projeto.md` com esta estrutura exata:

```markdown
# Resumo do Projeto — [Nome do Projeto]
> Gerado em [data ISO] pelo /pad-consolidar

---

## Projeto
- **Protagonista:** [nome + especialidade]
- **Nicho:** [nicho]
- **Avatar:** [descrição curta do público-alvo]
- **Pilar atual:** [Pilar X — nome]

---

## Oferta
- **Nome:** [nome do produto]
- **Promessa:** [promessa com prazo]
- **Mecanismo único:** [o pulo do gato]
- **Preço:** R$[X] à vista | [X]x R$[Y]
- **Stack resumido:** [listar entregáveis principais — 1 linha cada]
- **Garantia:** [X] dias

---

## Página de Vendas
- **Status:** [Rascunho local / Publicada]
- **Arquivo local:** [caminho relativo]
- **URL publicada:** [URL ou "—  ainda não publicada"]
- **Placeholders pendentes:** [sim/não — se sim, listar o que falta preencher]

---

## Checkout
- **Plataforma:** [Hotmart / Kirvano / —]
- **Link:** [URL ou "— ainda não configurado"]
- **Preço ativo:** [R$X ou "— pendente"]

---

## Tráfego
- **Campanha 1:** [ABO — públicos + orçamento ou "— pendente"]
- **Campanha 2:** [Advantage+ — orçamento ou "— pendente"]
- **Status:** [Ativa / Pausada / Não configurada]

---

## Prospecção Direta
- **Contatos definidos:** [X/20]
- **Abordagens enviadas:** [X/20]
- **Respostas:** [X]
- **Vendas diretas:** [X]

---

## Pendências
[Listar tudo que está marcado como ___ ou TO DO nos arquivos lidos. Usar checkboxes.]
- [ ] [pendência 1]
- [ ] [pendência 2]
...

---

## Próximos Passos
[Ordenar por prioridade. Incluir links quando aplicável.]
1. [ação] — [link ou instrução]
2. [ação] — [link ou instrução]
...

---

## Histórico resumido
[Últimas 5 entradas do log.md — data + ação em 1 linha cada]
```

---

## Geração do PDF

Após gerar o `resumo-projeto.md`, rodar o script Python abaixo para gerar o PDF.

### Regras de PDF inegociáveis (aplicar sem exceção)

1. Nunca quebrar página no meio de uma seção (título + conteúdo ficam juntos)
2. Nunca quebrar página no meio de uma lista — lista inteira na mesma página
3. Nunca deixar título isolado no final de página — mínimo título + 3 linhas abaixo
4. Nunca quebrar página no meio de um parágrafo
5. Mínimo 3 linhas de parágrafo antes da quebra (sem linhas órfãs)
6. Nunca deixar página com excesso de espaço vazio (exceto última página)
7. Acentos e caracteres especiais: UTF-8 obrigatório — nunca usar string sem encode explícito

### Script Python (gerar e executar)

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from fpdf2 import FPDF
import re, sys, os
from datetime import datetime

# ── CONFIG ──────────────────────────────────────────────────────────────────
PROJECT_DIR = "."  # substituir pelo caminho real do projeto
MD_PATH = os.path.join(PROJECT_DIR, "consolidadores", "resumo-projeto.md")
PDF_PATH = os.path.join(PROJECT_DIR, "consolidadores", "resumo-projeto.pdf")

MARGEM = 20
LARGURA_UTIL = 170
FONTE_TITULO_H1 = 18
FONTE_TITULO_H2 = 14
FONTE_TITULO_H3 = 12
FONTE_CORPO = 11
FONTE_LABEL = 9
COR_TITULO = (26, 26, 46)
COR_CORPO = (45, 55, 72)
COR_DESTAQUE = (42, 157, 92)
COR_MUTED = (107, 114, 128)
ESPACAMENTO_SECAO = 10
ESPACAMENTO_LINHA = 6
MIN_LINHAS_ORFAS = 3

class PDFConsolidador(FPDF):
    def __init__(self):
        super().__init__(orientation="P", unit="mm", format="A4")
        self.set_auto_page_break(auto=True, margin=25)
        self.add_page()
        self.set_margins(MARGEM, MARGEM, MARGEM)

    def header(self):
        if self.page_no() == 1:
            return
        self.set_font("Helvetica", "I", FONTE_LABEL)
        self.set_text_color(*COR_MUTED)
        self.cell(0, 6, f"Protocolo Ativo Digital — Consolidador do Projeto", align="R", new_x="LMARGIN", new_y="NEXT")
        self.set_draw_color(*COR_MUTED)
        self.set_line_width(0.2)
        self.line(MARGEM, self.get_y(), 210 - MARGEM, self.get_y())
        self.ln(3)

    def footer(self):
        self.set_y(-15)
        self.set_font("Helvetica", "I", FONTE_LABEL)
        self.set_text_color(*COR_MUTED)
        self.cell(0, 6, f"Pág. {self.page_no()}", align="C")

    def titulo_h1(self, texto):
        self.set_font("Helvetica", "B", FONTE_TITULO_H1)
        self.set_text_color(*COR_TITULO)
        self.multi_cell(LARGURA_UTIL, 9, texto, new_x="LMARGIN", new_y="NEXT")
        self.ln(4)

    def titulo_h2(self, texto):
        # Regra: garantir espaço suficiente antes de nova seção (não deixar título no fim da página)
        if self.get_y() > 240:
            self.add_page()
        else:
            self.ln(ESPACAMENTO_SECAO)
        self.set_font("Helvetica", "B", FONTE_TITULO_H2)
        self.set_text_color(*COR_DESTAQUE)
        self.multi_cell(LARGURA_UTIL, 8, texto, new_x="LMARGIN", new_y="NEXT")
        self.set_draw_color(*COR_DESTAQUE)
        self.set_line_width(0.4)
        self.line(MARGEM, self.get_y() + 1, MARGEM + 40, self.get_y() + 1)
        self.ln(4)

    def corpo(self, texto):
        self.set_font("Helvetica", "", FONTE_CORPO)
        self.set_text_color(*COR_CORPO)
        self.multi_cell(LARGURA_UTIL, ESPACAMENTO_LINHA, texto, new_x="LMARGIN", new_y="NEXT")

    def campo(self, chave, valor):
        self.set_font("Helvetica", "B", FONTE_CORPO)
        self.set_text_color(*COR_TITULO)
        chave_txt = chave.strip("*").strip() + ": "
        chave_w = self.get_string_width(chave_txt) + 2
        self.cell(chave_w, ESPACAMENTO_LINHA, chave_txt)
        self.set_font("Helvetica", "", FONTE_CORPO)
        self.set_text_color(*COR_CORPO)
        self.multi_cell(LARGURA_UTIL - chave_w, ESPACAMENTO_LINHA, valor.strip(), new_x="LMARGIN", new_y="NEXT")

    def checkbox(self, texto, marcado=False):
        self.set_font("Helvetica", "", FONTE_CORPO)
        self.set_text_color(*COR_CORPO)
        icone = "☑" if marcado else "☐"
        self.multi_cell(LARGURA_UTIL, ESPACAMENTO_LINHA, f"  {icone}  {texto.strip()}", new_x="LMARGIN", new_y="NEXT")

    def separador(self):
        self.ln(3)
        self.set_draw_color(*COR_MUTED)
        self.set_line_width(0.1)
        self.line(MARGEM, self.get_y(), 210 - MARGEM, self.get_y())
        self.ln(5)


def render_md(pdf, md_text):
    linhas = md_text.split("\n")
    i = 0
    while i < len(linhas):
        linha = linhas[i].rstrip()

        # H1
        if linha.startswith("# ") and not linha.startswith("## "):
            pdf.titulo_h1(linha[2:])

        # H2
        elif linha.startswith("## "):
            pdf.titulo_h2(linha[3:])

        # H3
        elif linha.startswith("### "):
            pdf.set_font("Helvetica", "B", FONTE_TITULO_H3)
            pdf.set_text_color(*COR_TITULO)
            pdf.multi_cell(LARGURA_UTIL, 7, linha[4:], new_x="LMARGIN", new_y="NEXT")
            pdf.ln(2)

        # Separador ---
        elif re.match(r"^-{3,}$", linha):
            pdf.separador()

        # Checkbox [ ] ou [x]
        elif re.match(r"^- \[[ xX]\]", linha):
            marcado = "[x]" in linha.lower()
            texto = re.sub(r"^- \[[ xX]\]\s*", "", linha)
            pdf.checkbox(texto, marcado)

        # Campo **chave:** valor
        elif re.match(r"^- \*\*(.+?)\*\*:", linha):
            m = re.match(r"^- \*\*(.+?)\*\*:\s*(.*)", linha)
            if m:
                pdf.campo(m.group(1), m.group(2))

        # Citação/blockquote
        elif linha.startswith("> "):
            pdf.set_font("Helvetica", "I", FONTE_CORPO)
            pdf.set_text_color(*COR_MUTED)
            pdf.multi_cell(LARGURA_UTIL, ESPACAMENTO_LINHA, linha[2:], new_x="LMARGIN", new_y="NEXT")

        # Lista numerada
        elif re.match(r"^\d+\. ", linha):
            texto = re.sub(r"^\d+\. ", "", linha)
            num = re.match(r"^(\d+)\. ", linha).group(1)
            pdf.set_font("Helvetica", "", FONTE_CORPO)
            pdf.set_text_color(*COR_CORPO)
            pdf.multi_cell(LARGURA_UTIL, ESPACAMENTO_LINHA, f"  {num}. {texto}", new_x="LMARGIN", new_y="NEXT")

        # Lista simples
        elif linha.startswith("- "):
            pdf.set_font("Helvetica", "", FONTE_CORPO)
            pdf.set_text_color(*COR_CORPO)
            pdf.multi_cell(LARGURA_UTIL, ESPACAMENTO_LINHA, f"  • {linha[2:]}", new_x="LMARGIN", new_y="NEXT")

        # Linha em branco
        elif linha == "":
            pdf.ln(2)

        # Parágrafo normal
        else:
            # Limpar markdown inline
            texto = re.sub(r"\*\*(.+?)\*\*", r"\1", linha)
            texto = re.sub(r"\*(.+?)\*", r"\1", texto)
            texto = re.sub(r"`(.+?)`", r"\1", texto)
            pdf.corpo(texto)

        i += 1


def gerar_pdf(md_path, pdf_path):
    with open(md_path, "r", encoding="utf-8") as f:
        md_text = f.read()

    pdf = PDFConsolidador()
    render_md(pdf, md_text)
    pdf.output(pdf_path)
    print(f"PDF gerado: {pdf_path}")


if __name__ == "__main__":
    if not os.path.exists(MD_PATH):
        print(f"Erro: {MD_PATH} não encontrado. Gere o resumo-projeto.md primeiro.")
        sys.exit(1)
    gerar_pdf(MD_PATH, PDF_PATH)
```

### Executar

```bash
python3 /tmp/pad_consolidar_pdf.py
```

Se `fpdf2` não estiver instalado:

```bash
pip install fpdf2 && python3 /tmp/pad_consolidar_pdf.py
```

---

## Saída final

Após gerar o PDF, exibir para o operador:

```
✅ Consolidador gerado

📄 Texto: consolidadores/resumo-projeto.md
📕 PDF:   consolidadores/resumo-projeto.pdf

Abra o PDF para ver o estado completo do projeto.
```

Registrar no `log.md`.
