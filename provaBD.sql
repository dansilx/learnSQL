
--------------------------------
BANCO DE DADOS - RESOLUÇÃO DA P1
--------------------------------


a)
create database PROVABD;
use PROVABD;

create table ALUNO (
	codigo int not null auto_increment,
    nome varchar(50),
    idade int,
    primary key (codigo)
);

create table CURSO (
	codigo int not null auto_increment,
    nome varchar(50),
    sala varchar(10),
    horario varchar(30),
    primary key (codigo)
);

create table MATRICULA (
	id int not null auto_increment,
	codigo_alu int not null,
    codigo_cur int not null,
    primary key (id),
    foreign key (codigo_alu) references ALUNO (codigo),
    foreign key (codigo_cur) references CURSO (codigo)
);

create table TEMP (
	cod int not null auto_increment,
    idade int not null,
    primary key (cod)
);


-----
b)
use PROVABD;

alter table TEMP add nome varchar(50);

alter table TEMP rename column cod to codigo; -- (não funciona no MariaDB)
alter table TEMP change cod codigo int;

alter table TEMP drop idade;

drop table TEMP;


-----
c)
use PROVADB;

insert into ALUNO (nome, idade) values ("João da Silva", 18), ("Pedro Costa", 20), ("Ana de Oliveira Pereira", 21), ("Fabiano Oliveira", 17);

insert into CURSO (nome, sala, horario) values ("Web Designer", "10", "13:00"), ("Pacote Office", "11", "15:00"), ("Internet", "12", "17:00");

insert into MATRICULA (codigo_alu, codigo_cur) values (1, 1), (2, 1), (3, 1), (1, 2), (2, 3), (3, 3), (4, 2);


-----
d)
use PROVABD;

update CURSO set nome = "Programação para Internet" where curso.codigo = 1;

set SQL_SAFE_UPDATES = 0;
update CURSO set nome = "Programação para Internet" where curso.nome = "Web Designer";

delete from MATRICULA where (codigo_alu = 1 and codigo_cur = 1);


-----
e)
use PROVABD;

select count(*) "Total de alunos maiores de idade" from ALUNO where idade >= 18;


-----
f)
use PROVABD;

select a.nome from MATRICULA m, ALUNO a, CURSO c 
where m.codigo_alu = a.codigo and m.codigo_cur = c.codigo and c.nome = "Programação para Internet" 
order by a.nome DESC;

select a.nome from MATRICULA m 
inner join ALUNO a on m.codigo_alu = a.codigo
inner join CURSO c on m.codigo_cur = c.codigo
where c.nome = "Programação para Internet"
order by a.nome DESC;


-----
g)
use PROVABD;

select a.nome from ALUNO a where a.nome like "%Oliveira%";


-----
h)
use PROVABD;

create user aluno2@localhost;
create user aluno2@localhost identified by "senha123";

grant select, insert, update, delete on *.* to aluno@localhost;

Select * from mysql.user;
Select * from mysql.user where host = "localhost";

