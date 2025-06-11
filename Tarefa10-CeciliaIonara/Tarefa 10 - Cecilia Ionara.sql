/*a) Lista com todos os animais e seus respectivos chips de identificação (se
possuírem). Isto é, lembre-se que nem todo animal possui chip de
identificação, então a listagem requerida deve listar todos os animais
existentes no banco de dados, e caso possuam chip de identificação mostrar
os respectivos dados, e em caso negativo mostrar valores “NULL”. Assim,
observar que tipo de JOIN deve ser utilizado neste caso. As colunas presentes
no resultado são: nome do animal, peso, cor, anoNascimento, codigoChip e
dataAplicacao.*/

SELECT a.nome, a.peso, a.cor, a.anoNascimento, c.codigoChip, c.dataAplicacao 
FROM Animal a
LEFT JOIN ChipIdentificacao c
ON a.idChip = c.idChip
ORDER BY a.nome; 

/*b) Lista apenas dos animais (Tabela “Animal”) que possuem chip de identificação
(Tabela “ChipIdentificação”). Isto é, nem todo animal possui chip de
identificação. Observe o melhor tipo de JOIN a ser utilizado neste caso. As
colunas presentes no resultado são: nome do animal, peso, cor,
anoNascimento, codigoChip e dataAplicacao.*/

SELECT a.nome, a.peso, a.cor, a.anoNascimento, c.codigoChip, c.dataAplicacao
FROM Animal a
INNER JOIN ChipIdentificacao c 
ON a.idChip = c.idChip
ORDER BY a.nome; 

/*c) Lista com todos os tutores e quantidade total de animais tutelados pelo tutor.
As colunas presentes no resultado são: nome (tutor) e quantidade.*/

SELECT t.nome, COUNT(*) AS quantidade 
FROM Tutor t 
INNER JOIN Animal a
ON t.idTutor = a.idTutor
GROUP BY t.nome;

/*d) Lista com todos os tutores e quantidade total de animais tutelados pelo tutor,
e, que possuem mais do que 03 animais tutelados. Ordenar o resultado pelo
total de animais. As colunas presentes no resultado são: nome (tutor) e
quantidade. Dica: Usar JOIN, GROUP BY, HAVING e COUNT().*/

SELECT t.nome, COUNT(*) AS quantidade 
FROM Tutor t 
INNER JOIN Animal a
ON t.idTutor = a.idTutor
GROUP BY t.nome
HAVING quantidade > 3
ORDER BY quantidade;
-- não tem ninguem

/*e) Consulta que devolve o nome, a idade e o peso do animal mais velho, cuja raça
seja ‘Siamês’.*/
SELECT nome, YEAR(CURDATE()) - anoNascimento AS idade, peso
FROM Animal 
WHERE raca LIKE 'Siamês' AND 
	  anoNascimento = (SELECT MIN(anoNascimento)
						FROM Animal
                        WHERE raca = 'Siamês');

/*f) Consulta que retorne o menor peso por raça. As colunas presentes no
resultado são raça e peso.*/
SELECT raca, MIN(peso) 
FROM Animal 
GROUP BY raca; 

/*g) Consulta que devolve a lista de animais que possuem peso maior que todos os
pesos de animais da raça ‘Maine Coon’.*/
SELECT *
FROM Animal
WHERE peso > ALL (SELECT peso FROM Animal WHERE raca = 'Maine Coon');

/*h) Consulta que devolve a lista de animais (se existir algum) que possuem peso
menor que algum animal da raça ‘Chihuahua’.*/

SELECT *
FROM Animal
WHERE peso < ALL(SELECT peso FROM Animal WHERE raca = 'Chihuahua’.')