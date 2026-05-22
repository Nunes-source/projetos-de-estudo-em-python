-- =========================================================
-- SELECTS SIMPLES (15+)
-- =========================================================

USE ecommerce_hardware;

-- 1. Todos os clientes
SELECT * FROM CLIENTE;

-- 2. Todos os produtos
SELECT * FROM PRODUTO;

-- 3. Todas as categorias
SELECT * FROM CATEGORIA;

-- 4. Todas as marcas
SELECT * FROM MARCA;

-- 5. Todos os pedidos
SELECT * FROM PEDIDO;

-- 6. Todos os itens de pedido
SELECT * FROM ITEMPEDIDO;

-- 7. Todos os pagamentos
SELECT * FROM PAGAMENTO;

-- 8. Todos os envios
SELECT * FROM ENVIO;

-- 9. Todo o estoque
SELECT * FROM ESTOQUE;

-- 10. Todos os carrinhos
SELECT * FROM CARRINHO;

-- 11. Todos os itens de carrinho
SELECT * FROM ITEMCARRINHO;

-- 12. Todos os enderecos
SELECT * FROM ENDERECO;

-- 13. Todos os tipos de especificacao
SELECT * FROM TIPOESPECIFICACAO;

-- 14. Todos os valores de especificacao
SELECT * FROM VALORESPECIFICACAO;

-- 15. Todas as especificacoes de produto
SELECT * FROM PRODUTOESPECIFICACAO;

-- 16. Nomes e emails dos clientes
SELECT nome, email FROM CLIENTE;

-- 17. Nomes e precos dos produtos
SELECT nome, preco FROM PRODUTO;

-- 18. Status e valor total dos pedidos
SELECT id_pedido, status, valor_total FROM PEDIDO;
