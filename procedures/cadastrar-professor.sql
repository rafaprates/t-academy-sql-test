DROP PROCEDURE IF EXISTS cadastrar_professor;
DELIMITER $$
CREATE PROCEDURE cadastrar_professor(IN nomeProfessor VARCHAR(32))
BEGIN 
	# Caso professor já esteja cadastrado, retornar mensagem de erro
	DECLARE mensagem_de_retorno VARCHAR(64);
	DECLARE quantidade_professores_com_nome TINYINT;
	SET quantidade_professores_com_nome = (SELECT COUNT(*) FROM professores WHERE nome = nomeProfessor);
 
	IF quantidade_professores_com_nome > 0 THEN
		SET mensagem_de_retorno = "erro: nome já existe no banco";
	ELSE
		SET mensagem_de_retorno = CONCAT("professor ", nomeProfessor, " cadastrado com sucesso");
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;