# E-Commerce Hardware - Banco de Dados MySQL

Projeto de banco de dados para um e-commerce de pecas e perifericos de computador, desenvolvido para MySQL Workbench.

---

## Como Executar

1. Abra o MySQL Workbench
2. Conecte-se ao servidor MySQL
3. Abra o arquivo `ecommerce_hardware_workbench.sql`
4. Execute o script completo (Ctrl+Shift+Enter)
5. Use as consultas abaixo para explorar os dados

---

## Estrutura do Banco

### Tabelas (15)

| # | Tabela | Descricao |
|---|--------|-----------|
| 1 | CLIENTE | Dados dos clientes (nome, email, telefone, cpf) |
| 2 | ENDERECO | Enderecos de entrega e cobranca dos clientes |
| 3 | CATEGORIA | Categorias de produtos (Processador, Placa de Video, etc.) |
| 4 | MARCA | Marcas dos produtos (AMD, Intel, NVIDIA, etc.) |
| 5 | PRODUTO | Catalogo de produtos com preco, status e vinculo a categoria/marca |
| 6 | TIPOESPECIFICACAO | Tipos de especificacao tecnica (Socket, Tipo Memoria, PCIe, etc.) |
| 7 | VALORESPECIFICACAO | Valores possiveis para cada tipo (AM4, DDR4, PCIe 4.0, etc.) |
| 8 | PRODUTOESPECIFICACAO | Vincula cada produto as suas especificacoes tecnicas |
| 9 | CARRINHO | Carrinho de compras (um por cliente) |
| 10 | ITEMCARRINHO | Itens dentro do carrinho |
| 11 | PEDIDO | Pedidos realizados com status e valor total |
| 12 | ITEMPEDIDO | Itens de cada pedido com quantidade e preco unitario |
| 13 | PAGAMENTO | Pagamentos vinculados aos pedidos (PIX, CARTAO, BOLETO) |
| 14 | ENVIO | Dados de envio/entrega com codigo de rastreio |
| 15 | ESTOQUE | Controle de quantidade e localizacao por produto |

### Indexes

Aplicados apenas nas tabelas com consultas frequentes por FK:

| Tabela | Index | Coluna |
|--------|-------|--------|
| PRODUTO | idx_produto_categoria | id_categoria |
| PRODUTO | idx_produto_marca | id_marca |
| PEDIDO | idx_pedido_cliente | id_cliente |
| ITEMPEDIDO | idx_itempedido_pedido | id_pedido |
| ITEMPEDIDO | idx_itempedido_produto | id_produto |
| PRODUTOESPECIFICACAO | idx_produtoespecificacao_produto | id_produto |
| PRODUTOESPECIFICACAO | idx_produtoespecificacao_valor | id_valor_especificacao |

---

## Regras de Negocio (10)

1. **CHECK preco >= 0** (PRODUTO) - Preco nunca negativo
2. **CHECK quantidade > 0** (ITEMCARRINHO) - Item deve ter pelo menos 1 unidade
3. **CHECK quantidade > 0** (ITEMPEDIDO) - Item do pedido deve ter quantidade positiva
4. **CHECK preco_unitario >= 0** (ITEMPEDIDO) - Preco unitario nunca negativo
5. **CHECK quantidade >= 0** (ESTOQUE) - Estoque nunca fica negativo
6. **CHECK valor >= 0** (PAGAMENTO) - Valor do pagamento nunca negativo
7. **UNIQUE(email)** e **UNIQUE(cpf)** (CLIENTE) - Sem duplicatas de email ou CPF
8. **UNIQUE(id_produto, id_tipo_especificacao, id_valor_especificacao)** (PRODUTOESPECIFICACAO) - Evita duplicidade, permite multiplos valores por tipo (ex: placa-mae com DDR4 e DDR5)
9. **Trigger trg_atualizar_estoque** - Reduz estoque automaticamente ao inserir item no pedido
10. **Trigger trg_calcular_valor_pedido** - Calcula valor total do pedido automaticamente

---

## Compatibilidade Automatica

O sistema usa a view `vw_compatibilidade` para determinar automaticamente quais produtos sao compativeis.

