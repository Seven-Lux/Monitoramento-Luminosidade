create database if not exists sevenLux;
use sevenLux;

create table if not exists endereco(
idEndereco int primary key auto_increment,
cep char (8) not null,
logradouro varchar (45) not null,
numero int not null,
cidade varchar (45) not null,
uf char(2)
);

create table if not exists empresa(
idEmpresa int not null auto_increment,
fkEndereco int not null,
constraint fkEndereco foreign key(fkEndereco)
	references endereco(idEndereco),
constraint pkComposta
	primary key (idEmpresa, fkEndereco),
nomeFantasia varchar(45) not null,
razaoSocial varchar(45) not null,
CNPJ char(14) not null,
tokenAcesso char(6) not null unique
);

create table if not exists funcionario(
idFuncionario int auto_increment,
fkEndereco int,
fkEmpresa int,
constraint fkEnderecoEmp foreign key(fkEndereco)
references endereco(idEndereco),
constraint fkEmpresa foreign key (fkEmpresa)
references empresa(idEmpresa),
constraint pkComposta
	primary key (idFuncionario, fkEndereco, fkEmpresa),
nome varchar(45) not null,
email varchar(45) not null,
senha varchar(45) not null
);

create table if not exists corredor (
idCorredor int primary key  auto_increment,
nome varchar(45) not null,
numero varchar(45) not null,
minLuxIdeal int not null,
maxLuxIdeal int not null,
fkEmpresa int not null,
fkEndereco int not null,
constraint fkEnderecoEmpr foreign key(fkEndereco)
references endereco(idEndereco),
constraint fkEmpresaC foreign key (fkEmpresa)
references empresa(idEmpresa)
);


create table if not exists sensor(
IdSensor int primary key  auto_increment,
nome varchar(45) not null,
statusSensor varchar(45) not null,
dtInstalacao DATE not null,
fkCorredor int not null,
constraint fkCorredor foreign key (fkCorredor) 
references corredor (idCorredor)
);


Create table if not exists dados(
idDados int primary key  auto_increment, 
luminancia decimal(7,2) not null,
dtHora timestamp not null default current_timestamp,
fkSensor int not null not null,
constraint fkSensor foreign key (fkSensor)
 references sensor (idSensor)
 );


 insert into endereco(cep,logradouro, numero,cidade, uf) values
 ('08451000','Estrada do Lageado Velho', 1013, 'São Paulo','SP'),
 ('02701000', 'Avenida Otaviano Alves de Lima', 1824,  'São Paulo','SP'),
 ('01310300', 'Avenida Paulista', 2300, 'São Paulo','SP'),
 ('21740001', 'Avenida  Marechal Fontenele', 3555, 'Rio de Janeiro', 'RJ'),
 ('40070200', 'Rua do Salete', 30, 'Salvador', 'BA'),
 ('07024170', 'Av. Pres. Humberto de Alencar Castelo Branco', 3413, 'Guarulhos', 'SP' );

 insert into empresa(nomeFantasia, CNPJ, razaoSocial, tokenAcesso, fkEndereco) values
 ('Supermercado Rossi', '09525900000712', 'Supermercado Rossi LTDA', 'B19100', 1),
 ('Extra Mercado', '47508411000163', 'Companhia Brasileira de Distribuição', 'L2609G', 2),
 ('Carrefour Express Paulista', '45543915023041', 'Carrefour Comércio e Indústria LTDA', 'I1206B', 3),
 ('Carrefour Hipermercado', '45543915000181', 'Carrefour Comércio e Indústria LTDA', 'J2608H', 4),
 ('Assaí Atacadista', '06057223000171', 'Sendas Distribuidora S.A.', 'HI983R', 5),
 ('Supermercado Nagumo Anel Viário', '07705530000184', 'Nagumo Supermercados LTDA', 'BR14N7', 6);

 
 insert into funcionario(nome, email, senha, fkEndereco, fkEmpresa)values
 ('Kleber Mendonça', 'Kleber.mendonca@gmail.com', 'Abc#123', 1,1),
 ('João Silva', 'joao.silva@gmail.com','batatinha', 2, 2),
 ('Renata de Souza', 'renata.souza@gmail.com','uburu@100', 3, 3),
 ('Melissa Angelical', 'melissa.angelical@gmail.com','sprint02', 4,4),
 ('Alexandre Costa', 'alexandre.costa@gmail.com', 'beterraba', 5,5),
 ('Richard Gomes', 'richard.gomes@gmail.com','senha', 6, 6);
 
