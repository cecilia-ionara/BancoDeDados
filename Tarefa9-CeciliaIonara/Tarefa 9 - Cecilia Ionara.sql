/*a) Lista com todas as pessoas (Tabela Pessoa), ordenadas por data de nascimento
e depois por nome. As colunas que devem estar na consulta são: nome,
sobrenome e dataNascimento.*/

SELECT nome, sobrenome, dataNascimento 
FROM Pessoa
ORDER BY dataNascimento, nome;

/*b) Lista com todas as pessoas (Tabela Pessoa), ordenadas de forma decrescente
pela idade. A idade pode ser calculada através da expressão:
YEAR(CURRENT_DATE()) - YEAR(dataNascimento). As colunas que devem estar
presentes no resultado são: nome, sobrenome e idade.*/

SELECT nome, sobrenome, YEAR(CURRENT_DATE()) - YEAR(dataNascimento) AS idade 
FROM Pessoa;

/*c) Lista com todos os contatos existentes (Tabela Contato), ordenados por email.
As colunas que devem estar presentes no resultado são: telefone e email.*/

SELECT telefone, email
FROM Contato 
ORDER BY email;

/*d) Lista com todos os contatos existentes (Tabela Contato), com telefones
começando com '94', ordenados por telefone. As colunas que devem estar
presentes no resultado são: telefone e email.*/

SELECT telefone, email 
FROM Contato
WHERE telefone LIKE '94%'
ORDER BY telefone;

/*e) Lista de todos as Pessoas (Tabela Pessoa), com seus respectivos contatos de
telefone e email (Tabela Contato), se houverem. Isto é, algumas pessoas não tem
contato cadastrado na Tabela Contato (Observar que tipo de JOIN deve ser
utilizado). As colunas que devem estar presentes no resultado são: nome,
sobrenome, telefone e email.*/

SELECT nome, sobrenome, telefone, email 
FROM Pessoa p
LEFT JOIN Contato c
ON p.idContato = c.idContato; 

/*f) Lista apenas das Pessoas (Tabela Pessoa) que possuem contatos (telefone e
email) cadastrados na Tabela Contato. Isto é, exibir apenas as pessoas que
possuem contato cadastrado (Observar que tipo de JOIN deve ser utilizado). As 
colunas que devem estar presentes no resultado são: nome, sobrenome,
telefone e email.*/

SELECT nome, sobrenome, telefone, email 
FROM Pessoa p
INNER JOIN Contato c 
ON p.idContato = c.idContato;

/*g) Lista de Pessoas (Tabela Pessoa) que possuem contatos (telefone e email)
cadastrados na Tabela Contato e que possuem nascimento entre '2000-01-01' e
'2002-01-01'. As colunas que devem estar presentes no resultado são: nome,
sobrenome, dataNascimento, telefone e email (Observar que tipo de JOIN
utilizar neste caso).*/

SELECT nome, sobrenome, dataNascimento, telefone, email 
FROM Pessoa p
INNER JOIN Contato c
ON p.idContato = c.idContato
WHERE dataNascimento BETWEEN '2000-01-01' AND '2002-01-01';

/*h) Lista de Pessoas (Tabela Pessoa) que possuem contatos (telefone e email)
cadastrados na Tabela Contato e que possuem nascimento entre '2000-01-01' e
'2002-01-01'. As colunas que devem estar presentes no resultado são: nome,
sobrenome, dataNascimento, telefone e email (Observar que tipo de JOIN
utilizar neste caso). Ordernar o resultado pelo nome e depois sobrenome.*/

SELECT nome, sobrenome, dataNascimento, telefone, email 
FROM Pessoa p
INNER JOIN Contato c
ON p.idContato = c.idContato
WHERE dataNascimento BETWEEN '2000-01-01' AND '2002-01-01'
ORDER BY nome, sobrenome;

/*i) Lista com todas as pessoas e seus respectivos endereços completos. As colunas
que devem estar presentes no resultado são: nome, sobrenome, rua, cidade,
estado e cep. Dica: Todas as pessoas possuem endereço cadastrado na Tabela
Endereço?*/

