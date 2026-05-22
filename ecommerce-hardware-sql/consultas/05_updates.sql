-- =========================================================
-- UPDATES (10+)
-- =========================================================

USE ecommerce_hardware;

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

-- 13. Cancelar pedidos pendentes antigos (exemplo)
UPDATE PEDIDO SET status = 'CANCELADO' WHERE id_pedido = 3;

-- 14. Recusar pagamento de pedido cancelado
UPDATE PAGAMENTO SET status = 'RECUSADO'
WHERE id_pedido IN (
    SELECT id_pedido FROM PEDIDO WHERE status = 'CANCELADO'
);
