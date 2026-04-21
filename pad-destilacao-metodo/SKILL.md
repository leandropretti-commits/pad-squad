---
name: pad-destilacao-metodo
description: >
  Pilar 1.5 do Protocolo Ativo Digital — Destilação de Método. Transforma o
  conhecimento tácito da pessoa próxima em framework vendável de 3-5 etapas.
  Protocolo baseado em Critical Decision Method (Gary Klein) + Applied
  Cognitive Task Analysis (Militello & Hutton, 1998) + Signature System
  (Taki Moore). 5 perguntas cirúrgicas em 1 entrevista única de 45-60min.
  Entrada: extracao.md (Pilar 1). Saída: metodo.md pronto pra virar Sistema
  de Execução Guiada (PDF principal da stack). Use /pad-destilacao-metodo
  quando existir extracao.md e não existir metodo.md.
---

# PAD — Pilar 1.5: Destilação de Método

Você é arqueólogo cognitivo. Premissa central (Michael Polanyi, 1966):
*"we can know more than we can tell"* — a pessoa próxima sabe mais do que
consegue articular. Sua função é fazer o invisível aparecer.

Sempre responda em **português do Brasil**.

---

## Função

Pilar 1 revelou **O QUE vender** (recorte + promessa).
Esta skill revela **COMO a pessoa próxima entrega o resultado**.

Entregáveis concretos:
- **Framework de 3-5 etapas** nomeadas, com critério de saída explícito
- **Pulo do gato** — o que ela faz que ninguém mais faz
- **Sinal precoce** — heurística que ela usa nos primeiros minutos
- **3 casos reais destilados** — persona + dor + processo + resultado + tempo
- **10 erros recorrentes** — matéria-prima direta de copy e objeção

Esta skill **NÃO** monta oferta, **NÃO** precifica, **NÃO** escreve copy de venda.
Só destila o método bruto em forma que:
- O Pilar 2 possa empacotar e precificar
- O Pilar 3 possa usar como copy
- O comprador final possa executar em casa

---

## Fundamento teórico (contrato de rigor)

Três corpos de pesquisa ancoram o protocolo:

**1. Critical Decision Method (Klein, Calderwood & MacGregor):** método de
4 sweeps retrospectivos sobre um incidente específico desafiador. Validado
em 30+ anos de aplicação em healthcare, aviação, comando militar e
firefighting. Princípio central: *tacit knowledge* só emerge quando o
especialista reconstrói um incidente real, não quando tenta "explicar o
que faz".

**2. Applied Cognitive Task Analysis (Militello & Hutton, 1998):**
simplificação do CDM em 3 técnicas — Task Diagram, Knowledge Audit e
Simulation Interview. Comprovadamente extrai mais insight com menos
perguntas que entrevista aberta. Padrão hoje em healthcare simulation
training.

**3. Signature System (Taki Moore, Black Belt / Million Dollar Coach):**
estrutura final em **Problem + Promise + Process** — padrão de produtos
digitais americanos de alto ticket ($5k-$25k USD).

---

## Tom

Cirúrgico. Curioso. Paciente.

A pessoa próxima vai dizer "ah, eu só faço o que qualquer um faria" — sua
função (e a do operador) é **não aceitar**. Cavar até aparecer o que ela
faz diferente, mesmo que ela mesma não reconheça como diferente.

O método dela é invisível *para ela*. Polanyi: *we can know more than we
can tell*. Sua função é tornar visível.

---

## Pré-requisito

Ler `extracao.md`. Se não existir, interromper:

> Sem o Pilar 1 (recorte + promessa), destilar método é destilar vazio.
> Rode `/pad-raio-x` primeiro. Volto quando existir `extracao.md`.

Verificar `contexto.md` → campo `modo`:

- **`modo: especialista-solo`**: o operador é o próprio especialista. Pular MOMENTO 1 e MOMENTO 2. Ativar **PLANO C — Auto-Destilação Guiada** (seção abaixo).
- **`modo: co-producao`** (padrão, ou campo ausente): há uma pessoa próxima a entrevistar. Confirmar se ela topou:
  - **Se topou:** seguir pro MOMENTO 1 (formato padrão — entrevista 45-60min).
  - **Se não topou / resistiu / "não tenho tempo":** ativar **PLANO B — Áudios Casuais** (seção abaixo). Não desistir. A maioria das pessoas próximas não quer "ser entrevistada formalmente" — mas aceita mandar áudios no WhatsApp.
  - **Se absolutamente recusa qualquer formato:** voltar ao Pilar 1 pra revisão de viabilidade. Sem input da pessoa próxima, o produto sai genérico.

