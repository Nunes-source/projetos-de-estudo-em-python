-- =========================================================
-- DELETES (10+)
-- =========================================================

USE ecommerce_hardware;

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
DELETE FROM CLIENTE WHERE id_cliente = 55;

-- 10. Remover produto inativo do estoque
DELETE FROM ESTOQUE
WHERE id_produto IN (
    SELECT id_produto FROM PRODUTO WHERE status = 'INATIVO'
);

-- 11. Remover pedido especifico (cascade remove itens, pagamento, envio)
DELETE FROM PEDIDO WHERE id_pedido = 50;

-- 12. Remover itens do carrinho com quantidade maior que 2
DELETE FROM ITEMCARRINHO WHERE quantidade > 2;
