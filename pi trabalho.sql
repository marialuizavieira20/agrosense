/*
GRUPO 06 - 1SIS
HENRIQUE REZENDE
JONAS FERNANDES
LUCAS GALVAO
LUIZ SOBRINHO
MARCUS VINICIUS
MATHEUS ANJOS
*/

create database AgroSense;
use AgroSense;

-- ----- Criação das tabelas -----

create table cadastro(
id int primary key auto_increment,
nome_da_empresa Varchar(50)not null,
data_cadastro date not null,
sts_plano Varchar (30), constraint chkStatus check(sts_plano in('Ativo', 'Teste', 'Cancelado')),
aceite_dos_termos tinyint (1) not null
) ;

create table informacao_do_cliente (
id int primary key auto_increment,
nome_da_empresa Varchar (50) not null,
telefone varchar(20) not null,
email Varchar(50) not null,
cidade_e_estado varchar (70) not null
);

create table informacao_da_plantacao (
id int primary key auto_increment,
nome_da_empresa varchar(50) not null,
area_de_plantacao_hectares int not null,
producao_media_hectares int not null,
gasto_mensal_agua int not null
);

create table dados_do_sensor (
id int primary key auto_increment,
nome_da_empresa Varchar (50) not null,
data_horario_medicao datetime default current_timestamp(),
porcentagem_umidade decimal (5,2) not null
);

-- inserindo dados
insert into cadastro values
(default, 'JBS','2026-01-02','Ativo',1),
(default, 'Raízen','2025-06-14','Ativo',1),
(default, 'Agromania','2025-03-30','Cancelado',0),
(default, 'Sítio Oliveira','2026-02-08','Teste',1),
(default, 'Ferreira´s Agro','2026-01-11','Ativo',0);

insert into informacao_do_cliente values
(default,'JBS','1140028922','jbs@gmail.com','Guarulhos,SP'),
(default,'Raízen','1198987676','raizen@gmail.com','Parati,RJ'),
(default,'Agromania','1192987059','agromania@gmail.com','São Bernardo,SP'),
(default,'Sítio Oliveira','1198388831','st.oliveira@gmail.com','Araraquara,SP'),
(default,'Ferreira´s Agro','1198886611','ferreira.agro@gmail.com','São Carlos,RJ');

insert into informacao_da_plantacao values
(default,'JBS',5,7500,5000),
(default,'Raízen',10,15000,10000),
(default,'Agromania',4,6800,4000),
(default,'Sítio Oliveira',3,5000,3000),
(default,'Ferreira´s Agro',8,10000,8000);

insert into dados_do_sensor values
(default,'JBS',default,54.01),
(default,'Raízen',default,65.00),
(default,'Agromania',default,77.00),
(default,'Sítio Oliveira',default,68.50),
(default,'Ferreira´s Agro',default,63.00);


-- ----- Script de Query ------
select id, nome_da_empresa, data_cadastro, sts_plano, case
when aceite_dos_termos = 1 then 'Aceitou'
else 'Não aceitou'
end as termos_de_uso
from cadastro;

Select *, case
when porcentagem_umidade <65 THEN 'ALERTA DE SOLO SECO'
When porcentagem_umidade >75 THEN 'ALERTA DE EXCESSO DE ÁGUA'
else 'UMIDADE ESTÁ NO NÍVEL CORRETO'
end as status_umidade
FROM dados_do_sensor;

select * from informacao_do_cliente;

select * from informacao_da_plantacao;