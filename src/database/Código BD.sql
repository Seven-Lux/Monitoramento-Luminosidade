create database if not exists sevenLux;
use sevenLux;

create table if not exists endereco(
idEndereco int primary key auto_increment,
cep char (8) not null,
logradouro varchar (45) not null,
numero int not null,
cidade varchar (45) not null,
estado char (2) not null
);

create table if not exists empresa(
idEmpresa int not null auto_increment,
fkEndereco int not null,
constraint fkEndereco foreign key(fkEndereco)
	references endereco(idEndereco),
constraint pkComposta
	primary key (idEmpresa, fkEndereco),
nomeFantasia varchar(45) not null,
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
cargo varchar(45)not null,
email varchar(45) not null,
senha varchar(45) not null
);

create table if not exists corredor (
idCorredor int primary key  auto_increment,
nome varchar(45) not null,
numero varchar(45) not null,
fkEndereco int not null,
fkEmpresa int not null,
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


 insert into endereco(cep,logradouro, numero,cidade, estado) values
 ('08451000','Estrada do Lageado Velho', 1013, 'São Paulo','SP'),
 ('02701000', 'Avenida Otaviano Alves de Lima', 1824,  'São Paulo','SP'),
 ('01310300', 'Avenida Paulista', 2300, 'São Paulo','SP'),
 ('21740001', 'Avenida  Marechal Fontenele', 3555, 'Rio de Janeiro', 'RJ'),
 ('40070200', 'Rua do Salete', 30, 'Salvador', 'BA'),
 ('07024170', 'Av. Pres. Humberto de Alencar Castelo Branco', 3413, 'Guarulhos', 'SP' );

 insert into empresa(nomeFantasia, CNPJ, tokenAcesso, fkEndereco)values
 ('Supermercado Rossi', '09525900000712', 'B19100', 1),
 ('Extra Mercado','47508411000163', 'L2609G',  2),
 ('Carrefour Express Paulista', '45543915023041', 'I1206B', 3),
 ('Carrefour Hipermercado', '45543915000181', 'J2608H', 4),
 ('Assaí Atacadista', '06057223000171', 'HI983R', 5),
 ('Supermercado Nagumo Anel Viário','07705530000184', 'BR14N7', 6);
 
 insert into funcionario(nome, cargo, email, senha, telefone, fkEndereco, fkEmpresa)values
 ('Kleber Mendonça', 'Analista financeiro', 'Kleber.mendonca@gmail.com', 'Abc#123', '11987654321', 1,1),
 ('João Silva', 'Recursos Humanos', 'joao.silva@gmail.com','batatinha', '11978456123', 2, 2),
 ('Renata de Souza', 'Analista financeiro', 'renata.souza@gmail.com','uburu@100','11912345678', 3, 3),
 ('Melissa Angelical', 'Recursos Humanos', 'melissa.angelical@gmail.com','sprint02','11965432187', 4,4),
 ('Alexandre Costa', 'Analista de t.i.', 'alexandre.costa@gmail.com', 'beterraba','11978456325', 5,5),
 ('Richard Gomes', 'Analista de t.i.', 'richard.gomes@gmail.com','senha','11932145678', 6, 6);
 
 insert into corredor(nome, numero, fkEndereco, fkEmpresa) values
('Alimentos Não Perecíveis', 'A1', 1, 1),
('Bebidas', 'B1', 1, 1),
('Laticínios', 'C1', 1, 1),
('Carnes e Frios', 'D1', 1, 1),
('Padaria', 'E1', 1, 1),
('Pet Shop', 'F1', 2, 2),
('Hortifrúti', 'G1', 1, 1),
('Produtos de Limpeza', 'H1', 1, 1),
('Alimentos Enlatados', 'I1', 1, 1),
('Cereais e Grãos', 'J1', 1, 1),
('Congelados', 'K1', 1, 1),
('Alimentos Não Perecíveis', 'A2', 2, 2),
('Bebidas', 'B2', 2, 2),
('Laticínios', 'C2', 2, 2),
('Carnes e Frios', 'D2', 2, 2),
('Padaria', 'E2', 2, 2),
('Pet Shop', 'F2', 2, 2),
('Hortifrúti', 'G2', 2, 2),
('Produtos de Limpeza', 'H2', 2, 2),
('Alimentos Enlatados', 'I2', 2, 2),
('Cereais e Grãos', 'J2', 2, 2),
('Congelados', 'K2', 2, 2),
('Alimentos Não Perecíveis', 'A3', 3, 3),
('Bebidas', 'B3', 3, 3),
('Laticínios', 'C3', 3, 3),
('Carnes e Frios', 'D3', 3, 3),
('Padaria', 'E3', 3, 3),
('Pet Shop', 'F3', 3, 3),
('Hortifrúti', 'G3', 3, 3),
('Produtos de Limpeza', 'H3', 3, 3),
('Alimentos Enlatados', 'I3', 3, 3),
('Cereais e Grãos', 'J3', 3, 3),
('Congelados', 'K3', 3, 3),
('Alimentos Não Perecíveis', 'A4', 4, 4),
('Bebidas', 'B4', 4, 4),
('Laticínios', 'C4', 4, 4),
('Carnes e Frios', 'D4', 4, 4),
('Padaria', 'E4', 4, 4),
('Pet Shop', 'F4', 4, 4),
('Hortifrúti', 'G4', 4, 4),
('Produtos de Limpeza', 'H4', 4, 4),
('Alimentos Enlatados', 'I4', 4, 4),
('Cereais e Grãos', 'J4', 4, 4),
('Congelados', 'K4', 4, 4),
('Alimentos Não Perecíveis', 'A5', 5, 5),
('Bebidas', 'B5', 5, 5),
('Laticínios', 'C5', 5, 5),
('Carnes e Frios', 'D5', 5, 5),
('Padaria', 'E5', 5, 5),
('Pet Shop', 'F5', 5, 5),
('Hortifrúti', 'G5', 5, 5),
('Produtos de Limpeza', 'H5', 5, 5),
('Alimentos Enlatados', 'I5', 5, 5),
('Cereais e Grãos', 'J5', 5, 5),
('Congelados', 'K5', 5, 5),
('Alimentos Não Perecíveis', 'A6', 6, 6),
('Bebidas', 'B6', 6, 6),
('Laticínios', 'C6', 6, 6),
('Carnes e Frios', 'D6', 6, 6),
('Padaria', 'E6', 6, 6),
('Pet Shop', 'F6', 6, 6),
('Hortifrúti', 'G6', 6, 6),
('Produtos de Limpeza', 'H6', 6, 6),
('Alimentos Enlatados', 'I6', 6, 6),
('Cereais e Grãos', 'J6', 6, 6),
('Congelados', 'K6', 6, 6);
select *from corredor;

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
insert into dados (luminancia, fkSensor) values
(850.75, 1),
(620.33, 2),
(430.10, 3);

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
f.telefone as Telefone,
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
f.telefone as Telefone,
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
f.telefone as Telefone,
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
f.telefone as Telefone,
c.nome as NomeCorredor,
d.luminancia as Luminancia
from empresa e
join funcionario f on f.fkEmpresa = e.idEmpresa
join corredor c on c.fkEmpresa = e.idEmpresa
join sensor s on s.fkCorredor = c.idCorredor
join dados d on d.fkSensor = s.idSensor
where d.luminancia > 800
order by d.luminancia;