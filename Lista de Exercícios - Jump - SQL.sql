DROP SCHEMA IF exists jump_school;
create schema jump_school;
use jump_school;

-- EXERCÍCIO 01 - Criando a tabela jump_school_alunos:

CREATE TABLE jump_school_alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    genero ENUM('Masculino', 'Feminino'),
    endereco TEXT,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_matricula DATE,
    ativo BOOLEAN
);

ALTER TABLE jump_school_alunos AUTO_INCREMENT = 1;
 

SELECT 
    *
FROM
    jump_school_alunos;

-- EXERCÍCIO 02 - Criando a tabela jump_school_cursos:

CREATE TABLE jump_school_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    carga_horaria INT,
    valor DECIMAL(10 , 2 ),
    data_inicio DATE,
    data_fim DATE,
    professor_id INT
);

SELECT 
    *
FROM
    jump_school_cursos;

-- EXERCÍCIO 03 - Criando a tabela jump_school_notas:

CREATE TABLE jump_school_notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    nota DECIMAL(5 , 2 ),
    data_avaliacao DATE
);
-- no exercício pedia a FOREIGN KEY em alunos_id e curso_id, por isso usei int

SELECT 
    *
FROM
    jump_school_notas;


-- EXERCÍCIO 04 - Criando a tabela jump_school_professores: 

CREATE TABLE jump_school_professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    formacao TEXT,
    experiencia TEXT,
    salario DECIMAL(10 , 2 ),
    data_contratacao DATE,
    ativo BOOLEAN
);

SELECT 
    *
FROM
    jump_school_professores;


-- EXERCÍCIO 05 - Inserindo dados na tabela jump_school_alunos:

INSERT INTO jump_school_alunos (nome, data_nascimento, genero, endereco, telefone, email, data_matricula, ativo)
VALUES
('Maria Silva', '2004-05-15', 'Feminino', 'Rua das Flores, 123', '(11) 98765-4321', 'maria@email.com', '2023-01-10', 1),
('João Santos', '1982-09-20', 'Masculino', 'Av. Principal, 456', '(11) 91234-5678', 'joao@email.com', '2023-02-05', 1),
('Ana Oliveira', '2003-02-28', 'Feminino', 'Rua do Sol, 789', '(11) 92345-6789', 'ana@email.com', '2023-03-15', 1),
('Pedro Souza', '1985-11-10', 'Masculino', 'Travessa da Paz, 321', '(11) 93456-7890', 'pedro@email.com', '2023-04-20', 1),
('Juliana Costa', '2002-08-05', 'Feminino', 'Av. Central, 789', '(11) 94567-8901', 'juliana@email.com', '2023-05-25', 1),
('Lucas Pereira', '1980-04-12', 'Masculino', 'Rua da Esperança, 654', '(11) 95678-9012', 'lucas@email.com', '2023-06-30', 0),
('Carla Lima', '2004-10-30', 'Feminino', 'Rua da Amizade, 987', '(11) 96789-0123', 'carla@email.com', '2023-07-10', 1),
('Marcos Mendes', '1983-07-18', 'Masculino', 'Av. dos Sonhos, 234', '(11) 97890-1234', 'marcos@email.com', '2023-08-15', 1),
('Patrícia Gomes', '2003-12-03', 'Feminino', 'Rua da Harmonia, 567', '(11) 98901-2345', 'patricia@email.com', '2024-09-20', 0),
('Rafael Oliveira', '1985-03-25', 'Masculino', 'Av. da Liberdade, 890', '(11) 99012-3456', 'rafael@email.com', '2024-10-25', 1);

-- nos dados recebidos não era fornecido o id, então retirei do insert.

-- EXERCÍCIO 06 - Inserindo dados na tabela jump_school_cursos:

INSERT INTO jump_school_cursos (nome, descricao, carga_horaria, valor, data_inicio, data_fim, professor_id)
VALUES 
('Introdução à Programação em Python', 'Curso introdutório sobre os fundamentos da linguagem de programação Python.', 40, 199.99, '2022-03-01', '2022-04-10', 1),
('Desenvolvimento Web com HTML, CSS e JavaScript', 'Aprenda a construir páginas web dinâmicas utilizando HTML, CSS e JavaScript.', 60, 299.99, '2022-05-15', '2022-07-05', 2),
('Banco de Dados e SQL para Iniciantes', 'Domine os conceitos básicos de bancos de dados e a linguagem SQL.', 80, 399.99, '2022-08-20', '2022-10-15', 3),
('Desenvolvimento de Aplicativos Android com Kotlin', 'Aprenda a criar aplicativos Android utilizando a linguagem Kotlin.', 100, 499.99, '2022-11-01', '2023-01-15', 4),
('Introdução à Inteligência Artificial', 'Explore os conceitos fundamentais da inteligência artificial e suas aplicações.', 20, 99.99, '2023-02-20', '2023-03-30', 5),
('Machine Learning: Fundamentos e Prática', 'Conheça os princípios do machine learning e aplique em projetos práticos.', 30, 149.99, '2023-04-15', '2023-05-30', 6),
('Segurança da Informação e Ethical Hacking', 'Aprenda sobre segurança da informação e técnicas de ethical hacking.', 50, 249.99, '2023-06-10', '2023-08-05', 7),
('Desenvolvimento de Jogos com Unity', 'Crie seus próprios jogos utilizando a engine Unity.', 40, 199.99, '2023-09-20', '2023-11-10', 8),
('Big Data e Análise de Dados', 'Explore o mundo do big data e aprenda técnicas de análise de dados.', 20, 99.99, '2023-12-01', '2024-01-30', 9),
('Desenvolvimento de Aplicações com Docker e Kubernetes', 'Construa, implante e gerencie aplicações usando Docker e Kubernetes.', 30, 149.99, '2024-02-15', '2024-04-05', 10);

