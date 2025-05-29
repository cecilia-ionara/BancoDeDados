-- a) Listar os nomes dos assinantes, junto com seus respectivos dados de endereço e
-- telefones correspondentes;

SELECT a.nome, e.logradouro, e.bairro, e.cep, e.cidade, e.estado, t.ddd, t.numero 
FROM Assinante a 
INNER JOIN Endereco e 
ON a.idAssinante = e.idAssinante
LEFT JOIN Telefone t 
ON e.idTelefone = t.idTelefone;

-- b) Listar os nomes dos assinantes, seguindo do seu ramo de atividade, ordenados
-- por ramo e posteriormente por nome;

SELECT a.nome, r.descricao 
FROM Assinante a 
INNER JOIN RamoAtividade r 
ON a.idRamoAtividade = r.idRamoAtividade
ORDER BY r.descricao, a.nome;

-- c) Listar os assinantes do Município “Belém”, que são do tipo “Residencial”;
SELECT a.nome
FROM Assinante a
INNER JOIN Endereco e 
ON a.idAssinante = e.idAssinante
LEFT JOIN TipoAssinante ta 
ON a.idTipoAssinante = ta.idTipoAssinante
WHERE e.cidade = 'Belém' AND ta.descricao = 'Residencial';

-- d) Listar os nomes dos assinantes seguindo do número de telefone, tipo de
-- assinante, com endereço na cidade de “Marabá” ou “Belém”

SELECT a.nome, t.ddd, t.numero, ta.descricao, e.cidade
FROM Assinante a
INNER JOIN TipoAssinante ta
ON a.idTipoAssinante = ta.idTipoAssinante 
LEFT JOIN Endereco e 
ON a.idAssinante = e.idAssinante
LEFT JOIN Telefone t 
ON e.idTelefone = t.idTelefone
WHERE e.cidade = 'Belém' OR e.cidade = 'Marabá';