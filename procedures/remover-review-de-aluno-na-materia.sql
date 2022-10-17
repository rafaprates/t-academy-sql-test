DROP PROCEDURE IF EXISTS remover_review_de_aluno_na_materia;
DELIMITER $$
CREATE PROCEDURE remover_review_de_aluno_na_materia(IN in_idAluno INT, IN in_idMateria INT)
BEGIN
    IF (SELECT COUNT(*) FROM review_materias WHERE idAluno = in_idAluno AND idMateria = in_idMateria) > 0 
    THEN
		DELETE FROM review_materias WHERE idAluno = in_idAluno AND idMateria = in_idMateria;
		SELECT "Registro removido com sucesso";
	ELSE
		SELECT "Review inexiste";
	END IF;
END $$
DELIMITER ;