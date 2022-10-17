DROP PROCEDURE IF EXISTS alterar_nome_aluno;
DELIMITER $$
CREATE PROCEDURE alterar_nome_aluno(IN antigoNomeAluno VARCHAR(32), IN novoNomeAluno VARCHAR(32))
BEGIN 
	DECLARE mensagem_de_retorno VARCHAR(64);
	DECLARE quantidade_aluno_com_novo_nome TINYINT;
    DECLARE quantidade_aluno_com_antigo_nome TINYINT;
    
	SET quantidade_aluno_com_novo_nome = (SELECT COUNT(*) FROM alunos WHERE nome = novoNomeAluno);
    SET quantidade_aluno_com_antigo_nome = (SELECT COUNT(*) FROM alunos WHERE nome = antigoNomeAluno);
 
	IF quantidade_aluno_com_novo_nome > 0 THEN
		SET mensagem_de_retorno = "erro: o novo nome já existe no banco";
	ELSEIF quantidade_aluno_com_antigo_nome = 0 THEN
		SET mensagem_de_retorno = "erro: o antigo nome não foi encontrado no banco";
	ELSE 
		UPDATE alunos SET nome = novoNomeAluno WHERE nome = antigoNomeAluno;
		SET mensagem_de_retorno = "nome alterado com sucesso";
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;





SELECT COUNT(*) FROM alunos WHERE nome = "aaaaa";

SELECT * FROM alunos;
CALL alterar_nome_aluno("Theo", "Rafael");
CALL alterar_nome_aluno("Rafael", "Theo");

# antigo nome nao encontrado
CALL alterar_nome_aluno("aaaaa", "Jonas");

# novo nome ja existe
CALL alterar_nome_aluno("aaaa", "Theo");