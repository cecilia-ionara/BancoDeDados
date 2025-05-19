SELECT * FROM Animal;

SELECT * FROM Chip;

SELECT * FROM Produto;

SELECT * FROM Tutor;

-- a) SELECT que obtém uma lista com todos os tutores (Tabela Tutor), ordenados por
-- nome e depois por email. As colunas que devem estar na consulta são estas:
-- nome, email e telefone.

SELECT nome, telefone, email FROM Tutor
ORDER BY nome, email;

-- b) SELECT que obtém uma lista com todos os tutores (Tabela Tutor) que possuem
-- telefones começando com ‘94’, ordenados por nome e depois telefone. As
-- colunas que devem estar presentes no resultado são apenas: nome e telefone.

SELECT nome, telefone FROM Tutor
WHERE telefone LIKE ('94%')
ORDER BY nome, telefone; 

-- c) SELECT que obtém uma lista com todos os tutores (Tabela Tutor) que possuem
-- telefones começando com ‘94’, e que possuam o endereço de email com o sufixo
-- “@unifesspa.edu.br”, ordenados por nome e depois e-mail. As colunas que
-- devem estar presentes no resultado são apenas: nome e telefone.

INSERT INTO Tutor VALUES (91, 'Hugo', '94-38908344', 'hugo@unifesspa.edu.br');

SELECT nome, email FROM Tutor 
WHERE telefone LIKE ('94%') and email LIKE ('%@unifesspa.edu.br')
ORDER BY nome, email;

/* d) SELECT que obtém uma lista com todos os animais (Tabela Animal), ordenados
 de forma decrescente pela idade. A idade do animal pode ser calculada através
 da expressão YEAR(CURRENT_DATE()) - anoNascimento. As colunas que devem
 estar presentes no resultado são: nome, peso, cor e idade.
*/
SELECT nome, peso, cor, YEAR(CURRENT_DATE()) - anoNascimento as idade FROM Animal
ORDER BY idade DESC;

-- e) SELECT que obtém uma lista com todos os animais (Tabela Animal) cujo peso seja
-- acima de 5.0kg e que possuam ano de nascimento entre 2017 e 2020. As colunas
-- que devem estar no resultado da consulta são: nome, peso e anoNascimento.
SELECT nome, peso, anoNascimento FROM Animal
WHERE peso > 5.0 and anoNascimento BETWEEN 2017 and 2020;

-- f) SELECT que obtém uma lista com todos os animais (Tabela Animal) cujo peso seja
-- acima de 5.0kg e que possuam ano de nascimento entre 2017 e 2020, e que não
-- possuam chip de identificação. As colunas que devem estar no resultado da
-- consulta são: nome, peso, cor e anoNascimento.
SELECT nome, peso, cor, anoNascimento FROM Animal 
WHERE peso > 5.0 AND anoNascimento BETWEEN 2017 AND 2020 
AND IdChip IS NULL;

-- g) SELECT que obtém uma lista de animais do tipo “Gato” (‘G’), cuja cor da pelagem
-- seja “cinza” ou “amarela” e que possuam peso entre 3.0 e 5.0 kg. Use
-- obrigatoriamente a cláusula BETWEEN. Ordene o resultado de maneira
-- decrescente, pelo peso do animal. As colunas presentes no resultado são:
-- idAnimal, nomeAnimal e peso.
SELECT idAnimal, nome, peso FROM Animal
WHERE tipoAnimal = ('G') AND
	(peso BETWEEN 3.0 AND 5.0) AND
	(cor = 'Cinza' OR cor = 'Amarelo')
ORDER BY peso DESC;

/*
h) SELECT que obtém uma lista de animais que não são do tipo “GATO” (‘G’), que
possuem peso acima de 1.0kg e que possuam chip de identificação. As colunas
que devem estar no resultado da consulta são: nome, peso, tipoAnimal, cor e
anoNascimento.
*/

SELECT nome, peso, tipoAnimal, cor, anoNascimento FROM Animal
WHERE tipoAnimal != 'G'AND 
	(peso > 1) AND 
	(idChip IS NOT NULL);

/*
i) SELECT que obtém uma lista de quantos animais temos na Tabela Animal. A única
coluna presente no resultado deverá ser “quantidade”.
*/
SELECT COUNT(*) AS quantidade FROM Animal;

/*
j) SELECT que obtém uma lista de quantos animais temos na Tabela Animal que
são do tipo Gato (‘G’). A única coluna presente no resultado deverá ser
“quantidade”.
*/
SELECT COUNT(*) AS quantidade FROM Animal
WHERE tipoAnimal = 'G';	

/*
k) SELECT que obtém uma lista de quantos animais temos na Tabela Animal que
são do tipo Cão (‘C’) ou outros (‘O’). A única coluna presente no resultado deverá
ser “quantidade”.
*/
SELECT COUNT(*) AS quantidade FROM Animal
	WHERE tipoAnimal = 'C' 
    OR tipoAnimal = 'O';
    
/*l) SELECT que obtém uma lista de quantos animais temos na Tabela Animal que
são tipo Gato (‘G’) ou do tipo outros (‘O’) e que não possuam chip de
identificação. A única coluna presente no resultado deverá ser “quantidade”.*/
SELECT COUNT(*) AS quantidade FROM Animal
WHERE (tipoAnimal = 'G' OR
	tipoAnimal = 'O') AND
    idChip IS NULL;
    
/*
m) SELECT que obtém uma lista de chips de identificação que foram aplicados entre
‘2010-10-12’ e ‘2021-11-02’, ordenados pelo código do chip (codigoChip). As
colunas presentes no resultado são códigoChip e dataAplicacao.
*/
SELECT codigoChip, dataAplicacao FROM Chip
WHERE dataAplicacao BETWEEN '2010-10-12' AND '2021-11-02'
ORDER BY codigoChip;