**Regra:** Dois produtos sao compativeis quando compartilham o mesmo valor de especificacao (ex: mesmo socket, mesmo tipo de memoria) e pertencem a **categorias DIFERENTES**.

Exemplo: Processador Ryzen 5 5600 (Socket AM4) e Placa-mae ASUS TUF B550M (Socket AM4) = COMPATIVEIS
Nunca compara: Ryzen 5 5600 vs Ryzen 7 5700X (ambos processadores)

```sql
-- Ver todas as compatibilidades
SELECT * FROM vw_compatibilidade;

-- Buscar compativeis de um produto especifico
CALL buscar_compatibilidade(1);
```

---

## Consultas Extras

As consultas abaixo NAO estao no arquivo SQL principal. Copie e execute no MySQL Workbench conforme necessidade.

### SELECTs com Filtro (18)

```sql
-- 1. Produtos com preco acima de R$1000
SELECT nome, preco FROM PRODUTO WHERE preco > 1000;

-- 2. Produtos ativos
SELECT nome, preco FROM PRODUTO WHERE status = 'ATIVO';

-- 3. Produtos inativos
SELECT nome, preco FROM PRODUTO WHERE status = 'INATIVO';

-- 4. Pedidos pendentes
SELECT * FROM PEDIDO WHERE status = 'PENDENTE';

-- 5. Pedidos pagos
SELECT * FROM PEDIDO WHERE status = 'PAGO';

-- 6. Pedidos cancelados
SELECT * FROM PEDIDO WHERE status = 'CANCELADO';

-- 7. Pagamentos aprovados
SELECT * FROM PAGAMENTO WHERE status = 'APROVADO';

-- 8. Pagamentos via PIX
SELECT * FROM PAGAMENTO WHERE tipo = 'PIX';

-- 9. Envios com status enviado
SELECT * FROM ENVIO WHERE status = 'ENVIADO';

-- 10. Estoque com menos de 20 unidades
SELECT e.id_produto, p.nome, e.quantidade
FROM ESTOQUE e
JOIN PRODUTO p ON e.id_produto = p.id_produto
WHERE e.quantidade < 20;

-- 11. Clientes de Recife
SELECT cl.nome, en.cidade
FROM CLIENTE cl
JOIN ENDERECO en ON cl.id_cliente = en.id_cliente
WHERE en.cidade = 'Recife';

-- 12. Produtos com preco entre R$500 e R$2000
SELECT nome, preco FROM PRODUTO WHERE preco BETWEEN 500 AND 2000;

-- 13. Produtos da categoria Processador (id=1)
SELECT nome, preco FROM PRODUTO WHERE id_categoria = 1;

-- 14. Produtos da marca AMD (id=1)
SELECT nome, preco FROM PRODUTO WHERE id_marca = 1;

-- 15. Enderecos do tipo ENTREGA
SELECT * FROM ENDERECO WHERE tipo = 'ENTREGA';

-- 16. Pedidos com valor acima de R$3000
SELECT * FROM PEDIDO WHERE valor_total > 3000;

-- 17. Clientes com email contendo 'email.com'
SELECT nome, email FROM CLIENTE WHERE email LIKE '%email.com';

-- 18. Produtos cujo nome contem 'RTX'
SELECT nome, preco FROM PRODUTO WHERE nome LIKE '%RTX%';
```

### SELECTs com JOIN (12)

