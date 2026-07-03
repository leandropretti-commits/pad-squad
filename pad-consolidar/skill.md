---
name: pad-consolidar
description: >
  Gera o resumo consolidado do projeto PAD — oferta, página, tráfego, prospecção, pendências
  e próximos passos — em .md + PDF na pasta do projeto. Roda a qualquer momento para ver o
  estado completo. Use /pad-consolidar antes de pausar ou quando quiser visão geral.
---

# PAD — Consolidador Global

Você é o espelho do projeto. Lê o que foi produzido e entrega um resumo humano, limpo e acionável. **Espelho não inventa:** o que não existe nos arquivos aparece como pendência, nunca como suposição.

Sempre responda em **português do Brasil**.

## Lei da squad

Obedece a `~/.claude/skills/_shared/pad-contratos.md` (aqui, sobretudo o Contrato 2: cada linha do resumo tem fonte num arquivo do projeto).

## Leitura (o que existir; o que faltar vira pendência)

`00-contexto/contexto.md` (protagonista, relacao, acordo) · `01-extracao/extracao.md` · `02-metodo/metodo.md` (+ status de validação) · `03-oferta/oferta.md` + `oferta-completa.md` · `04-disparo/disparo.md` + `ads.md` · `05-validacao/validacao.md` · `06-escala/escala.md` · `07-posicionamento/posicionamento.md` · `html/index.html` (existe? publicada?) · `fonte-da-verdade/*` (quais existem) · `00-contexto/log.md` (últimas entradas + blocos Pendente).

## Estrutura do `consolidadores/resumo-projeto.md`

```markdown
# Resumo do Projeto — [Nome]
> Gerado em [data ISO] pelo /pad-consolidar

## Projeto
Protagonista: [nome + especialidade] · Relação: [relacao] · Acordo: [status]
Avatar: [1 linha] · Pilar ativo: [N — nome]

## Oferta
Nome · Promessa · Mecanismo (pulo do gato) · Preço (ação/oficial/12x) · Stack (1 linha/item) · Garantia
Status do método: [validado / NÃO VALIDADO / pulado (low)]

## Página e Checkout
Página: [rascunho local / publicada + URL] · [SUBSTITUIR] pendentes: [listar]
Checkout: [plataforma + link ou pendente]

## Tráfego e Prospecção
Campanhas: [config + status] · Criativos: [3 ângulos ou pendente]
Abordagens: [X/20 enviadas · Y respostas · sinais: P/M/F] · Stories: [rotina ativa?]

## Validação
[6 números · loops rodados · vendas · case]

## Fonte da verdade
[✓/✗] avatar.md · [✓/✗] voz.md · [✓/✗] metodo.md · [✓/✗] oferta.md

## Pendências
- [ ] [tudo que está ___ , [BURACO] ou [SUBSTITUIR] nos arquivos lidos]

## Próximos passos (por prioridade)
1. [ação — skill]

## Histórico (últimas 5 do log)
```

## Geração do PDF

Após salvar o `.md`, gerar e executar o script abaixo em `/tmp/pad_consolidar_pdf.py` (ajustando `PROJECT_DIR`).

**Regras de paginação (implementadas no script, não só declaradas):** seção nunca começa sem espaço pro título + 3 linhas · lista quebra inteira pra próxima página quando não cabe · título nunca fica órfão no fim da página · UTF-8 obrigatório.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Requisito: pip install fpdf2  (o pacote é fpdf2, o import é fpdf)
from fpdf import FPDF
import re, sys, os

PROJECT_DIR = "."  # substituir pelo caminho real
MD = os.path.join(PROJECT_DIR, "consolidadores", "resumo-projeto.md")
OUT = os.path.join(PROJECT_DIR, "consolidadores", "resumo-projeto.pdf")

M, W, LH = 20, 170, 6
INK, BODY, ACC, MUT = (26,26,46), (45,55,72), (42,157,92), (107,114,128)

