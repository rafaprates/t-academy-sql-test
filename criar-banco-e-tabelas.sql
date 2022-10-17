DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;
USE escola;

CREATE TABLE alunos (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32) NOT NULL,
    data_nascimento DATE
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

CREATE TABLE IF NOT EXISTS materias (
	idMateria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32) NOT NULL,
    idProfessor INT,
	idPeriodo INT,
    idSala INT,
	FOREIGN KEY (idProfessor) REFERENCES professores(idProfessor),
	FOREIGN KEY (idPeriodo) REFERENCES periodos(idPeriodo),
    FOREIGN KEY (idSala) REFERENCES salas(idSala)
);


CREATE TABLE alunos_materias (
	idAlunosMaterias INT PRIMARY KEY AUTO_INCREMENT,
	idAluno INT NOT NULL,
    idMateria INT NOT NULL,
	FOREIGN KEY (idAluno) REFERENCES alunos(idAluno),
	FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
);

CREATE TABLE notas (
	idNota INT PRIMARY KEY AUTO_INCREMENT,
	nota DOUBLE NOT NULL DEFAULT 0.0,
	idAluno INT NOT NULL,
    idMateria INT NOT NULL,
    criada_em DATETIME DEFAULT now(),
    modificada_em DATETIME DEFAULT now(),
    FOREIGN KEY (idAluno) REFERENCES alunos(idAluno),
    FOREIGN KEY (idMateria) REFERENCES materias(idMateria)
);

DROP TABLE IF EXISTS notas_deletadas;
CREATE TABLE notas_deletadas (
	idNotaDeletada INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(255)
);

CREATE TABLE review_materias (
	idReview INT PRIMARY KEY AUTO_INCREMENT,
    idAluno INT NOT NULL,
	idMateria INT NOT NULL,
    review DOUBLE NOT NULL,
    criado_em DATETIME,
	FOREIGN KEY (idMateria) REFERENCES materias(idMateria),
    FOREIGN KEY (idAluno) REFERENCES alunos(idAluno)
);

USE escola;