-- =========================================================
-- SELECTS COM AGREGACAO (3+ de cada: COUNT, SUM, AVG, MIN, MAX)
-- =========================================================

USE ecommerce_hardware;

-- =========================================================
-- COUNT (5)
-- =========================================================

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

-- =========================================================
-- SUM (4)
-- =========================================================

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

-- =========================================================
-- AVG (4)
-- =========================================================

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

-- =========================================================
-- MIN / MAX (4)
-- =========================================================

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
