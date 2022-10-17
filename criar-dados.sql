select * from alunos;

INSERT INTO alunos (nome, data_nascimento)
VALUES 
("Miguel", "2000-01-01"),
("Arthur", "2002-01-01"),
("Gael", "2004-01-01"),
("Heitor", "2004-01-01"),
("Helena", "2004-01-01"),
("Alice", "2005-01-01"),
("Theo", "2000-01-01"),
("Lauro", "2001-01-01"),
("Davi", "2001-01-01"),
("Gabriel", "2000-01-01"),
("Joelson", "2000-01-01");

UPDATE alunos SET data_nascimento = "2000-01-02" WHERE nome = "Gabriel";
DELETE FROM alunos WHERE nome = "Joelson";


INSERT INTO professores (nome)
VALUES
("Maria"),
("Ana"),
("Lucas"),
("José"),
("João"),
("Jéssica"),
("Bruna"),
("Gabriel"),
("Felipe"),
("Amanda"),
("Jandira");

UPDATE professores SET nome = "Joelma" WHERE nome = "Amanda";
DELETE FROM alunos WHERE nome = "Joelma";


INSERT INTO periodos (periodo)
VALUES
("2027-1"),
("2027-2"),
("2028-1"),
("2028-2"),
("2029-1"),
("2029-2"),
("2030-1"),
("2030-2"),
("2031-1"),
("2031-2"),
("2032-1");

UPDATE periodos SET periodo = "2125-2" WHERE periodo = "2032-1";
DELETE FROM periodos WHERE periodo = "2125-2";


INSERT INTO salas (nome)
VALUES
("1A"),
("1B"),
("1C"),
("1D"),
("1E"),
("1F"),
("2A"),
("2B"),
("2C"),
("2D"),
("2E");

UPDATE salas SET nome = "ABC" WHERE nome = "2E";
DELETE FROM salas WHERE nome = "abc";


INSERT INTO materias (nome, idProfessor, idPeriodo, idSala)
VALUES
("História", 1, 1, 1),
("História", 1, 2, 2),
("Matemática", 2, 1, 2),
("Matemática", 2, 2, 3),
("Física", 3, 1, 4),
("Física", 3, 2, 5),
("Português", 4, 1, 7),
("Português", 4, 2, 7),
("Ed. Física", 5, 1, 8),
("Ed. Física", 5, 2, 9),
("Química", 6, 1, 10),
("Química", 6, 2, 10),
("ABC", 6, 2, 10);

UPDATE materias SET nome = "ABC" WHERE nome = "2E";
DELETE FROM materias WHERE nome = "ABC";


INSERT INTO alunos_materias (idAluno, idMateria)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 4),
(3, 5),
(4, 8),
(4, 9),
(5, 6),
(5, 7),
(6, 8),
(6, 8),
(7, 6),
(2, 3),
(5, 7),
(4, 6),
(6, 9);


INSERT INTO notas (nota, idAluno, idMateria)
VALUES
(7.5, 1, 1),
(8, 1, 1),
(3.5, 1, 1),
(9.9, 2, 1),
(10, 2, 1),
(0, 2, 1),
(6, 3, 1),
(2.5, 3, 1),
(9.0, 3, 1),
(7.5, 4, 1),
(7.5, 4, 1),
(7.5, 4, 1);

UPDATE notas SET nota = 10 WHERE idNota = (SELECT MAX(idAlunosMaterias) FROM alunos_materias);
DELETE FROM notas WHERE idNota = (SELECT MAX(idAlunosMaterias) FROM alunos_materias);


INSERT INTO review_materias (idAluno, idMateria, review)
VALUES
(1, 1, 10.0),
(1, 2, 5.0),
(2, 1, 3.0),
(2, 2, 8.0),
(3, 4, 10.0),
(3, 5, 7.0),
(4, 8, 10.0),
(4, 9, 9.0),
(4, 6, 7.0),
(4, 7, 7.0),
(5, 5, 5.0);


UPDATE review_materias SET review = 10.0 WHERE idReview = 10;
DELETE FROM review_materias WHERE idReview = 10;