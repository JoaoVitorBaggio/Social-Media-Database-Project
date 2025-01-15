-- PublicacoesPerfis
-- Visão que junta perfis com suas publicação
    CREATE OR REPLACE VIEW PublicacoesPerfis AS
    SELECT
        p.ID_Per AS Perfil_ID, 
        p.Nome AS Nome_Perfil, 
        pub.ID_Pub AS Publicacao_ID 
    FROM
        Perfil p
    RIGHT JOIN Publicacao pub ON p.ID_Per = pub.Autor_ID;

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