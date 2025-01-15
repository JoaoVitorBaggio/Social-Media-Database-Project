-- @block
DROP TABLE IF EXISTS Publicacao CASCADE;
CREATE TABLE IF NOT EXISTS Publicacao (
    ID_Pub INT PRIMARY KEY,
    Data TIMESTAMP NOT NULL,
    Autor_ID INT NOT NULL,
    Imagem BYTEA NOT NULL,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE
);

-- @block
DROP TABLE IF EXISTS Curtir CASCADE;
CREATE TABLE IF NOT EXISTS Curtir (
    Perfil_ID INT NOT NULL,
    Publicacao_ID INT,
    Story_ID INT,
    Data TIMESTAMP NOT NULL,
    
    FOREIGN KEY (Perfil_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Publicacao_ID) REFERENCES Publicacao(ID_Pub) ON DELETE CASCADE,
    
    -- Garantir que um perfil só possa curtir uma publicação ou story por vez
    UNIQUE (Perfil_ID, Publicacao_ID),
    UNIQUE (Perfil_ID, Story_ID),
    
    -- Das chaves de publicação e story, uma deve ser nula e a outra não
    CHECK (
        (Publicacao_ID IS NOT NULL OR Story_ID IS NOT NULL)
        AND 
        (Publicacao_ID IS NULL OR Story_ID IS NULL)
    )
);

-- @block
DROP TABLE IF EXISTS Story CASCADE;
CREATE TABLE IF NOT EXISTS Story (
    ID_Sto INT PRIMARY KEY,
    Data TIMESTAMP NOT NULL,
    Video BYTEA NOT NULL,
    Autor_ID INT NOT NULL,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE
);

-- @block
DROP TABLE IF EXISTS Comentario CASCADE;
CREATE TABLE IF NOT EXISTS Comentario (
    ID_Com INT PRIMARY KEY,
    Data TIMESTAMP NOT NULL,
    Texto TEXT NOT NULL,
    Autor_ID INT NOT NULL,
    -- ID da ação original à qual o comentário se refere
    -- Deve ser um desses, os demais devem ser nulos
    Publicacao_ID INT,
    Comentario_ID INT,
    Story_ID INT,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Story_ID) REFERENCES Story(ID_Sto),
    FOREIGN KEY (Publicacao_ID) REFERENCES Publicacao(ID_Pub),
    FOREIGN KEY (Comentario_ID) REFERENCES Comentario(ID_Com),

    CHECK (
    (Publicacao_ID IS NOT NULL AND Comentario_ID IS NULL AND Story_ID IS NULL) OR
    (Publicacao_ID IS NULL AND Comentario_ID IS NOT NULL AND Story_ID IS NULL) OR
    (Publicacao_ID IS NULL AND Comentario_ID IS NULL AND Story_ID IS NOT NULL)
    )
);
