USE insight_places_db;

-- 1. NOW() - Verificando o momento atual do sistema
SELECT NOW() AS 'Data_e_Hora_em_Edo';

-- 2. DATEDIFF com JOIN de Clientes
SELECT 
    TRIM(c.nome) AS Nome, 
    DATEDIFF(a.data_fim, a.data_inicio) AS Dias_Hospedado
FROM alugueis a
JOIN clientes c ON a.cliente_id = c.cliente_id;

-- 3. SUM + DATEDIFF + GROUP BY
SELECT 
    h.tipo AS Tipo_Imovel, 
    SUM(DATEDIFF(a.data_fim, a.data_inicio)) AS Total_Dias_Acumulados
FROM alugueis a
JOIN hospedagens h ON a.hospedagem_id = h.hospedagem_id
GROUP BY h.tipo
ORDER BY Total_Dias_Acumulados DESC;
