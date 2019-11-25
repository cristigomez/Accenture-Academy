CREATE DATABASE BibliotecaAA;
GO

USE BibliotecaAA;
GO

CREATE TABLE Generos 
(
	Id int primary key identity(1,1),
	Nombre varchar(20) not null,
	CONSTRAINT UQ_NOMBRE_GENERO UNIQUE (Nombre)
)

CREATE TABLE Editoriales 
(
	Id int primary key identity(1,1),
	Nombre varchar(20) not null,
	CONSTRAINT UQ_NOMBRE_EDITORIALES UNIQUE (Nombre)
)

CREATE TABLE Autores 
(
	Id int primary key identity(1,1),
	Nombre varchar(20) not null,
	Apellido varchar(20) not null
);


CREATE TABLE Libros
(
	ID int primary key identity (1,1),
	Nombre varchar(30) not null,
	Id_Autor int not null,
	Id_Genero int not null,
	Id_Editorial int not null,
	CONSTRAINT FK_LIBROS_AUTORES FOREIGN KEY (Id_Autor) REFERENCES Autores(Id) ON DELETE CASCADE,
	CONSTRAINT FK_LIBROS_GENEROS FOREIGN KEY (Id_Genero) REFERENCES Generos(Id) ON DELETE CASCADE,
	CONSTRAINT FK_LIBROS_EDITORIALES FOREIGN KEY (Id_Editorial) REFERENCES Editoriales(Id) ON DELETE CASCADE,
)


INSERT INTO Generos
(Nombre)
VALUES
('Suspenso'),
('Novelas'),
('Policiales'),
('Poesia'),
('Ensayo'),
('Aventuras');
GO

INSERT INTO Editoriales
(Nombre)
VALUES
('Planeta'),
('Dunken'),
('El Ateneo'),
('Penguin Random'),
('Sudestada'),
('Paradigma'),
('Alsina'),
('Kiel'),
('Estrada');
GO



INSERT INTO Autores
(Nombre, Apellido)
VALUES
('Virginia','Woolf'),
('Simone','De Beauvoir'),
('Emily','Brontë'),
('Gloria','Fuertes'),
('Susan','Sontang'),
('Marguerite','Yourcenar'),
('Harper','Lee'),
('Laura','Esquivel'),
('Patricia','Highsmith'),
('Irène','Némirovsky');
GO


INSERT INTO Libros
(Nombre, Id_Autor, Id_Editorial, Id_Genero)
VALUES 
('Una habitacion propia', 5, 12, 4),
('Las olas', 6, 14, 1),
('Emma', 3, 11, 3),
('Orgullo y prejuicio', 4, 9, 6),
('La campana de cristal', 8, 15, 3),
('Cumbres Borrascosas', 6, 13, 4),
('Persuasión', 1, 8, 1),
('La mujer rota', 2, 9, 2),
('El segundo sexo', 3, 10, 3),
('La ley del amor', 4, 11, 5),
('Como agua para chocolate', 6, 12, 6),
('Carol', 7, 13, 5),
('Extraños en un tren', 7, 12, 2),
('La enfermedad y sus metaforas', 1, 8, 5),
('Ante el dolor de los demás', 2, 9, 6),
('Vamps & Tramps', 7, 11, 3),
('Segun venga el juego', 9, 9, 6),
('El año del pensamiento mágico', 4, 14, 3),
('Noches azules', 4, 14, 2),
('My life on the road', 6, 11, 1),
('Bajar es lo peor', 6, 11, 2);
GO



Select 
  Libros.Nombre, Generos.Nombre, Autores.Nombre 
from 
  Libros
INNER JOIN 
  Autores
On 
  Libros.Id_Autor = Autores.Id
INNER JOIN 
  Generos
On 
  Libros.Id_Genero = Generos.Id
INNER JOIN 
  Editoriales
On 
  Libros.Id_Editorial = Editoriales.Id
Where 
  Editoriales.Id = '14' 


  
