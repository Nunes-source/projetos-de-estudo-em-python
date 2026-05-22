-- =========================================================
-- ECOMMERCE HARDWARE DATABASE
-- Views e Procedures
-- =========================================================

USE ecommerce_hardware;

-- =========================================================
-- VIEW 1: Catalogo de produtos com categoria e marca
-- =========================================================

CREATE VIEW vw_catalogo_produtos AS
SELECT
    p.id_produto,
    p.nome AS produto,
    c.nome AS categoria,
    m.nome AS marca,
    p.preco,
    p.status
FROM PRODUTO p
JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
JOIN MARCA m ON p.id_marca = m.id_marca;

-- =========================================================
-- VIEW 2: Compatibilidade automatica entre produtos
--
-- Regra profissional: compara apenas produtos de categorias
-- DIFERENTES que compartilham o mesmo valor de especificacao.
-- Exemplo: processador AM4 <-> placa-mae AM4
-- NAO compara: processador AM4 <-> processador AM4
-- =========================================================

CREATE VIEW vw_compatibilidade AS
SELECT
    p1.id_produto AS id_produto_1,
    p1.nome AS produto_1,
    c1.nome AS categoria_1,
    p2.id_produto AS id_produto_2,
    p2.nome AS produto_2,
    c2.nome AS categoria_2,
    te.nome AS especificacao,
    ve.valor AS valor_compartilhado
FROM PRODUTOESPECIFICACAO pe1
JOIN PRODUTOESPECIFICACAO pe2
    ON pe1.id_valor_especificacao = pe2.id_valor_especificacao
    AND pe1.id_tipo_especificacao = pe2.id_tipo_especificacao
    AND pe1.id_produto < pe2.id_produto
JOIN PRODUTO p1 ON pe1.id_produto = p1.id_produto
JOIN PRODUTO p2 ON pe2.id_produto = p2.id_produto
JOIN CATEGORIA c1 ON p1.id_categoria = c1.id_categoria
JOIN CATEGORIA c2 ON p2.id_categoria = c2.id_categoria
JOIN TIPOESPECIFICACAO te ON pe1.id_tipo_especificacao = te.id_tipo_especificacao
JOIN VALORESPECIFICACAO ve ON pe1.id_valor_especificacao = ve.id_valor_especificacao
WHERE p1.id_categoria <> p2.id_categoria;

-- =========================================================
-- VIEW 3: Resumo de pedidos por cliente
-- =========================================================

CREATE VIEW vw_pedidos_cliente AS
SELECT
    cl.id_cliente,
    cl.nome AS cliente,
    COUNT(p.id_pedido) AS total_pedidos,
    COALESCE(SUM(p.valor_total), 0) AS valor_total_gasto
FROM CLIENTE cl
LEFT JOIN PEDIDO p ON cl.id_cliente = p.id_cliente
GROUP BY cl.id_cliente, cl.nome;

-- =========================================================
-- PROCEDURE 1: Buscar compatibilidade de um produto
-- =========================================================

DELIMITER $$

CREATE PROCEDURE buscar_compatibilidade(IN produto_id INT)
BEGIN
    SELECT
        produto_1,
        categoria_1,
        produto_2,
        categoria_2,
        especificacao,
        valor_compartilhado
    FROM vw_compatibilidade
    WHERE id_produto_1 = produto_id
       OR id_produto_2 = produto_id;
END $$

DELIMITER ;

-- =========================================================
-- PROCEDURE 2: Resumo do estoque por categoria
-- =========================================================

DELIMITER $$

CREATE PROCEDURE resumo_estoque_categoria()
BEGIN
    SELECT
        c.nome AS categoria,
        COUNT(e.id_estoque) AS total_itens,
        SUM(e.quantidade) AS quantidade_total,
        MIN(e.quantidade) AS menor_estoque,
        MAX(e.quantidade) AS maior_estoque
    FROM ESTOQUE e
    JOIN PRODUTO p ON e.id_produto = p.id_produto
    JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
    GROUP BY c.nome
    ORDER BY quantidade_total DESC;
END $$

DELIMITER ;

-- =========================================================
-- TESTES RAPIDOS DAS VIEWS E PROCEDURES
-- =========================================================

SELECT * FROM vw_catalogo_produtos LIMIT 10;
SELECT * FROM vw_compatibilidade LIMIT 10;
SELECT * FROM vw_pedidos_cliente LIMIT 10;

CALL buscar_compatibilidade(1);
CALL resumo_estoque_categoria();
