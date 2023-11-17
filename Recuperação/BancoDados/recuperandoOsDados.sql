CREATE DATABASE recuperacao;
USE recuperacao;

CREATE TABLE clientes_tb (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  endereco VARCHAR(100) NOT NULL
);

CREATE TABLE vendedores_tb (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  periodo ENUM('integral', 'parcial') NOT NULL,
  salario DECIMAL(10,2) NOT NULL
);

drop table clientes_tb;

CREATE TABLE produtos (
  id INT PRIMARY KEY NOT NULL,
  tamanho VARCHAR(10) NOT NULL,
  cor VARCHAR(20) NOT NULL,
  quantidade INT NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE vendas_tb (
  id_venda INT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_vendedor INT NOT NULL,
  id_produto INT NOT NULL,
  data_venda DATE NOT NULL,
  valor_venda DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes_tb(id),
  FOREIGN KEY (id_vendedor) REFERENCES vendedores_tb(id),
  FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

INSERT INTO clientes_tb (id, nome, telefone, endereco) VALUES
(1, 'Ana Souza', '82-99999-9999', 'Rua das Flores, 123, Centro, Maceió'),
(2, 'Bruno Dias', '82-88888-8888', 'Avenida da Paz, 456, Jatiúca, Maceió'),
(3, 'Carla Silva', '82-77777-7777', 'Praça do Skate, 789, Ponta Verde, Maceió'),
(4, 'Daniel Costa', '82-66666-6666', 'Rua do Sol, 101, Pajuçara, Maceió'),
(5, 'Eduardo Lima', '82-55555-5555', 'Rua do Farol, 202, Trapiche, Maceió');

INSERT INTO vendedores_tb (id, nome, telefone, endereco, periodo, salario) VALUES
(1, 'Fabio Santos', '82-44444-4444', 'Rua da Lagoa, 303, Benedito Bentes, Maceió', 'integral', 1500.00),
(2, 'Gabriela Oliveira', '82-33333-3333', 'Rua do Comércio, 404, Jaraguá, Maceió', 'parcial', 800.00),
(3, 'Henrique Alves', '82-22222-2222', 'Rua do Barro, 505, Tabuleiro, Maceió', 'integral', 1200.00),
(4, 'Isabela Rocha', '82-11111-1111', 'Rua da Praia, 606, Cruz das Almas, Maceió', 'parcial', 700.00),
(5, 'João Pedro', '82-00000-0000', 'Rua da Serra, 707, Gruta, Maceió', 'integral', 1300.00);

INSERT INTO produtos (id, tamanho, cor, quantidade, preco) VALUES
(1, 'P', 'azul', 10, 49.90),
(2, 'M', 'vermelho', 5, 59.90),
(3, 'G', 'verde', 8, 69.90),
(4, 'P', 'amarelo', 12, 39.90),
(5, 'M', 'preto', 6, 79.90);

INSERT INTO vendas_tb (id_venda, id_cliente, id_vendedor, id_produto, data_venda, valor_venda) VALUES
(1, 1, 1, 1, '2023-11-17', 49.90),
(2, 2, 2, 2, '2023-11-16', 59.90),
(3, 3, 1, 3, '2023-11-15', 69.90),
(4, 4, 3, 4, '2023-11-14', 39.90),
(5, 5, 4, 5, '2023-11-13', 79.90);

UPDATE vendedores_tb
SET salario = salario * 1.1
WHERE periodo = 'integral';

SELECT tamanho, cor, quantidade
FROM produtos;

SELECT v.nome, SUM(vl.valor_venda) AS total_vendas
FROM vendedores_tb v
JOIN vendas_tb vl ON v.id = vl.id_vendedor
GROUP BY v.id
ORDER BY total_vendas DESC
LIMIT 3;

SELECT *
FROM vendas_tb
WHERE data_venda BETWEEN '2023-11-01' AND '2023-11-30';

SELECT v.*
FROM vendas_tb v
JOIN clientes_tb c ON v.id_cliente = c.id
WHERE c.nome = 'João Silva';