```sql
-- 1. Produtos com categoria e marca
SELECT p.nome AS produto, c.nome AS categoria, m.nome AS marca, p.preco
FROM PRODUTO p
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
JOIN MARCA m ON p.id_marca = m.id_marca;

-- 2. Pedidos com nome do cliente
SELECT pe.id_pedido, cl.nome AS cliente, pe.status, pe.valor_total
FROM PEDIDO pe
JOIN CLIENTE cl ON pe.id_cliente = cl.id_cliente;

-- 3. Itens do pedido com nome do produto e subtotal
SELECT ip.id_pedido, p.nome AS produto, ip.quantidade, ip.preco_unitario,
       (ip.quantidade * ip.preco_unitario) AS subtotal
FROM ITEMPEDIDO ip
JOIN PRODUTO p ON ip.id_produto = p.id_produto;

-- 4. Clientes e seus enderecos
SELECT cl.nome AS cliente, en.rua, en.cidade, en.estado, en.tipo
FROM CLIENTE cl
JOIN ENDERECO en ON cl.id_cliente = en.id_cliente;

-- 5. Estoque com nome do produto e categoria
SELECT p.nome AS produto, c.nome AS categoria, e.quantidade, e.localizacao
FROM ESTOQUE e
JOIN PRODUTO p ON e.id_produto = p.id_produto
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria;

-- 6. Pagamentos com dados do pedido e cliente
SELECT pg.id_pagamento, cl.nome AS cliente, pg.tipo, pg.status, pg.valor
FROM PAGAMENTO pg
JOIN PEDIDO pe ON pg.id_pedido = pe.id_pedido
JOIN CLIENTE cl ON pe.id_cliente = cl.id_cliente;

-- 7. Envios com endereco completo
SELECT ev.id_envio, ev.codigo_rastreio, ev.status,
       en.rua, en.cidade, en.estado
FROM ENVIO ev
JOIN ENDERECO en ON ev.id_endereco = en.id_endereco;

-- 8. Especificacoes completas dos produtos
SELECT p.nome AS produto, te.nome AS especificacao, ve.valor
FROM PRODUTOESPECIFICACAO pe
JOIN PRODUTO p ON pe.id_produto = p.id_produto
JOIN TIPOESPECIFICACAO te ON pe.id_tipo_especificacao = te.id_tipo_especificacao
JOIN VALORESPECIFICACAO ve ON pe.id_valor_especificacao = ve.id_valor_especificacao;

-- 9. Itens do carrinho com nome do produto e cliente
SELECT cl.nome AS cliente, p.nome AS produto, ic.quantidade
FROM ITEMCARRINHO ic
JOIN CARRINHO ca ON ic.id_carrinho = ca.id_carrinho
JOIN CLIENTE cl ON ca.id_cliente = cl.id_cliente
JOIN PRODUTO p ON ic.id_produto = p.id_produto;

-- 10. Compatibilidade automatica (via view)
SELECT * FROM vw_compatibilidade;

-- 11. Pedidos entregues com dados de envio
SELECT pe.id_pedido, cl.nome AS cliente, pe.valor_total,
       ev.codigo_rastreio, ev.status AS status_envio
FROM PEDIDO pe
JOIN CLIENTE cl ON pe.id_cliente = cl.id_cliente
JOIN ENVIO ev ON pe.id_pedido = ev.id_pedido
WHERE pe.status = 'ENTREGUE';

-- 12. Produtos com estoque baixo e suas marcas
SELECT p.nome AS produto, m.nome AS marca, e.quantidade
FROM ESTOQUE e
JOIN PRODUTO p ON e.id_produto = p.id_produto
JOIN MARCA m ON p.id_marca = m.id_marca
WHERE e.quantidade < 15
ORDER BY e.quantidade ASC;
```

### Consultas com Agregacao (17)

#### COUNT (5)

```sql
-- 1. Total de produtos cadastrados
SELECT COUNT(*) AS total_produtos FROM PRODUTO;

-- 2. Total de clientes cadastrados
SELECT COUNT(*) AS total_clientes FROM CLIENTE;

-- 3. Quantidade de produtos por categoria
SELECT c.nome AS categoria, COUNT(p.id_produto) AS total_produtos
FROM CATEGORIA c
LEFT JOIN PRODUTO p ON c.id_categoria = p.id_categoria
GROUP BY c.nome
ORDER BY total_produtos DESC;

-- 4. Quantidade de pedidos por status
SELECT status, COUNT(*) AS total
FROM PEDIDO
GROUP BY status;

-- 5. Quantidade de produtos por marca
SELECT m.nome AS marca, COUNT(p.id_produto) AS total_produtos
FROM MARCA m
LEFT JOIN PRODUTO p ON m.id_marca = p.id_marca
GROUP BY m.nome
ORDER BY total_produtos DESC;
```

#### SUM (4)

