INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (1, 'Limpeza');
 INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (2, 'Cosmeticos');
INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (3, 'Massas');
INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (4, 'Molhos');
INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (5, 'Temperos');
INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (6, 'Higiene');
INSERT INTO Categoria(idCategoria, nomeCategoria) VALUES (8, 'Frios');
 
SELECT * FROM Categoria;

INSERT INTO Produto(idProduto, nomeProduto, precoProduto, Categoria_idCategoria) VALUES (1, 'Macarrão', 2.99, 3);
INSERT INTO Produto(idProduto, nomeProduto, precoProduto, Categoria_idCategoria) VALUES (2, 'Sabão em pó', 9.99, 1);
INSERT INTO Produto(idProduto, nomeProduto, precoProduto, Categoria_idCategoria) VALUES (3, 'Filé de peito de frango', 20.70, 7);

SELECT * FROM Produto;

UPDATE Categoria 
SET nomeCategoria = 'Pescados'
WHERE idCategoria = 8;

DELETE FROM Categoria
WHERE idCategoria IN(8);

-- idCategoria BEETWEN 3 AND 5 (entre 3 e 5)