INSERT INTO corredor(nome, numero, minLuxIdeal, maxLuxIdeal, fkEndereco, fkEmpresa) VALUES
('Alimentos Não Perecíveis', 'A1', 500, 750, 1, 1),
('Bebidas', 'B1', 500, 750, 1, 1),
('Laticínios', 'C1', 500, 750, 1, 1),
('Carnes e Frios', 'D1', 750, 1000, 1, 1),
('Padaria', 'E1', 500, 750, 1, 1),
('Pet Shop', 'F1', 250, 400, 2, 2),
('Hortifrúti', 'G1', 300, 500, 1, 1),
('Produtos de Limpeza', 'H1', 200, 400, 1, 1),
('Alimentos Enlatados', 'I1', 220, 370, 1, 1),
('Cereais e Grãos', 'J1', 230, 380, 1, 1),
('Congelados', 'K1', 150, 250, 1, 1),
('Alimentos Não Perecíveis', 'A2', 250, 400, 2, 2),
('Bebidas', 'B2', 300, 450, 2, 2),
('Laticínios', 'C2', 200, 350, 2, 2),
('Carnes e Frios', 'D2', 150, 300, 2, 2),
('Padaria', 'E2', 280, 420, 2, 2),
('Pet Shop', 'F2', 250, 400, 2, 2),
('Hortifrúti', 'G2', 300, 500, 2, 2),
('Produtos de Limpeza', 'H2', 200, 400, 2, 2),
('Alimentos Enlatados', 'I2', 220, 370, 2, 2),
('Cereais e Grãos', 'J2', 230, 380, 2, 2),
('Congelados', 'K2', 150, 250, 2, 2),
('Alimentos Não Perecíveis', 'A3', 250, 400, 3, 3),
('Bebidas', 'B3', 300, 450, 3, 3),
('Laticínios', 'C3', 200, 350, 3, 3),
('Carnes e Frios', 'D3', 150, 300, 3, 3),
('Padaria', 'E3', 280, 420, 3, 3),
('Pet Shop', 'F3', 250, 400, 3, 3),
('Hortifrúti', 'G3', 300, 500, 3, 3),
('Produtos de Limpeza', 'H3', 200, 400, 3, 3),
('Alimentos Enlatados', 'I3', 220, 370, 3, 3),
('Cereais e Grãos', 'J3', 230, 380, 3, 3),
('Congelados', 'K3', 150, 250, 3, 3),
('Alimentos Não Perecíveis', 'A4', 250, 400, 4, 4),
('Bebidas', 'B4', 300, 450, 4, 4),
('Laticínios', 'C4', 200, 350, 4, 4),
('Carnes e Frios', 'D4', 150, 300, 4, 4),
('Padaria', 'E4', 280, 420, 4, 4),
('Pet Shop', 'F4', 250, 400, 4, 4),
('Hortifrúti', 'G4', 300, 500, 4, 4),
('Produtos de Limpeza', 'H4', 200, 400, 4, 4),
('Alimentos Enlatados', 'I4', 220, 370, 4, 4),
('Cereais e Grãos', 'J4', 230, 380, 4, 4),
('Congelados', 'K4', 150, 250, 4, 4),
('Alimentos Não Perecíveis', 'A5', 250, 400, 5, 5),
('Bebidas', 'B5', 300, 450, 5, 5),
('Laticínios', 'C5', 200, 350, 5, 5),
('Carnes e Frios', 'D5', 150, 300, 5, 5),
('Padaria', 'E5', 280, 420, 5, 5),
('Pet Shop', 'F5', 250, 400, 5, 5),
('Hortifrúti', 'G5', 300, 500, 5, 5),
('Produtos de Limpeza', 'H5', 200, 400, 5, 5),
('Alimentos Enlatados', 'I5', 220, 370, 5, 5),
('Cereais e Grãos', 'J5', 230, 380, 5, 5),
('Congelados', 'K5', 150, 250, 5, 5),
('Alimentos Não Perecíveis', 'A6', 250, 400, 6, 6),
('Bebidas', 'B6', 300, 450, 6, 6),
('Laticínios', 'C6', 200, 350, 6, 6),
('Carnes e Frios', 'D6', 150, 300, 6, 6),
('Padaria', 'E6', 280, 420, 6, 6),
('Pet Shop', 'F6', 250, 400, 6, 6),
('Hortifrúti', 'G6', 300, 500, 6, 6),
('Produtos de Limpeza', 'H6', 200, 400, 6, 6),
('Alimentos Enlatados', 'I6', 220, 370, 6, 6),
('Cereais e Grãos', 'J6', 230, 380, 6, 6),
('Congelados', 'K6', 150, 250, 6, 6);


