use streaming_jumpflix;

				-- AULA QUARTA-FEIRA (08/05)
                
/* Utilizando a tabela jumpflix_especificacoes:
•Crie uma nova tabela chamada media_aventura. 
Essa tabela deverá conter a média dos votos dos gêneros que contem Aventura 
sendo a média menor que 30 mil. */

drop table if exists media_aventura;

/* CREATE TABLE 
	media_aventura AS SELECT genero, 
	AVG (replace(votos, ',', '')) AS media_votos 
FROM
    jumpflix_especificacoes
WHERE
    genero LIKE '%Aventura%'
GROUP BY genero
HAVING AVG (replace(votos, ',', ''))  < 30000;

select * from media_aventura; */

create table media_aventura as
	select
		genero,
		avg(replace(votos, ',', '')) as media_votos
	from jumpflix_especificacoes
		where genero like '%Aventura%'
		group by genero
		having avg(replace(votos, ',', '')) > 30000;
 
 select * from media_aventura;
 
 /*==============================================================
 
Selecione o nome, classificação indicativa e tempo dos filmes da 
tabela jumpflix_filmes lançados na data mais recente.
 
=================================================================*/

		-- FAZENDO NA MÃO!! 
 
 select * from jumpflix_filmes;
 
 select nome,
	classificacao_indicativa,
	tempo 
	from jumpflix_filmes
		where data_lancamento > '2018-12-31'; 
        
		-- FAZENDO SUB-CONSULTA
        
SELECT 
    nome, 
    classificacao_indicativa, 
    tempo
FROM
    jumpflix_filmes
WHERE
    data_lancamento = (SELECT 
							MAX(data_lancamento) AS maior_data
					   FROM jumpflix_filmes);

 /*==============================================================
 Escreva uma consulta SQL que calcule o total da quantidade de produtos
 vendidos por país para os clientes do serviço de streaming 'Jumpflix',
 agrupando os resultados por país.
 Em seguida, filtre os resultados para exibir apenas os países 
 cujo total de quantidade de produtos vendidos seja inferior à média global
 da quantidade de produtos vendidos por cliente no serviço 'Jumpflix'.

=================================================================*/

SELECT 
	pais,
    SUM(quantidade) as soma
FROM clientes_promo_jumpflix
	group by pais
	having SUM(quantidade) < (select 
								avg(quantidade) from clientes_promo_jumpflix);
		
		