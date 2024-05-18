use streaming_jumpflix;

						-- AULA DO DIA 29/04 - SEGUNDA-FEIRA


SELECT 
    SUM(quantidade) AS qnt_soma, AVG(quantidade) AS media
FROM
    clientes_promo_jumpflix;
 
 
 
 SELECT 
    COUNT(pontuacao) AS total
FROM
    jumpflix_especificacoes
WHERE
    pontuacao = 8;
    
    
    select * from clientes_promo_jumpflix;
    
SELECT 
    SUM(quantidade)
FROM
    clientes_promo_jumpflix
WHERE
    codigo_promocional like '%2024';
    

SELECT 
    COUNT(DISTINCT pais)
FROM
    clientes_promo_jumpflix;


SELECT 
    AVG(votos), SUM(votos)
FROM
    jumpflix_especificacoes
WHERE
    genero LIKE '%Ação%';
    
------------------------------------------
-- teste
select year('2024-12-03') as teste;


-- extrair e ordenar

SELECT 
    titulo,
    descricao,
    MONTH(data_fim) AS mes,
    YEAR(data_fim) AS ano
FROM
    promocao_jumpflix
ORDER BY ano , mes;

