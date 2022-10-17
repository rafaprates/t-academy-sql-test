DELIMITER $$
CREATE PROCEDURE remover_registro_notas_deletadas(IN in_idNotaDeletada INT)
BEGIN
    IF (SELECT COUNT(*) FROM notas_deletadas WHERE idNotaDeletada = in_idNotaDeletada) > 0 THEN
		DELETE FROM notas_deletadas WHERE idNotaDeletada = in_idNotaDeletada;
		SELECT "Registro deletado com sucesso";
	ELSE
		SELECT "idNotaDeletada inexistente";
	END IF;
END $$
DELIMITER ;