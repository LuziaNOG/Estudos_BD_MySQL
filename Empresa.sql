Navathe - 6 Edição - Databases

#Criando o Database EMPRESA:

create database EMPRESA;

#Conectando ao database
use EMPRESA;

#Criando as Tabelas

create table FUNCIONARIO (
	cpf char(11) PRIMARY KEY,
	Pnome varchar (20) NOT NULL,
	Minicial char (1) NOT NULL,
	Unome varchar (10) NOT NULL,
	Datanasc date,
	Endereco varchar (40),
	Sexo char(1),
	Salario float,
	Cpf_supervisor char(11),
	Dnr int
);


create table DEPARTAMENTO (
	Dnumero int PRIMARY KEY,
	Dnome varchar(15) NOT NULL,
	Cpf_gerente char(11) NOT NULL,
	Data_inicio_gerente date
);

create table PROJETO (
	Projnumero int PRIMARY KEY,
	Projnome varchar(20) NOT NULL,
	Projlocal varchar(15),
	Dnum int NOT NULL
);

create table TRABALHA_EM (
	Fcpf char(11) NOT NULL,
	Pnr int NOT NULL,
	Horas decimal (3,1),
	PRIMARY KEY(Fcpf,Pnr)
);

create table LOCALIZACOES_DEP (
	Dnumero int NOT NULL,
	Dlocal varchar(20) NOT NULL,
	PRIMARY KEY(Dnumero,Dlocal)
);

create table DEPENDENTE(
	Fcpf CHAR(11) NOT NULL,
	Nome_dependente varchar (15) NOT NULL,
	Sexo char(1),
	Datanasc date,
	Parentesco varchar(10),
	PRIMARY KEY (Fcpf, Nome_dependente)
);

# Adicionando chaves estrangeiras nas tabelas.

alter table FUNCIONARIO 
ADD CONSTRAINT FK_FUNCIONARIO_FUNCIONARIO
FOREIGN KEY(Cpf_supervisor)
REFERENCES FUNCIONARIO(cpf);

alter table FUNCIONARIO
ADD CONSTRAINT FK_FUNCIONARIO_DEPARTAMENTO
FOREIGN KEY(Dnr)
REFERENCES DEPARTAMENTO(Dnumero);

alter table PROJETO
ADD CONSTRAINT FK_PROJETO_DEPARTAMENTO
FOREIGN KEY(Dnum)
REFERENCES DEPARTAMENTO (Dnumero);

alter table TRABALHA_EM 
ADD CONSTRAINT FK_TRABALHA_EM_FUNCIONARIO
FOREIGN KEY(Fcpf)
REFERENCES FUNCIONARIO(cpf);

alter table TRABALHA_EM
ADD CONSTRAINT FK_TRABALHA_EM_PROJETO
FOREIGN KEY (Pnr)
REFERENCES PROJETO(Projnumero);

alter table LOCALIZACOES_DEP
ADD CONSTRAINT FK_LOCALIZACOES_DEP_DEPARTAMENTO
FOREIGN KEY(Dnumero)
REFERENCES DEPARTAMENTO (Dnumero);

alter table DEPENDENTE
ADD CONSTRAINT FK_DEPENDENTE_FUNCIONARIO
FOREIGN KEY(Fcpf)
REFERENCES FUNCIONARIO (Cpf);

# Inserindo dados nas tabelas

insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('Jorge', 'E', 'Brito', '88866555576','1937-11-10','Rua do Horto,35,São Paulo,SP', 'M', 55.000, NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa,34,São Paulo,SP', 'M', 40.000, NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('Alice','J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima,35,Curitiba,PR', 'F', 25.000, NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima,54,Santo André,SP','F', 43.000, NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças,65,Piracicaba,SP', 'M', 38.000, NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes,74,São Paulo,SP', 'F', 25.000, NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('André', 'V', 'Pereira', '98798798733' , '1969-03-29', 'Rua Timbira,35,São Paulo,SP', 'M', 25.000,NULL, NULL);
insert into FUNCIONARIO(Pnome, Minicial, Unome, cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) values ('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores,751,São Paulo,SP', 'M', 30.000,NULL, NULL);


insert DEPARTAMENTO(Dnome,Dnumero,Cpf_gerente,Data_inicio_gerente) values ('Pesquisa','5', '33344555587', '1988-05-22');
insert DEPARTAMENTO(Dnome,Dnumero,Cpf_gerente,Data_inicio_gerente) values ('Adminstração','4', '98765432168', '1995-01-01');
insert DEPARTAMENTO(Dnome,Dnumero,Cpf_gerente,Data_inicio_gerente) values ('Matriz','1', '88866555576', '1981-06-19');

insert PROJETO(Projnome, Projnumero,Projlocal,Dnum) values ('ProdutoX', 1, 'Santo', 'André',5);
insert PROJETO(Projnome, Projnumero,Projlocal,Dnum) values ('ProdutoY', 2 ,'Itu', 5);
insert PROJETO(Projnome, Projnumero,Projlocal,Dnum) values ('ProdutoZ', 3 ,'São Paulo', 5);
insert PROJETO(Projnome, Projnumero,Projlocal,Dnum) values ('Informatização', 10, 'Mauá', 4);
insert PROJETO(Projnome, Projnumero,Projlocal,Dnum) values ('Reorganização', 20, 'São Paulo', 1);
insert PROJETO(Projnome, Projnumero,Projlocal,Dnum) values ('Novosbenefícios', 30, 'Mauá', 4);

insert LOCALIZACOES_DEP(Dnumero,Dlocal) values(1, 'São Paulo');
insert LOCALIZACOES_DEP(Dnumero,Dlocal) values(4, 'Mauá');
insert LOCALIZACOES_DEP(Dnumero,Dlocal) values(5, 'Santo André');
insert LOCALIZACOES_DEP(Dnumero,Dlocal) values(5, 'Itu');
insert LOCALIZACOES_DEP(Dnumero,Dlocal) values(5, 'São Paulo');

insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('12345678966', 1, 32.5);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('12345678966', 2, 7.5);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('66688444476', 3, 40.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('45345345376', 1, 20.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('45345345376', 2, 20.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('33344555587', 2, 10.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('33344555587', 3, 10.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('33344555587', 10, 10.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('33344555587', 20, 10.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('99988777767', 30, 30.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('99988777767', 10, 10.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('98798798733', 10, 35.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('98798798733', 30, 5.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('98765432168', 30, 20.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('98765432168', 20, 15.0);
insert TRABALHA_EM(Fcpf,Pnr,Horas) values ('88866555576', 20, NULL);

insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha');
insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho');
insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa');
insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido');
insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho');
insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha');
insert DEPENDENTE(Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco) values ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

#Inserindo o Cpf_supervisor 
update FUNCIONARIO SET Cpf_supervisor='33344555587' where cpf='12345678966';
update FUNCIONARIO SET Cpf_supervisor='88866555576' where cpf='33344555587';
update FUNCIONARIO SET Cpf_supervisor='98765432168' where cpf='99988777767';
update FUNCIONARIO SET Cpf_supervisor='88866555576' where cpf='98765432168';
update FUNCIONARIO SET Cpf_supervisor='33344555587' where cpf='66688444476';
update FUNCIONARIO SET Cpf_supervisor='33344555587' where cpf='45345345376';
update FUNCIONARIO SET Cpf_supervisor='98765432168' where cpf='98798798733';
update FUNCIONARIO SET Cpf_supervisor='NULL' where cpf='88866555576';


# Inserindo o Dnr dos funcionarios
update FUNCIONARIO set Dnr=5 where cpf='12345678966';
update FUNCIONARIO set Dnr=5 where cpf='33344555587';
update FUNCIONARIO set Dnr=4 where cpf='99988777767';
update FUNCIONARIO set Dnr=4 where cpf='98765432168';
update FUNCIONARIO set Dnr=5 where cpf='66688444476';
update FUNCIONARIO set Dnr=5 where cpf='45345345376';
update FUNCIONARIO set Dnr=4 where cpf='98798798733';
update FUNCIONARIO set Dnr=1 where cpf='88866555576';


#Exercicios Navathe 6 Edição - pagina 94


5.5.a
Para cada departamento cujo salário médio do funcionário seja maior do que R$30.000,00 recupere o nome do departamento e o número de funcionários que trabalham nele.

select d.Dnome, count(f.cpf) as Qtd_func from FUNCIONARIO f, DEPARTAMENTO d  where f.Dnr = d.Dnumero group by d.Dnome having avg(f.salario)>30.000;

5.5.b
select d.Dnome, count(f.cpf) as Qtd_func from FUNCIONARIO f, DEPARTAMENTO d  where f.Sexo = 'M' and f.Dnr = d.Dnumero group by d.Dnome having avg(f.salario)>30.000;


5.7.a
select Pnome from FUNCIONARIO where Dnr = (select f.Dnr from FUNCIONARIO f where f.Salario = (select max(Salario) from FUNCIONARIO ));


5.7.b
select f.Pnome from FUNCIONARIO f where f.Cpf_supervisor in (select s.Cpf from FUNCIONARIO s where s.Cpf_supervisor='88866555576');

5.7.c 
select f.Pnome from FUNCIONARIO f where f.Salario > (10.000 + (select min(f.Salario) from FUNCIONARIO f));

5.8.a

create view INFO_GERENTE (Nome_dep, Nome_Gerente, Salario_gerente)
as select d.Dnome, f.Pnome, f.Salario 
from DEPARTAMENTO d, FUNCIONARIO f 
where d.Cpf_gerente = f.cpf;

5.8.b 
create view INFO_DEP_PESQUISA (Nome_func, Nome_super, Salario_func)
as select f.Pnome, (Select s.Pnome from FUNCIONARIO s where s.cpf = f.Cpf_supervisor), f.Salario 
from FUNCIONARIO f 
where f.Dnr=5;

5.8.c
create view INFO_PROJETOS (Nome_proj, Nome_dep, Num_func, Horas_trab) as select Projnome, Nome_dep, qtd, total from (select p.Projnumero as Num_Proj, p.Projnome, (select d.Dnome from DEPARTAMENTO d where p.Dnum = d.Dnumero) as Nome_dep from PROJETO p) as T1 Join (select t.Pnr as Num_Proj, count(t.Fcpf) as qtd, sum(t.Horas) as total from TRABALHA_EM t group by t.Pnr) as T2 Using (Num_Proj);

5.8.d
create view INFO_PROJETOS (Nome_proj, Nome_dep, Num_func, Horas_trab) as select Projnome, Nome_dep, qtd, total from (select p.Projnumero as Num_Proj, p.Projnome, (select d.Dnome from DEPARTAMENTO d where p.Dnum = d.Dnumero) as Nome_dep from PROJETO p) as T1 Join (select t.Pnr as Num_Proj, count(t.Fcpf) as qtd, sum(t.Horas) as total from TRABALHA_EM t group by t.Pnr having qtd>1) as T2 Using (Num_Proj);

