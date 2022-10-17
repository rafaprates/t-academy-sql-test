# Maior nota já registrada
SELECT MAX(nota) AS maior_nota
FROM notas;

# Menor nota já registrada
SELECT MIN(nota) AS menor_nota
FROM notas;

# Quantidade de notas entre 7 e 10
SELECT COUNT(nota) AS quantidade
FROM notas
WHERE nota BETWEEN 7 AND 10;

# Alunos com coeficiente igual ou superior à 7
SELECT nome, ROUND(AVG(nota), 2) AS coeficiente
FROM alunos
INNER JOIN notas on notas.idAluno = alunos.idAluno
GROUP BY alunos.nome
HAVING coeficiente >= 7;