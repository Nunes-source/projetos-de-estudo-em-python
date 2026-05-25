-- Arquivo unico para MySQL Workbench
DROP DATABASE IF EXISTS ecommerce_hardware;
CREATE DATABASE ecommerce_hardware;
USE ecommerce_hardware;

-- 1. CLIENTE

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cpf CHAR(11) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. ENDERECO

CREATE TABLE ENDERECO (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    rua VARCHAR(150) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    tipo ENUM('ENTREGA', 'COBRANCA') NOT NULL,

    CONSTRAINT fk_endereco_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. CATEGORIA

CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 4. MARCA

CREATE TABLE MARCA (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- 5. PRODUTO

CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    status ENUM('ATIVO', 'INATIVO') DEFAULT 'ATIVO',
    id_categoria INT NOT NULL,
    id_marca INT NOT NULL,

    CONSTRAINT chk_preco_produto CHECK (preco >= 0),

    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),

    CONSTRAINT fk_produto_marca
        FOREIGN KEY (id_marca) REFERENCES MARCA(id_marca)
) ENGINE=InnoDB;

-- 6. TIPOESPECIFICACAO

CREATE TABLE TIPOESPECIFICACAO (
    id_tipo_especificacao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
) ENGINE=InnoDB;

-- 7. VALORESPECIFICACAO

CREATE TABLE VALORESPECIFICACAO (
    id_valor_especificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_especificacao INT NOT NULL,
    valor VARCHAR(100) NOT NULL,

    CONSTRAINT fk_valorespecificacao_tipo
        FOREIGN KEY (id_tipo_especificacao)
        REFERENCES TIPOESPECIFICACAO(id_tipo_especificacao)
) ENGINE=InnoDB;

-- 8. PRODUTOESPECIFICACAO

CREATE TABLE PRODUTOESPECIFICACAO (
    id_produto_especificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_tipo_especificacao INT NOT NULL,
    id_valor_especificacao INT NOT NULL,

    CONSTRAINT uq_produto_tipo_valor
        UNIQUE (id_produto, id_tipo_especificacao, id_valor_especificacao),

    CONSTRAINT fk_produtoespecificacao_produto
        FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
        ON DELETE CASCADE,

    CONSTRAINT fk_produtoespecificacao_tipo
        FOREIGN KEY (id_tipo_especificacao) REFERENCES TIPOESPECIFICACAO(id_tipo_especificacao),

    CONSTRAINT fk_produtoespecificacao_valor
        FOREIGN KEY (id_valor_especificacao) REFERENCES VALORESPECIFICACAO(id_valor_especificacao)
) ENGINE=InnoDB;

-- 9. CARRINHO

CREATE TABLE CARRINHO (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL UNIQUE,

    CONSTRAINT fk_carrinho_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- 10. ITEMCARRINHO

CREATE TABLE ITEMCARRINHO (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_carrinho INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,

    CONSTRAINT chk_quantidade_itemcarrinho CHECK (quantidade > 0),

    CONSTRAINT fk_itemcarrinho_carrinho
        FOREIGN KEY (id_carrinho) REFERENCES CARRINHO(id_carrinho)
        ON DELETE CASCADE,

    CONSTRAINT fk_itemcarrinho_produto
        FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
) ENGINE=InnoDB;

-- 11. PEDIDO

CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDENTE','PAGO','ENVIADO','ENTREGUE','CANCELADO') DEFAULT 'PENDENTE',
    valor_total DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
) ENGINE=InnoDB;

-- 12. ITEMPEDIDO

CREATE TABLE ITEMPEDIDO (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_quantidade_itempedido CHECK (quantidade > 0),
    CONSTRAINT chk_preco_itempedido CHECK (preco_unitario >= 0),

    CONSTRAINT fk_itempedido_pedido
        FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
        ON DELETE CASCADE,

    CONSTRAINT fk_itempedido_produto
        FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
) ENGINE=InnoDB;

-- 13. PAGAMENTO

CREATE TABLE PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    tipo ENUM('PIX','CARTAO','BOLETO') NOT NULL,
    status ENUM('PENDENTE','APROVADO','RECUSADO') DEFAULT 'PENDENTE',
    valor DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_valor_pagamento CHECK (valor >= 0),

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- 14. ENVIO