-- nos dados recebidos não era fornecido o id, então retirei do insert.

-- EXERCÍCIO 07 - Inserindo dados na tabela jump_school_notas:

INSERT INTO jump_school_notas(aluno_id, curso_id, nota, data_avaliacao)
VALUES
(1, 1, 8.5, '2023-04-10'),
(2, 4, 7.8, '2023-05-15'),
(3, 1, 9.2, '2023-06-20'),
(4, 7, 6.9, '2023-07-25'),
(5, 1, 8.3, '2023-08-30'),
(6, 0, 9.7, '2024-03-10'),
(7, 6, 8.0, '2024-04-15'),
(8, 2, 7.5, '2024-05-20'),
(9, 3, 9.0, '2024-06-25'),
(10, 9, 8.8, '2024-07-30');

-- nos dados recebidos não era fornecido o id (chave primaria), então não foram acrescentados na inserção.

-- EXERCÍCIO 08 - Inserindo dados na tabela jump_school_professores:

INSERT INTO jump_school_professores (nome, formacao, experiencia, salario, data_contratacao, ativo)
VALUES 
('Fernanda Oliveira', 'Mestrado em Ciência da Computação', '10 anos de experiência como desenvolvedora e professora de Python.', 3000.00, '2020-01-15', 1),
('Gustavo Santos', 'Doutorado em Desenvolvimento Web', 'Autor de diversos livros sobre HTML, CSS e JavaScript.', 3500.00, '2019-05-20', 0),
('Patricia Lima', 'Graduação em Banco de Dados', 'Experiência em administração de sistemas de banco de dados.', 2500.00, '2021-03-10', 0),
('Ricardo Silva', 'Especialização em Inteligência Artificial', 'Pesquisador em projetos de inteligência artificial e machine learning.', 3200.00, '2018-11-05', 0),
('Juliana Mendes', 'Pós-graduação em Segurança da Informação', 'Consultora em segurança da informação e ethical hacking.', 2800.00, '2022-02-18', 1),
('Carlos Souza', 'Mestrado em Desenvolvimento de Jogos', 'Desenvolvedor de jogos e instrutor de Unity.', 3100.00, '2017-09-30', 1),
('Luciana Fernandes', 'Graduação em Análise de Dados', 'Analista de dados e especialista em big data.', 2900.00, '2016-07-12', 1),
('Pedro Oliveira', 'Especialização em DevOps', 'Engenheiro de software focado em práticas DevOps.', 3300.00, '2015-04-25', 1),
('Mariana Costa', 'Doutorado em Computação em Nuvem', 'Pesquisadora em tecnologias de nuvem e virtualização.', 3400.00, '2014-02-08', 1),
('Roberto Almeida', 'Graduação em Sistemas de Informação', 'Analista de segurança e especialista em Docker e Kubernetes.', 2700.00, '2019-09-15', 1);

-- nos dados recebidos não era fornecido o id, então retirei do insert.

-- EXERCÍCIO 09 - Encontre todos os alunos ativos que nasceram após 2000:
SELECT 
    nome, ativo, data_nascimento
FROM
    jump_school_alunos
WHERE
    ativo = 1 AND data_nascimento > '2000-12-31';

-- EXERCÍCIO 10 - Encontre os diferentes valores de mensalidade dos cursos, com um desconto de 10% aplicado:

SELECT 
    nome, valor, 
    round(valor * 0.9, 2) AS valor_desconto
FROM
    jump_school_cursos;


SELECT 
    home, 
    COUNT(*)
FROM
    jump_school_cursos
GROUP BY nome
HAVING COUNT(*) > 1;

-- utilizei o 0.9 para 10% de desconto pois, 0.9 seria 90% do valor restando os 10% que eu queria achar.

-- EXERCÍCIO 11 - Entenda a estrutura da tabela de notas em seguida consulte todos os dados da tabela criando as colunas mês e ano da data de avaliação:

SELECT 
    id, 
    aluno_id,
    curso_id,
    nota, 
    data_avaliacao,
    MONTH(data_avaliacao) as mês,
    YEAR(data_avaliacao) as ano
FROM
    jump_school_notas;


-- EXERCÍCIO 12 - Gere uma lista de professores com a data de contratação no formato dia/mes/ano e crie uma coluna salário anual estimado:
SELECT 
    nome,
    data_contratacao,
    salario,
    DAY(data_contratacao) AS dia,
    MONTH(data_contratacao) AS mês,
    YEAR(data_contratacao) AS ano,
	salario * 12 AS salario_anual
FROM
    jump_school_professores;


-- Exercício 13:
/*Você precise revisar as notas dos alunos para uma determinada avaliação. Escreva uma consulta SQL que selecione as notas e as 
datas de avaliação dos alunos da tabela jump_school_notas, juntamente com a data atual. A data atual será exibida como data_hoje ao 
lado das informações das notas e das datas de avaliação.*/
 
SELECT 
    *, 
    NOW() AS data_hoje
FROM
    jump_school_notas;
 
 select current_date();
 
 
-- Exercício 14:
/*Encontre o número de alunos ativos por gênero e a média de idade de cada gênero. 
Ordene o resultado pela média de idade em ordem decrescente.*/

SELECT 
    genero,
    COUNT(*) AS numero_aluno,
    AVG(TIMESTAMPDIFF(YEAR,
        data_nascimento,
        CURDATE())) AS media_idade
FROM
    jump_school_alunos
WHERE
    ativo = 1
GROUP BY genero
ORDER BY media_idade DESC;

















