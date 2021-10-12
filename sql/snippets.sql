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

-- nas tabelas de tributacao pode-se usar o conceito de generalizacao e especialicacao (exclusiva) 
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
	prd_valor_unitario decimal(5,2) not null, 
    prd_valor_desconto decimal(5,2) not null,
    prd_valor_liquido decimal(5,2) not null,
    prd_valor_base_icms decimal(5,2) not null default 0.00,
    prd_valor_icms decimal(5,2) not null default 0.00,
    prd_valor_base_pis_cofins decimal(5,2) not null default 0.00,
    prd_valor_pis_cofins decimal(5,2) not null default 0.00,
    prd_valor_frete decimal(5,2) not null default 0.00,
    prd_valor_ipi decimal(5,2) not null default 0.00,
    prd_valor_cmv decimal(5,2) not null default 0.00
);

create table mnf_modelo_nfe(
	mnf_id serial primary key,
    mnf_serie char(1) not null,
    mnf_modelo tinyint not null
);

create table nfe_nota_fiscal(
	nfe_id serial primary key,
    nfe_numero int unsigned not null,
    nfe_numero_xml varchar(44) not null,
    nfe_xml blob,
    nfe_valor_frete decimal(5,3) default 0.00,
    nfe_valor_total_desconto decimal(5,3) default 0.00,
    nfe_valor_ipi decimal(5,3) default 0.00
);

-- criacao tabela intermediaria entre produtos e nota fiscais
create table prd_nfe_produtos_notas(
	prd_id bigint unsigned not null,
    nfe_id bigint unsigned not null,
    prd_nfe_prd_quantidade tinyint unsigned not null,
    prd_nfe_valor_total decimal(5,2) not null default 0.00,
    primary key(prd_id, nfe_id),
    foreign key(prd_id) references prd_produtos(prd_id),
    foreign key(nfe_id) references nfe_nota_fiscal(nfe_id)
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




