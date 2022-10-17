DROP TRIGGER atualizar_data_modificacao_nota;
DELIMITER $$
# Atualiza a data modificada da nota antes da atualização.
CREATE TRIGGER atualizar_data_modificacao_nota BEFORE UPDATE
ON notas
FOR EACH ROW
BEGIN
	IF (OLD.idNota = NEW.idNota) THEN
		SET NEW.modificada_em = now();
	END IF;
END $$
DELIMITER ;