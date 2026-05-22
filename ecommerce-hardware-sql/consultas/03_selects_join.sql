-- =========================================================
-- SELECTS COM JOIN (10+)
-- =========================================================

USE ecommerce_hardware;

-- 1. Produtos com categoria e marca
SELECT p.nome AS produto, c.nome AS categoria, m.nome AS marca, p.preco
FROM PRODUTO p
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
JOIN MARCA m ON p.id_marca = m.id_marca;

-- 2. Pedidos com nome do cliente
SELECT pe.id_pedido, cl.nome AS cliente, pe.status, pe.valor_total
FROM PEDIDO pe
JOIN CLIENTE cl ON pe.id_cliente = cl.id_cliente;

-- 3. Itens do pedido com nome do produto
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
