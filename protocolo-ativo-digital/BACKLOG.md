# PAD — Backlog de Melhorias

> Itens identificados durante stress tests, revisões e uso real que ficaram fora do escopo da versão atual.
> Alimentar este arquivo sempre que surgir algo que "entra na próxima versão".
> Ao implementar, mover o item para a seção "Implementados" com data.

---

## Pendentes

### 1. Mini-guia de gravação de vídeo com celular
- **Origem:** Stress test Cliente 01 (agência de sobrancelhas) — Problema 4
- **Data:** 2026-04-20
- **Pilar afetado:** Pilar 3 (Disparo Inicial)
- **Problema:** Nichos visuais (beleza, saúde, fitness) dependem de vídeo pra converter em ads. O PAD não tem nenhuma orientação sobre como gravar minimamente bem.
- **Sugestão:** Mini-guia "Como Gravar seu Primeiro Vídeo de Vendas com Celular" — 1 página, 5 regras (iluminação, enquadramento, áudio, roteiro simples, edição mínima).
- **Formato provável:** Bônus em PDF ou seção dentro do Pilar 3.

### 2. Métricas com ferramentas específicas por plataforma
- **Origem:** Stress test Cliente 01 (agência de sobrancelhas) — Problema 5
- **Data:** 2026-04-20
- **Pilar afetado:** Pilar 4 (Prova de Venda)
- **Problema:** "Tempo médio na página" exige GA configurado. "Checkout iniciado" exige integração com plataforma. Operador menos técnico trava.
- **Sugestão:** Indicar ferramentas específicas por cenário: "Se usou Hotmart, veja em Relatórios > Funil de vendas. Se usou Carrd, instale o snippet do GA. Se usou Vercel + página própria, configure o Pixel do Meta via GTM."
- **Formato provável:** Tabela de referência rápida dentro do Passo 1 do Pilar 4.

### 3. Pré-venda padrão (Founding Presell + Pré-venda pública)
- **Origem:** Revisão de auditoria + sessão de simulação Cliente 01 (Marcos) em 2026-04-20.
- **Data:** 2026-04-20
- **Pilar afetado:** Pilar 2 (Engenharia de Oferta) + Pilar 3 (Disparo Inicial).
- **Motivo da saída da v01:** a lógica de Founding Presell estava amarrada como regra dura dentro do Pilar 2 (Passo 9), impondo validação com 5 vagas ANTES de qualquer disparo público. Isso:
  - Engessava o fluxo quando o recorte já tinha caso forte e o operador queria ir direto pro Mid ticket.
  - Misturava "validação" com "decisão de ticket" na tabela de decisão do Passo 0.
  - Tratava pré-venda pública (estilo Doug VICIANTE$) como inexistente, quando na prática é a OUTRA metade da estratégia de pré-venda.
- **Decisão v01 (2026-04-20):** remover TODA lógica de pré-venda da SQUAD. Decisão inicial do Pilar 2 vira puramente de ticket (Low / Mid / Hi). Pré-venda volta na v02 como sistema próprio — documentado e detalhado abaixo.

#### O que implementar na v02

A v02 deve trazer pré-venda como **sistema paralelo**, não como regra fixa no Pilar 2. Ideia: depois da oferta travada, oferecer ao operador **dois caminhos de pré-venda** conforme o ticket + apetite de risco:

##### A) Founding Presell (pré-venda privada) — inspiração Amy Porterfield / Ramit Sethi / Taki Moore

- **Quando indicar:** Mid ticket ou Hi ticket com caso real ainda frágil. Também vale quando o operador quer validar preço + disposição de pagar antes de queimar tráfego pago.
- **Protocolo mínimo:**
  - 5 vagas exatas (não "enquanto houver")
  - Preço founding = 50% do preço oficial
  - Benefício vitalício: acesso a todas as versões futuras + 1 sessão individual com a pessoa próxima + nome no "Muro dos Fundadores"
  - Página de 1 seção (sem VSL, sem stack elaborado)
  - Abordagem direta: operador envia mensagem pra 20 pessoas do círculo próximo/lista da pessoa próxima (não tráfego pago)
  - Prazo: 7 dias. Gates: ≥3 fechamentos → avança pro disparo público; 1-2 → volta pro Pilar 2; 0 → refaz Pilar 1 + 1.5 + 2.
