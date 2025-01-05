-- Criando perfis
INSERT INTO Perfil (ID_Per, Nome, Foto, Descricao, Privado)
VALUES
(1, 'Alice', 'alice.png', 'Criadora de conteúdo', FALSE),
(2, 'Bob', 'bob.png', 'Fotógrafo', FALSE),
(3, 'Carol', 'carol.png', 'Designer', TRUE);

-- Relação de seguidores
INSERT INTO Seguir (Seguidor_ID, Seguido_ID, Melhores_Amigos)
VALUES
(1, 2, FALSE), -- Alice segue Bob
(1, 3, TRUE),  -- Alice segue Carol (Melhores amigos)
(2, 1, FALSE); -- Bob segue Alice

-- Publicações
INSERT INTO Publicacao (ID_Pub, Data, Autor_ID, Imagem)
VALUES
(1, NOW(), 1, decode('89504E47', 'hex')), -- Publicação de Alice
(2, NOW(), 2, decode('FFD8FFE0', 'hex')); -- Publicação de Bob

-- Stories
INSERT INTO Story (ID_Sto, Data, Video, Autor_ID)
VALUES
(1, NOW(), decode('89504E47', 'hex'), 1), -- Story de Alice
(2, NOW(), decode('FFD8FFE0', 'hex'), 2); -- Story de Bob

-- Curtidas
INSERT INTO Curtir (Perfil_ID, Publicacao_ID, Story_ID)
VALUES
(1, 2, NULL), -- Alice curtiu a publicação de Bob
(2, NULL, 1); -- Bob curtiu o story de Alice

-- Comentários
INSERT INTO Comentario (ID_Com, Data, Texto, Autor_ID, Publicacao_ID, Comentario_ID, Story_ID)
VALUES
(1, NOW(), 'Ótima foto!', 1, 2, NULL, NULL), -- Alice comentou na publicação de Bob
(2, NOW(), 'Obrigado!', 2, NULL, 1, NULL); -- Bob respondeu ao comentário de Alice

-- Conversas
INSERT INTO Conversa (ID_Con, Data, DM)
VALUES
(1, NOW(), TRUE); -- Conversa privada

-- Mensagens
INSERT INTO Mensagem (ID_Msg, Autor_ID, Data, Texto, Conversa_ID, ID_Story_Ref, ID_Msg_Ref)
VALUES
(1, 1, NOW(), 'Oi, Bob!', 1, NULL, NULL), -- Alice para Bob
(2, 2, NOW(), 'Oi, Alice!', 1, NULL, 1); -- Bob respondendo Alice

-- Participação em conversa
INSERT INTO Participacao (ID_Con, ID_Per)
VALUES
(1, 1), -- Alice participa
(1, 2); -- Bob participa

-- Reações
INSERT INTO Reagir (Perfil_ID, Emoji, Publicacao_ID, Mensagem_ID, Story_ID)
VALUES
(1, '❤️', NULL, 2, NULL), -- Alice reagiu à mensagem de Bob
(2, '🔥', NULL, NULL, 1); -- Bob reagiu ao story de Alice