CREATE TABLE ENVIO (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    id_endereco INT NOT NULL,
    status ENUM('PREPARANDO','ENVIADO','ENTREGUE') DEFAULT 'PREPARANDO',
    codigo_rastreio VARCHAR(100),

    CONSTRAINT fk_envio_pedido
        FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
        ON DELETE CASCADE,

    CONSTRAINT fk_envio_endereco
        FOREIGN KEY (id_endereco) REFERENCES ENDERECO(id_endereco)
) ENGINE=InnoDB;

-- 15. ESTOQUE

CREATE TABLE ESTOQUE (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL UNIQUE,
    quantidade INT NOT NULL DEFAULT 0,
    localizacao VARCHAR(100),

    CONSTRAINT chk_quantidade_estoque CHECK (quantidade >= 0),

    CONSTRAINT fk_estoque_produto
        FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
        ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE INDEX idx_produto_categoria ON PRODUTO(id_categoria);
CREATE INDEX idx_produto_marca ON PRODUTO(id_marca);

CREATE INDEX idx_pedido_cliente ON PEDIDO(id_cliente);

CREATE INDEX idx_itempedido_pedido ON ITEMPEDIDO(id_pedido);
CREATE INDEX idx_itempedido_produto ON ITEMPEDIDO(id_produto);

CREATE INDEX idx_produtoespecificacao_produto ON PRODUTOESPECIFICACAO(id_produto);
CREATE INDEX idx_produtoespecificacao_valor ON PRODUTOESPECIFICACAO(id_valor_especificacao);

-- CATEGORIAS
INSERT INTO CATEGORIA (nome) VALUES
('Processador'),
('Placa-mae'),
('Placa de Video'),
('Memoria RAM'),
('SSD'),
('HD'),
('Fonte'),
('Gabinete'),
('Cooler'),
('Monitor'),
('Teclado'),
('Mouse');

-- MARCAS
INSERT INTO MARCA (nome) VALUES
('AMD'),
('Intel'),
('NVIDIA'),
('ASUS'),
('Gigabyte'),
('MSI'),
('Corsair'),
('Kingston'),
('Samsung'),
('Cooler Master'),
('EVGA'),
('Western Digital'),
('Seagate'),
('Redragon'),
('HyperX');

-- TIPOS ESPECIFICACAO
INSERT INTO TIPOESPECIFICACAO (nome, descricao) VALUES
('Socket', 'Socket do processador ou placa-mae'),
('Tipo Memoria', 'Tipo de memoria RAM suportada'),
('PCIe', 'Versao PCI Express'),
('Potencia', 'Potencia da fonte em watts'),
('Tamanho Tela', 'Tamanho da tela do monitor'),
('Capacidade', 'Capacidade de armazenamento'),
('Formato', 'Formato do gabinete'),
('Interface', 'Interface de conexao do armazenamento');

-- VALORES ESPECIFICACAO
INSERT INTO VALORESPECIFICACAO (id_tipo_especificacao, valor) VALUES
(1, 'AM4'),
(1, 'AM5'),
(1, 'LGA1700'),
(1, 'LGA1200'),
(2, 'DDR4'),
(2, 'DDR5'),
(3, 'PCIe 3.0'),
(3, 'PCIe 4.0'),
(3, 'PCIe 5.0'),
(4, '500W'),
(4, '650W'),
(4, '750W'),
(4, '850W'),
(5, '24 polegadas'),
(5, '27 polegadas'),
(6, '512GB'),
(6, '1TB'),
(6, '2TB'),
(7, 'ATX'),
(7, 'mATX'),
(8, 'SATA'),
(8, 'NVMe');

-- PRODUTOS (25)
INSERT INTO PRODUTO (nome, descricao, preco, id_categoria, id_marca) VALUES
('Ryzen 5 5600', 'CPU AMD 6 nucleos AM4', 899.90, 1, 1),
('Ryzen 7 5700X', 'CPU AMD 8 nucleos AM4', 1299.90, 1, 1),
('Ryzen 5 7600X', 'CPU AMD 6 nucleos AM5', 1599.90, 1, 1),
('Intel i5-12400F', 'CPU Intel 6 nucleos LGA1700', 999.90, 1, 2),
('Intel i7-13700K', 'CPU Intel 16 nucleos LGA1700', 2599.90, 1, 2),
('ASUS TUF B550M', 'Placa-mae AMD AM4 mATX DDR4', 899.90, 2, 4),
('Gigabyte B450M DS3H', 'Placa-mae AMD AM4 mATX DDR4', 599.90, 2, 5),
('MSI MAG Z790', 'Placa-mae Intel LGA1700 ATX DDR5', 1899.90, 2, 6),
('ASUS ROG X670E', 'Placa-mae AMD AM5 ATX DDR5', 2499.90, 2, 4),
('RTX 4060', 'GPU NVIDIA 8GB GDDR6', 2399.90, 3, 3),
('RTX 4070 Ti', 'GPU NVIDIA 12GB GDDR6X', 4899.90, 3, 3),
('RX 7600', 'GPU AMD 8GB GDDR6', 1999.90, 3, 1),
('RX 7900 XT', 'GPU AMD 20GB GDDR6', 6299.90, 3, 1),
('Corsair Vengeance 16GB DDR4 3200MHz', 'Kit 2x8GB DDR4', 349.90, 4, 7),
('Kingston Fury 32GB DDR5 5600MHz', 'Kit 2x16GB DDR5', 799.90, 4, 8),
('Samsung 980 PRO 1TB', 'SSD NVMe PCIe 4.0', 549.90, 5, 9),
('Kingston A2000 1TB', 'SSD NVMe PCIe 3.0', 449.90, 5, 8),
('WD Blue 1TB', 'HD 7200RPM SATA', 279.90, 6, 12),
('Seagate Barracuda 2TB', 'HD 7200RPM SATA', 429.90, 6, 13),
('Corsair RM650 650W', 'Fonte 80 Plus Gold', 499.90, 7, 7),
('Corsair RM750 750W', 'Fonte 80 Plus Gold', 599.90, 7, 7),
('Corsair 4000D', 'Gabinete ATX Mid Tower', 499.90, 8, 7),
('Cooler Master Hyper 212', 'Air Cooler 120mm', 249.90, 9, 10),
('Samsung Odyssey G5 27pol', 'Monitor 27 polegadas 144Hz', 1799.90, 10, 9),
('Redragon Kumara K552', 'Teclado mecanico RGB', 199.90, 11, 14);

-- PRODUTO ESPECIFICACAO
INSERT INTO PRODUTOESPECIFICACAO (id_produto, id_tipo_especificacao, id_valor_especificacao) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 2),
(4, 1, 3),
(5, 1, 3),
(1, 2, 5),
(2, 2, 5),
(3, 2, 6),
(4, 2, 5),
(4, 2, 6),
(5, 2, 5),
(5, 2, 6),
(6, 1, 1),
(7, 1, 1),
(8, 1, 3),
(9, 1, 2),
(6, 2, 5),
(7, 2, 5),
(8, 2, 6),
(9, 2, 6),
(6, 3, 8),
(7, 3, 7),
(8, 3, 9),
(9, 3, 9),
(10, 3, 8),
(11, 3, 8),
(12, 3, 8),
(13, 3, 8),
(14, 2, 5),
(15, 2, 6),
(16, 8, 22),
(16, 6, 17),
(16, 3, 8),
(17, 8, 22),
(17, 6, 17),
(17, 3, 7),
(18, 8, 21),
(18, 6, 17),
(19, 8, 21),
(19, 6, 18),
(20, 4, 11),
(21, 4, 12),
(22, 7, 19),
(24, 5, 15);