class PDF(FPDF):
    def __init__(self):
        super().__init__("P", "mm", "A4")
        self.set_auto_page_break(True, 25)
        self.set_margins(M, M, M)
        self.add_page()
    def header(self):
        if self.page_no() == 1: return
        self.set_font("Helvetica", "I", 9); self.set_text_color(*MUT)
        self.cell(0, 6, "Protocolo Ativo Digital — Consolidador", align="R",
                  new_x="LMARGIN", new_y="NEXT")
        self.line(M, self.get_y(), 210-M, self.get_y()); self.ln(3)
    def footer(self):
        self.set_y(-15); self.set_font("Helvetica", "I", 9)
        self.set_text_color(*MUT); self.cell(0, 6, f"Pag. {self.page_no()}", align="C")
    def need(self, h):
        # Regra-mãe: se o bloco de altura h não cabe, quebra ANTES de começar
        if self.get_y() + h > self.h - 25: self.add_page()
    def est(self, txt, size=11):
        # altura estimada de um texto em multi_cell
        self.set_font("Helvetica", "", size)
        chars_per_line = max(int(W / (self.get_string_width("m") or 2.2)), 20)
        lines = max(1, -(-len(txt) // chars_per_line))
        return lines * LH

def clean(t):
    t = re.sub(r"\*\*(.+?)\*\*", r"\1", t)
    t = re.sub(r"\*(.+?)\*", r"\1", t)
    return re.sub(r"`(.+?)`", r"\1", t)

def render(pdf, md):
    lines = md.split("\n"); i = 0
    while i < len(lines):
        ln = lines[i].rstrip()
        if ln.startswith("## "):                       # seção: título + 3 linhas juntos
            pdf.need(8 + 3*LH + 6)
            pdf.ln(6); pdf.set_font("Helvetica", "B", 14); pdf.set_text_color(*ACC)
            pdf.multi_cell(W, 8, clean(ln[3:]), new_x="LMARGIN", new_y="NEXT")
            pdf.set_draw_color(*ACC); pdf.line(M, pdf.get_y()+1, M+40, pdf.get_y()+1); pdf.ln(4)
        elif ln.startswith("# "):
            pdf.set_font("Helvetica", "B", 18); pdf.set_text_color(*INK)
            pdf.multi_cell(W, 9, clean(ln[2:]), new_x="LMARGIN", new_y="NEXT"); pdf.ln(4)
        elif re.match(r"^\s*- \[[ xX]\]", ln) or ln.startswith("- ") or re.match(r"^\d+\. ", ln):
            # lista: coletar o bloco inteiro e garantir que cabe junto
            blk = []
            while i < len(lines) and (re.match(r"^\s*- ", lines[i]) or re.match(r"^\d+\. ", lines[i])):
                blk.append(lines[i].rstrip()); i += 1
            i -= 1
            h = sum(pdf.est(clean(b)) for b in blk)
            if h < 200: pdf.need(h)                    # lista maior que a página: deixa fluir
            for b in blk:
                mrk = "[x] " if re.match(r"^\s*- \[[xX]\]", b) else ("[ ] " if re.match(r"^\s*- \[ \]", b) else "  -  ")
                txt = re.sub(r"^\s*(- (\[[ xX]\] )?|\d+\. )", "", b)
                pdf.set_font("Helvetica", "", 11); pdf.set_text_color(*BODY)
                pdf.multi_cell(W, LH, mrk + clean(txt), new_x="LMARGIN", new_y="NEXT")
        elif ln.startswith("> "):
            pdf.need(pdf.est(ln)); pdf.set_font("Helvetica", "I", 11); pdf.set_text_color(*MUT)
            pdf.multi_cell(W, LH, clean(ln[2:]), new_x="LMARGIN", new_y="NEXT")
        elif re.match(r"^-{3,}$", ln):
            pdf.ln(3); pdf.set_draw_color(*MUT); pdf.line(M, pdf.get_y(), 210-M, pdf.get_y()); pdf.ln(5)
        elif ln == "":
            pdf.ln(2)
        else:                                          # parágrafo: mínimo 3 linhas antes da quebra
            h = pdf.est(ln)
            pdf.need(min(h, 3*LH))
            pdf.set_font("Helvetica", "", 11); pdf.set_text_color(*BODY)
            pdf.multi_cell(W, LH, clean(ln), new_x="LMARGIN", new_y="NEXT")
        i += 1

if __name__ == "__main__":
    if not os.path.exists(MD):
        print(f"Erro: {MD} nao encontrado."); sys.exit(1)
    with open(MD, encoding="utf-8") as f: src = f.read()
    p = PDF(); render(p, src); p.output(OUT); print(f"PDF gerado: {OUT}")
```

Executar: `pip install fpdf2 2>/dev/null; python3 /tmp/pad_consolidar_pdf.py`. Falhou a geração → entregar o `.md` e avisar o erro real (nunca fingir que o PDF saiu).

## Card de saída

```
---
✅ Consolidador gerado
📄 Texto: consolidadores/resumo-projeto.md · 📕 PDF: consolidadores/resumo-projeto.pdf
➡️  Próximo: [skill do pilar pendente, do próprio resumo]
---
```

Registrar no `log.md`.

## Checklist pré-envio (falhou um → reescreve)

1. [ ] Cada linha do resumo tem fonte num arquivo lido (zero suposição)?
2. [ ] Pendências capturaram todos os `___`, `[BURACO]` e `[SUBSTITUIR]` dos arquivos?
3. [ ] PDF gerado de verdade (ou falha reportada com o erro real)?
