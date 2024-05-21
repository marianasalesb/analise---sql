DROP SCHEMA IF EXISTS PKM;
CREATE SCHEMA PKM;
USE PKM;

CREATE TABLE tabela_pokemon (
	number int not null,
	name varchar(255),
	type1 varchar(100),
	type2 varchar(100),
	total int,
	hp int,
	attack int,
	defense int,
	sp_attack int,
	sp_defense int,
	speed int,
	generation int,
	legendary varchar(50)
);

 
-- Exercício 16:
-- A Tabela Pokémon possui dados duplicados desnecessários?
-- Existem inconsistências nos dados, como nomes fora do lugar ou sem coerência 
-- com o nome da coluna, espaços nulos ou vazios, etc?
-- Identificou algo para corrigir? Qual solução encontrou?
-- Com os dados presentes na tabela Pokémon, demonstre um levantamento com uma análise nos dados.

select
	number,
    row_number() over (partition by number order by total) as nivel,
    name,
    total
from tabela_pokemon;

-- verificando vazio
select 
	*
from tabela_pokemon
	where type2 = '';

-- tratando vazios
select 
	name,
    type1,
    CASE
		WHEN type2 = '' then 'Normal'
        else type2
	end as type2
from tabela_pokemon;


/* tratar a coluna type1:
	Fire = Fogo
    Water = Água*/
    
select 
	type1,
    case
		when type1 = 'Fire' then 'Fogo'
        when type1 = 'Water' then 'Água'
        else type1
	 end as type1_novo
from tabela_pokemon;
    
