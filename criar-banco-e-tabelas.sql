CREATE DATABASE escola;

CREATE TABLE alunos (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32) NOT NULL
);

create TABLE professores (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(32) NOT NULL
);

CREATE TABLE periodos (
    idPeriodo INT PRIMARY KEY AUTO_INCREMENT,
    periodo VARCHAR(8) NOT NULL
);

CREATE TABLE salas (
	idSala INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(8) NOT NULL
);

CREATE TABLE materias (
	idMateria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32),
    idProfessor INT,
	idPeriodo INT,
    idSala INT,
	FOREIGN KEY (idProfessor) REFERENCES professores(idProfessor),
	FOREIGN KEY (idPeriodo) REFERENCES periodos(idPeriodo),
    FOREIGN KEY (idSala) REFERENCES salas(idSala)
);


CREATE TABLE alunosMaterias (
	idAlunosMaterias INT PRIMARY KEY AUTO_INCREMENT,
	idAluno INT,
    idMateria INT,
	FOREIGN KEY (idAluno) REFERENCES alunos(idAluno),
	FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
);


CREATE TABLE notas (
	idNota INT PRIMARY KEY AUTO_INCREMENT,
	nota DOUBLE,
	idAluno INT,
    idMateria INT,
    FOREIGN KEY (idAluno) REFERENCES alunos(idAluno),
    FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
);

CREATE TABLE review_professores (
	idReviewProfessor INT,
	idMateria INT,
    review DOUBLE NOT NULL,
	FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
);