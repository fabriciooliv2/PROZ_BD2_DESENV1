DELIMITER $$

CREATE PROCEDURE GerarRelatorioDiario()
BEGIN
    -- Cria uma tabela temporária para armazenar o relatório diário
    CREATE TEMPORARY TABLE IF NOT EXISTS RelatorioDiario (
        data_compra DATE,
        quantidade_total INT
    );

    -- Limpa a tabela temporária para novos dados
    TRUNCATE TABLE RelatorioDiario;

    -- Insere os dados na tabela temporária, agrupando por data de compra
    INSERT INTO RelatorioDiario (data_compra, quantidade_total)
    SELECT 
        data_compra,
        SUM(quantidade) AS quantidade_total
    FROM 
        Compras
    GROUP BY 
        data_compra;

    -- Seleciona os dados do relatório diário
    SELECT * FROM RelatorioDiario;

    -- Opcionalmente, pode-se inserir os dados em uma tabela permanente
    -- ou gerar um arquivo de exportação.

END$$

DELIMITER ;
