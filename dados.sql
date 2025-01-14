-- Perfil
INSERT INTO Perfil (ID_Per, Nome, Foto, Descricao, Privado) VALUES
    (1, 'João Silva', 'joao.jpg', 'Descrição de João', FALSE),
    (2, 'Maria Oliveira', 'maria.jpg', 'Descrição de Maria', TRUE),
    (3, 'Carlos Souza', 'carlos.jpg', 'Descrição de Carlos', FALSE),
    (4, 'Ana Santos', 'ana.jpg', 'Descrição de Ana', TRUE),
    (5, 'Pedro Lima', 'pedro.jpg', 'Descrição de Pedro', FALSE),
    (6, 'Fernanda Costa', 'fernanda.jpg', 'Descrição de Fernanda', TRUE),
    (7, 'Lucas Mendes', 'lucas.jpg', 'Descrição de Lucas', FALSE),
    (8, 'Julia Ferreira', 'julia.jpg', 'Descrição de Julia', TRUE),
    (9, 'Rafael Carvalho', 'rafael.jpg', 'Descrição de Rafael', FALSE),
    (10, 'Mariana Barros', 'mariana.jpg', 'Descrição de Mariana', TRUE);

-- Seguir
INSERT INTO Seguir (Seguidor_ID, Seguido_ID, Melhores_Amigos) VALUES
    (1, 2, TRUE),
    (1, 3, FALSE),
    (2, 4, TRUE),
    (3, 5, FALSE),
    (4, 6, TRUE),
    (5, 7, FALSE),
    (6, 8, TRUE),
    (7, 9, FALSE),
    (8, 10, TRUE),
    (9, 1, FALSE);

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

-- Conversa
INSERT INTO Conversa (ID_Con, Data, DM) VALUES
    (1, '2025-01-01 09:00:00', TRUE),
    (2, '2025-01-02 09:00:00', FALSE),
    (3, '2025-01-03 09:00:00', TRUE),
    (4, '2025-01-04 09:00:00', FALSE),
    (5, '2025-01-05 09:00:00', TRUE),
    (6, '2025-01-06 09:00:00', FALSE),
    (7, '2025-01-07 09:00:00', TRUE),
    (8, '2025-01-08 09:00:00', FALSE),
    (9, '2025-01-09 09:00:00', TRUE),
    (10, '2025-01-10 09:00:00', FALSE);

-- Mensagem
INSERT INTO Mensagem (ID_Msg, Autor_ID, Data, Texto, Conversa_ID, ID_Story_Ref, ID_Msg_Ref) VALUES
    (1, 1, '2025-01-01 10:00:00', 'Oi!', 1, NULL, NULL),
    (2, 2, '2025-01-02 10:00:00', 'Tudo bem?', 1, 1, NULL),
    (3, 3, '2025-01-03 10:00:00', 'Olá!', 2, NULL, NULL),
    (4, 4, '2025-01-04 10:00:00', 'Como vai?', 2, NULL, 3),
    (5, 5, '2025-01-05 10:00:00', 'Bom dia!', 3, NULL, NULL),
    (6, 6, '2025-01-06 10:00:00', 'Tudo certo!', 3, 5, NULL),
    (7, 7, '2025-01-07 10:00:00', 'Oi gente!', 4, NULL, NULL),
    (8, 8, '2025-01-08 10:00:00', 'E aí?', 4, NULL, 7),
    (9, 9, '2025-01-09 10:00:00', 'Olá a todos!', 5, NULL, NULL),
    (10, 10, '2025-01-10 10:00:00', 'Até logo!', 5, 9, NULL);

-- Participacao
INSERT INTO Participacao (ID_Con, ID_Per) VALUES
    (1, 1),
    (2, 3),
    (3, 5),
    (3, 6),
    (4, 7),
    (5, 9),
    (5, 10),
    (6, 1),
    (6, 2),
    (7, 3),
    (7, 4),
    (8, 5),
    (8, 6),
    (9, 7),
    (9, 8),
    (10, 9),
    (10, 10);

-- Reagir
INSERT INTO Reagir (Perfil_ID, Emoji, Data, Publicacao_ID, Mensagem_ID, Story_ID) VALUES
    (1, '❤️', '2025-01-01 10:00:00', 2, NULL, NULL),
    (2, '😂', '2025-01-02 10:00:00', NULL, 1, NULL),
    (3, '👍', '2025-01-03 10:00:00', NULL, NULL, 2),
    (4, '👏', '2025-01-04 10:00:00', 5, NULL, NULL),
    (5, '😍', '2025-01-05 10:00:00', NULL, 4, NULL),
    (6, '🔥', '2025-01-06 10:00:00', NULL, NULL, 5),
    (7, '😊', '2025-01-07 10:00:00', 8, NULL, NULL),
    (8, '😲', '2025-01-08 10:00:00', NULL, 7, NULL),
    (9, '😎', '2025-01-09 10:00:00', NULL, NULL, 8),
    (10, '🙌', '2025-01-10 10:00:00', 1, NULL, NULL);

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

INSERT INTO Curtir (Perfil_ID, Publicacao_ID, Story_ID, Data) VALUES
    (2, 11, NULL, '2025-01-11 12:00:00'),
    (2, 12, NULL, '2025-01-12 12:00:00'),
    (2, 13, NULL, '2025-01-13 12:00:00');

INSERT INTO Perfil (ID_Per, Nome, Foto, Descricao, Privado) VALUES
    (20, 'Alice Silva', 'alice.jpg', 'Perfil de Alice', FALSE),
    (21, 'Bruno Souza', 'bruno.jpg', 'Perfil de Bruno', FALSE);

INSERT INTO Publicacao (ID_Pub, Data, Autor_ID, Imagem) VALUES
    (101, '2025-01-20 10:00:00', 20, 'imagem_alice.jpg');

INSERT INTO Curtir (Perfil_ID, Publicacao_ID, Story_ID, Data) VALUES
    (21, 101, NULL, '2025-01-20 11:00:00');

INSERT INTO Curtir (Perfil_ID, Publicacao_ID, Story_ID, Data) VALUES
    (8, 7, NULL, '2025-01-30 11:00:00');