insert into sensor(nome, statusSensor, fkCorredor, dtInstalacao) values
('LDR', 'Ativo', 1, '2025-05-23'),
('LDR', 'Ativo', 2, '2025-07-28'),
('LDR', 'Ativo', 3, '2025-09-23'),
('LDR', 'Inativo', 4, '2025-03-22'),
('LDR', 'Ativo', 5, '2025-09-17'),
('LDR', 'Ativo', 6, '2025-08-10'),
('LDR', 'Ativo', 7, '2025-09-12'),
('LDR', 'Manutenção', 8, '2025-10-23'),
('LDR', 'Ativo', 9, '2025-09-02'),
('LDR', 'Ativo', 10, '2025-07-20'),
('LDR', 'Ativo', 11, '2025-03-02'),
('LDR', 'Ativo', 12, '2025-09-11'),
('LDR', 'Inativo', 13, '2025-09-07'),
('LDR', 'Ativo', 14, '2025-04-14'),
('LDR', 'Ativo', 15, '2025-11-24'),
('LDR', 'Ativo', 16, '2025-06-27'),
('LDR', 'Ativo', 17, '2025-01-28'),
('LDR', 'Ativo', 18, '2025-06-12'),
('LDR', 'Ativo', 19, '2025-10-16'),
('LDR', 'Ativo', 20, '2025-03-15'),
('LDR', 'Ativo', 21, '2025-03-07'),
('LDR', 'Ativo', 22, '2025-03-25'),
('LDR', 'Inativo', 23, '2025-02-11'),
('LDR', 'Ativo', 24, '2025-09-18'),
('LDR', 'Ativo', 25, '2025-07-22'),
('LDR', 'Ativo', 26, '2025-05-27'),
('LDR', 'Ativo', 27, '2025-11-08'),
('LDR', 'Ativo', 28, '2025-02-16'),
('LDR', 'Ativo', 29, '2025-06-21'),
('LDR', 'Ativo', 30, '2025-10-21'),
('LDR', 'Inativo', 31, '2025-04-29'),
('LDR', 'Ativo', 32, '2025-04-19'),
('LDR', 'Ativo', 33, '2025-08-28'),
('LDR', 'Ativo', 34, '2025-08-08'),
('LDR', 'Ativo', 35, '2025-09-04'),
('LDR', 'Ativo', 36, '2025-04-30'),
('LDR', 'Ativo', 37, '2025-04-08'),
('LDR', 'Ativo', 38, '2025-07-28'),
('LDR', 'Ativo', 39, '2025-02-21'),
('LDR', 'Ativo', 40, '2025-11-13'),
('LDR', 'Manutenção', 41, '2025-02-25'),
('LDR', 'Ativo', 42, '2025-08-21'),
('LDR', 'Ativo', 43, '2025-05-01'),
('LDR', 'Ativo', 44, '2025-08-11'),
('LDR', 'Ativo', 45, '2025-01-22'),
('LDR', 'Ativo', 46, '2025-03-21'),
('LDR', 'Ativo', 47, '2025-05-07'),
('LDR', 'Ativo', 48, '2025-05-26'),
('LDR', 'Ativo', 49, '2025-01-04'),
('LDR', 'Ativo', 50, '2025-12-30'),
('LDR', 'Ativo', 51, '2025-06-28'),
('LDR', 'Ativo', 52, '2025-10-29'),
('LDR', 'Inativo', 53, '2025-10-19'),
('LDR', 'Ativo', 54, '2025-07-24'),
('LDR', 'Ativo', 55, '2025-12-18'),
('LDR', 'Ativo', 56, '2025-01-21'),
('LDR', 'Ativo', 57, '2025-08-02'),
('LDR', 'Ativo', 58, '2025-06-15'),
('LDR', 'Ativo', 59, '2025-11-20'),
('LDR', 'Ativo', 60, '2025-04-17'),
('LDR', 'Ativo', 61, '2025-02-18'),
('LDR', 'Ativo', 62, '2025-11-21'),
('LDR', 'Inativo', 63, '2025-03-24'),
('LDR', 'Ativo', 64, '2025-06-30'),
('LDR', 'Ativo', 65, '2025-09-11'),
('LDR', 'Ativo', 66, '2025-03-07');

