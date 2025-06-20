/*a) Consulta que retorne uma lista de tutores que possuem animais. As colunas
presentes no resultado são: nome e telefone do tutor. Ordene o resultado pelo
nome do tutor.*/

SELECT DISTINCT t.nome, t.telefone 
FROM Tutor t
INNER JOIN Animal a
ON t.idTutor = a.idTutor
ORDER BY t.nome;

/*b) Consulta que retorne uma lista de tutores que possuem animais, com o
respectivo quantitativo de animais. As colunas presentes no resultado são:
nome do tutor e total de animais.*/

SELECT t.nome, COUNT(*) AS total_animais
FROM Tutor t 
INNER JOIN Animal a 
ON t.idTutor = a.idTutor
GROUP BY t.idTutor;

/*c) Consulta que retorne uma lista com os tutores que não possuem animais
cadastrados no banco de dados. As colunas presentes no resultado são: nome
e telefone do tutor. Ordene o resultado pelo nome do tutor.*/
SELECT t.nome, t.telefone 
FROM Tutor t
LEFT JOIN Animal a 
ON t.idTutor = a.idTutor
WHERE a.idAnimal IS NULL
ORDER BY t.nome; 

/*d) Consulta que devolve o nome e a idade do animal mais pesado (maior peso)
nascido depois de 2018. */
SELECT nome, YEAR(CURRENT_DATE()) - anoNascimento AS idade 
FROM Animal 
WHERE peso = (SELECT MAX(peso) FROM Animal
			  WHERE anoNascimento > 2018); 
      
/*e) Consulta que retorne uma lista com os pesos dos animais com o maior peso
por cor de pelagem do animal. As colunas que devem estar presentes no
resultado são: cor, max_peso. Ordene o resultado pela cor do animal, de modo
descendente.*/
SELECT cor, MAX(peso) 
FROM Animal 
GROUP BY cor 
ORDER BY cor DESC;

/*f) Consulta que retorne o nome, o peso e a cor do animal mais novo. As colunas
presentes no resultado são nome, peso e cor do animal. Ordene o resultado
pelo peso do animal.*/
SELECT nome, peso, cor 
FROM Animal 
WHERE anoNascimento = (SELECT MAX(anoNascimento) FROM Animal)
ORDER BY peso;

/*g) Consulta que retorne uma lista com a quantidade de animais que nasceram
por ano. As colunas presentes no resultado são: anoNascimento e total.
Ordene o resultado pelo anoNascimento.*/
SELECT anoNascimento, COUNT(*) AS total 
FROM Animal 
GROUP BY anoNascimento
ORDER BY anoNascimento;

/*h) Consulta que retorne nome do tutor, nome e cor do animal cuja raça seja
Maine Coon ou Siames. Ordene o resultado pelo nome do tutor.*/
SELECT t.nome, a.nome, a.cor 
FROM Tutor t
INNER JOIN Animal a
ON t.idTutor = a.idTutor
WHERE a.raca LIKE 'Maine Coon' 
	  OR a.raca LIKE 'Siames'
ORDER BY t.nome;

/*i) Consulta que devolve a lista de tutores cujos respectivos animais não possuam
chips de identificação. As colunas presentes no resultado são: nome e telefone
do tutor, bem como nome e idade do animal. Ordene o resultado pelo nome
do tutor e depois pelo nome do animal.*/
SELECT t.nome, t.telefone, a.nome, 
	    YEAR(CURRENT_DATE()) - anoNascimento AS idade  
FROM Tutor t
INNER JOIN Animal a 
ON t.idTutor = a.idTutor 
WHERE a.idChip IS NULL
ORDER BY t.nome, a.nome;

/*j) Consulta que devolve a lista de tutores cujos respectivos animais não possuem
chip de identificação. As colunas presentes no resultado são o nome do tutor
e o total de animais que não possuem chip para cada tutor. Ordene o resultado
pelo total de animais sem chip*/
SELECT t.nome, COUNT(*) AS quantidade
FROM Tutor t
INNER JOIN Animal a 
ON t.idTutor = a.idTutor 
WHERE a.idChip IS NULL
GROUP BY t.nome
ORDER BY quantidade;

/*k) Consulta que retorne a lista com os animais cujos chips de identificação
tenham sido aplicados entre 01/01/2015 e 31/12/2023. As colunas presentes
no resultado são: O nome do tutor, o nome do animal, o código e a data de
aplicação do chip.*/
SELECT t.nome, a.nome, c.codigoChip, c.dataAplicacao 
FROM Tutor t
INNER JOIN Animal a 
ON t.idTutor = a.idTutor 
INNER JOIN ChipIdentificacao c
ON a.idChip = c.idChip
WHERE c.dataAplicacao BETWEEN '2015-01-01' AND '2023-12-31';

/*l) Consulta que devolve a lista de tutores cujos respectivos animais possuem chip
de identificação. As colunas presentes no resultado são o nome do tutor e o
total de animais que possuem chip para cada tutor. Ordene o resultado
pelo nome do tutor.*/
SELECT t.nome, COUNT(*) AS quantidade
FROM Tutor t
INNER JOIN Animal a 
ON t.idTutor = a.idTutor 
WHERE a.idChip IS NOT NULL
GROUP BY t.nome
ORDER BY t.nome;

/*m) Consulta que retorne a lista de animais e seus respectivos códigos de
identificação do chip (se possuírem), para animais da raça Rottweiler ou
Golden Retriever. As colunas presentes no resultado são nome, peso e raça do
animal, e o código do chip de identificação (se possuírem).*/
SELECT a.nome, a.peso, a.raca, c.codigoChip 
FROM Animal a
LEFT JOIN ChipIdentificacao c 
ON a.idChip = c.idChip
WHERE a.raca LIKE 'Rottweiler'
	  OR a.raca LIKE 'Golden Retriever';

/*n) Consulta que devolve o nome e o código do chip de identificação com o maior
peso de animal da raça siames.*/
SELECT a.nome, c.codigoChip 
FROM Animal a 
INNER JOIN ChipIdentificacao c 
ON a.idChip = c.idChip
WHERE a.peso = (SELECT MAX(peso) FROM Animal 
				WHERE raca LIKE 'Siames')
	  AND raca LIKE 'Siames';
                