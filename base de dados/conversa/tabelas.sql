-- @block
DROP TABLE IF EXISTS Conversa CASCADE;
CREATE TABLE IF NOT EXISTS Conversa (
    ID_Con INT PRIMARY KEY,
    Data TIMESTAMP NOT NULL
);

-- @block
DROP TABLE IF EXISTS Mensagem CASCADE;
CREATE TABLE IF NOT EXISTS Mensagem (
    ID_Msg INT PRIMARY KEY,
    Autor_ID INT NOT NULL,
    Data TIMESTAMP NOT NULL,
    Texto TEXT NOT NULL,
    Conversa_ID INT NOT NULL,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Conversa_ID) REFERENCES Conversa(ID_Con) ON DELETE CASCADE,

    -- Propriedades de resposta
    -- Story ou mensagem referência
    ID_Story_Ref INT,
    ID_Msg_Ref INT,

    FOREIGN KEY (ID_Story_Ref) REFERENCES Story(ID_Sto) ON DELETE CASCADE,
    FOREIGN KEY (ID_Msg_Ref) REFERENCES Mensagem(ID_Msg) ON DELETE CASCADE,

    -- Não pode haver duas referências
    CHECK (ID_Story_Ref IS NULL OR ID_Msg_Ref IS NULL)
);

-- @block
DROP TABLE IF EXISTS Direct CASCADE;
CREATE TABLE IF NOT EXISTS Direct(
    Perfil1_ID INT NOT NULL,
    Perfil2_ID INT NOT NULL,
    PRIMARY KEY (Perfil1_ID, Perfil2_ID),
    FOREIGN KEY (Perfil1_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Perfil2_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,

    -- Garantir que o id do perfil 1 é menor que o do perfil 2
    -- Isso garante que o direct não seja duplicado
    CHECK (Perfil1_ID < Perfil2_ID),
    
    -- ID da conversa para armazenar mensagens
    Conversa_ID INT NOT NULL,
    FOREIGN KEY (Conversa_ID) REFERENCES Conversa(ID_Con) ON DELETE CASCADE
);

-- @block
DROP TABLE IF EXISTS Grupo CASCADE;
CREATE TABLE IF NOT EXISTS Grupo (
    ID_Gru INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Foto BYTEA NOT NULL,
    Descricao TEXT NOT NULL,

    -- ID da conversa para armazenar mensagens
    Conversa_ID INT NOT NULL,
    FOREIGN KEY (Conversa_ID) REFERENCES Conversa(ID_Con) ON DELETE CASCADE
);

-- @block
DROP TABLE IF EXISTS Participacao CASCADE;
CREATE TABLE Participacao (
  ID_Gru INT NOT NULL,
  ID_Per INT NOT NULL,
  
  PRIMARY KEY (ID_Gru, ID_Per),
  FOREIGN KEY (ID_Gru) REFERENCES Grupo(ID_Gru) ON DELETE CASCADE,
  FOREIGN KEY (ID_Per) REFERENCES Perfil(ID_Per) ON DELETE CASCADE
);

-- @block
DROP TABLE IF EXISTS Reagir CASCADE;
CREATE TABLE IF NOT EXISTS Reagir (
    Perfil_ID INT NOT NULL,
    Emoji VARCHAR(255) NOT NULL,
    Data TIMESTAMP NOT NULL,

    Publicacao_ID INT,
    Mensagem_ID INT,
    Story_ID INT,

    FOREIGN KEY (Perfil_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Publicacao_ID) REFERENCES Publicacao(ID_Pub) ON DELETE CASCADE,
    FOREIGN KEY (Mensagem_ID) REFERENCES Mensagem(ID_Msg) ON DELETE CASCADE,

    UNIQUE (Perfil_ID, Publicacao_ID),
    UNIQUE (Perfil_ID, Mensagem_ID),
    UNIQUE (Perfil_ID, Story_ID),
    
    -- Das chaves de publicação, mensagem e story, apenas uma deve ser não nula
    CHECK (
        (Publicacao_ID IS NOT NULL OR Mensagem_ID IS NOT NULL OR Story_ID IS NOT NULL) AND
        (Publicacao_ID IS NULL OR Mensagem_ID IS NULL) AND
        (Publicacao_ID IS NULL OR Story_ID IS NULL) AND
        (Story_ID IS NULL OR Mensagem_ID IS NULL)
    )
);
