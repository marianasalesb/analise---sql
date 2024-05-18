SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS teste_join;
CREATE SCHEMA teste_join;
USE teste_join;

CREATE TABLE TABELA_ALUNOS (
    ID_ALUNO INT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    SEXO ENUM('M','F'),
    IDADE INT NOT NULL
);

INSERT INTO TABELA_ALUNOS(ID_ALUNO, NOME, SEXO, IDADE) 
VALUES 
(1, 'João da Silva', 'M', 14),
(2, 'Paulo Antônio', 'M', 13),
(3, 'Maria dos Santos', 'F', 16),
(4, 'Fernanda Madeira', 'F', 13),
(5, 'Paula Aguiar', 'F', 17);


CREATE TABLE TABELA_SALAS(
    ID_SALA CHAR(5) PRIMARY KEY,
    ID_ALUNO INT,
    ANDAR VARCHAR(255),
    SALA CHAR(10)
);

INSERT INTO TABELA_SALAS(ID_SALA, ID_ALUNO, ANDAR, SALA) 
VALUES 
('A1', 2, '1º PRIMEIRO ANDAR', 1001),
('A2', 3, '2º SEGUNDO ANDAR', 2001),
('A3', 1, '1º PRIMEIRO ANDAR', 1002),
('B1', 7, '3º TERCEIRO ANDAR', 3002),
('B2', NULL, '1º SEGUNDO ANDAR', 2002),
('B3', 5, '3º TERCEIRO ANDAR', 3001);

SELECT * FROM tabela_alunos;
SELECT * FROM tabela_salas;

	-- LEFT ENRIQUECE O QUE ESTÁ NO FROM.
SELECT 
    T1.ID_ALUNO,
    T1.NOME,
    T2.SALA
FROM tabela_salas AS T2
        LEFT JOIN tabela_alunos AS T1 
			ON T1.ID_ALUNO = T2.ID_ALUNO;

	-- RIGHT ENRIQUECE O QUE ESTÁ NO JOIN.
SELECT 
    T1.ID_ALUNO,
    T1.NOME,
    T2.SALA
FROM tabela_salas AS T2
        RIGHT JOIN tabela_alunos AS T1 
			ON T1.ID_ALUNO = T2.ID_ALUNO;
        
	-- INNER JOIN:
SELECT 
    T1.ID_ALUNO,
    T2.NOME,
    T1.SALA
FROM tabela_salas AS T1
        INNER JOIN tabela_alunos AS T2 
			ON T2.ID_ALUNO = T1.ID_ALUNO;
            
	-- FULL JOIN:
SELECT 
    T1.ID_ALUNO,
    T1.NOME,
    T2.SALA
FROM tabela_salas AS T2
        LEFT JOIN tabela_alunos AS T1 
			ON T1.ID_ALUNO = T2.ID_ALUNO
UNION ALL 
SELECT 
    T1.ID_ALUNO,
    T1.NOME,
    T2.SALA
FROM tabela_salas AS T2
        RIGHT JOIN tabela_alunos AS T1 
			ON T1.ID_ALUNO = T2.ID_ALUNO;
            
            
        
SELECT 
    *
FROM tabela_alunos t1
        LEFT JOIN tabela_salas t2 
        ON t1.ID_ALUNO = t2.ID_ALUNO;
-- 01		
/* quais dados da tabela alunos não tem relação com a tabela sala*/

select * from tabela_salas t1
	left join tabela_alunos t2
    on t1.ID_ALUNO = t2.ID_ALUNO
where t2.ID_ALUNO is null;

-- 02
/*quais dados da tabela salas não tem relação com a tabela alunos?*/

-- 03)
/*Gerar uma tabela com o nome dos alunos, andar e número da sala apenas para aqueles 
que estão cadastrados em salas.*/

SELECT 
    T1.NOME,
    T2.ANDAR,
    T2.SALA
FROM tabela_alunos T1
        INNER JOIN tabela_salas T2 
			ON T1.ID_ALUNO = T2.ID_ALUNO;

-- 04)
/*Faça um acompanhamento da quantidade de alunos cadastrados em salas, discriminados 
por sexo.*/

SELECT 
    COUNT(*) quantidade, 
    t1.sexo
FROM tabela_alunos t1
        INNER JOIN tabela_salas t2 
        ON t1.ID_ALUNO = t2.ID_ALUNO
GROUP BY t1.SEXO;

-- 05)
/*Construir uma tabela com todos os alunos cadastrados na tabela de alunos, enriquecendo 
a informação do andar da sala, caso esta esteja disponível para o aluno.*/
 
SELECT 
	t1.ID_ALUNO,
    t1.NOME, 
    t2.ANDAR,
    t2.SALA
FROM tabela_alunos t1
        LEFT JOIN tabela_salas t2 
        ON t1.ID_ALUNO = t2.ID_ALUNO;
 
 
-- 06)
/*Caso o aluno não esteja atribuído a um andar preencher o campo com CADASTRAR SALA.*/
 
  
SELECT 
    t1.nome,
    t2.ANDAR,
    CASE
        WHEN t2.SALA IS NULL THEN 'CADASTRAR SALA'
        ELSE t2.SALA
    END SALA
FROM tabela_alunos t1
        LEFT JOIN tabela_salas t2 
			ON t1.ID_ALUNO = t2.ID_ALUNO;
 
SELECT 
    T1.*, 
	ifnull(T2.SALA,'CADASTRAR SALA') SALA,
    ifnull(T2.ANDAR,'CADASTRAR ANDAR') ANDAR
FROM
    tabela_alunos T1
        LEFT JOIN tabela_salas T2 
        ON t1.ID_ALUNO = T2.ID_ALUNO;
    
 -- select ifnull(2,'CADASTRAR SALA') teste
 
 -- 07)
/*Criar uma tabela que não necessariamente contenha o nome de todos os alunos, mas que inclua 
os dados de todos os andares e salas. */
 
 -- RIGHT
 SELECT 
    ifnull(T1.NOME,'CADASTRAR ALUNO') NOME,
	T2.SALA,
    T2.ANDAR
FROM
    tabela_alunos T1
        RIGHT JOIN tabela_salas T2 
        ON t1.ID_ALUNO = T2.ID_ALUNO;
 
-- 08)
/*Ajuste a query anterior para exibir apenas o nome e sala dos alunos com 16 anos ou mais. */

-- RIGHT

SELECT 
    T1.NOME,
    T1.IDADE,
	T2.SALA
FROM
    tabela_alunos T1
        RIGHT JOIN tabela_salas T2 
			ON t1.ID_ALUNO = T2.ID_ALUNO
        WHERE T1.IDADE >= 16;




-- SELECT:
SELECT 
    *
FROM
    tabela_alunos;


            