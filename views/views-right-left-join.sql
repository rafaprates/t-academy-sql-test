# Quantidade de salas sem utilizacao
CREATE VIEW quantidade_salas_sem_utilizacao 
AS
SELECT COUNT(*) AS quantidade_salas_sem_utilizacao
FROM salas
LEFT JOIN materias ON  materias.idSala = salas.idSala
WHERE materias.idSala IS NULL;

# Nome de alunos que não estão matriculados em alguma disciplina
CREATE VIEW alunos_nao_matriculados 
AS
SELECT COUNT(*) AS alunos_nao_matriculados
FROM alunos_materias
RIGHT JOIN alunos ON alunos.idAluno = alunos_materias.idAluno
WHERE alunos_materias.idAluno IS NULL;


SELECT * FROM quantidade_salas_sem_utilizacao;
SELECT * FROM alunos_nao_matriculados;