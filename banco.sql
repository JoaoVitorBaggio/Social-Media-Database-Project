CREATE TABLE Perfil (
    ID_Per INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Foto VARCHAR(255),
    Descricao TEXT NOT NULL,
    Privado BOOLEAN DEFAULT FALSE
);

CREATE TABLE Seguir (
    Seguidor_ID INT NOT NULL,
    Seguido_ID INT NOT NULL,
    Melhores_Amigos BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (Seguidor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Seguido_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
);

CREATE TABLE Publicacao (
    ID_Pub INT PRIMARY KEY,
    Data DATETIME NOT NULL,
    Autor_ID INT NOT NULL,
    Imagem BLOB NOT NULL,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE
);

CREATE TABLE Curtir (
    Perfil_ID INT NOT NULL,
    Publicacao_ID INT NOT NULL,

    FOREIGN KEY (Perfil_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Publicacao_ID) REFERENCES Publicacao(ID_Pub) ON DELETE CASCADE
);

CREATE TABLE Reagir (
    ID_Rea INT PRIMARY KEY,
    Emoji VARCHAR(255) NOT NULL,
    Perfil_ID INT NOT NULL,
    Publicacao_ID INT,
    Mensagem_ID INT,

    FOREIGN KEY (Perfil_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Publicacao_ID) REFERENCES Publicacao(ID_Pub) ON DELETE CASCADE,
    FOREIGN KEY (Mensagem_ID) REFERENCES Mensagem(ID_Msg) ON DELETE CASCADE
);

CREATE TABLE Story (
    ID_Sto INT PRIMARY KEY,
    Data DATETIME NOT NULL,
    Video BLOB NOT NULL,
    Autor_ID INT NOT NULL,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE
);

CREATE TABLE Comentario (
    ID_Com INT PRIMARY KEY,
    Data DATETIME NOT NULL,
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

    -- Uma referência tem que existir
    CHECK (Publicacao_ID IS NOT NULL OR Comentario_ID IS NOT NULL OR Story_ID IS NOT NULL),
    -- Não pode haver duas referências
    CHECK (Publicacao_ID IS NULL OR Comentario_ID IS NULL),
    CHECK (Publicacao_ID IS NULL OR Story_ID IS NULL),
    CHECK (Story_ID IS NULL OR Comentario_ID IS NULL)
);

CREATE TABLE Mensagem (
    ID_Msg INT PRIMARY KEY,
    Autor_ID INT NOT NULL,
    Data DATETIME NOT NULL,
    Texto TEXT NOT NULL,
    Conversa_ID INT NOT NULL,

    FOREIGN KEY (Autor_ID) REFERENCES Perfil(ID_Per) ON DELETE CASCADE,
    FOREIGN KEY (Conversa_ID) REFERENCES Conversa(ID_Con) ON DELETE CASCADE,

    -- Propriedades de resposta
    -- Story ou mensagem referência
    ID_Story_Ref INT,
    ID_Msg_Ref INT,

    FOREIGN KEY (ID_Story) REFERENCES Story(ID_Story) ON DELETE CASCADE,
    FOREIGN KEY (ID_Msg_Resposta) REFERENCES Mensagem(ID_Msg) ON DELETE CASCADE,

    -- Não pode haver duas referências
    CHECK (ID_Story_Ref IS NULL OR ID_Msg_Ref IS NULL)
);

CREATE TABLE Conversa (
  ID_Con INT PRIMARY KEY,
  Data DATETIME NOT NULL,
  DM BOOLEAN NOT NULL
);

CREATE TABLE Participacao (
  ID_Con INT NOT NULL,
  ID_Per INT NOT NULL,
  
  FOREIGN KEY (ID_Con) REFERENCES Conversa(ID_Con) ON DELETE CASCADE,
  FOREIGN KEY (ID_Per) REFERENCES Perfil(ID_Per) ON DELETE CASCADE
);
