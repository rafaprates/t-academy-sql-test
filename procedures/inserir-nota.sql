DROP PROCEDURE IF EXISTS inserir_nota;
DELIMITER $$
CREATE PROCEDURE inserir_nota(IN in_idAluno INT, IN in_idMateria INT, IN in_nota DOUBLE)
BEGIN 
	DECLARE mensagem_de_retorno VARCHAR(64);
	IF (in_nota < 0 OR in_nota > 10) THEN
		SET mensagem_de_retorno = "erro: nota fora do intervalo entre 0 e 10";
	ELSE 
		SET mensagem_de_retorno = "nota inserida com sucesso";
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;