-- CLIENTES (15)
INSERT INTO CLIENTE (nome, email, telefone, cpf) VALUES
('Joao Silva', 'joao1@email.com', '81989353786', '10000000001'),
('Maria Souza', 'maria2@email.com', '81916780951', '10000000002'),
('Carlos Lima', 'carlos3@email.com', '81946743147', '10000000003'),
('Leticia Ramos', 'leticia4@email.com', '81996868717', '10000000004'),
('Roberto Pinto', 'roberto5@email.com', '81935621817', '10000000005'),
('Ana Paula Ferreira', 'ana6@email.com', '81927773991', '10000000006'),
('Lucas Oliveira', 'lucas7@email.com', '81957628943', '10000000007'),
('Fernanda Costa', 'fernanda8@email.com', '81917941622', '10000000008'),
('Pedro Henrique Alves', 'pedro9@email.com', '81960071109', '10000000009'),
('Juliana Barbosa', 'juliana10@email.com', '81914067967', '10000000010'),
('Rafael Nascimento', 'rafael11@email.com', '81953473560', '10000000011'),
('Camila Rocha', 'camila12@email.com', '81942032445', '10000000012'),
('Bruno Gomes', 'bruno13@email.com', '81966016451', '10000000013'),
('Patricia Vieira', 'patricia14@email.com', '81987877954', '10000000014'),
('Diego Martins', 'diego15@email.com', '81962642442', '10000000015');