- **Artefato que gera:** `03-oferta/presell-founding.md` (lista de 20 abordagens + script + gates).

##### B) Pré-venda pública (estilo Doug VICIANTE$)

- **Quando indicar:** Low ticket ou Mid ticket quando o operador já tem audiência mínima (500+ seguidores ou lista de e-mail) e quer usar o próprio público pra validar.
- **Protocolo mínimo:**
  - **Bandeira/enquete:** começar 7-14 dias antes do lançamento com conteúdo que testa a bandeira (stories com enquete, reels com ganchos da oferta). Regra dos 10% do Doug — se 10% engajam, há demanda.
  - **Lista de espera:** página minimalista capturando e-mail/WhatsApp com promessa "te aviso quando abrir + preço especial pra quem entrou aqui primeiro".
  - **Contagem regressiva:** data travada de abertura. 48-72h antes, subir stories/posts contando o que a pessoa vai destravar, quanto custa, por quê.
  - **Gatilho de escassez real:** vagas limitadas por turma OU janela de preço (primeiros 48h no preço X, depois sobe).
  - **Abertura:** link pra quem está na lista (6-24h antes do público geral), depois público.
- **Artefato que gera:** `03-oferta/presell-publica.md` (calendário de 14 dias + peças de conteúdo + estrutura da lista de espera).

##### Como encaixar na SQUAD (proposta pra v02)

1. Criar skill nova: `/pad-pre-venda` (roda depois do Pilar 2, antes do Pilar 3). Pergunta:
   > "Tem audiência mínima (≥500 seguidores ou lista)? Sim → pré-venda pública. Não → Founding Presell. Mid/Hi ticket e quer validar preço? → Founding Presell mesmo com audiência."
2. Manter opção de **pular** pré-venda (Low ticket sem audiência + sem caso = ir direto pro Pilar 3 com regra dos 10% do Doug em stories, que já é implicitamente uma pré-venda leve).
3. Reintegrar artefatos na estrutura de pastas: `03-oferta/presell-founding.md` OU `03-oferta/presell-publica.md` conforme o caminho.
4. Ajustar `/pad-disparo-inicial` pra ler qual pré-venda foi feita e herdar a lista quente / fundadores como primeiro público.

##### Referência conceitual

- Founding: Amy Porterfield "Founding Members", Ramit Sethi "customer research", Taki Moore presell.
- Pública: Doug DEmar (estratégia VICIANTE$ — bandeira + lista + contagem regressiva), Jeff Walker PLF (versão lite), Sean Cannell "launch waitlist".

### 4. Promover `/bandeira` como skill standalone
- **Origem:** Rewrite de `/agente-storyads` → `/posicionamento` em 2026-04-20. Consolidamos bandeira + pilares de conteúdo + atraçãoADS numa única skill pra evitar reestrutura grande.
- **Data:** 2026-04-20
- **Pilar afetado:** meta (squad).
- **Problema:** Hoje a bandeira (frase-farol) é construída DENTRO de `/posicionamento`. Isso acopla bandeira ao tráfego de topo. Projetos orgânicos ou co-produções fora do PAD não conseguem rodar a construção de bandeira sem puxar junto o resto da skill.
- **Sugestão:** Extrair `/bandeira` como skill própria. Passa a ser pré-requisito de `/posicionamento`, `/agente-pagina`, `/agente-ads`, `/agente-vsl`. Uma bandeira, muitos canais.
- **Gate pra executar:** quando rodar o primeiro projeto orgânico ou co-produção em que a estrutura PAD não se aplica.

---

## Implementados

*(mover itens aqui quando forem implementados, com data)*

