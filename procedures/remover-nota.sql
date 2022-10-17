DROP PROCEDURE IF EXISTS remover_nota;
DELIMITER $$
CREATE PROCEDURE remover_nota(IN in_idNota INT)
BEGIN 
	IF (SELECT COUNT(*) FROM notas WHERE idNota = in_idNota) > 0 THEN
		DELETE FROM notas WHERE idNota = in_idNota;
	ELSE
		SELECT "erro: id da nota não encontrado";
	END IF;
END $$
DELIMITER ;