-- ENDERECOS (15)
INSERT INTO ENDERECO (id_cliente, rua, cidade, estado, cep, tipo) VALUES
(1, 'Rua das Flores', 'Recife', 'PE', '53280292', 'ENTREGA'),
(2, 'Av Brasil', 'Olinda', 'PE', '58896894', 'ENTREGA'),
(3, 'Rua Boa Vista', 'Jaboatao', 'PE', '57662354', 'COBRANCA'),
(4, 'Rua do Sol', 'Paulista', 'PE', '59967242', 'ENTREGA'),
(5, 'Av Recife', 'Caruaru', 'PE', '51386606', 'ENTREGA'),
(6, 'Rua das Flores', 'Recife', 'PE', '53349646', 'COBRANCA'),
(7, 'Av Brasil', 'Olinda', 'PE', '57829166', 'ENTREGA'),
(8, 'Rua Boa Vista', 'Jaboatao', 'PE', '52441430', 'ENTREGA'),
(9, 'Rua do Sol', 'Paulista', 'PE', '57567369', 'COBRANCA'),
(10, 'Av Recife', 'Caruaru', 'PE', '58513001', 'ENTREGA'),
(11, 'Rua das Flores', 'Recife', 'PE', '51561081', 'ENTREGA'),
(12, 'Av Brasil', 'Olinda', 'PE', '58367526', 'COBRANCA'),
(13, 'Rua Boa Vista', 'Jaboatao', 'PE', '52870723', 'ENTREGA'),
(14, 'Rua do Sol', 'Paulista', 'PE', '59364035', 'ENTREGA'),
(15, 'Av Recife', 'Caruaru', 'PE', '54843903', 'COBRANCA');

-- ESTOQUE (25)
INSERT INTO ESTOQUE (id_produto, quantidade, localizacao) VALUES
(1, 73, 'A1'),
(2, 75, 'A2'),
(3, 22, 'A3'),
(4, 18, 'B1'),
(5, 23, 'B2'),
(6, 53, 'B3'),
(7, 76, 'C1'),
(8, 67, 'C2'),
(9, 63, 'A1'),
(10, 7, 'A2'),
(11, 16, 'A3'),
(12, 8, 'B1'),
(13, 8, 'B2'),
(14, 26, 'B3'),
(15, 29, 'C1'),
(16, 8, 'C2'),
(17, 62, 'A1'),
(18, 74, 'A2'),
(19, 59, 'A3'),
(20, 74, 'B1'),
(21, 45, 'B2'),
(22, 25, 'B3'),
(23, 6, 'C1'),
(24, 71, 'C2'),
(25, 11, 'A1');

-- CARRINHOS (15)
INSERT INTO CARRINHO (id_cliente) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

-- ITENS CARRINHO (15)
INSERT INTO ITEMCARRINHO (id_carrinho, id_produto, quantidade) VALUES
(7, 3, 3),
(7, 21, 2),
(2, 2, 2),
(5, 2, 3),
(15, 10, 3),
(13, 11, 1),
(4, 9, 3),
(6, 2, 3),
(4, 15, 3),
(3, 19, 3),
(12, 14, 3),
(12, 6, 3),
(14, 10, 2),
(10, 13, 1),
(11, 25, 3);

-- PEDIDOS (15)
INSERT INTO PEDIDO (id_cliente, status, valor_total) VALUES
(1, 'PENDENTE', 654.71),
(2, 'PAGO', 2074.51),
(3, 'ENVIADO', 3105.57),
(4, 'ENTREGUE', 1720.81),
(5, 'CANCELADO', 5014.49),
(6, 'PENDENTE', 2468.69),
(7, 'PAGO', 2349.88),
(8, 'ENVIADO', 5323.30),
(9, 'ENTREGUE', 2534.30),
(10, 'CANCELADO', 3473.27),
(11, 'PENDENTE', 3910.98),
(12, 'PAGO', 2978.13),
(13, 'ENVIADO', 5599.76),
(14, 'ENTREGUE', 1152.75),
(15, 'CANCELADO', 718.38);

-- ITENS PEDIDO (15)
INSERT INTO ITEMPEDIDO (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 13, 2, 6299.90),
(2, 4, 1, 999.90),
(3, 6, 1, 899.90),
(4, 20, 1, 499.90),
(5, 24, 1, 1799.90),
(6, 4, 2, 999.90),
(7, 18, 2, 279.90),
(8, 6, 1, 899.90),
(9, 23, 2, 249.90),
(10, 15, 2, 799.90),
(11, 19, 2, 429.90),
(12, 5, 2, 2599.90),
(13, 16, 1, 549.90),
(14, 2, 2, 1299.90),
(15, 22, 2, 499.90);

