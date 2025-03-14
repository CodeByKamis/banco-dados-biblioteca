CREATE DATABASE biblioteca_kamis;
USE biblioteca_kamis;
-- drop database biblioteca_kamis


CREATE TABLE nivel_associacao(
	id_nivel INT AUTO_INCREMENT PRIMARY KEY,
	nome_nivel VARCHAR (100)
);

INSERT INTO nivel_associacao (nome_nivel)
VALUES
('novato'),
('regular'),
('premium'),
('plus_premium');

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_nivel INT NOT NULL,
    nome varchar (100),
    cpf varchar (11),
    id_nivel INT,
    FOREIGN KEY (id_nivel) REFERENCES nivel_associacao (id_nivel)
);

#pra colocar os dados de nome da tabela usuario, id_nivel e cpf
INSERT INTO usuario(nome, cpf, id_nivel)
VALUES
('kamila', '12357684923', 1),
('Jualiana', '42343432542', 1),
('Julia', '23445607653', 2),
('Paula', '45851500548', 4),
('Vitória', '53748521038', 1),
('Pâmela', '32154304478', 2),
('Mirella', '41157874141', 3),
('Márcia', '48510065498', 3);


#----------------------------    AGORA VAMOS FAZER AS COISAS DE LIVRO ETC.   -------------------------------------------
CREATE TABLE livros(
	id_livros INT AUTO_INCREMENT PRIMARY KEY,
    titulo varchar (100),
    descricao varchar (100),
    ISBN varchar (100)
);
INSERT INTO livros(titulo, descricao, ISBN)
VALUES
('Crepusculo', 'Primeiro livro do Crepúsculo', 133),
('Lua Nova', 'Segundo livro do Crepúsculo, o Edward some', 136),
('Eclipse', 'Terceiro livro do Crepúsuclo, a Bella fica noiva', 139),
('Amanhecer', 'Quarto livro do Crepúsculo, casamento, gravidez, a Bella vira vampira e guerra', 142),
('Sol da Meia-Noite', 'Toda a história na visão do Edward', 145),
('The Short Second Life of Bree Tanner', 'É a menininha morta no Eclipse', 148);


CREATE TABLE emprestimo(
	id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio date,
    data_fim date,
    id_usuario INT,
    id_livro INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
);
INSERT INTO emprestimo(data_inicio, data_fim)
VALUES
('05/02/2002', '20/02/2002'),
('05/02/2002', '20/02/2002'),
('05/02/2002', '20/02/2002');



CREATE TABLE genero (
	id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome_genero varchar (100)
);

INSERT INTO genero (nome_genero)
VALUES
('Romance'),
('Drama'),
('Comédia'),
('Infantil'),
('Ficção');
 #SELECT * FROM GENERO

CREATE TABLE livo_genero(
	id_livro_genero INT AUTO_INCREMENT PRIMARY KEY, 
    id_livros INT,
    id_genero INT,
    FOREIGN KEY (id_livros) REFERENCES livros (id_livros),
    FOREIGN KEY (id_genero) REFERENCES genero (id_genero)
);


CREATE TABLE autores(
	id_autores INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100),
    data_de_nascimento date,
    briografia varchar (500)
);
INSERT INTO autores(nome,data_de_nascimento, briografia)
VALUES
('Stephenie Mever', 24/12/1973, 'Stephenie Meyer nasceu nos Estados Unidos e é a autora da famosa saga Crepúsculo. Seu primeiro livro, Twilight (2005), foi inspirado por um sonho e alcançou grande sucesso, levando a série a se expandir para Lua Nova, Eclipse e Amanhecer');

CREATE TABLE livro_autor(
	id_livro_autor INT AUTO_INCREMENT PRIMARY KEY,
    id_livors INT,
    id_autores INT, 
    FOREIGN KEY (id_livors) REFERENCES livros (id_livros),
    FOREIGN KEY (id_autores) REFERENCES autores (id_autores)
);
