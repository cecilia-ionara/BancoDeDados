SELECT * FROM Produto;

SELECT * FROM Categoria;

-- MEDIA - ROUND deixa em duas casas decimais
SELECT ROUND(AVG(precoProduto),2) AS media 
FROM Produto;
 
-- SOMA 
SELECT ROUND(AVG(precoProduto),2) AS soma
FROM Produto;

-- MINIMO 
SELECT MIN(precoProduto) AS menor 
FROM Produto;

-- MAXIMO 
SELECT MAX(precoProduto) AS maximo 
FROM Produto;

-- ATIVIDADE 
/*1. Calcule o valor médio dos produtos de cada categoria*/
SELECT Categoria_idCategoria, AVG(precoProduto) AS media
FROM Produto 
GROUP BY Categoria_idCategoria;

/*2. Liste o produto mais barato e o produto mais caro de cada
categoria.*/
SELECT Categoria_idCategoria, MIN(precoProduto) AS min, MAX(precoProduto) AS max
FROM Produto 
GROUP BY Categoria_idCategoria;

/*3. Calcule o valor médio dos produtos das categorias 1 e 2.*/
SELECT Categoria_idCategoria, ROUND(AVG(precoProduto),2) AS media
FROM Produto
WHERE Categoria_idCategoria IN (1,2)
GROUP BY Categoria_idCategoria;

/*4. Liste as categorias onde o preço médio dos produtos seja
maior que 500.*/
SELECT Categoria_idCategoria, ROUND(AVG(precoProduto),2) AS media 
FROM Produto 
GROUP BY Categoria_idCategoria
HAVING media > 500;

/*5. Liste as categorias que possuem mais de 5 produtos
cadastrados.*/
SELECT Categoria_idCategoria
FROM Produto 
GROUP BY Categoria_idCategoria 
HAVING COUNT(*) > 5; 

#nenhum tem mais de 5 

/*6. Calcule a média dos preços apenas dos produtos que sejam das categorias
de Livros de História ou Matemática.*/
SELECT Categoria_idCategoria, nomeProduto, ROUND(AVG(precoProduto),2) 
FROM Produto 
GROUP BY Categoria_idCategoria, nomeProduto
HAVING nomeProduto = 'Livro de História' OR nomeProduto = 'Livro de Matemática';

/*7. Liste as categorias em que o produto mais caro custa mais de R$ 1000.*/
SELECT Categoria_idCategoria, MAX(precoProduto) AS maximo
FROM Produto 
GROUP BY Categoria_idCategoria
HAVING maximo > 1000;

/*8. Exiba a média de preço dos produtos agrupados por categoria, mas
mostre apenas as categorias cuja média seja entre R$ 100 e R$ 300.*/
SELECT Categoria_idCategoria, ROUND(AVG(precoProduto),2) AS media
FROM Produto
GROUP BY Categoria_idCategoria
HAVING media BETWEEN 100 AND 300;