-- PAGAMENTOS (15)
INSERT INTO PAGAMENTO (id_pedido, tipo, status, valor) VALUES
(1, 'PIX', 'PENDENTE', 654.71),
(2, 'CARTAO', 'APROVADO', 2074.51),
(3, 'BOLETO', 'APROVADO', 3105.57),
(4, 'PIX', 'APROVADO', 1720.81),
(5, 'CARTAO', 'RECUSADO', 5014.49),
(6, 'BOLETO', 'PENDENTE', 2468.69),
(7, 'PIX', 'APROVADO', 2349.88),
(8, 'CARTAO', 'APROVADO', 5323.30),
(9, 'BOLETO', 'APROVADO', 2534.30),
(10, 'PIX', 'RECUSADO', 3473.27),
(11, 'CARTAO', 'PENDENTE', 3910.98),
(12, 'BOLETO', 'APROVADO', 2978.13),
(13, 'PIX', 'APROVADO', 5599.76),
(14, 'CARTAO', 'APROVADO', 1152.75),
(15, 'BOLETO', 'RECUSADO', 718.38);

-- ENVIOS (15)
INSERT INTO ENVIO (id_pedido, id_endereco, status, codigo_rastreio) VALUES
(1, 1, 'PREPARANDO', 'BR952518951'),
(2, 2, 'ENVIADO', 'BR719699698'),
(3, 3, 'ENTREGUE', 'BR582228976'),
(4, 4, 'PREPARANDO', 'BR220295964'),
(5, 5, 'ENVIADO', 'BR142300651'),
(6, 6, 'ENTREGUE', 'BR847337803'),
(7, 7, 'PREPARANDO', 'BR750190379'),
(8, 8, 'ENVIADO', 'BR321371930'),
(9, 9, 'ENTREGUE', 'BR197171492'),
(10, 10, 'PREPARANDO', 'BR953144269'),
(11, 11, 'ENVIADO', 'BR241983712'),
(12, 12, 'ENTREGUE', 'BR212063615'),
(13, 13, 'PREPARANDO', 'BR570525797'),
(14, 14, 'ENVIADO', 'BR587288405'),
(15, 15, 'ENTREGUE', 'BR770198620');

-- TRIGGER 1: Atualizar estoque apos inserir item no pedido

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

-- TRIGGER 2: Calcular valor total do pedido automaticamente

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

-- TRIGGER 3: Impedir pedido com valor negativo

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

-- VIEW 1: Catalogo de produtos com categoria e marca

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

-- VIEW 2: Compatibilidade automatica entre produtos
--
-- Regra profissional: compara apenas produtos de categorias
-- DIFERENTES que compartilham o mesmo valor de especificacao.
-- Exemplo: processador AM4 <-> placa-mae AM4
-- NAO compara: processador AM4 <-> processador AM4

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

-- VIEW 3: Resumo de pedidos por cliente

CREATE VIEW vw_pedidos_cliente AS
SELECT
    cl.id_cliente,
    cl.nome AS cliente,
    COUNT(p.id_pedido) AS total_pedidos,
    COALESCE(SUM(p.valor_total), 0) AS valor_total_gasto
FROM CLIENTE cl
LEFT JOIN PEDIDO p ON cl.id_cliente = p.id_cliente
GROUP BY cl.id_cliente, cl.nome;

-- PROCEDURE 1: Buscar compatibilidade de um produto

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

-- PROCEDURE 2: Resumo do estoque por categoria

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

-- SELECTS PRINCIPAIS PARA ANALISE

SELECT * FROM CLIENTE;
SELECT * FROM PRODUTO;
SELECT * FROM PEDIDO;
SELECT * FROM ITEMPEDIDO;
SELECT * FROM PAGAMENTO;
SELECT * FROM ENVIO;
SELECT * FROM ESTOQUE;
SELECT * FROM CATEGORIA;
SELECT * FROM MARCA;
SELECT * FROM ENDERECO;
SELECT * FROM CARRINHO;
SELECT * FROM ITEMCARRINHO;
SELECT * FROM TIPOESPECIFICACAO;
SELECT * FROM VALORESPECIFICACAO;
SELECT * FROM PRODUTOESPECIFICACAO;

SELECT * FROM vw_catalogo_produtos;
SELECT * FROM vw_compatibilidade;
SELECT * FROM vw_pedidos_cliente;

CALL buscar_compatibilidade(1);
CALL resumo_estoque_categoria();
