-- Criação da visão ResumoPublicacoes
-- Resumo que consolida o número de curtidas e comentários por publicação
CREATE OR REPLACE VIEW ResumoPublicacoes AS
SELECT
    pp.Perfil_ID, 
    pp.Nome_Perfil, 
    pp.Publicacao_ID, 
    COUNT(c.Perfil_ID) AS Total_Curtidas, 
    COUNT(co.ID_Com) AS Total_Comentarios 
FROM
    PublicacoesPerfis pp
LEFT JOIN Curtir c ON pp.Publicacao_ID = c.Publicacao_ID 
LEFT JOIN Comentario co ON pp.Publicacao_ID = co.Publicacao_ID 
GROUP BY
    pp.Perfil_ID, pp.Nome_Perfil, pp.Publicacao_ID;

-- Consulta 1: Perfis com maior número de curtidas em suas publicações
-- Identifica os perfis mais populares com base no total de curtidas recebidas
SELECT 
    p.Nome AS Nome_Perfil, 
    r.Perfil_ID, 
    SUM(r.Total_Curtidas) AS Total_Curtidas 
FROM 
    ResumoPublicacoes r 
JOIN Perfil p ON r.Perfil_ID = p.ID_Per 
JOIN Publicacao pub ON r.Publicacao_ID = pub.ID_Pub 
GROUP BY 
    p.Nome, r.Perfil_ID
ORDER BY 
    Total_Curtidas DESC 
LIMIT 5;

-- Consulta 2: Publicações com mais de 5 curtidas e ao menos 2 comentários
-- Identifica publicações com alta interação
SELECT DISTINCT
    r.Nome_Perfil, 
    r.Publicacao_ID, 
    r.Total_Curtidas, 
    r.Total_Comentarios 
    ResumoPublicacoes r 
JOIN Curtir c ON r.Publicacao_ID = c.Publicacao_ID 
JOIN Comentario co ON r.Publicacao_ID = co.Publicacao_ID 
WHERE 
    r.Total_Curtidas > 5
    AND r.Total_Comentarios >= 2; 

-- Consulta 3: Publicações que não receberam nenhuma curtida
-- Encontra publicações sem engajamento (nenhuma curtida)
SELECT 
    p.Nome AS Nome_Perfil, 
    pub.ID_Pub AS Publicacao_ID 
FROM 
    Perfil p 
JOIN Publicacao pub ON p.ID_Per = pub.Autor_ID 
LEFT JOIN Curtir c ON pub.ID_Pub = c.Publicacao_ID 
WHERE 
    c.Perfil_ID IS NULL; 

-- Consulta 4: Total de curtidas por tipo de interação (Publicação ou Story)
-- Analisa o comportamento de curtidas entre diferentes tipos de conteúdo
SELECT 
    CASE 
        WHEN c.Publicacao_ID IS NOT NULL THEN 'Publicacao' 
        WHEN c.Story_ID IS NOT NULL THEN 'Story' 
    END AS Tipo_Conteudo,
    COUNT(c.Perfil_ID) AS Total_Curtidas 
FROM 
    Curtir c -- Tabela de curtidas
LEFT JOIN Publicacao p ON c.Publicacao_ID = p.ID_Pub 
LEFT JOIN Story s ON c.Story_ID = s.ID_Sto 
GROUP BY 
    Tipo_Conteudo; 

-- Consulta 5: Pessoas que curtiram todas as fotos de outras
-- Identifica perfis que curtiram todas as publicações de outros perfis
SELECT 
    c.Perfil_ID AS Quem_Curtiu, 
    p_autor.ID_Per AS Autor_Fotos 
FROM 
    Curtir c 
JOIN Publicacao pub ON c.Publicacao_ID = pub.ID_Pub 
JOIN Perfil p_autor ON pub.Autor_ID = p_autor.ID_Per 
GROUP BY 
    c.Perfil_ID, p_autor.ID_Per 
HAVING 
    COUNT(DISTINCT pub.ID_Pub) = (
        SELECT COUNT(*) 
        FROM Publicacao pub_sub
        WHERE pub_sub.Autor_ID = p_autor.ID_Per
    );

-- Consulta 6: Publicações com maior número de curtidas para cada perfil
-- Identifica as publicações de maior destaque de cada autor
SELECT 
    r.Nome_Perfil, 
    r.Publicacao_ID, 
    r.Total_Curtidas 
FROM 
    ResumoPublicacoes r 
JOIN Curtir c ON r.Publicacao_ID = c.Publicacao_ID 
JOIN Perfil p ON r.Perfil_ID = p.ID_Per 
WHERE 
    r.Total_Curtidas = ( 
        SELECT MAX(sub.Total_Curtidas)
        FROM ResumoPublicacoes sub
        WHERE sub.Perfil_ID = r.Perfil_ID
    );

-- Consulta 7: Total de mensagens enviadas por tipo de conversa (DM ou Grupo)
-- Analisa a atividade de mensagens por tipo de conversa
SELECT 
    c.DM AS Tipo_Conversa, 
    COUNT(m.ID_Msg) AS Total_Mensagens, 
    COUNT(DISTINCT p.ID_Per) AS Total_Participantes 
FROM 
    Conversa c 
JOIN Mensagem m ON c.ID_Con = m.Conversa_ID 
JOIN Perfil p ON m.Autor_ID = p.ID_Per 
GROUP BY 
    c.DM; 

-- Consulta 8: Perfis que receberam comentários em todas as suas publicações
-- Identifica autores cujas publicações receberam comentários em todas as postagens
SELECT 
    p.ID_Per, 
    p.Nome 
FROM 
    Perfil p 
JOIN Publicacao pub ON p.ID_Per = pub.Autor_ID 
WHERE 
    NOT EXISTS ( 
        SELECT 1
        FROM Publicacao pub2
        WHERE pub2.Autor_ID = p.ID_Per 
        AND NOT EXISTS ( 
            SELECT 1
            FROM Comentario co
            WHERE co.Publicacao_ID = pub2.ID_Pub
        )
    );
