-- scripts destinado ao projeto PCustos

create database pcustos;

use pcustos;

create table ncm(
	id serial primary key,
    codigo int unique not null, 
    descricao varchar(50) not null
);

create table cfop(
	id serial primary key,
    codigo int unique not null,
    descricao varchar(50) not null
);

create table produtos(
	id serial primary key,
    codigo int unsigned unique not null,
    ncm_id bigint unsigned not null,
    cfop_id bigint unsigned not null,
    descricao varchar(50) not null,
    quantidade tinyint unsigned not null, 
	valor_unitario decimal(5,2) not null, 
    valor_base_icms decimal(5,2) not null default 0.00,
    valor_base_pis_cofins decimal(5,2) not null default 0.00,
    foreign key(ncm_id) references ncm(id),
    foreign key(cfop_id) references cfop(id)
);
