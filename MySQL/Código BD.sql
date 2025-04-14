CREATE DATABASE savenlux;
USE sevenlux;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NULL,
cep CHAR(8) NULL,
logradouro VARCHAR(100) NULL,
numero INT NULL,
cidade VARCHAR(45) NULL
);

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nomeFantasia VARCHAR(45) NULL,
cnpj CHAR(11) NULL,
email VARCHAR(100) NULL,
senha VARCHAR(45) NULL,
fkEmpresa INT NULL,
CONSTRAINT fkCadastroEndereco
	FOREIGN KEY (fkEndereco) REFERENCES empresa(idEmpresa)
);

CREATE TABLE setor (
idSetor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NULL,
corredor VARCHAR (10) NULL,
fkEmpresa INT NULL,
CONSTRAINT fkSetorEmpresa
	FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
setor VARCHAR(45) NULL,
corredor VARCHAR(45) NULL,
statusSensor VARCHAR(10) NULL,
CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo', 'Desativado', 'Manutenção')),
fkSetor INT NULL,
CONSTRAINT fkSensorSetor
	FOREIGN KEY (fkSetor) REFERENCES setor(idSetor)
);

CREATE TABLE metrica (
idMetrica INT PRIMARY KEY AUTO_INCREMENT,
luminancia DECIMAL(7,2) NULL,
dtHora DATETIME NULL,
fkSensor INT NULL,
CONSTRAINT fkMetricaSensor
	FOREIGN KEY (fkSensor) REFERENCES sensor(diSensor)
);

INSERT INTO empresa (nome, cep, logradouro, numero, cidade) VALUES
('Tech Solutions', '01001000', 'Rua das Inovações', 100, 'São Paulo'),
('Global Corp', '20040002', 'Avenida Central', 500, 'Rio de Janeiro'),
('Alpha Ltda', '30120010', 'Rua do Comércio', 250, 'Belo Horizonte'),
('Beta Systems', '80010000', 'Avenida das Indústrias', 75, 'Curitiba');

INSERT INTO cadastro (nomeFantasia, cnpj, email, senha, fkEmpresa) VALUES
('Tech Soluções', '12345678901', 'contato@techsolucoes.com', 'senha123', 1),
('Global Tecnologia', '23456789012', 'suporte@globaltec.com', 'global321', 2),
('Alpha Tech', '34567890123', 'vendas@alphatech.com', 'alpha456', 3),
('Beta Corp', '45678901234', 'rh@betacorp.com', 'beta789', 4);

INSERT INTO setor (nome, corredor, fkEmpresa) VALUES
('TI', 'A1', 1),
('Financeiro', 'B2', 2),
('Logística', 'C3', 3),
('Marketing', 'D4', 4);

INSERT INTO sensor (setor, corredor, statusSensor, fkSetor) VALUES
('TI', 'A1', 'Ativo', 1),
('Financeiro', 'B2', 'Manutenção', 2),
('Logística', 'C3', 'Ativo', 3),
('Marketing', 'D4', 'Desativado', 4);e