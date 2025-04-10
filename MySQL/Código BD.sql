CREATE DATABASE savenlux;
USE sevenlux;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cep CHAR(8),
logradouro VARCHAR(100),
numero INT,
cidade VARCHAR(45)
);

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nomeFantasia VARCHAR(45),
cnpj CHAR(11),
email VARCHAR(100),
senha VARCHAR(45),
fkEmpresa INT,
CONSTRAINT fkCadastroEndereco
	FOREIGN KEY (fkEndereco) REFERENCES empresa(idEmpresa)
);

CREATE TABLE setor (
idSetor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
corredor VARCHAR (10),
fkEmpresa INT,
CONSTRAINT fkSetorEmpresa
	FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
setor VARCHAR(45),
corredor VARCHAR(45),
statusSensor VARCHAR(10),
CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo', 'Desativado', 'Manutenção')),
fkSetor INT,
CONSTRAINT fkSensorSetor
	FOREIGN KEY (fkSetor) REFERENCES setor(idSetor)
);

CREATE TABLE metrica (
idMetrica INT PRIMARY KEY AUTO_INCREMENT,
luminancia DECIMAL(7,2),
dtHora DATETIME,
fkSensor INT,
CONSTRAINT fkMetricaSensor
	FOREIGN KEY (fkSensor) REFERENCES sensor(diSensor)
);