				-- AULA QUINTA - FEIRA - DIA 02 DE MAIO

use streaming_jumpflix;

				--  FUNÇÃO DE AGREGAÇÃO (GROUP BY) :

SELECT 
    SUM(valor) AS soma_valor
FROM
    clientes_promo_jumpflix
GROUP BY pais;

SELECT 
    *
FROM
    clientes_promo_jumpflix;
    

SELECT 
    valor_desconto, round(AVG(valor_desconto),2) as media_desconto
FROM
    descricao_promo_jumpflix
GROUP BY valor_desconto;

				-- Exercício da aula - contar os gêneros distintos que estão listados, mostrando em duas colunas o gênero e a quantidade, valores em ordem decrescente: 

SELECT 
    *
FROM
    jumpflix_especificacoes;

SELECT 
    genero, COUNT(genero) AS valores
FROM
    jumpflix_especificacoes
WHERE
    genero <> ''
GROUP BY genero
ORDER BY valores DESC;

				-- Exercício 2

select * from descricao_promo_jumpflix;

SELECT 
    ativo,
    tipo_desconto,
    SUM(valor_desconto) AS soma,
    ROUND(AVG(valor_desconto), 2) AS media
FROM
    descricao_promo_jumpflix
GROUP BY tipo_desconto , ativo
ORDER BY tipo_desconto;

				-- Exercicio 3 - Filtre o país da tabela clientes_promo_jumpflix e crie uma coluna com total_valor, mostrando o valor total por país. Aplique um filtro para exibir apenas os valores por país maiores que 9.
                -- HAVING:

select 
pais, 
sum(valor) as total_valor
from clientes_promo_jumpflix
group by pais
having sum(valor) > 9;


				-- Exemplo: HAVING:

SELECT 
    codigo_promocional,
    ROUND(AVG(valor * quantidade), 0) AS media_total
FROM
    clientes_promo_jumpflix
GROUP BY codigo_promocional
HAVING ROUND(AVG(valor * quantidade), 0) < 13500;



		-- Exercício 4 (2 etapas):

SELECT 
    *
FROM
    jumpflix_filmes;

SELECT 
    tempo, classificacao_indicativa, COUNT(*) AS qnt
FROM
    jumpflix_filmes
GROUP BY tempo , classificacao_indicativa
HAVING COUNT(*) > 1;



