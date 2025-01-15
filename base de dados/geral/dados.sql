-- @block
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

-- @block
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
