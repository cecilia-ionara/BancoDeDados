/*Questão 01: Consulta que retorne nome e sobrenome do aluno(a) e nome da disciplina
que tenham cursado com resultado aprovado (Regular, Bom ou Excelente), e, cujo
conceito foi lançado entre '2019' e '2021'. Usar a função YEAR(dataConceito) para obter
apenas o ano de um campo DATETIME.*/

SELECT a.nome, a.sobrenome, d.nome  
FROM Aluno a 
INNER JOIN Aluno_Disciplina ad
	ON a.matriculaAluno = ad.matriculaAluno
INNER JOIN Disciplina d 
	ON d.idDisciplina = ad.idDisciplina
WHERE (ad.conceito LIKE 'Regular'
	  OR ad.conceito LIKE 'Bom'
      OR ad.conceito LIKE 'Excelente')
      AND YEAR(dataConceito) BETWEEN '2019' AND '2021'; 

/*Questão 02: Consulta que retorne o total de alunos que obtiveram um determinado
conceito, para alunos que cursam 'Sistemas de Informação', fizeram 'Banco de Dados I'
ou 'Banco de Dados II' na Faculdade de nome 'Faculdade de Sistemas de Informação'. A
consulta deverá ter a seguinte saída:*/
SELECT d.nome, ad.conceito, COUNT(*) AS Total 
FROM Aluno a 
INNER JOIN Aluno_Disciplina ad
	ON a.matriculaAluno = ad.matriculaAluno
INNER JOIN Disciplina d 
	ON d.idDisciplina = ad.idDisciplina 
INNER JOIN Curso c 
	ON d.idCurso = c.idCurso
INNER JOIN Faculdade f 
	ON f.idFaculdade = c.idFaculdade
WHERE 
    c.nomeCurso LIKE 'Sistemas de Informação'
    AND f.nome LIKE 'Faculdade de Sistemas de Informação'
    AND d.nome IN ('Banco de Dados I', 'Banco de Dados II')
GROUP BY 
    d.nome, ad.conceito;
    
/*Questão 03: Consulta que retorne o nome e sobrenome do aluno(a) e a nota da
disciplina de 'Banco de Dados I' para o aluno(a) que tenha obtido a maior nota,
agrupados pelos Cursos de 'Sistemas de Informação' e 'Engenharia da Computação'. A
consulta deverá ter a seguinte saída:*/
SELECT a.nome, a.sobrenome, c.nomeCurso, ad.nota
FROM Aluno a 
INNER JOIN Aluno_Disciplina ad
	ON a.matriculaAluno = ad.matriculaAluno
INNER JOIN Disciplina d 
	ON d.idDisciplina = ad.idDisciplina 
INNER JOIN Curso c 
	ON d.idCurso = c.idCurso
WHERE (
        c.nomeCurso LIKE 'Sistemas de Informação'
        OR c.nomeCurso LIKE 'Engenharia da Computação'
    )
    AND d.nome LIKE 'Banco de Dados I'
    AND ad.nota = (
        SELECT MAX(nota) 
        FROM Aluno_Disciplina
        WHERE idDisciplina = (
            SELECT idDisciplina 
            FROM Disciplina
            WHERE nome LIKE 'Banco de Dados I'
        )
    )
ORDER BY c.nomeCurso;
-- professor fez com dois select usando inner join 
-- corrigir para que filtre a maior nota de engenha e maior nota de sistemas, do jeito que eu fiz pega apenas a maior dos dois 


/*Questão 04: Todos alunos já cursaram disciplinas? Escreva uma consulta que retorne
uma lista de alunos, com o total de disciplinas que cada um cursou e a nota média obtida
por cada aluno nestas disciplinas.*/
SELECT a.nome, a.sobrenome,
    COUNT(ad.idDisciplina) AS total_disciplinas,
    AVG(ad.nota) AS media_nota
FROM Aluno a
LEFT JOIN Aluno_Disciplina ad 
	ON a.matriculaAluno = ad.matriculaAluno
GROUP BY 
    a.nome, a.sobrenome;
    
/*Questão 05: Consulta que retorne a carga horária das disciplinas de cada uma das
faculdades do ‘Campus Universitário de Marabá’, e que estejam acima de 150 horas. As
colunas presentes no resultado são nome da Faculdade, e a carga horária total das
disciplinas da faculdade.*/
SELECT f.nome,
    SUM(d.cargaHoraria) AS carga_horaria_total
FROM Disciplina d
INNER JOIN Curso c 
	ON d.idCurso = c.idCurso
INNER JOIN Faculdade f 
	ON c.idFaculdade = f.idFaculdade
INNER JOIN Campus cp 
	ON f.idCampus = cp.idCampus
WHERE cp.nome = 'Campus Universitário de Marabá'
GROUP BY f.nome
HAVING SUM(d.cargaHoraria) > 150;
