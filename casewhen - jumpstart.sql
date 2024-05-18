drop schema if exists dados_pokemon;
create schema dados_pokemon;

use dados_pokemon;

create table tabela_pokemon (
number int primary key,
name varchar(100),
type1 varchar(20),
type2 varchar(20),
total varchar(100),
hp varchar(100),
attack varchar(100),
defense varchar(100),
sp_attack varchar(100),
sp_defense varchar(100),
speed varchar(100),
generation char(10),
legendary TEXT
);


SELECT 
    *
FROM
    tabela_pokemon;
    
-- row number () or ()

-- exercicio 16
-- nao possuem dados desnecessários    

select * from tabela_pokemon;


SELECT
 name, 
    count(*)
FROM
    tabela_pokemon
GROUP BY  name
having count(*) > 1 ;

select distinct
count(type2) as espaco_vazio
 from tabela_pokemon
 where type2 = "";
 
/* tratar a coluna type1:

	Fire = Fogo

    Water = Água*/

SELECT 
    type1,
    CASE
        WHEN type1 = 'Water' THEN 'Água'
        WHEN type1 = 'Fire' THEN 'Fogo'
    END AS type1
FROM
    tabela_pokemon;

















    
    
    
    
    
    
    
    
    