SELECT nome, sobrenome, rua, cidade, estado, cep 
FROM Pessoa p
LEFT JOIN Endereco e
ON p.idPessoa = e.idPessoa;

/*j) Lista com o total de pessoas agrupadas por cidade (GROUP BY cidade). As colunas
que devem estar presentes no resultado são: cidade e total. DICA: Usar o
operador COUNT(*).*/

SELECT cidade, COUNT(*) AS total 
FROM Pessoa p 
INNER JOIN Endereco e 
ON p.idPessoa = e.idPessoa
GROUP BY cidade;

/*k) Lista com todas as pessoas e seus respectivos endereços completos e que moram
em 'Belém' ou 'São Paulo'. As colunas que devem estar presentes no resultado
são: nome, sobrenome, rua, cidade, estado e cep. Dica: Utilizar cláusula WHERE.*/

SELECT nome, sobrenome, rua, cidade, estado, cep 
FROM Pessoa p 
INNER JOIN Endereco e 
ON p.idPessoa = e.idPessoa
WHERE cidade LIKE 'Belém' OR cidade LIKE 'São Paulo';

/*l) Lista com o total de pessoas agrupadas por cidade no estado 'PA' (GROUP BY
cidade). As colunas que devem estar presentes no resultado são: cidade e total.
DICA: Usar operadores COUNT(*) e WHERE.*/

SELECT cidade, COUNT(*) AS total 
FROM Pessoa p 
INNER JOIN Endereco e 
ON p.idPessoa = e.idPessoa
WHERE estado LIKE 'PA'
GROUP BY cidade;

/*m) Lista com o nome, a idade e a cidade de uma pessoa. As colunas que devem estar
presentes no resultado são: nome, idade e cidade. A idade pode ser calculada
através da expressão: YEAR(CURRENT_DATE()) - YEAR(dataNascimento). DICA
para o JOIN: Todas as pessoas tem endereço cadastrado na Tabela Endereço?*/

SELECT nome, YEAR(CURRENT_DATE()) - YEAR(dataNascimento) AS idade , cidade 
FROM Pessoa p 
LEFT JOIN Endereco e
ON p.idPessoa = e.idPessoa;

/*n) Lista com a idade da pessoa mais velha por cidade (GROUP BY cidade). As colunas
que devem estar presentes no resultado são: maior_idade e cidade. A idade
pode ser calculada através da expressão: YEAR(CURRENT_DATE()) -
YEAR(dataNascimento). DICA: Usar o operador MAX().*/
SELECT MAX(YEAR(CURRENT_DATE()) - YEAR(dataNascimento)) AS maior_idade, cidade  
FROM Pessoa p 
INNER JOIN Endereco e 
ON p.idPessoa = e.idPessoa
GROUP BY cidade;

/*o) Lista com o nome, a idade da pessoa e o estado. As colunas que devem estar
presentes no resultado são: nome, idade e estado. A idade pode ser calculada
através da expressão: YEAR(CURRENT_DATE()) - YEAR(dataNascimento).
Ordenar por nome, e depois por idade.*/

SELECT nome, YEAR(CURRENT_DATE()) - YEAR(dataNascimento) AS idade, estado
FROM Pessoa p 
INNER JOIN Endereco e 
ON p.idPessoa = e.idPessoa
ORDER BY nome, idade;

/*p) Lista com a idade da pessoa mais nova, agrupada por estado (GROUP BY estado).
As colunas que devem estar presentes no resultado são: menor_idade e estado.
A idade pode ser calculada através da expressão: YEAR(CURRENT_DATE()) -
YEAR(dataNascimento). DICA: Usar o operador MIN().*/

SELECT MIN(YEAR(CURRENT_DATE()) - YEAR(dataNascimento)) AS menor_idade, estado 
FROM Pessoa p 
INNER JOIN Endereco e 
ON p.idPessoa = e.idPessoa
GROUP BY estado; 
