
CREATE OR REPLACE VIEW FeedInteracoes AS
SELECT 
    p.Nome AS NomeAutor,
    pub.ID_Pub AS IDPublicacao,
    co.Texto AS Comentario,
    cu.Perfil_ID AS IDPerfilCurtida,
    pf.Nome AS NomePerfilInteracao,
    CASE 
        WHEN cu.Publicacao_ID IS NOT NULL THEN 'Curtida'
        WHEN co.Texto IS NOT NULL THEN 'Comentário'
    END AS TipoInteracao,
    COALESCE(co.Data, cu.Data) AS DataInteracao
FROM Publicacao pub
LEFT JOIN Curtir cu ON pub.ID_Pub = cu.Publicacao_ID
LEFT JOIN Comentario co ON pub.ID_Pub = co.Publicacao_ID
LEFT JOIN Perfil p ON pub.Autor_ID = p.ID_Per
LEFT JOIN Perfil pf ON co.Autor_ID = pf.ID_Per OR cu.Perfil_ID = pf.ID_Per;

SELECT 
    IDPublicacao,
    TipoInteracao,
    COUNT(*) AS TotalInteracoes
FROM FeedInteracoes
GROUP BY IDPublicacao, TipoInteracao;

SELECT 
    IDPublicacao,
    COUNT() AS TotalComentarios
FROM FeedInteracoes
WHERE TipoInteracao = 'Comentário'
GROUP BY IDPublicacao
HAVING COUNT() > 2;

SELECT Nome
FROM Perfil
WHERE ID_Per NOT IN (
    SELECT DISTINCT IDPerfilInteracao
    FROM FeedInteracoes
    WHERE TipoInteracao = 'Comentário'
);

SELECT 
    IDPublicacao,
    COUNT() AS TotalCurtidas
FROM FeedInteracoes
WHERE TipoInteracao = 'Curtida'
GROUP BY IDPublicacao
ORDER BY COUNT() DESC
LIMIT 3;

SELECT DISTINCT f.IDPublicacao, f.TipoInteracao, f.NomePerfilInteracao
FROM FeedInteracoes f
WHERE f.NomeAutor IN (
    SELECT Nome
    FROM Perfil p
    JOIN Seguir s ON p.ID_Per = s.Seguido_ID
    WHERE s.Seguidor_ID = 1
);

SELECT Nome
FROM Perfil
WHERE NOT EXISTS (
    SELECT 1
    FROM Story s
    WHERE s.Autor_ID = 1 AND
          NOT EXISTS (
              SELECT 1
              FROM Curtir c
              WHERE c.Publicacao_ID = s.ID_Sto AND c.Perfil_ID = Perfil.ID_Per
          )
);

SELECT Emoji, COUNT(*) AS TotalReacoes
FROM Reagir
GROUP BY Emoji;

SELECT 
    NomeAutor,
    NomePerfilInteracao,
    TipoInteracao,
    Comentario,
    DataInteracao
FROM FeedInteracoes
WHERE IDPublicacao = 1;
