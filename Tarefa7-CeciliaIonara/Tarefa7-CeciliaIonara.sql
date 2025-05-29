-- a)
SELECT id_NF, id_item, cod_prod, valor_unit FROM Pedido 
WHERE desconto IS NULL;

-- b)
SELECT id_NF, id_item, cod_prod, valor_unit, 
		valor_unit - (valor_unit * (desconto/100)) AS valor_vendido
FROM Pedido 
WHERE desconto IS NOT NULL;

-- c) 
SELECT id_NF, id_item, cod_prod, valor_unit
FROM Pedido
WHERE desconto IS NULL;

SELECT id_NF, id_item, cod_prod, valor_unit,
	   valor_unit - (valor_unit*(desconto/100)) AS valor_vendido
FROM Pedido
WHERE desconto IS NOT NULL;
UPDATE Pedido
SET desconto = 0
WHERE desconto IS NULL;

SELECT id_NF, id_item, cod_prod, valor_unit, quantidade
      (quantidade * valor_unit) AS valor_total, 
      (valor_unit - (valor_unit*(desconto/100)))  AS valor_vendido
FROM Pedido; 

SELECT id_NF, SUM (quantidade * valor_unit) as valor_total
FROM Pedido
GROUP BY  id_NF
ORDER BY valor_total DESC;


-- i) 
SELECT id_NF, SUM(quantidade * valor_unit) AS valor_total
FROM Pedido 
GROUP BY id_NF
HAVING valor_total > 500
ORDER BY valor_total DESC;

-- j) 
SELECT cod_prod, AVG(desconto) AS media 
FROM Pedido
GROUP BY cod_prod;

-- k) 
SELECT cod_prod, 
		MIN(desconto) AS menor,
		MAX(desconto) AS maior,
		AVG(desconto) AS media
FROM Pedido
GROUP BY cod_prod;

-- l) 
SELECT id_NF, COUNT(*) AS quantidade 
FROM Pedido
GROUP BY id_NF
HAVING quantidade > 3;