Navathe - 6 Edição - Databases

# Criando o Database UNIVERSIDADE

create database UNIVERSIDADE;

use UNIVERSIDADE;

create table ALUNO (
	Nome varchar(15),
	Numero_aluno int primary key,
	Tipo_aluno int,
	Curso varchar(5)
);

create table DISCIPLINA (
	Nome_disciplina varchar(40),
	Numero_disciplina varchar(8) primary key,
	Creditos int,
	Departamento varchar(5)
);

create table TURMA (
	Identificacao_turma int,
	Numero_disciplina varchar(8) ,
	Semestre varchar(20),
	Ano int,
	Professor varchar(20),
	primary key (Identificacao_turma, Numero_disciplina)
);

create table HISTORICO_ESCOLAR (
	Numero_aluno int ,
	Identificacao_turma int ,
	Nota char(1) default ('F'),
	primary key (Numero_aluno, Identificacao_turma)
);

create table PRE_REQUESITO (
	Numero_disciplina varchar(8) ,
	Numero_pre_requisito varchar(8),
	primary key (Numero_disciplina, Numero_pre_requisito) 
);

alter table TURMA 
ADD CONSTRAINT FK_TURMA_DISCIPLINA
FOREIGN KEY(Numero_disciplina)
REFERENCES DISCIPLINA(Numero_disciplina);

alter table HISTORICO_ESCOLAR 
ADD CONSTRAINT FK_HISTORICO_ALUNO
FOREIGN KEY(Numero_aluno)
REFERENCES ALUNO(Numero_aluno);

alter table HISTORICO_ESCOLAR 
ADD CONSTRAINT FK_HISTORICO_TURMA
FOREIGN KEY(Identificacao_turma)
REFERENCES TURMA(Identificacao_turma);

alter table  PRE_REQUESITO
ADD CONSTRAINT FK_PRE_REQUISITO_DISCIPLINA_2
FOREIGN KEY(Numero_pre_requisito)
REFERENCES DISCIPLINA(Numero_disciplina);

# Inserindo dados

insert into ALUNO values ('Silva',17,1,'CC');
insert into ALUNO values ('Braga',8,2,'CC');

insert into DISCIPLINA values ('Introd. à ciência da computação', 'CC1310',4,'CC');
insert into DISCIPLINA values ('Estruturas de dados', 'CC3320',4,'CC');
insert into DISCIPLINA values ('Matemática discreta', 'MAT2410',3,'MAT');
insert into DISCIPLINA values ('Banco de dados', 'CC3380',3,'CC');

insert into TURMA values (85,'MAT2410','Segundo',07,'Kleber');
insert into TURMA values (92,'CC1310','Segundo',07,'Anderson');
insert into TURMA values (102,'CC3320',' Primeiro',08,'Carlos');
insert into TURMA values (112,'MAT2410','Segundo',08,'Chang');
insert into TURMA values (119,'CC1310','Segundo',08,'Anderson');
insert into TURMA values (135,'CC3380','Segundo',08,'Santos');

insert into HISTORICO_ESCOLAR values (17,112,'B');
insert into HISTORICO_ESCOLAR values (17,119,'C');
insert into HISTORICO_ESCOLAR values (8,85,'A');
insert into HISTORICO_ESCOLAR values (8,92,'A');
insert into HISTORICO_ESCOLAR values (8,102,'B');
insert into HISTORICO_ESCOLAR values (8,135,'A');

insert into PRE_REQUESITO values ('CC3380','CC3320');
insert into PRE_REQUESITO values ('CC3380','MAT2410');
insert into PRE_REQUESITO values ('CC3320','CC1310');