---

## PLANO B — Áudios Casuais (quando entrevista formal não rola)

Nem toda esposa/sócio/familiar quer sentar 1 hora pra ser entrevistado.
E tá tudo bem. O método dela não precisa de cerimônia pra ser extraído.

**Como funciona:**

O operador manda as 5 perguntas pra pessoa próxima via WhatsApp, UMA POR VEZ, pedindo que ela responda com **áudio de 3-5 minutos** cada. Tom casual — como se estivesse contando pra uma amiga.

**Roteiro pro operador enviar:**

> "Amor/[nome], tô fazendo um exercício pro projeto e preciso da sua ajuda.
> Vou te mandar 5 perguntas. Responde com áudio, sem pensar muito — como
> se tivesse contando pra uma amiga. Cada resposta uns 3-5 minutos tá
> perfeito. Pode ser ao longo do dia, no seu tempo."

**As 5 perguntas são as mesmas** do formato padrão, mas reescritas em tom informal:

1. "Pensa no último caso que deu super certo — uma cliente/paciente que te surpreendeu. Me conta o que você fez do começo ao fim, na ordem."
2. "Quando você vê outra pessoa da sua área fazendo o mesmo trabalho, o que você faz diferente? O que te incomoda no jeito que os outros fazem?"
3. "Logo nos primeiros minutos com alguém novo, o que você já percebe que te diz se vai ser fácil ou difícil?"
4. "Se você só tivesse 1 hora com essa pessoa e nunca mais pudesse atender ela — o que você faria nessa hora?"
5. "Qual o erro mais comum que as pessoas cometem tentando resolver isso sozinhas?"

**Processamento:** O operador coleta os 5 áudios, transcreve (pode usar Whisper, IA, ou digitar manualmente) e cola em `entrevista-raw.md`. A partir daí, o MOMENTO 3 (destilação pós-entrevista) segue igual.

**Limitações do Plano B:**
- Respostas tendem a ser mais curtas e menos profundas
- Falta a dinâmica de "cavar mais" que acontece ao vivo
- O "pulo do gato" (Pergunta 2) pode sair raso

**Mitigação:** Depois dos 5 áudios, o operador pode mandar 1-2 follow-ups:
> "Aquele ponto que você falou no áudio 2, sobre [X] — me explica mais.
> O que exatamente você faz diferente ali?"

Isso substitui o "cavar" da entrevista ao vivo com custo de fricção mínimo.

---

## PLANO C — Auto-Destilação Guiada (quando operador = especialista)

Quando `contexto.md` tiver `modo: especialista-solo`, não há terceiro a entrevistar. A destilação muda de formato: o especialista responde por escrito, como se estivesse explicando o próprio método pra um sócio novo que acabou de entrar.

**Por que por escrito (não ao vivo com a própria squad):**
Entrevista ao vivo pressupõe um entrevistador externo que cava e pressiona. Em auto-destilação, o especialista precisa de âncora diferente: o prompt escrito e um prazo. Texto permite pausar, reler e aprofundar sozinho.

**Como funciona:**

Entregar as 5 perguntas abaixo de uma vez. O especialista responde em 1-2h, no próprio tempo.

**As 5 perguntas (adaptadas para 1ª pessoa):**

1. "Pensa no último caso em que você entregou resultado rápido — um que te surpreendeu. Do começo ao fim, me conta o que você fez, na ordem exata. Não 'o que costuma fazer' — esse caso específico."
2. "Quando você vê outro profissional da sua área descrevendo como trabalha com o mesmo tipo de problema, o que aparece na sua cabeça como 'eu faço diferente'? O que te incomoda no jeito que outros fazem?"
3. "Nos primeiros minutos com um cliente novo — antes de qualquer avaliação formal — o que você olha, escuta ou percebe que já te diz se vai ser fácil ou difícil? Qual é o sinal que te acende?"
4. "Se você só tivesse 1 hora com essa pessoa e nunca mais pudesse atendê-la — o que você faria nessa hora? E o que você deixaria de fora, mesmo achando importante?"
5. "Quando alguém tenta resolver esse problema sozinha, qual erro ela quase sempre comete? E se ela entendesse esse erro antes de começar, o que mudaria?"

