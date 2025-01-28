-- Criando o banco de dados
CREATE DATABASE Ecommerce;
USE Ecommerce;

-- Tabela Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Data_Pedido DATE NOT NULL,
    Status ENUM('Pendente', 'Enviado', 'Entregue', 'Cancelado') NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

-- Tabela Produtos
CREATE TABLE Produtos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Estoque INT NOT NULL
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT NOT NULL,
    Tipo_Pagamento ENUM('Cartao', 'Boleto', 'PIX', 'Transferencia') NOT NULL,
    Status_Pagamento ENUM('Aprovado', 'Recusado', 'Pendente') NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID)
);
