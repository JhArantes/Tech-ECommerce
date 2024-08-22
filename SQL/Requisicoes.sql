
--Conhecendo Tabela Vendas
SELECT * FROM Vendas

-- Nome da Tabela "Vendas"
-- Colunas (TransactionID, Date, Month, Product_Category, Product_Name, Unit_Sold, Unit_Price, Total_Revenue, Region, Payment_Method)
--==========================================

--Valores Unicos
SELECT DISTINCT Product_Category FROM Vendas
SELECT DISTINCT Region FROM Vendas

--=====================================

-- Dados dos Clientes maiores de 25
SELECT NOME, CIDADE, ESTADO, IDADE, GENERO
FROM TABELA_DE_CLIENTES
WHERE IDADE > 25;

-- Mudando preço das embalagens que são Latas
UPDATE TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = 10
WHERE EMBALAGEM = 'Lata';


--Valor Total da Revenda
SELECT SUM(Total_Revenue) AS Valor_Total_Revenda
FROM Vendas


-- Clientes que são mulheres e tem mais de 25 ordenado por idade decrescente
SELECT NOME, CIDADE, ESTADO, IDADE, GENERO
FROM TABELA_DE_CLIENTES
WHERE IDADE > 25 AND GENERO = 'Feminino'
ORDER BY IDADE DESC;

-- Média de idade dos Clientes
SELECT AVG(IDADE) AS MEDIA_IDADE
FROM TABELA_DE_CLIENTES;

-- Juntando tabela com Join
SELECT C.NOME, P.PRODUTO, P.PRECO_DE_LISTA
FROM TABELA_DE_CLIENTES C
JOIN TABELA_DE_PRODUTOS P
ON C.ID_CLIENTE = P.ID_CLIENTE;


-- Encontrar clientes que compraram um produto específico
SELECT NOME
FROM TABELA_DE_CLIENTES
WHERE ID_CLIENTE IN (
    SELECT ID_CLIENTE
    FROM TABELA_DE_PRODUTOS
    WHERE PRODUTO = 'ProdutoX'
);


--==============================================
-- Porcentagem de venda por Categoria do Produto
SELECT 
    Product_Category, 
    COUNT(Product_Category) as Quantidade_Vendas,
    (COUNT(Product_Category) * 100.0) / SUM(COUNT(Product_Category)) OVER() as Porcentagem_Vendas
FROM 
    Vendas
GROUP BY 
    Product_Category
ORDER BY 
    Porcentagem_Vendas DESC;

--=============================================



