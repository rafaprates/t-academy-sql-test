DROP PROCEDURE IF EXISTS alterar_nome_sala;
DELIMITER $$
CREATE PROCEDURE alterar_nome_sala(IN antigoNomeSala VARCHAR(32), IN novoNomeSala VARCHAR(32))
BEGIN 
	DECLARE mensagem_de_retorno VARCHAR(64);
	DECLARE quantidade_sala_com_novo_nome TINYINT;
    DECLARE quantidade_sala_com_antigo_nome TINYINT;
    
	SET quantidade_sala_com_novo_nome = (SELECT COUNT(*) FROM salas WHERE nome = novoNomeSala);
    SET quantidade_sala_com_antigo_nome = (SELECT COUNT(*) FROM salas WHERE nome = antigoNomeSala);
 
	IF quantidade_sala_com_novo_nome > 0 THEN
		SET mensagem_de_retorno = "erro: o novo nome já existe no banco";
	ELSEIF quantidade_sala_com_antigo_nome = 0 THEN
		SET mensagem_de_retorno = "erro: o antigo nome não foi encontrado no banco";
	ELSE 
		UPDATE salas SET nome = novoNomeSala WHERE nome = antigoNomeSala;
		SET mensagem_de_retorno = "nome alterado com sucesso";
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;