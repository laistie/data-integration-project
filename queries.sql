-- Essa consulta é destinada à visualização da distribuição dos usuários da survey de 2023 (no tratamento, os dados foram inseridos na coluna 'userId'/'SOuserId' como {ano}responseId da tabela 'STACKOVERFLOW.SO_{ano}), sendo agrupados pela idade e correspondentes a apenas um tipo de recurso de aprendizagem. Para esse exemplo, foi analisado o recurso 'Books / Physical media', que, de modo geral, possui pouca utilização entre os usuários quando comparado ao 'Other online resources (e.g., videos, blogs, forum)'.

SELECT SOusr.age, COUNT(*) AS quantity, 
    ROUND((COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM SOuser SOusr 
        JOIN learn lrn ON SOusr.userId = lrn.SOuserId
        WHERE lrn.resourcetype = 'Books / Physical media' 
        AND TO_CHAR(SOusr.userId) LIKE '2023%')), 2) AS percentage_books,
    ROUND((COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM SOuser SOusr 
        JOIN learn lrn ON SOusr.userId = lrn.SOuserId
        WHERE TO_CHAR(SOusr.userId) LIKE '2023%')), 2) AS percentage_all
FROM SOuser SOusr
JOIN learn lrn ON SOusr.userId = lrn.SOuserId
WHERE lrn.resourcetype = 'Books / Physical media' AND TO_CHAR(SOusr.userId) LIKE '2023%'
GROUP BY SOusr.age;


-- Essa consulta serve para visualizar a idade média de anos programando dos usuários, de forma a relacionar com sua escolaridade. De modo geral, observou-se que as maiores médias estão presentes no grupo de pessoas que possuem maiores graus de escolaridade.
SELECT edlevel, ROUND(AVG(yearscode), 0) AS mean_yearscode
FROM SOuser
WHERE TO_CHAR(SOuser.userId) LIKE '2023%'
GROUP BY edlevel
ORDER BY mean_yearscode DESC;


-- Analogamente, buscou-se analisar a relação entre a idade média de anos programando  dos usuários, mas agrupando-os por país. Países de menor desenvolvimento possuem, em média, usuários menos experientes em programação.
SELECT country, ROUND(AVG(yearscode), 0) AS mean_yearscode
FROM SOuser
WHERE TO_CHAR(SOuser.userId) LIKE '2023%'
GROUP BY country
ORDER BY mean_yearscode DESC;


-- Buscou-se relacionar as consultas anteriores com a presente, de forma que se esperou uma maior frequência em usuários com maior grau de escolaridade relativos ao país. Em casos de países menos desenvolvidos, como o Afeganistão, o bacharelado representa um índice de escolaridade alto, e a consulta anterior permitiu analisar que os usuários apresentaram uma média de anos programando também relativamente baixa.
WITH edlevel_frequency AS (
    SELECT country, edlevel, COUNT(*) AS frequency,
        ROW_NUMBER() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) AS rank,
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY country) AS percentage
    FROM SOuser
    GROUP BY country, edlevel
)
SELECT country, edlevel, frequency, ROUND(percentage, 2) AS percentage_country
FROM edlevel_frequency
WHERE rank <= 3
ORDER BY country, rank;
