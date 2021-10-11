-- scripts destinado ao projeto PCustos

create database pcustos;

use pcustos;

create table ncm(
	id serial primary key,
    codigo int not null, -- verficar tamanho ncm
    descricao varchar(150) not null
);

insert into ncm
(codigo, descricao)
values
(33053245, 'Descricao test 2');

alter table ncm change column codigo codigo int(8) not null;

describe ncm;

select * from ncm;

drop table ncm;