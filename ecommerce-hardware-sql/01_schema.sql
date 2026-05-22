-- =========================================================
-- ECOMMERCE HARDWARE DATABASE
-- Schema: tabelas, constraints, indexes
-- =========================================================

DROP DATABASE IF EXISTS ecommerce_hardware;
CREATE DATABASE ecommerce_hardware;
USE ecommerce_hardware;

-- =========================================================
-- 1. CLIENTE
-- =========================================================

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cpf CHAR(11) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================================================
-- 2. ENDERECO
-- =========================================================

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

-- =========================================================
-- 3. CATEGORIA
-- =========================================================

CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- =========================================================
-- 4. MARCA
-- =========================================================

CREATE TABLE MARCA (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- =========================================================
-- 5. PRODUTO
-- =========================================================

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

-- =========================================================
-- 6. TIPOESPECIFICACAO
-- =========================================================

CREATE TABLE TIPOESPECIFICACAO (
    id_tipo_especificacao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
) ENGINE=InnoDB;

-- =========================================================
-- 7. VALORESPECIFICACAO
-- =========================================================

CREATE TABLE VALORESPECIFICACAO (
    id_valor_especificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_especificacao INT NOT NULL,
    valor VARCHAR(100) NOT NULL,

    CONSTRAINT fk_valorespecificacao_tipo
        FOREIGN KEY (id_tipo_especificacao)
        REFERENCES TIPOESPECIFICACAO(id_tipo_especificacao)
) ENGINE=InnoDB;

-- =========================================================
-- 8. PRODUTOESPECIFICACAO
-- =========================================================

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

-- =========================================================
-- 9. CARRINHO
-- =========================================================

CREATE TABLE CARRINHO (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL UNIQUE,

    CONSTRAINT fk_carrinho_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- 10. ITEMCARRINHO
-- =========================================================

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

-- =========================================================
-- 11. PEDIDO
-- =========================================================

CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDENTE','PAGO','ENVIADO','ENTREGUE','CANCELADO') DEFAULT 'PENDENTE',
    valor_total DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
) ENGINE=InnoDB;

-- =========================================================
-- 12. ITEMPEDIDO
-- =========================================================

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

-- =========================================================
-- 13. PAGAMENTO
-- =========================================================

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

-- =========================================================
-- 14. ENVIO
-- =========================================================

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

-- =========================================================
-- 15. ESTOQUE
-- =========================================================

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

-- =========================================================
-- INDEXES (apenas tabelas que realmente precisam)
-- =========================================================

-- PRODUTO
CREATE INDEX idx_produto_categoria ON PRODUTO(id_categoria);
CREATE INDEX idx_produto_marca ON PRODUTO(id_marca);

-- PEDIDO
CREATE INDEX idx_pedido_cliente ON PEDIDO(id_cliente);

-- ITEMPEDIDO
CREATE INDEX idx_itempedido_pedido ON ITEMPEDIDO(id_pedido);
CREATE INDEX idx_itempedido_produto ON ITEMPEDIDO(id_produto);

-- PRODUTOESPECIFICACAO
CREATE INDEX idx_produtoespecificacao_produto ON PRODUTOESPECIFICACAO(id_produto);
CREATE INDEX idx_produtoespecificacao_valor ON PRODUTOESPECIFICACAO(id_valor_especificacao);
