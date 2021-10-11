-- scripts destinado ao projeto PCustos

create database pcustos;

use pcustos;

create table ncm(
	ncm_id serial primary key,
    ncm_codigo int unique not null, 
    ncm_descricao varchar(50) not null
);

create table cfop(
	cfop_id serial primary key,
    cfop_codigo int unique not null,
    cfop_descricao varchar(50) not null
);

create table tbe_tributacao_estadual(
	tbe_id serial primary key,
    tbe_descricao varchar(50) not null, 
    tbe_aliquota tinyint unsigned not null,
    tbe_ativo bool default 1
);

create table tbf_tributacao_federal(
	tbf_id serial primary key,
    tbf_descricao varchar(50) not null, 
    tbf_aliquota tinyint unsigned not null,
    tbf_ativo bool default 1
);

create table prd_produtos(
	prd_id serial primary key,
    prd_codigo int unsigned unique not null,
    ncm_id bigint unsigned not null,
    cfop_id bigint unsigned not null,
    prd_descricao varchar(50) not null,
    prd_quantidade tinyint unsigned not null, 
	prd_valor_unitario decimal(5,2) not null, 
    prd_valor_base_icms decimal(5,2) not null default 0.00,
    prd_valor_base_pis_cofins decimal(5,2) not null default 0.00
);

alter table prd_produtos
add constraint fk_prd_produtos__ncm__ncm_id
foreign key(ncm_id) references ncm(ncm_id);

alter table prd_produtos
add constraint fk_prd_produtos__cfop__cfop_id
foreign key(cfop_id) references cfop(cfop_id);

alter table prd_produtos
add column tbe_id bigint unsigned not null,
add column tbf_id bigint unsigned not null;

alter table prd_produtos
add constraint fk_produtos__tbe_tributacao_estadual__tbe_id
foreign key(tbe_id) references tbe_tributacao_estadual(tbe_id);

alter table prd_produtos
add constraint fk_produtos__tbf_tributacao_federal__tbf_id
foreign key(tbf_id) references tbf_tributacao_federal(tbf_id);

-- drop table produtos;
-- drop table ncm;
-- drop table cfop;
-- drop table tbe_tributacao_estadual;




