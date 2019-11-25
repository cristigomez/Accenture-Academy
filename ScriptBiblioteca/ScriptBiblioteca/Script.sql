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