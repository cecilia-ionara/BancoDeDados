-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categoria` (
  `idCategoria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomeCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto` (
  `idProduto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `precoProduto` FLOAT NOT NULL,
  `Categoria_idCategoria` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_Produto_Categoria_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Categoria`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Inserção de Categorias
-- -----------------------------------------------------
INSERT INTO `Categoria` (`nomeCategoria`) VALUES 
('Eletrônicos'),
('Livros'),
('Roupas'),
('Alimentos'),
('Brinquedos'),
('Móveis'),
('Beleza'),
('Esportes'),
('Ferramentas'),
('Automotivo');

-- -----------------------------------------------------
-- Inserção de Produtos
-- -----------------------------------------------------
INSERT INTO `Produto` (`nomeProduto`, `precoProduto`, `Categoria_idCategoria`) VALUES
('Smartphone X1', 1999.99, 1),
('Notebook Pro', 3499.90, 1),
('Fone de Ouvido', 299.90, 1),
('Carregador Portátil', 149.50, 1),
('TV LED 50"', 2499.00, 1),

('Livro SQL Básico', 89.90, 2),
('Livro de Python', 129.90, 2),
('Romance Clássico', 49.99, 2),
('Livro de Matemática', 99.00, 2),
('Livro de História', 59.90, 2),

('Camiseta Polo', 79.90, 3),
('Calça Jeans', 129.99, 3),
('Tênis Esportivo', 249.90, 3),
('Jaqueta de Couro', 399.00, 3),
('Vestido Floral', 149.90, 3),

('Arroz 5kg', 22.50, 4),
('Feijão 1kg', 8.90, 4),
('Macarrão 500g', 5.99, 4),
('Café 500g', 15.90, 4),
('Açúcar 1kg', 4.50, 4),

('Boneca Fashion', 79.90, 5),
('Carrinho de Controle', 149.99, 5),
('Quebra-cabeça 1000 peças', 89.90, 5),
('Jogo de Tabuleiro', 119.90, 5),
('Pelúcia Urso', 59.90, 5),

('Mesa de Jantar', 799.00, 6),
('Cadeira de Escritório', 499.90, 6),
('Armário de Cozinha', 1199.00, 6),
('Sofá Retrátil', 2499.90, 6),
('Estante de Livros', 399.00, 6),

('Shampoo Hidratante', 29.90, 7),
('Condicionador', 31.90, 7),
('Perfume Importado', 399.90, 7),
('Creme Facial', 89.90, 7),
('Maquiagem Kit', 199.00, 7),

('Bicicleta Aro 29', 1599.00, 8),
('Patins In-line', 299.90, 8),
('Bola de Futebol', 89.90, 8),
('Raquete de Tênis', 399.00, 8),
('Tênis de Corrida', 349.90, 8),

('Chave de Fenda', 19.90, 9),
('Furadeira Elétrica', 299.00, 9),
('Parafusadeira', 249.00, 9),
('Serra Circular', 599.00, 9),
('Martelo', 39.90, 9),

('Pneu Aro 15', 299.00, 10),
('Óleo de Motor', 79.90, 10),
('Kit Ferramentas Auto', 199.00, 10),
('Calha Automotiva', 89.90, 10),
('Tapete de Borracha', 129.90, 10);
