-- Publicacao
INSERT INTO Publicacao (ID_Pub, Data, Autor_ID, Imagem) VALUES
    (1, '2025-01-01 10:00:00', 1, 'imagem1.jpg'),
    (2, '2025-01-02 11:00:00', 2, 'imagem2.jpg'),
    (3, '2025-01-03 12:00:00', 3, 'imagem3.jpg'),
    (4, '2025-01-04 13:00:00', 4, 'imagem4.jpg'),
    (5, '2025-01-05 14:00:00', 5, 'imagem5.jpg'),
    (6, '2025-01-06 15:00:00', 6, 'imagem6.jpg'),
    (7, '2025-01-07 16:00:00', 7, 'imagem7.jpg'),
    (8, '2025-01-08 17:00:00', 8, 'imagem8.jpg'),
    (9, '2025-01-09 18:00:00', 9, 'imagem9.jpg'),
    (10, '2025-01-10 19:00:00', 10, 'imagem10.jpg'),

    -- João Silva (ID_Per = 1) posta mais duas fotos
    (11, '2025-01-11 10:00:00', 1, 'imagem11.jpg'),
    (12, '2025-01-12 11:00:00', 1, 'imagem12.jpg'),

    -- Maria Oliveira (ID_Per = 2) posta mais três fotos
    (13, '2025-01-13 12:00:00', 2, 'imagem13.jpg'),
    (14, '2025-01-14 13:00:00', 2, 'imagem14.jpg'),
    (15, '2025-01-15 14:00:00', 2, 'imagem15.jpg'),

    -- Carlos Souza (ID_Per = 3) posta mais uma foto
    (16, '2025-01-16 15:00:00', 3, 'imagem16.jpg'),

    -- Ana Santos (ID_Per = 4) posta mais duas fotos
    (17, '2025-01-17 16:00:00', 4, 'imagem17.jpg'),
    (18, '2025-01-18 17:00:00', 4, 'imagem18.jpg');

-- Curtidas em Publicações
INSERT INTO Curtir (Perfil_ID, Publicacao_ID, Story_ID, Data) VALUES
    (1, 2, NULL, '2025-01-01 10:10:00'),
    (2, 3, NULL, '2025-01-02 11:10:00'),
    (3, 4, NULL, '2025-01-03 12:10:00'),
    (4, 5, NULL, '2025-01-04 13:10:00'),
    (5, 6, NULL, '2025-01-05 14:10:00'),
    (6, 7, NULL, '2025-01-06 15:10:00'),
    (7, 8, NULL, '2025-01-07 16:10:00'),
    (8, 9, NULL, '2025-01-08 17:10:00'),
    (9, 10, NULL, '2025-01-09 18:10:00'),
    (10, 1, NULL, '2025-01-10 19:10:00'),
    (3, 2, NULL, '2025-01-01 10:00:00'),
    (4, 2, NULL, '2025-01-01 10:00:00'),
    (5, 2, NULL, '2025-01-01 10:00:00'),
    (6, 2, NULL, '2025-01-01 10:00:00'),
    (7, 2, NULL, '2025-01-01 10:00:00');

-- Story
INSERT INTO Story (ID_Sto, Data, Video, Autor_ID) VALUES
    (1, '2025-01-01 20:00:00', 'video1.mp4', 1),
    (2, '2025-01-02 21:00:00', 'video2.mp4', 2),
    (3, '2025-01-03 22:00:00', 'video3.mp4', 3),
    (4, '2025-01-04 23:00:00', 'video4.mp4', 4),
    (5, '2025-01-05 20:00:00', 'video5.mp4', 5),
    (6, '2025-01-06 21:00:00', 'video6.mp4', 6),
    (7, '2025-01-07 22:00:00', 'video7.mp4', 7),
    (8, '2025-01-08 23:00:00', 'video8.mp4', 8),
    (9, '2025-01-09 20:00:00', 'video9.mp4', 9),
    (10, '2025-01-10 21:00:00', 'video10.mp4', 10);

-- Comentário
INSERT INTO Comentario (ID_Com, Data, Texto, Autor_ID, Publicacao_ID, Comentario_ID, Story_ID) VALUES
    (1, '2025-01-01 12:00:00', 'Ótima publicação!', 1, 2, NULL, NULL),
    (2, '2025-01-02 12:00:00', 'Adorei isso!', 2, NULL, NULL, 3),
    (3, '2025-01-03 12:00:00', 'Incrível!', 3, NULL, 2, NULL),
    (4, '2025-01-04 12:00:00', 'Parabéns!', 4, 5, NULL, NULL),
    (5, '2025-01-05 12:00:00', 'Lindo!', 5, NULL, NULL, 6),
    (6, '2025-01-06 12:00:00', 'Perfeito!', 6, NULL, 5, NULL),
    (7, '2025-01-07 12:00:00', 'Fantástico!', 7, 8, NULL, NULL),
    (8, '2025-01-08 12:00:00', 'Incrível!', 8, NULL, NULL, 9),
    (9, '2025-01-09 12:00:00', 'Bom demais!', 9, NULL, 8, NULL),
    (10, '2025-01-10 12:00:00', 'Adorei isso!', 10, 1, NULL, NULL);

-- Curtidas em Stories
INSERT INTO Curtir (Perfil_ID, Publicacao_ID, Story_ID, Data) VALUES
    -- João Silva (ID_Per = 1) curte os Stories de Maria Oliveira (ID_Sto = 2) e Carlos Souza (ID_Sto = 3)
    (1, NULL, 2, '2025-01-11 08:00:00'),
    (1, NULL, 3, '2025-01-11 09:00:00'),

    -- Maria Oliveira (ID_Per = 2) curte os Stories de João Silva (ID_Sto = 1) e Ana Santos (ID_Sto = 4)
    (2, NULL, 1, '2025-01-12 10:00:00'),
    (2, NULL, 4, '2025-01-12 11:00:00'),

    -- Carlos Souza (ID_Per = 3) curte os Stories de Pedro Lima (ID_Sto = 5) e Julia Ferreira (ID_Sto = 8)
    (3, NULL, 5, '2025-01-13 12:00:00'),
    (3, NULL, 8, '2025-01-13 13:00:00'),

    -- Ana Santos (ID_Per = 4) curte os Stories de Rafael Carvalho (ID_Sto = 9) e Fernanda Costa (ID_Sto = 6)
    (4, NULL, 9, '2025-01-14 14:00:00'),
    (4, NULL, 6, '2025-01-14 15:00:00'),

    -- Pedro Lima (ID_Per = 5) curte os Stories de Lucas Mendes (ID_Sto = 7) e Mariana Barros (ID_Sto = 10)
    (5, NULL, 7, '2025-01-15 16:00:00'),
    (5, NULL, 10, '2025-01-15 17:00:00');
    (8, 7, NULL, '2025-01-30 11:00:00');