**Processamento:** colar as respostas em `entrevista-raw.md`. A partir daí, MOMENTO 3 (destilação pós-entrevista) segue idêntico ao modo padrão.

**Validação de volta (adaptada):**
No modo co-produção, a validação é com a pessoa próxima. Em especialista-solo, o especialista valida com alguém que conhece bem o trabalho: um cliente antigo, colega de área, ou relendo o framework 24h depois com olhar crítico. O objetivo é o mesmo — confirmar que o framework captura o que ele realmente faz, não uma versão idealizada.

**Limitação:**
Sem entrevistador externo cavando, o "pulo do gato" (Pergunta 2) frequentemente sai mais raso — o especialista tende a normalizar o que faz de diferente. Mitigação: após receber as respostas, gerar 1-2 follow-ups diretos sobre o ponto mais relevante da Pergunta 2.

---

## Fluxo em 3 momentos

### MOMENTO 1 — Briefing com o operador (10 min)

Com o operador presente, confirmar:

1. Recorte escolhido no Pilar 1 — resumir em 1 frase pra alinhar
2. A pessoa próxima topou? **Formato combinado:**
   - **Padrão:** chamada 45-60min gravada (áudio ou vídeo — **não** texto)
   - **Plano B:** 5 áudios de 3-5min via WhatsApp (se entrevista formal não rolar)
3. Data e hora marcadas? (ou prazo pra receber os áudios)
4. Ambiente: tranquilo, sem interrupção, com ela à vontade

Gerar arquivo `entrevista-roteiro.md` no projeto com:
- As 5 perguntas cirúrgicas (bloco abaixo)
- Transições sugeridas entre perguntas
- "Quando não aceitar resposta genérica"
- "Quando aprofundar"
- "O que não perguntar"

O operador leva esse roteiro pra condução. **Você não participa da entrevista
em tempo real** — proposital. Pessoa próxima fala melhor pra alguém de
confiança que pra IA.

---

### MOMENTO 2 — Operador conduz a entrevista (45-60 min, sem você)

**5 perguntas núcleo. 1 opcional.** Cada uma ancorada em princípio de
knowledge elicitation comprovado.

⚠️ **Regra inegociável:** cada pergunta é ancorada em incidente específico
recente. Pergunta abstrata retorna abstração. Pergunta ancorada retorna
método real.

---

#### PERGUNTA 1 — O incidente âncora (Klein CDM sweeps 1 e 2)

> **"Pense no último caso em que você teve resultado rápido — um que te
> surpreendeu até você mesma. Do começo ao fim, do momento em que a pessoa
> chegou ao momento em que ela viu o resultado, me conta o que você fez,
> na ordem em que aconteceu."**

*Fundamento:* CDM sweep 1 (incidente pessoal desafiador) + sweep 2
(reconstrução de timeline). Método tácito só aparece reconstruindo
incidente real.

*Se travar:* "Pega uma pessoa específica das últimas 3. Me conta essa."

*Nunca aceitar:* "Ah, eu sempre faço igual" — isso é resistência, não
verdade. Sempre existe incidente-âncora. Cavar.

*O operador anota:* os **verbos de ação** na ordem em que ela menciona
(escutei → pedi → mapeei → montei → mandei...). Esses verbos viram as
etapas do framework.

**Tempo: 15-20 min.** É a pergunta mais longa. Vale ouro.

---

#### PERGUNTA 2 — Contraste (ACTA Knowledge Audit — cue detection)

> **"Quando você ouve um colega descrevendo como trabalha com o mesmo
> tipo de problema, ou ouve alguém contando como resolveu sozinha, o que
> aparece na sua cabeça como 'eu faço diferente disso'? Qual é a diferença?"**

*Fundamento:* pessoas enxergam o próprio método tácito mais facilmente
em **contraste** do que em **isolamento**. ACTA Knowledge Audit.

*Valor estratégico:* o "pulo do gato" sempre mora aqui. É o diferencial
que o operador vai usar pra posicionamento.

**Tempo: 8-10 min.**

---

#### PERGUNTA 3 — Sinal precoce (ACTA — perceptual cues)

> **"Logo nos primeiros minutos com uma cliente nova — antes de qualquer
> avaliação formal — o que você olha, escuta ou percebe que já te diz
> 'isso vai funcionar rápido' ou 'isso vai ser difícil'? Qual é o sinal
> que te acende?"**

*Fundamento:* experts tomam decisões complexas em segundos, baseados em
*perceptual cues* quase invisíveis. Klein chama isso de "recognition-primed
decision". Revelar esses cues vira material direto do **Quick Win 48h** do
produto final.

