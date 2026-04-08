CREATE TABLE IF NOT EXISTS hospedagens (
    hospedagem_id VARCHAR(255) PRIMARY KEY,
    tipo VARCHAR(50),
    endereco_id VARCHAR(255),
    proprietario_id VARCHAR(255),
    ativo BOOL,
    FOREIGN KEY (endereco_id) REFERENCES enderecos (endereco_id),
    FOREIGN KEY (proprietario_id) REFERENCES proprietarios (proprietario_id)
);

CREATE TABLE IF NOT EXISTS alugueis (
    aluguel_id VARCHAR(255) PRIMARY KEY,
    cliente_id VARCHAR(255),
    hospedagem_id VARCHAR(255),
    data_inicio DATE,
    data_fim DATE,
    preco_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id),
    FOREIGN KEY (hospedagem_id) REFERENCES hospedagens (hospedagem_id)
);

CREATE TABLE IF NOT EXISTS avaliacoes (
    avaliacao_id VARCHAR(255) PRIMARY KEY,
    cliente_id VARCHAR(255),
    hospedagem_id VARCHAR(255),
    nota INT,
    comentario TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id),
    FOREIGN KEY (hospedagem_id) REFERENCES hospedagens (hospedagem_id)
);