-- @block
-- Dados dois perfis, cria um direct entre eles, junto da conversa e da participação dos perfis nela
-- Retorna o id da conversa criada
    CREATE OR REPLACE FUNCTION novo_direct(perfil1 INT, perfil2 INT) RETURNS INT AS $$
    DECLARE
        nova_conversa_id INT;
    BEGIN
        RAISE NOTICE 'Criando direct entre % e %', perfil1, perfil2;
        -- Cria a conversa para comportar as mensagens
        INSERT INTO Conversa (ID_Con, Data) 
        VALUES ((SELECT COALESCE(MAX(ID_Con), 0) + 1 FROM Conversa), NOW())
        RETURNING ID_Con INTO nova_conversa_id;

        -- Se perfil1 for nulo, levanta um erro
        IF perfil1 IS NULL THEN
            RAISE EXCEPTION 'Perfil 1 não pode ser nulo';
        END IF;
        -- Se perfil2 for nulo, levanta um erro
        IF perfil2 IS NULL THEN
            RAISE EXCEPTION 'Perfil 2 não pode ser nulo';
        END IF;

        -- Insere a participação dos perfis na conversa na tabela Participacao
        INSERT INTO Participacao (ID_Con, ID_Per) VALUES (nova_conversa_id, perfil1);
        INSERT INTO Participacao (ID_Con, ID_Per) VALUES (nova_conversa_id, perfil2);

        -- Cria a direct entre os perfis
        IF perfil1 < perfil2 THEN
            INSERT INTO Direct (Perfil1_ID, Perfil2_ID, Conversa_ID)
            VALUES (perfil1, perfil2, nova_conversa_id);
        ELSIF perfil1 > perfil2 THEN
            INSERT INTO Direct (Perfil1_ID, Perfil2_ID, Conversa_ID)
            VALUES (perfil2, perfil1, nova_conversa_id);
        ELSE
            RAISE EXCEPTION 'Não é possível criar um direct entre o mesmo perfil';
        END IF;

        RETURN nova_conversa_id;
    END;
    $$ LANGUAGE plpgsql;

-- @block
/* Função que, dados dois perfis, retorna o id da conversa direct entre eles sendo que,
se ela não existir, ela é criada. */
    CREATE OR REPLACE FUNCTION garantir_direct(perfil1 INT, perfil2 INT) RETURNS INT AS $$
    DECLARE
        conversa_id INT;
    BEGIN
        RAISE NOTICE 'Garantir direct entre % e %', perfil1, perfil2;
        -- Verifica se existe um direct entre os perfis
        SELECT d.Conversa_ID INTO conversa_id
        FROM Direct d
        WHERE (d.Perfil1_ID = perfil1 AND d.Perfil2_ID = perfil2)
        OR (d.Perfil1_ID = perfil2 AND d.Perfil2_ID = perfil1);

        -- Se não existir, cria o direct e as dependências
        IF NOT FOUND THEN
            conversa_id := novo_direct(perfil1, perfil2);
        END IF;

        RETURN conversa_id;
    END;
    $$ LANGUAGE plpgsql;

-- @block
/* Função trigger baseada no garantir_direct */
    CREATE OR REPLACE FUNCTION tratar_reacao() RETURNS TRIGGER AS $$
    DECLARE autor_id INT;
    BEGIN
        -- Se a reação for a um story, garante que o direct exista
        IF NEW.Story_ID IS NOT NULL THEN
            -- Debugging statement to check NEW.Story_ID
            RAISE NOTICE 'Story_ID: %', NEW.Story_ID;
            -- Busca o autor do story
            autor_id := (SELECT Story.Autor_ID FROM Story WHERE ID_Sto = NEW.Story_ID);
            RAISE NOTICE 'Autor do story: %', autor_id;
            -- Se o autor for igual ao perfil que reagiu, levanta um erro
            IF autor_id = NEW.Perfil_ID THEN
                RAISE EXCEPTION 'Não é possível reagir ao próprio story';
            END IF;
            -- Garante que o direct exista
            PERFORM garantir_direct(NEW.Perfil_ID, autor_id);
        END IF;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

-- @block
-- Trigger que chama a função tratar_reacao antes de inserir uma reação
    CREATE OR REPLACE TRIGGER trg_tratar_reacao
    AFTER INSERT ON Reagir
    FOR EACH ROW
    EXECUTE FUNCTION tratar_reacao();