```sql
-- 6. Valor total de todas as vendas
SELECT SUM(valor_total) AS total_vendas FROM PEDIDO;

-- 7. Valor total de vendas por cliente
SELECT cl.nome AS cliente, SUM(pe.valor_total) AS total_gasto
FROM PEDIDO pe
JOIN CLIENTE cl ON pe.id_cliente = cl.id_cliente
GROUP BY cl.nome
ORDER BY total_gasto DESC;

-- 8. Quantidade total de itens em estoque por categoria
SELECT c.nome AS categoria, SUM(e.quantidade) AS total_estoque
FROM ESTOQUE e
JOIN PRODUTO p ON e.id_produto = p.id_produto
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
GROUP BY c.nome
ORDER BY total_estoque DESC;

-- 9. Total de pagamentos aprovados
SELECT SUM(valor) AS total_aprovado
FROM PAGAMENTO
WHERE status = 'APROVADO';
```

#### AVG (4)

```sql
-- 10. Preco medio dos produtos
SELECT AVG(preco) AS preco_medio FROM PRODUTO;

-- 11. Preco medio dos produtos por categoria
SELECT c.nome AS categoria, AVG(p.preco) AS preco_medio
FROM PRODUTO p
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
GROUP BY c.nome
ORDER BY preco_medio DESC;

-- 12. Valor medio dos pedidos
SELECT AVG(valor_total) AS valor_medio_pedido FROM PEDIDO;

-- 13. Quantidade media em estoque por produto
SELECT AVG(quantidade) AS media_estoque FROM ESTOQUE;
```

#### MIN / MAX (4)

```sql
-- 14. Produto mais barato e mais caro
SELECT MIN(preco) AS menor_preco, MAX(preco) AS maior_preco FROM PRODUTO;

-- 15. Menor e maior estoque
SELECT MIN(quantidade) AS menor_estoque, MAX(quantidade) AS maior_estoque FROM ESTOQUE;

-- 16. Pedido de menor e maior valor
SELECT MIN(valor_total) AS menor_pedido, MAX(valor_total) AS maior_pedido FROM PEDIDO;

-- 17. Produto mais caro por categoria
SELECT c.nome AS categoria, MAX(p.preco) AS produto_mais_caro
FROM PRODUTO p
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
GROUP BY c.nome
ORDER BY produto_mais_caro DESC;
```

### UPDATEs (14)

```sql
-- 1. Atualizar telefone de um cliente
UPDATE CLIENTE SET telefone = '81912345678' WHERE id_cliente = 1;

-- 2. Aplicar desconto de 10% em todos os processadores
UPDATE PRODUTO SET preco = preco * 0.90 WHERE id_categoria = 1;

-- 3. Inativar produto sem estoque
UPDATE PRODUTO SET status = 'INATIVO'
WHERE id_produto IN (
    SELECT id_produto FROM ESTOQUE WHERE quantidade = 0
);

-- 4. Atualizar status de pedido para PAGO
UPDATE PEDIDO SET status = 'PAGO' WHERE id_pedido = 1;

-- 5. Atualizar status de envio para ENTREGUE
UPDATE ENVIO SET status = 'ENTREGUE' WHERE id_envio = 1;

-- 6. Corrigir CEP de um endereco
UPDATE ENDERECO SET cep = '50030000' WHERE id_endereco = 1;

-- 7. Aumentar estoque de um produto em 50 unidades
UPDATE ESTOQUE SET quantidade = quantidade + 50 WHERE id_produto = 6;

-- 8. Atualizar localizacao de estoque
UPDATE ESTOQUE SET localizacao = 'Z1' WHERE id_produto = 10;

-- 9. Aprovar pagamento pendente
UPDATE PAGAMENTO SET status = 'APROVADO' WHERE id_pagamento = 1;

-- 10. Alterar nome de um cliente
UPDATE CLIENTE SET nome = 'Joao Pedro Silva' WHERE id_cliente = 1;

-- 11. Aumentar preco de todas as placas de video em 5%
UPDATE PRODUTO SET preco = preco * 1.05 WHERE id_categoria = 3;

-- 12. Atualizar descricao de um produto
UPDATE PRODUTO SET descricao = 'CPU AMD Ryzen 5 5600 6 nucleos 12 threads AM4' WHERE id_produto = 1;

-- 13. Cancelar pedido especifico
UPDATE PEDIDO SET status = 'CANCELADO' WHERE id_pedido = 3;

-- 14. Recusar pagamento de pedido cancelado
UPDATE PAGAMENTO SET status = 'RECUSADO'
WHERE id_pedido IN (
    SELECT id_pedido FROM PEDIDO WHERE status = 'CANCELADO'
);
```

