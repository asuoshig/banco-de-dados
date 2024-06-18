-- TABELA PESSOA
CREATE TABLE IF NOT EXISTS pessoa (
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(150) NOT NULL,
    tipo NUMERIC(2) DEFAULT 1,
    PRIMARY KEY (cpf_cnpj)
);

-- TABELA PESSOA FISICA
CREATE TABLE IF NOT EXISTS pessoa_fisica (
    cpf VARCHAR(20) NOT NULL,
    data_nascimento TIMESTAMP,
    sexo VARCHAR(1),
    PRIMARY KEY (cpf),
    FOREIGN KEY (cpf) REFERENCES pessoa(cpf_cnpj)
);

-- TABELA PESSOA JURIDICA
CREATE TABLE IF NOT EXISTS pessoa_juridica (
    cnpj VARCHAR(20) NOT NULL,
    inscricao_estadual VARCHAR(50) NOT NULL,
	
    PRIMARY KEY (cnpj),
    FOREIGN KEY (cnpj) REFERENCES pessoa(cpf_cnpj)
);

-- TABELA PESSOA TRABALHO
CREATE TABLE IF NOT EXISTS pessoa_trabalho (
    cargo VARCHAR(50),
    salario FLOAT(15),
    data_admissao TIMESTAMP,
    cpf_cnpj VARCHAR(150) NOT NULL,
    PRIMARY KEY (cpf_cnpj),
    FOREIGN KEY (cpf_cnpj) REFERENCES pessoa(cpf_cnpj)
);

-- TABELA MORADIA
CREATE TABLE IF NOT EXISTS moradia (
    codigo_endereco INT NOT NULL,
    tipo NUMERIC(2) DEFAULT 1,
    PRIMARY KEY (codigo_endereco)
);

-- TABELA ENDERECO
CREATE TABLE IF NOT EXISTS endereco (
    codigo INT NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    cidade VARCHAR(15) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo) REFERENCES moradia(codigo_endereco)
);
