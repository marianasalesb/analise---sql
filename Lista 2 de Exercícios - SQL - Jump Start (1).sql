-- Lista 2 - SQL
-- Mariana Sales
-- Não usei o create schema pois já tinha feito na primeira lista
use jump_school;

/* SELECTS DAS TABELAS: */

SELECT 
    *
FROM
    jump_school_alunos;
    
SELECT 
    *
FROM
    jump_school_cursos;
    
SELECT 
    *
FROM
    jump_school_notas;
   
SELECT 
    *
FROM
    jump_school_professores;
 
 
/*==============================================================
		Exercício 13: Filtrando alunos ativos e inativos. 
	Selecione todos os alunos que estão ativos e se
    matricularam a partir de 1º de janeiro de 2023 
=================================================================*/

SELECT 
    nome, 
    ativo,
    data_matricula
FROM jump_school_alunos
WHERE ativo = 1
        AND data_matricula >= '2023-01-01';

/*==============================================================
		Exercício 14:
    Crie uma consulta que selecione alunos com idades entre 21 e 40 anos.
	Certifique-se de filtrar apenas colunas necessárias para analise
    como por exemplo uma coluna com a idade dos alunos.
=================================================================*/

SELECT 
    nome,
    TIMESTAMPDIFF(YEAR, data_nascimento,CURDATE()) AS idade
FROM jump_school_alunos
WHERE
    TIMESTAMPDIFF(YEAR, data_nascimento,CURDATE()) BETWEEN 21 AND 40; 

-- Não chamei a coluna data_nascimento para a consulta por ter criado a coluna idade.


/*==============================================================
	Exercício 15: Filtrando Cursos por Carga Horária e Valor.
    Selecione todos os cursos com carga horária 
    maior que 50 horas e valor menor que R$500
=================================================================*/

SELECT 
    nome, 
    carga_horaria,
    valor
FROM jump_school_cursos
WHERE carga_horaria > 50 
	AND valor < 500.00;




/*==============================================================
		Exercício 16:
    Selecione todos os cursos que começam em 2023 
    e têm valor entre R$100 e R$200
=================================================================*/

SELECT 
    nome, 
    data_inicio,
    valor
FROM jump_school_cursos
WHERE data_inicio >= '2023-01-01'
	AND valor BETWEEN 100.00 AND 200.00;
    

SELECT 
    nome, 
    data_inicio, 
    valor
FROM jump_school_cursos
WHERE data_inicio LIKE '%2023%'
	AND valor BETWEEN 100.00 AND 200.00;

/* Fiz dessas duas maneiras, mas acho que a segunda seria mais eficaz,
pois pega apenas os cursos do ano de 2023, já a primeira maneira, também
traz a consulta os cursos iniciados em 2024.*/


/*==============================================================
		Exercício 17:
	Crie uma consulta onde serão apresentadas as colunas
    nota e uma coluna chamada acompanhamento.
	O acompanhamento é criado da seguinte maneira:
	As notas serão marcadas como "aprovado" quando maiores que 7.5 
    e "reprovado" quando menores que este valor.
	Crie uma segunda consulta com a contagem de notas aprovadas.      
=================================================================*/
 
	-- Primeira consulta:
 SELECT 
    nota,
    CASE
        WHEN nota > 7.5 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS situação
FROM jump_school_notas;


	-- Segunda consulta:
    
SELECT 
    count(nota) as notas_aprovadas
FROM jump_school_notas
WHERE nota > 7.5;
 
 

/*==============================================================
		Exercício 18:
	O diretor da escola pediu um levantamento da quantidade
    de professores que foram contratados por ano. 
    Monte uma tabela com a quantidade de professores contratados por ano. 
    Você tem alguma observação sobre o resultado? Se sim, qual?		
=================================================================*/

-- teste 1
SELECT 
    YEAR(data_contratacao) AS ano, COUNT(nome) AS professores
FROM
    jump_school_professores
GROUP BY YEAR(data_contratacao)
ORDER BY YEAR(data_contratacao);

--  consulta final:
SELECT 
    ativo,
    YEAR(data_contratacao) AS ano,
    COUNT(DISTINCT nome) AS professores
FROM
    jump_school_professores
WHERE
    ativo = 1
GROUP BY YEAR(data_contratacao)
ORDER BY YEAR(data_contratacao);

/* Na primeira consulta (teste 1) trouxe como resultado 2 professores contratados
no ano de 2019, mas observando na coluna "ativo", um desses professores já não estava
mais ativo, então, puxei na última consulta o ativo também para mostrar apenas os professores
que ainda estão trabalhando desde o ano de contrato.*/



/*==============================================================
		Exercício 19: Filtrando e Ordenando Notas dos Alunos.
	Selecione todas as notas acima de 7.0 para o curso com id 1
    e ordene-as pela data da avaliação, 
    da mais recente para a mais antiga.
=================================================================*/


SELECT 
    nota, 
    curso_id, 
    data_avaliacao
FROM jump_school_notas
WHERE nota > 7.0 AND curso_id = 1
ORDER BY data_avaliacao ASC;

-- Poderia não ter colocado o ASC, pois iria dar no mesmo, mas deixei para melhor visualização.


/*==============================================================
		Exercício 20:
    Fizemos um levantamento na tabela notas e identificamos que 
    tem uma coluna chamada curso_id, com o responsável pelas bases. 
    Pegamos as seguintes informações sobre essa coluna:
	• Curso 2: HTML, CSV e JAVA
	• Curso 3: SQL
	• Curso 9: Big Data
	Você pode gerar uma tabela com curso, nota e data_avaliacao, 
    associando esses nomes de cursos nesta coluna 
    e renomeando para 'CURSOS'. 
    Os valores não identificados devem ser colocados como NULL.    
=================================================================*/

SELECT 
    CASE curso_id
        WHEN 2 THEN 'HTML, CSV e JAVA'
        WHEN 3 THEN 'SQL'
        WHEN 9 THEN 'Big Data'
        ELSE NULL
    END AS CURSOS,
    nota,
    data_avaliacao
FROM
    jump_school_notas;
    
    
    
    
    