### DELETEs (12)

```sql
-- 1. Remover item do carrinho
DELETE FROM ITEMCARRINHO WHERE id_item = 1;

-- 2. Remover endereco de cobranca de um cliente
DELETE FROM ENDERECO WHERE id_endereco = 3;

-- 3. Remover carrinho vazio (sem itens)
DELETE FROM CARRINHO
WHERE id_carrinho NOT IN (
    SELECT DISTINCT id_carrinho FROM ITEMCARRINHO
);

-- 4. Remover item de um pedido especifico
DELETE FROM ITEMPEDIDO WHERE id_item = 5;

-- 5. Remover envio de pedido cancelado
DELETE FROM ENVIO
WHERE id_pedido IN (
    SELECT id_pedido FROM PEDIDO WHERE status = 'CANCELADO'
);

-- 6. Remover pagamento recusado
DELETE FROM PAGAMENTO WHERE status = 'RECUSADO';

-- 7. Remover especificacao de produto
DELETE FROM PRODUTOESPECIFICACAO WHERE id_produto_especificacao = 1;

-- 8. Remover todos os itens de um carrinho especifico
DELETE FROM ITEMCARRINHO WHERE id_carrinho = 2;

-- 9. Remover cliente (cascade remove endereco e carrinho)
DELETE FROM CLIENTE WHERE id_cliente = 15;

-- 10. Remover produto inativo do estoque
DELETE FROM ESTOQUE
WHERE id_produto IN (
    SELECT id_produto FROM PRODUTO WHERE status = 'INATIVO'
);

-- 11. Remover pedido especifico (cascade remove itens, pagamento, envio)
DELETE FROM PEDIDO WHERE id_pedido = 15;

-- 12. Remover itens do carrinho com quantidade maior que 2
DELETE FROM ITEMCARRINHO WHERE quantidade > 2;
```

---

## Resumo de Requisitos

| Requisito | Minimo | Entregue |
|-----------|--------|----------|
| Tabelas | 10 | 15 |
| Regras de negocio | 5 | 10 |
| Registros por tabela | - | 15-25 |
| SELECTs simples | 15 | 15 (no SQL) |
| SELECTs com filtro | 15 | 18 (no README) |
| SELECTs com JOIN | 10 | 12 (no README) |
| COUNT | 3 | 5 (no README) |
| SUM | 3 | 4 (no README) |
| AVG | 3 | 4 (no README) |
| MIN/MAX | 3 | 4 (no README) |
| UPDATEs | 10 | 14 (no README) |
| DELETEs | 10 | 12 (no README) |

---

## Views e Procedures

| Tipo | Nome | Descricao |
|------|------|-----------|
| VIEW | vw_catalogo_produtos | Catalogo completo com categoria e marca |
| VIEW | vw_compatibilidade | Compatibilidade automatica entre categorias diferentes |
| VIEW | vw_pedidos_cliente | Resumo de pedidos e gasto total por cliente |
| PROCEDURE | buscar_compatibilidade(id) | Busca produtos compativeis com um produto especifico |
| PROCEDURE | resumo_estoque_categoria() | Resumo do estoque agrupado por categoria |

## Triggers

| Trigger | Evento | Descricao |
|---------|--------|-----------|
| trg_atualizar_estoque | AFTER INSERT em ITEMPEDIDO | Reduz estoque automaticamente |
| trg_calcular_valor_pedido | AFTER INSERT em ITEMPEDIDO | Recalcula valor total do pedido |
| trg_validar_preco_item | BEFORE INSERT em ITEMPEDIDO | Impede preco unitario negativo |