-- insert feito para a visualização de dados das tabelas
-- Dia 1 (2025-06-01)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (320.50, '2025-06-01 08:15:00', 1);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (310.75, '2025-06-01 10:30:00', 1);

-- Dia 2 (2025-06-02)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (305.10, '2025-06-02 09:00:00', 1);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (295.80, '2025-06-02 15:20:00', 1);

-- Dia 3 (2025-06-03)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (312.60, '2025-06-03 11:45:00', 1);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (330.20, '2025-06-03 16:00:00', 1);

-- Dia 4 (2025-06-04)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (340.00, '2025-06-04 12:10:00', 1);

-- Dia 5 (2025-06-05)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (325.90, '2025-06-05 14:50:00', 1);

-- Dia 6 (2025-06-06)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (310.00, '2025-06-06 17:30:00', 1);

-- Dia 7 (2025-06-07)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (300.45, '2025-06-07 13:00:00', 1);


select 
e.nomeFantasia as Empresa,
en.cep as CEP,
f.nome as 'Nome do Funcionario',
f.email as Email,
c.nome as 'Nome do Corredor',
s.statusSensor as StatusSensor,
d.luminancia as Luminancia,
d.dtHora as DataHora
from empresa e
join endereco en on e.fkEndereco = en.idEndereco
join funcionario f on f.fkEmpresa = e.idEmpresa
join corredor c on c.fkEmpresa = e.idEmpresa
join sensor s on s.fkCorredor = c.idCorredor
join dados d on d.fkSensor = s.idSensor
order by e.nomeFantasia, c.nome, d.dtHora;

select 
e.nomeFantasia as Empresa,
f.email as Email,
c.nome as NomeCorredor,
d.luminancia as Luminancia
from empresa e
join funcionario f on f.fkEmpresa = e.idEmpresa
join corredor c on c.fkEmpresa = e.idEmpresa
join sensor s on s.fkCorredor = c.idCorredor
join dados d on d.fkSensor = s.idSensor
order by d.luminancia;

select  
e.nomeFantasia as Empresa,
f.email as Email,
c.nome as NomeCorredor,
s.nome as Sensor,
d.luminancia as Luminancia
from empresa e
left join funcionario f on f.fkEmpresa = e.idEmpresa
left join corredor c on c.fkEmpresa = e.idEmpresa
left join sensor s on s.fkCorredor = c.idCorredor
left join dados d on d.fkSensor = s.idSensor
where e.nomeFantasia like '%Paulista%';

select  
e.nomeFantasia as Empresa,
f.email as Email,
c.nome as NomeCorredor,
d.luminancia as Luminancia
from empresa e
join funcionario f on f.fkEmpresa = e.idEmpresa
join corredor c on c.fkEmpresa = e.idEmpresa
join sensor s on s.fkCorredor = c.idCorredor
join dados d on d.fkSensor = s.idSensor
where e.nomeFantasia LIKE '%rossi%';

select 
e.nomeFantasia as Empresa,
f.email as Email,
c.nome as NomeCorredor,
d.luminancia as Luminancia
from empresa e
join funcionario f on f.fkEmpresa = e.idEmpresa
join corredor c on c.fkEmpresa = e.idEmpresa
join sensor s on s.fkCorredor = c.idCorredor
join dados d on d.fkSensor = s.idSensor
where d.luminancia > 800
order by d.luminancia;

-- Dia 1 (2025-06-01)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (850.75, '2025-06-01 09:10:00', 2);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (870.20, '2025-06-01 14:45:00', 2);

-- Dia 2 (2025-06-02)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (890.00, '2025-06-02 08:30:00', 2);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (865.90, '2025-06-02 17:20:00', 2);

-- Dia 3 (2025-06-03)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (900.60, '2025-06-03 11:00:00', 2);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (910.80, '2025-06-03 15:40:00', 2);

-- Dia 4 (2025-06-04)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (880.10, '2025-06-04 10:25:00', 2);

-- Dia 5 (2025-06-05)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (895.45, '2025-06-05 13:15:00', 2);

-- Dia 6 (2025-06-06)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (905.90, '2025-06-06 16:05:00', 2);

-- Dia 7 (2025-06-07)
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (920.30, '2025-06-07 12:00:00', 2);

select * from dados;	
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (320.50, '2025-06-08 08:15:00', 1);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (310.75, '2025-06-08 10:30:00', 1);
INSERT INTO dados (luminancia, dtHora, fkSensor) VALUES (990.75, '2025-06-09 10:30:00', 1);

