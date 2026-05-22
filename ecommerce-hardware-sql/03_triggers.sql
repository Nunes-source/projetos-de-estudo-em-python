-- =========================================================
-- ECOMMERCE HARDWARE DATABASE
-- Triggers (regras de negocio automaticas)
-- =========================================================

USE ecommerce_hardware;

-- =========================================================
-- TRIGGER 1: Atualizar estoque apos inserir item no pedido
-- =========================================================

DELIMITER $$

CREATE TRIGGER trg_atualizar_estoque
AFTER INSERT ON ITEMPEDIDO
FOR EACH ROW
BEGIN
    UPDATE ESTOQUE
    SET quantidade = quantidade - NEW.quantidade
    WHERE id_produto = NEW.id_produto;
END $$

DELIMITER ;

-- =========================================================
-- TRIGGER 2: Calcular valor total do pedido automaticamente
-- =========================================================

DELIMITER $$

CREATE TRIGGER trg_calcular_valor_pedido
AFTER INSERT ON ITEMPEDIDO
FOR EACH ROW
BEGIN
    UPDATE PEDIDO
    SET valor_total = (
        SELECT SUM(quantidade * preco_unitario)
        FROM ITEMPEDIDO
        WHERE id_pedido = NEW.id_pedido
    )
    WHERE id_pedido = NEW.id_pedido;
END $$

DELIMITER ;

-- =========================================================
-- TRIGGER 3: Impedir pedido com valor negativo
-- =========================================================

DELIMITER $$

CREATE TRIGGER trg_validar_preco_item
BEFORE INSERT ON ITEMPEDIDO
FOR EACH ROW
BEGIN
    IF NEW.preco_unitario < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Preco unitario nao pode ser negativo';
    END IF;
END $$

DELIMITER ;