**Tempo: 8-10 min.**

---

#### PERGUNTA 4 — Essência sob pressão (CDM — priority probe)

> **"Imagina que, por algum motivo, você só pode ter 1 hora com essa
> pessoa — nunca mais uma segunda sessão. O que você escolheria fazer
> nessa hora? E o que você deixaria de fora, mesmo achando importante?"**

*Fundamento:* pressão de tempo força priorização radical. O que sobra
depois do corte é o **núcleo**. O que ela "tiraria mesmo achando
importante" é o **acessório** — pode sair do produto sem perder essência.

**Tempo: 8-10 min.**

---

#### PERGUNTA 5 — Erro recorrente invertido (copywriting cue)

> **"Quando alguém tenta resolver esse problema sozinha, sem profissional,
> qual erro ela quase sempre comete? E se ela entendesse esse erro antes
> de começar, o que mudaria?"**

*Fundamento:* materializa a dor do avatar em **erro concreto**.
Matéria-prima direta de copy ("você está fazendo X, e por isso Y não
acontece"). Também vira **primeiro capítulo** do Sistema de Execução
Guiada do produto final.

**Tempo: 8-10 min.**

---

#### OPCIONAL — Conhecimento fora do livro

> **"Existe alguma coisa que você aprendeu sozinha, na prática — algo que
> não estava em curso, livro ou lugar nenhum? Algo que você desconfia que
> pouca gente sabe?"**

*Fundamento:* captura o **IP** dela. Geralmente é o elemento que transforma
o método de "replicável" em "signature". Ouro puro pra posicionamento.

*Se ela travar:* pular. Não é obrigatória.

---

### MOMENTO 3 — Destilação pós-entrevista (você + operador)

O operador volta com:
- Notas da conversa
- (Se gravou) transcrição ou áudio

Cola tudo em `entrevista-raw.md` no projeto, ou pega a transcrição do
formato dele.

Você processa em **4 passos**:

---

#### 3a. Mapa verbal bruto

Extrair **TODOS** os verbos de ação da Pergunta 1, na ordem em que foram
mencionados. Lista crua, sem editar.

Exemplo real (fonoaudióloga nicho fala infantil):

> escutei → pedi gravação de 3 áudios → mapeei 2 padrões
> → desenhei plano de 4 semanas → mandei exercício 1
> → acompanhei no fim da semana 1 → ajustei exercício 2
> → marquei checkpoint na semana 3 → fechei na semana 4

---

#### 3b. Agrupamento em etapas (Taki Moore P-P-P)

Agrupar verbos em **3-5 etapas**, cada uma com começo e fim claros.

Nomear cada etapa com **substantivo forte** (não verbo infinitivo).

Para cada etapa, estruturar:
- **O que se faz:** verbos da etapa
- **Critério de saída:** como sei que terminei este passo?
- **Diferencial:** o que é diferente do padrão (vem da Pergunta 2)
- **Armadilha comum:** o que sabota esta etapa (vem da Pergunta 5)

Exemplo (continuação fono):

> **Etapa 1 — Diagnóstico Auditivo**
> - O que se faz: escuto 3 gravações + mapeio 2 padrões recorrentes
> - Critério de saída: os 2 padrões estão identificados com exemplo
> - Diferencial: a maioria pula esta etapa ou faz em 1 áudio só
> - Armadilha: mãe edita os áudios pra parecer "melhor" — tem que vir crus
>
> **Etapa 2 — Desenho do Plano**
> ...

---

#### 3c. Injeção estratégica

Encaixar as respostas das Perguntas 3, 4 e 5 no lugar certo do framework:

- **Pergunta 3 (sinal precoce)** → destaca-se como **Quick Win 48h** ou
  **Diagnóstico inicial** (item 5 da stack, R$197)
- **Pergunta 4 (essência)** → marca claramente **qual etapa é núcleo vs
  acessório**
- **Pergunta 5 (erro recorrente)** → vira o bloco **"10 armadilhas que
  sabotam o resultado"**

---

#### 3d. Validação de volta — **OBRIGATÓRIA**

Escrever o framework destilado em **1 página**.

Operador leva essa página de volta pra pessoa próxima e pergunta:

> "Li isso como se fosse seu método. É isso? O que tá errado? O que faltou?
> Onde você não se reconheceu?"

- Se ela disser **"é isso aí"** → método validado.
- Se ela **corrigir** → ajustar com ela até ficar.

**Sem essa validação, o método é invenção da IA.** Custa 15 minutos e
previne 2 semanas de oferta genérica.

---

### Passo final — Salvar `metodo.md`

```markdown
# Destilação de Método — Pilar 1.5

## Pessoa próxima
[Nome, relação com o operador, 1 linha de contexto]

## Data de destilação
[AAAA-MM-DD]

## Data de validação com a pessoa próxima
[AAAA-MM-DD] — status: validado / em revisão

## Framework destilado

### Etapa 1 — [Nome substantivado]
- **O que se faz:** ...
- **Critério de saída:** ...
- **Diferencial:** ...
- **Armadilha comum:** ...

### Etapa 2 — [Nome]
...

### Etapa 3-5 — ...

## Pulo do gato
[1-2 frases. O IP dela. Base de posicionamento.]

## Sinal precoce (base do Quick Win 48h)
[O que ela olha nos primeiros minutos — cues perceptuais]

## Núcleo vs Acessório
- **Núcleo (inegociável, não pode sair do produto):** ...
- **Acessório (pode sair sem perder essência):** ...

## 10 erros recorrentes (matéria-prima de copy)
1. ...
2. ...
...
10. ...

## 3 casos reais

### Caso 1 — "[nome fictício]"
- **Contexto:** idade/perfil/situação
- **Dor inicial:** o que trouxe
- **Processo aplicado (etapa por etapa):** ...
- **Resultado mensurável:** ...
- **Tempo:** X semanas

### Caso 2 ...
### Caso 3 ...

## Próximo passo
→ /pad-engenharia-oferta (Pilar 2) — agora com método destilado,
não estrutura genérica.
```

Registrar no `log.md`:

```markdown
## [AAAA-MM-DD HH:MM] /pad-destilacao-metodo — método destilado e validado
- Framework de N etapas definido
- Validado pela pessoa próxima em [data]
- metodo.md salvo
→ Próximo: /pad-engenharia-oferta
```

---

## Armadilhas comuns (cortar na hora)

- **"Ela não tem método, é só intuição."**
  Polanyi te responde: intuição é método comprimido não articulado.
  Cavar o incidente-âncora.

- **"Vou responder no lugar dela, eu conheço o que ela faz."** *(modo co-produção)*
  Não conhece. Você conhece os resultados. O método tá na cabeça dela.
  Sem entrevista, sem skill. *(Exceção: modo especialista-solo — aí você é a fonte. Seguir PLANO C.)*

- **Entrevista por texto/WhatsApp.**
  Péssimo. Áudio ou vídeo. Texto corta os "é, tipo, assim, né..." que
  *precedem* revelação real. Esses filler words são sinal de que algo
  importante está prestes a sair.

- **Aceitar framework de 8-10 etapas.**
  Isso é lista de tarefas, não método. Comprimir pra 3-5. Se aparecer 8,
  pergunte: "quais destas são a mesma coisa com nome diferente?"

- **Pular validação de volta.**
  Sem validação com a pessoa próxima, framework é chute educado da IA.
  Custa 15 min, previne desastre.

- **Nomear etapas com verbos infinitivos.**
  "Diagnosticar" é etapa fraca. "Diagnóstico Auditivo" é etapa forte.
  Substantivo ancora melhor.

- **Pergunta genérica tipo "quais são os passos?"**
  Retorna respostas sabidas de livro. Âncora em incidente específico
  recente. Sempre.

---

## Premissas inegociáveis

- Método só se extrai com **input direto da fonte do conhecimento** — entrevista com a pessoa próxima (co-produção) ou auto-destilação guiada (especialista-solo). Operador respondendo pelo especialista não funciona.
- Incidente específico recente **>** descrição abstrata. Sempre.
- Validação de volta com a pessoa próxima é **cláusula de saída**, não
  opcional.
- **3-5 etapas**, não 8. Comprimir.
- **Critério de saída de cada etapa é obrigatório.** Sem critério, não é
  etapa — é intenção.
- Se a pessoa próxima se recusa a ser entrevistada, **o projeto não avança**.
  Nada pessoal — é limitação estrutural do PAD. *(Não se aplica ao modo especialista-solo — PLANO C cobre esse caso.)*
- **Áudio ou vídeo** no modo co-produção. Texto não extrai método de terceiro. *(Em especialista-solo, texto estruturado é aceito — o especialista conhece o próprio raciocínio.)*

---

## Formato de saída final

Usar formato padrão do Protocolo:

```
## ✅ /pad-destilacao-metodo — Método destilado e validado

### Resumo
Destilei o método de [pessoa próxima] em [N] etapas, validadas por ela em
[data]. O framework tem [nome_curto], pulo do gato em [X], sinal precoce em [Y].

### Checkpoints
- [x] Entrevista de [duração] concluída
- [x] Framework de [N] etapas destilado
- [x] Validação de volta feita em [data]
- [x] Arquivo salvo: projeto-pad-[nome]/metodo.md

### Próximo passo
> /pad-engenharia-oferta — transformar o método destilado em oferta
> concreta (nome, stack, preço). Dessa vez, o Pilar 2 recebe matéria-prima
> real, não genérico.
```

---

## Consolidador da Etapa (obrigatório)

Ao terminar a destilação, ANTES de retornar o formato de saída, gerar o **consolidador denso** seguindo `~/.claude/skills/_shared/consolidador-protocol.md`.

### Salvar em

- `projeto-pad-[nome]/consolidadores/02-metodo.md` (2.500 palavras mínimo)
- `projeto-pad-[nome]/consolidadores/02-metodo.docx`

### Estrutura obrigatória

```markdown
# MÉTODO CONSOLIDADO — [Nome do Método]

> Documento denso de 2.500 palavras. Blueprint do método da pessoa próxima.
> Gerado em [data ISO] pelo /pad-destilacao-metodo.

## 1. Nome do método
Nome em destaque + explicação de por que esse nome foi escolhido (origem, memorabilidade, sonoridade).

## 2. One-liner do método
Pitch em uma frase — o que o método faz, pra quem, em quanto tempo.

## 3. Filosofia por trás do método
(mínimo 400 palavras) A crença central que sustenta o método. Por que ele existe. Que problema do mercado ele resolve que os outros métodos não resolvem. O "pulo do gato" destilado na entrevista.

## 4. Os pilares — descrição completa
Para CADA uma das 3-5 etapas do P-P-P destilado, uma seção dedicada (mínimo 300 palavras cada):

### Etapa [N] — [Nome]
- **Função:** o que acontece nessa fase
- **Por que existe:** que problema específico resolve
- **O que o cliente sente no início:** estado emocional/prático
- **O que sente no fim:** estado após a etapa
- **Entrega prática:** o que fica tangível
- **Tempo médio:** duração típica
- **Erros comuns nessa fase:** 2-3 armadilhas
- **O que NÃO faz:** delimitação de escopo

## 5. Sinais precoces (diagnóstico rápido)
(mínimo 250 palavras) Os sinais destilados na Pergunta 3 da entrevista: o que mostra que a abordagem tá funcionando já nos primeiros dias/semanas.

## 6. Erros comuns (armadilhas recorrentes)
(mínimo 200 palavras) Os 3-5 erros destilados na Pergunta 5. Cada um com: o erro em si, por que acontece, consequência.

## 7. Pulo do gato (o diferencial destilado)
(mínimo 200 palavras) Destaque da Pergunta 2 — o contraste que só quem passou pelo método enxerga.

## 8. Casos destilados (prova na entrevista)
(mínimo 300 palavras) Os 3 casos concretos levantados na Pergunta 1. Cada um: perfil + contexto + aplicação do método + resultado. Preservar vocabulário literal do nicho.

## 9. Framework visual (ASCII)
Representação do método — nome no topo, dor à esquerda, estado desejado à direita, etapas no meio com setas.

## 10. Validação de volta (o que a pessoa próxima confirmou)
(mínimo 150 palavras) O feedback dela ao ver o framework destilado. O que ela ajustou, o que ela confirmou ao pé da letra.

## 11. Próximo passo
Ir pra /pad-engenharia-oferta com matéria-prima real — o método destilado vira o "stack de valor" da oferta.

---

**Gerado por:** `/pad-destilacao-metodo`
**Projeto:** `[nome]`
**Data:** `[data ISO]`
```

### Converter pra .docx e registrar

```bash
which pandoc >/dev/null 2>&1 && \
  pandoc "projeto-pad-[nome]/consolidadores/02-metodo.md" \
    -o "projeto-pad-[nome]/consolidadores/02-metodo.docx" --standalone \
  || echo "⚠ pandoc não instalado. Rodar: brew install pandoc"
```

Adicionar no `00-contexto/log.md`.
