DROP PROCEDURE IF EXISTS cadastrar_periodo;
DELIMITER $$
CREATE PROCEDURE cadastrar_periodo(IN nomePeriodo VARCHAR(32))
BEGIN 
	# Caso periodo já esteja cadastrado, retornar mensagem de erro
	DECLARE mensagem_de_retorno VARCHAR(64);
    
	IF ((SELECT COUNT(*) FROM periodos WHERE periodo = nomePeriodo) > 0) THEN
		SET mensagem_de_retorno = "erro: período já cadastrado no banco";
	ELSE
		SET mensagem_de_retorno = CONCAT("periodo ", nomePeriodo, " cadastrado com sucesso");
    END IF;
    SELECT mensagem_de_retorno;
END $$
DELIMITER ;