				-- AULA DO DIA 11 DE MAIO - SÁBADO
                
/*==============================================================
		Funções para pesquisar:
	 - Coalesce 
 
=================================================================*/

use streaming_jumpflix;

CREATE OR REPLACE VIEW tabela_teste AS
	SELECT 
		*,
		CASE
			WHEN classificacao_indicativa < 18 THEN 'MENOR_IDADE'
			ELSE 'MAIOR_IDADE'
		END AS teste
	FROM
		jumpflix_filmes;
 
SELECT 
    *
FROM
    tabela_teste
WHERE
    teste = 'MENOR_IDADE';

	-- não dá para filtrar uma coluna que não existe.
	-- or replace modifica a tabela - view criada.

/* Crie uma view com o nome datas_promocoes utilizando
a tabela promocao_jumpflix. Selecione todas as colunas
da tabela e crie mais três colunas dia, mes e ano
da data de início. */

CREATE OR REPLACE VIEW datas_promocoes AS
    SELECT 
        *,
        DAY(data_inicio) AS DIA,
        MONTH(data_inicio) AS MES,
        YEAR(data_inicio) AS ANO
    FROM promocao_jumpflix;
	
SELECT 
    *
FROM datas_promocoes;

/* Crie uma view promocoes com a coluna titulo
 e cria uma coluna tipo_promocao verificando a coluna titulo.
 Se tiver a palavra Promoção então na nova coluna virá
 Promoção e caso na coluna titulo tenha a palavra Oferta
 então na nova coluna virá Oferta. 
 Caso contrário escreva Definir. */
 
 CREATE VIEW promocoes AS
    SELECT 
        titulo,
        CASE
            WHEN titulo LIKE '%Promoção%' THEN 'Promoção'
            WHEN titulo LIKE '%Oferta%' THEN 'Oferta'
            ELSE 'Definir'
        END AS tipo_promocao
    FROM
        promocao_jumpflix;
    
SELECT 
    *
FROM
    promocoes;

/* Coloque em uma única consultas os códigos promocionais
das tabelas clientes_promo_jumpflix e
descricao_promo_jumpflix
*/

SELECT 
    codigo_promocional
FROM
    clientes_promo_jumpflix 
UNION ALL 
SELECT 
    codigo_promocional
FROM
    descricao_promo_jumpflix;
    
/* Crie duas tabelas temporárias utilizando a tabela clientes_promo_jumpflix.
 A primeira deverá ter todas as colunas, limitadas a 5 linhas, 
 sendo ordenadas em ordem decrescente a coluna quantidade, com o nome clientes_promo_top5. 
 A segunda tabela terá a mesma estrutura; entretanto, 
 será ordenada em ordem crescente, também limitada a cinco registros, 
 com o nome clientes_promo_menos5. Com as duas tabelas temporárias criadas,
 faça o UNION ALL.*/
    
-- View One: 
CREATE VIEW clientes_promo_top5 AS
    SELECT 
        *
    FROM
        clientes_promo_jumpflix
    ORDER BY quantidade DESC
    LIMIT 5;

-- View Two:
CREATE VIEW clientes_promo_menos5 AS
    SELECT 
        *
    FROM
        clientes_promo_jumpflix
    ORDER BY quantidade ASC
    LIMIT 5;

SELECT 
    *
FROM clientes_promo_top5 
UNION ALL 
SELECT 
    *
FROM clientes_promo_menos5;

    
    
    
    
