DROP PROCEDURE IF EXISTS alterar_nome_professor;
DELIMITER $$
CREATE PROCEDURE alterar_nome_professor(IN antigoNomeProfessor VARCHAR(32), IN novoNomeProfessor VARCHAR(32))
BEGIN 
	DECLARE mensagem_de_retorno VARCHAR(64);
	DECLARE quantidade_professor_com_novo_nome TINYINT;
    DECLARE quantidade_professor_com_antigo_nome TINYINT;
    
	SET quantidade_professor_com_novo_nome = (SELECT COUNT(*) FROM professores WHERE nome = novoNomeProfessor);
    SET quantidade_professor_com_antigo_nome = (SELECT COUNT(*) FROM professores WHERE nome = antigoNomeProfessor);
 
	IF quantidade_professor_com_novo_nome > 0 THEN
		SET mensagem_de_retorno = "erro: o novo nome já existe no banco";
	ELSEIF quantidade_professor_com_antigo_nome = 0 THEN
		SET mensagem_de_retorno = "erro: o antigo nome não foi encontrado no banco";
	ELSE 
		UPDATE professores SET nome = novoNomeProfessor WHERE nome = antigoNomeProfessor;
		SET mensagem_de_retorno = "nome alterado com sucesso";
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;