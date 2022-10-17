DROP PROCEDURE IF EXISTS cadastrar_aluno;
DELIMITER $$
CREATE PROCEDURE cadastrar_aluno(IN nomeAluno VARCHAR(32))
BEGIN 
# Caso aluno já esteja cadastrado, retornar mensagem de erro
	DECLARE mensagem_de_retorno VARCHAR(64);
	DECLARE quantidade_aluno_com_nome TINYINT;
	SET quantidade_aluno_com_nome = (SELECT COUNT(*) FROM alunos WHERE nome = nomeAluno);
 
	IF quantidade_aluno_com_nome > 0 THEN
		SET mensagem_de_retorno = "erro: nome já existe no banco";
	ELSE
		SET mensagem_de_retorno = CONCAT("aluno ", nomeAluno, " cadastrado com sucesso");
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;