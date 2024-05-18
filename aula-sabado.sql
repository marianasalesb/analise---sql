-- ctrl b faz o código ficar mais organizado e limpo.

use streaming_jumpflix;
show tables;

select distinct * from promocao_jumpflix;

select distinct
	descricao,
	titulo,
    data_inicio,
    data_fim
from promocao_jumpflix;

select * from jumpflix_filmes;

select distinct
	nome,
    data_lancamento
from jumpflix_filmes;

select * from clientes_promo_jumpflix;

select distinct 
	pais,
	pais as pais_unico
from clientes_promo_jumpflix;

select 2 * 3 as multiplica;

select nome,
       ' '	as campo_obri,
       'app' as canal
from jumpflix_filmes;


select nome,
       ' '	as campo_obri,
       'TV' as canal
from jumpflix_filmes;



select * from descricao_promo_jumpflix;

select valor_desconto,
valor_desconto * 0.02 as desconto_2
	-- 2/100 as desconto_2
from descricao_promo_jumpflix;

SELECT 
    nome,
    classificacao_indicativa,
    classificacao_indicativa - 1 AS classificacao_indificativa_nova
FROM
    jumpflix_filmes;

SELECT 
    nome, tempo
FROM
    jumpflix_filmes
WHERE
    tempo = '60 min';

--                   !!!!!!! AULA DE SÁBADO 27/04 !!!!!!!

SELECT 
    *
FROM
    promocao_jumpflix;
-- select * from promocao_jumpflix where 'Oferta de Aniversário';

SELECT DISTINCT
    titulo
FROM
    promocao_jumpflix;

SELECT 
    *
FROM
    promocao_jumpflix
WHERE
    titulo = 'Oferta de Aniversário';

SELECT 
    *
FROM
    clientes_promo_jumpflix
WHERE
    codigo_promocional = 'VERAO2023'
        OR pais = 'Brasil';
    
SELECT 
    *
FROM
    jumpflix_filmes;

SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa = 15
        AND tempo = '4,393 min';


SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa = 15
        OR tempo = '4,393 min';
    

select * from jumpflix_filmes;

--             ! valores distintos de classificação indicativa !
SELECT DISTINCT
    classificacao_indicativa
FROM
    jumpflix_filmes;

SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa IN (10 , 12);

--                          ! inicio do nome !
SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    nome LIKE 'The%';

--                         ! em qualquer parte !
SELECT 
    *
FROM
    promocao_jumpflix
WHERE
    descricao LIKE '%descontos%';

--                             ! no final !
SELECT 
    *
FROM
    promocao_jumpflix
WHERE
    descricao LIKE '%primavera!';

--                          ! segunda letra f !
SELECT 
    *
FROM
    promocao_jumpflix
WHERE
    titulo LIKE '_f%';

--                          ! terceira letra o !
SELECT 
    *
FROM
    promocao_jumpflix
WHERE
    titulo LIKE '__o%';

SELECT 
    nome,
    classificacao_indicativa,
    'terceira letra r' AS letra_filme,
    tempo
FROM
    jumpflix_filmes
WHERE
    nome LIKE '__r%';

--                     ! entre tais valores !
SELECT 
    *
FROM
    promocao_jumpflix
WHERE
    id_promocao BETWEEN 4 AND 10;

--                     ! entre 10 e 15 (BETWEEN) !
SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa BETWEEN 10 AND 15;

--                     ! nao quero o número 18: !
SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa <> 18;

--             ! nao quero o número 18 (operadores de negação): !
SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa NOT IN (18);

--            ! nao quero o número 18 (operadores de negação): !
SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa != 18;

--            ! idade menor ou igual a 15 e tempo que seja diferente que 60 min: !
SELECT 
    *
FROM
    jumpflix_filmes
WHERE
    classificacao_indicativa <= 15
        AND tempo <> '60 min';

--                        ! ordenar !

SELECT 
    *
FROM
    descricao_promo_jumpflix
ORDER BY valor_desconto;

--                        ! ordenar descrescente!

SELECT 
    *
FROM
    descricao_promo_jumpflix
ORDER BY tipo_desconto , valor_desconto desc;


--                        ! ordenar descrescente!

SELECT 
    *
FROM
    descricao_promo_jumpflix
where ativo = 1
ORDER BY tipo_desconto , valor_desconto desc;

select * from jumpflix_filmes 
order by data_lancamento;