-- =========================================================
-- SELECTS COM FILTRO (15+)
-- =========================================================

USE ecommerce_hardware;

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
