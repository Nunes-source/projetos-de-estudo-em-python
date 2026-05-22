# E-Commerce Hardware - Banco de Dados MySQL

Projeto de banco de dados para um e-commerce de hardware/peças de computador.

## Estrutura do Projeto

```
ecommerce-hardware-sql/
├── 01_schema.sql                  -- DDL: tabelas, constraints, indexes
├── 02_dados.sql                   -- INSERT: dados de exemplo (50+ por tabela)
├── 03_triggers.sql                -- Triggers (regras de negocio)
├── 04_views_procedures.sql        -- Views e Procedures
├── consultas/
│   ├── 01_selects_simples.sql     -- 18 SELECTs simples
│   ├── 02_selects_filtro.sql      -- 18 SELECTs com filtro (WHERE)
│   ├── 03_selects_join.sql        -- 12 SELECTs com JOIN
│   ├── 04_selects_agregacao.sql   -- 17 SELECTs com agregacao (COUNT, SUM, AVG, MIN, MAX)
│   ├── 05_updates.sql             -- 14 UPDATEs
│   └── 06_deletes.sql             -- 12 DELETEs
└── README.md
```

## Como Executar

Execute os arquivos na seguinte ordem no MySQL Workbench:

1. `01_schema.sql` - Cria o banco e as tabelas
2. `02_dados.sql` - Insere os dados de exemplo
3. `03_triggers.sql` - Cria os triggers
4. `04_views_procedures.sql` - Cria views e procedures
5. Arquivos em `consultas/` - Execute conforme necessidade

## Tabelas (15)

| # | Tabela | Descricao |
|---|--------|-----------|
| 1 | CLIENTE | Dados dos clientes |
| 2 | ENDERECO | Enderecos de entrega/cobranca |
| 3 | CATEGORIA | Categorias de produtos |
| 4 | MARCA | Marcas de produtos |
| 5 | PRODUTO | Catalogo de produtos |
| 6 | TIPOESPECIFICACAO | Tipos de especificacao tecnica |
| 7 | VALORESPECIFICACAO | Valores possiveis para cada tipo |
| 8 | PRODUTOESPECIFICACAO | Vinculo produto-especificacao |
| 9 | CARRINHO | Carrinho de compras |
| 10 | ITEMCARRINHO | Itens no carrinho |
| 11 | PEDIDO | Pedidos realizados |
| 12 | ITEMPEDIDO | Itens de cada pedido |
| 13 | PAGAMENTO | Pagamentos dos pedidos |
| 14 | ENVIO | Envios/entregas |
| 15 | ESTOQUE | Controle de estoque |

## Regras de Negocio

1. **CHECK preco >= 0** - Preco do produto nunca negativo
2. **CHECK quantidade > 0** - Item do carrinho/pedido deve ter quantidade positiva
3. **CHECK quantidade >= 0** - Estoque nunca fica negativo
4. **UNIQUE(email)** e **UNIQUE(cpf)** - Cliente nao pode ter email ou CPF duplicado
5. **UNIQUE(id_produto, id_tipo_especificacao, id_valor_especificacao)** - Evita duplicidade na especificacao do produto
6. **Trigger trg_atualizar_estoque** - Reduz estoque automaticamente ao criar item de pedido
7. **Trigger trg_calcular_valor_pedido** - Calcula valor total do pedido automaticamente
8. **Trigger trg_validar_preco_item** - Impede inserir item com preco negativo
9. **View vw_compatibilidade** - Compatibilidade automatica entre produtos de categorias DIFERENTES que compartilham especificacoes (ex: processador AM4 + placa-mae AM4)
10. **Procedure buscar_compatibilidade** - Busca todos os produtos compativeis com um produto especifico

## Compatibilidade Automatica

O sistema de compatibilidade usa a tabela `PRODUTOESPECIFICACAO` com constraint `UNIQUE(id_produto, id_tipo_especificacao, id_valor_especificacao)` para determinar automaticamente quais produtos sao compativeis.

**Regra:** Dois produtos sao compativeis quando compartilham o mesmo valor de especificacao (ex: mesmo socket, mesmo tipo de memoria) e pertencem a categorias DIFERENTES. Isso evita comparacoes sem sentido como "processador vs processador".

## Contagem de Requisitos

| Requisito | Minimo | Entregue |
|-----------|--------|----------|
| Tabelas | 10 | 15 |
| Regras de negocio | 5 | 10 |
| Registros por tabela | 50 | 55-90 |
| SELECTs simples | 15 | 18 |
| SELECTs com filtro | 15 | 18 |
| SELECTs com JOIN | 10 | 12 |
| COUNT | 3 | 5 |
| SUM | 3 | 4 |
| AVG | 3 | 4 |
| MIN/MAX | 3 | 4 |
| UPDATEs | 10 | 14 |
| DELETEs | 10 | 12 |
