DROP TRIGGER IF EXISTS relatar_nota_deletada;
DELIMITER $$
# Atualiza a data modificada sua nota anotes da atualização.
CREATE TRIGGER relatar_nota_deletada BEFORE DELETE
ON notas
FOR EACH ROW
BEGIN
	INSERT INTO notas_deletadas (descricao)
    VALUES
    (concat("Nota do aluno de id ", OLD.idAluno, " foi deletada"));
END $$
DELIMITER ;