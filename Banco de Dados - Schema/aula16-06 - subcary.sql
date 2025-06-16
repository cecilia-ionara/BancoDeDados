-- TESTANDO FULL JOIN 

(SELECT * 
FROM Produto p 
LEFT JOIN Categoria c 
ON p.idCategoria = c.idCategoria)

UNION 

(SELECT * 
FROM Produto p 
RIGHT JOIN Categoria c 
ON p.idCategoria = c.idCategoria);

-- QUANTOS PRODUTOS TEMOS 
SELECT COUNT(*) 
FROM Produto; 

-- COUNT POR COLUNA 
SELECT COUNT(idCategoria) 
FROM Produto;

DESC Categoria;
INSERT INTO Categoria (idCategoria, nomeCategoria) VALUES (NULL, 'Laticínios');

DESC Produto;
INSERT INTO Produto VALUES (NULL, 'Pão', 10.00, NULL);

SELECT * FROM Categoria;

-- CATEGORIA SEM PRODUTO
SELECT * 
FROM Produto p 
RIGHT JOIN Categoria c 
ON p.idCategoria = c.idCategoria
WHERE p.idProduto IS NULL;

-- PRODUTO SEM CATEGORIA 
SELECT * 
FROM Produto p 
RIGHT JOIN Categoria c 
ON p.idCategoria = c.idCategoria
WHERE p.idCategoria IS NULL;

-- SUBCONSULTA
DESC Funcionario;

SELECT nomeFunc, depto, funcao, salario 
FROM Funcionario 
WHERE salario = (SELECT MAX(Salario)
				FROM Funcionario);

SELECT nomeFunc, funcao, salario
FROM Funcionario 
WHERE salario > ANY (SELECT salario 
					 FROM Funcionario 
                     WHERE funcao = 'Supervisor');