USE `a202440602003`; 

SHOW TABLES;

DESC Categoria;

INSERT INTO Categoria(idCategoria, nomeCategoria)
VALUES (8, 'Higiene Pessoal');

INSERT INTO Categoria(idCategoria, nomeCategoria)
VALUES (9, 'Bebidas');

INSERT INTO Categoria(idCategoria, nomeCategoria)
VALUES (10, 'Açougue');

-- ESTA CONSULTA DEVOLVE O NUMERO DE CATEGORIAS
SELECT COUNT(*) FROM Categoria;

-- ESTA CONSULTA RENOMEIA O COUNT PRA QUANTIDADE
SELECT COUNT(*) AS quantidade FROM Categoria;

-- FILTRANDO O NOME DAS CATEGORIAS EM ORDEM ALFABETICA (A - Z) 
SELECT nomeCategoria 
FROM Categoria as c 
ORDER BY c.nomeCategoria;


-- FILTRANDO O NOME DAS CATEGORIAS EM ORDEM ALFABETICA INVERTIDA (Z - A)
SELECT nomeCategoria 
FROM Categoria as c 
ORDER BY c.nomeCategoria DESC;

-- FILTRANDO O NOME DAS CATEGORIAS EM ORDEM ALFABETICA INVERTIDA (Z - A)
SELECT * FROM Categoria 
WHERE nomeCategoria LIKE ('%a%') or nomeCategoria LIKE('%b%');

INSERT INTO Produto VALUES(3, 'Refrigerante 1L', 2.99, 7);
INSERT INTO Produto VALUES(4, 'Refrigerante 2L', 9.99, 7);

-- TESTE PRODUTOS COM VALOR ENTRE 10 E 15 
SELECT * FROM Produto 
WHERE precoProduto BETWEEN 1.00 AND 15.00
AND Categoria_idCategoria = 7;

-- OUTRA FORMA 
SELECT * FROM Produto 
WHERE precoProduto BETWEEN 1.00 AND 15.00
AND Categoria_idCategoria IN (4,5,6,7);





