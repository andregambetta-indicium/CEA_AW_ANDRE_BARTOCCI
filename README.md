# Certificação Engenharia de Analytics - Adventure Works

Este repositório contém o projeto prático desenvolvido para a Certificação em Engenharia de Analytics da **Indicium**. O projeto consiste na construção de uma plataforma de dados moderna para a Adventure Works (AW), utilizando o conceito de **Modern Data Stack**.

## 🎯 Objetivo do Projeto
Transformar os dados brutos do ERP (PostgreSQL) da Adventure Works em informações estratégicas, seguindo a modelagem dimensional (Star Schema) para responder a perguntas de negócio críticas da diretoria e garantir a veracidade dos dados através de testes automatizados.

## 🛠️ Tecnologias Utilizadas
- **Data Warehouse:** Snowflake
- **Transformação de Dados:** dbt (Data Build Tool)
- **Linguagem:** SQL
- **Diagramação:** DrawSQL
- **Fundos do dashboard e ícones:** Figma
- **Visualização (BI):** Power BI

---

## 🔗 Links do Projeto
- **📺 Apresentação em Vídeo:** [YouTube](https://youtu.be/j_I8ui-5HI0)
- **📊 Dashboard Interativo (Power BI Online):** [Acesse o Painel aqui](https://app.powerbi.com/view?r=eyJrIjoiOWE1MjE3MmMtN2UxZi00NmQxLWE2ODgtMzRkNWVlY2FhNGIyIiwidCI6IjM1YzRlYzQzLTZlMDctNGQ1Mi05Njk4LWIwYTYwZDg0ZmFiNSJ9)
- **📐 Diagrama Conceitual:** [Visualize o Modelo Dimensional no DrawSQL](https://drawsql.app/teams/andre-bartocci/diagrams/cea-andre-bartocci)
- **📁 Pasta de Downloads (Drive):** [Arquivos PDF e PBIX](https://drive.google.com/drive/folders/1W0NqXGUjU7QF7VPMbkwNdW3CLTnWetuK)

---

## 📐 Modelagem de Dados
O projeto foi estruturado utilizando a metodologia de camadas:

1.  **Staging:** Limpeza, renomeação e tipagem dos dados brutos (Schema `raw_data_aw`).
2.  **Intermediate:** Joins complexos e regras de negócio intermediárias (ex: consolidação de categorias de produtos e motivos de venda).
3.  **Marts:** Tabelas finais de fatos e dimensões prontas para o consumo no BI e demais regras de negócio.

### Tabelas Finais:
- **Fatos:** `fct_sales` (Cabeçalho) e `fct_sales_details` (Itens/Grão do produto).
- **Dimensões:** `dim_product`, `dim_customer`, `dim_region`, `dim_dates` e `dim_credit_card`.

---

## ✅ Garantia de Qualidade (Data Quality)
O projeto implementa testes para assegurar a confiabilidade das decisões:
- **Testes de Schema:** Validação de unicidade das chaves primárias e garantia de campos obrigatórios (`not_null`).
- **Teste de Auditoria (CEO Carlos Silveira):** Implementação de teste singular para validar as vendas brutas de 2011. 
    - *Nota Técnica:* Durante a auditoria, identificou-se que o valor total bruto presente no banco de dados extraído ($ 12.641.672,51) apresenta uma pequena variação de 0,03% em relação à expectativa inicial da contabilidade ($ 12.646.112,16). Esta discrepância foi documentada como inerente à extração da fonte de dados, sendo o pipeline ajustado para garantir a integridade absoluta com os dados do ERP.

---

## 📈 Perguntas de Negócio Respondidas
O dashboard permite filtrar e analisar:
- Evolução de pedidos e faturamento por período.
- Melhores produtos por ticket médio e volume.
- Ranking de clientes e cidades por valor negociado.
- Impacto de motivos de venda (ex: campanhas de "Promotion").