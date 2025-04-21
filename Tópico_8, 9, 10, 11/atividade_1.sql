-- 1)
DELETE FROM Vendedores WHERE ven_nome = 'José Ubaldo';

-- 2)
DELETE FROM Produtos WHERE pro_nome = 'CD-R';

-- 3)
WITH Duplicados AS (
    SELECT id_do_pedido,
           ROW_NUMBER() OVER (PARTITION BY id_do_pedido ORDER BY id_do_pedido) AS row_num
    FROM Pedidos
)
DELETE FROM Pedidos
WHERE id_do_pedido IN (
    SELECT id_do_pedido
    FROM Duplicados
    WHERE row_num > 1
);

-- 4)
UPDATE PRODUTOS
SET PRO_VALOR_UNIT = 0.90 WHERE PRO_NOME LIKE 'Caneta esferográfica%';

-- 5)
UPDATE PRODUTOS
SET PRO_VALOR_UNIT = PRO_VALOR_UNIT * 1.10 WHERE PRO_NOME LIKE 'Papel A4%';

-- 6)
UPDATE PRODUTOS SET PRO_TIPO = 'papelaria';

-- 7)
UPDATE CLIENTES
SET CLI_NOME = 'Carolina Santos Silva', CLI_TELEFONE = CONCAT(CLI_TELEFONE, ', ', '(11) 99897-6543')
WHERE CLI_NOME = 'Carolina Santos';

-- 8)
INSERT INTO PRODUTOS (PRO_COD, PRO_NOME, PRO_VALOR_UNIT, PRO_QT_ESTOQUE, PRO_TIPO) VALUES 
(7, 'Apontador', 3.50, 80, 'papelaria'),
(8, 'Borracha', 2.80, 120, 'papelaria'),
(9, 'Giz de cera', 5.90, 45, 'papelaria'),
(10, 'Estojo', 12.00, 25, 'papelaria'),
(11, 'Canetinhas', 22.00, 40, 'papelaria'),
(12, 'Toner', 120.00, 5, 'informática'),
(13, 'Mouse', 35.00, 10, 'informática'),
(14, 'Teclado', 80.00, 6, 'informática');
