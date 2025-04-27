create database sevenLux;
use sevenLux;

create table endereco(
idEndereco int primary key auto_increment,
cep char ( 8),
logradouro varchar (45),
numero int,
cidade varchar (45),
estado char (2));

create table empresa(
idEmpresa int primary key  auto_increment,
nomeFantasia varchar(45),
CNPJ char (14),
fkEndereco int,
constraint fkEndereco foreign key(fkEndereco)
references endereco(idEndereco));

create table funcionario(
idFuncionario int primary key  auto_increment,
nome varchar (45),
cargo varchar (45),
email varchar (45),
senha varchar (45),
telefone char (11),
fkEndereco int,
fkEmpresa int,
constraint fkEnderecoEmp foreign key(fkEndereco)
references endereco(idEndereco),
constraint fkEmpresa foreign key (fkEmpresa)
references empresa(idEmpresa));

create table corredor (
idCorredor int primary key  auto_increment,
nome varchar(45),
numero varchar(45),
fkEndereco int,
fkEmpresa int,
constraint fkEnderecoEmpr foreign key(fkEndereco)
references endereco(idEndereco),
constraint fkEmpresaC foreign key (fkEmpresa)
references empresa(idEmpresa));


create table sensor(
IdSensor int primary key  auto_increment,
nome varchar(45),
statusSensor varchar(45),
fkCorredor int,
Constraint fkCorredor foreign key (fkCorredor) 
references corredor (idCorredor));


Create table dados(
idDados int primary key  auto_increment, 
luminancia decimal(7,2),
dtHora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
fkSensor int,
Constraint fkSensor foreign key (fkSensor)
 references sensor (idSensor));


 insert into endereco(cep,logradouro, numero,cidade, estado) values
 ('08451000','Estrada do Lageado Velho', 1013, 'São Paulo','SP'),
 ('02701000', 'Avenida Otaviano Alves de Lima', 1824,  'São Paulo','SP'),
 ('01310300', 'Avenida Paulista', 2300, 'São Paulo','SP'),
 ('21740001', 'Avenida  Marechal Fontenele', 3555, 'Rio de Janeiro', 'RJ'),
 ('40070200', 'Rua do Salete', 30, 'Salvador', 'BA'),
 ('07024170', 'Av. Pres. Humberto de Alencar Castelo Branco', 3413, 'Guarulhos', 'SP' );

 insert into empresa(nomeFantasia, CNPJ, fkEndereco)values
 ('Supermercado Rossi', '09525900000712', 1),
 ('Extra Mercado','47508411000163', 2),
 ('Carrefour Express Paulista', '45543915023041', 3),
 ('Carrefour Hipermercado', '45543915000181', 4),
 ('Assaí Atacadista', '06057223000171', 5),
 ('Supermercado Nagumo Anel Viário','07705530000184', 6);
 
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

insert into sensor(nome,statusSensor, fkCorredor) values
('LDR', 'Ativo', 1),
('LDR', 'Ativo', 2),
('LDR', 'Ativo', 3),
('LDR', 'Inativo', 4),
('LDR', 'Ativo', 5),
('LDR', 'Ativo', 6),
('LDR', 'Ativo', 7),
('LDR', 'Manutenção', 8),
('LDR', 'Ativo', 9),
('LDR', 'Ativo', 10),
('LDR', 'Ativo', 11),
('LDR', 'Ativo', 12),
('LDR', 'Inativo', 13),
('LDR', 'Ativo', 14),
('LDR', 'Ativo', 15),
('LDR', 'Ativo', 16),
('LDR', 'Ativo', 17),
('LDR', 'Ativo', 18),
('LDR', 'Ativo', 19),
('LDR', 'Ativo', 20),
('LDR', 'Ativo', 21),
('LDR', 'Ativo', 22),
('LDR', 'Manutenção', 23),
('LDR', 'Ativo', 24),
('LDR', 'Ativo', 25),
('LDR', 'Ativo', 26),
('LDR', 'Ativo', 27),
('LDR', 'Ativo', 28),
('LDR', 'Ativo', 29),
('LDR', 'Ativo', 30),
('LDR', 'Inativo', 31),
('LDR', 'Ativo', 32),
('LDR', 'Ativo', 33),
('LDR', 'Ativo', 34),
('LDR', 'Ativo', 35),
('LDR', 'Ativo', 36),
('LDR', 'Ativo', 37),
('LDR', 'Ativo', 38),
('LDR', 'Ativo', 39),
('LDR', 'Ativo', 40),
('LDR', 'Manutenção', 41),
('LDR', 'Ativo', 42),
('LDR', 'Ativo', 43),
('LDR', 'Ativo', 44),
('LDR', 'Ativo', 45),
('LDR', 'Ativo', 46),
('LDR', 'Ativo', 47),
('LDR', 'Ativo', 48),
('LDR', 'Ativo', 49),
('LDR', 'Ativo', 50),
('LDR', 'Ativo', 51),
('LDR', 'Ativo', 52),
('LDR', 'Inativo', 53),
('LDR', 'Ativo', 54),
('LDR', 'Ativo', 55),
('LDR', 'Ativo', 56),
('LDR', 'Ativo', 57),
('LDR', 'Ativo', 58),
('LDR', 'Ativo', 59),
('LDR', 'Ativo', 60),
('LDR', 'Ativo', 61),
('LDR', 'Ativo', 62),
('LDR', 'Inativo', 63),
('LDR', 'Ativo', 64),
('LDR', 'Ativo', 65),
('LDR', 'Ativo', 66);

insert into dados(luminancia, fkSensor) values
(481.00, 1),
(491.26, 2),
(631.75, 3),
(787.70, 4),
(400.85, 5),
(484.33, 6),
(867.23, 7),
(428.16, 8),
(373.60, 9),
(347.93, 10),
(472.22, 11),
(482.44, 12),
(492.66, 13),
(636.45, 14),
(785.12, 15),
(402.34, 16),
(485.71, 17),
(872.11, 18),
(429.55, 19),
(375.84, 20),
(350.42, 21),
(474.01, 22),
(484.07, 23),
(494.22, 24),
(637.83, 25),
(783.33, 26),
(403.17, 27),
(487.65, 28),
(869.45, 29),
(430.87, 30),
(376.91, 31),
(351.65, 32),
(475.88, 33),
(485.32, 34),
(495.51, 35),
(640.00, 36),
(780.90, 37),
(404.88, 38),
(489.23, 39),
(871.77, 40),
(432.12, 41),
(378.32, 42),
(353.24, 43),
(477.45, 44),
(486.91, 45),
(497.42, 46),
(641.35, 47),
(782.11, 48),
(405.66, 49),
(490.80, 50),
(870.00, 51),
(433.67, 52),
(379.75, 53),
(354.77, 54),
(478.66, 55),
(488.45, 56),
(498.65, 57),
(643.01, 58),
(781.55, 59),
(407.11, 60),
(492.12, 61),
(868.42, 62),
(434.92, 63),
(381.04, 64),
(356.29, 65),
(480.12, 66);


select 
e.nomeFantasia as Empresa,
en.cep as Cep,
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
d.luminancia as Luminancia
from empresa e
join funcionario f on f.fkEmpresa = e.idEmpresa
join corredor c on c.fkEmpresa = e.idEmpresa
join sensor s on s.fkCorredor = c.idCorredor
join dados d on d.fkSensor = s.idSensor
where e.nomeFantasia like '%carrefour%';

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
where e.nomeFantasia like '%nagumo%' 
or    e.nomeFantasia LIKE '%rossi%';

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




