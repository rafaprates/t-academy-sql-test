# Coeficiente dos alunos em ordem descrescente
CREATE VIEW coeficiente_alunos 
AS
SELECT nome, ROUND(AVG(notas.nota), 2) AS coeficiente
FROM alunos
INNER JOIN notas ON notas.idAluno = alunos.idAluno
GROUP BY alunos.nome
ORDER BY coeficiente DESC;

SELECT * FROM coeficiente_alunos;



# Quantidade de matérias já cursadas por nome do aluno.
CREATE VIEW qtd_materias_ja_cursadas_por_aluno
AS
SELECT alunos.nome, COUNT(alunos_materias.idMateria) as qtd_disciplinas_cursadas
FROM alunos_materias
INNER JOIN alunos ON alunos.idAluno = alunos_materias.idAluno
GROUP BY alunos.nome;

SELECT * FROM qtd_materias_ja_cursadas_por_aluno;



# Nome das matérias e nome dos alunos que já as cursaram
DROP VIEW IF EXISTS nome_aluno_nome_materia_ja_cursadas;
CREATE VIEW nome_aluno_nome_materia_ja_cursadas
AS
SELECT  materias.nome AS nome_materia, alunos.nome AS nome_aluno
FROM alunos_materias
INNER JOIN alunos ON alunos.idAluno = alunos_materias.idAluno
INNER JOIN materias ON materias.idMateria = alunos_materias.idMateria
ORDER BY materias.nome;

SELECT * FROM nome_aluno_nome_materia_ja_cursadas;


# Média histórica dos reviews dos professores por nome do professor
CREATE VIEW media_historica_notas_professores
AS
SELECT professores.nome, ROUND(AVG(review_materias.review), 2) AS media_historica_professor
FROM review_materias
INNER JOIN materias ON materias.idMateria = review_materias.idMateria
INNER JOIN professores ON professores.idProfessor = materias.idProfessor
GROUP BY professores.nome;

SELECT * FROM media_historica_notas_professores;











CREATE VIEW nomes_alunos_professores_materias
AS
SELECT alunos.nome AS nomeAluno, materias.nome AS nomeMateria, professores.nome AS nomeProfessor FROM alunos_materias
INNER JOIN alunos ON alunos.idAluno = alunos_materias.idAluno
INNER JOIN materias ON materias.idMateria = alunos_materias.idMateria
INNER JOIN professores ON materias.idProfessor = professores.idProfessor;



SELECT * FROM alunos_materias
INNER JOIN alunos ON alunos.idAluno = alunos_materias.idAluno
INNER JOIN materias ON materias.idMateria = alunos_materias.idMateria
INNER JOIN professores ON materias.idProfessor = professores.idProfessor;





