				-- AULA 09/05 --

use streaming_jumpflix;

/*Escreva uma consulta SQL que retorna o código promocional 
e o total de valor por promoção com o nome 'total_promocao' 
para todas as promoções em que o valor total seja igual
 ou superior à média dos valores de desconto  das promoções ativas
 e não ativas que sejam de 2024.
 Utilize as tabelas clientes_promo_jumpflix e descricao_promo_jumpflix */
 
SELECT 
    *
FROM
    clientes_promo_jumpflix;
    
SELECT 
    *
FROM
    descricao_promo_jumpflix;
    
select 
	codigo_promocional,
	sum(valor) as total_promocao 
from clientes_promo_jumpflix
	group by codigo_promocional
    having sum(valor) >= (select 
							avg(valor_desconto)
						  from descricao_promo_jumpflix
								where codigo_promocional like '%2024%'
									and tipo_desconto = 'valor_fixo');


/* Pensando na otimização da query, faça uma consulta na tabela 'jumpflix_filmes'.
 A consulta deverá ser feita nesta tabela reduzida, 
 tendo todas as colunas, porém filtrando apenas os filmes com duração de uma hora.
 Nesta tabela reduzida, faça a consulta do nome e da data de lançamento
 e crie uma coluna chamada 'menor_maior_idade', onde serão tratadas as idades. 
 Caso tenha menos de 18 anos, será considerado menor de idade;
 caso contrário, será considerado maior de idade.*/


SELECT 
    nome,
    data_lancamento,
    CASE
        WHEN classificacao_indicativa < 18 THEN 'menor de idade'
        ELSE 'maior de idade'
    END AS menor_maior_idade
FROM (SELECT 
        *
	  FROM jumpflix_filmes
		WHERE tempo = '60 min') AS temporaria;
    

SELECT 
    *
FROM
    jumpflix_filmes
     WHERE tempo = '60 min';



