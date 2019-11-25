CREATE DATABASE EntityPrueba;
GO

USE EntityPrueba;
GO

CREATE TABLE Country 
(
	Id int primary key identity(1,1),
	Nombre varchar(100) not null,
	Code varchar(4) not null 
)

CREATE TABLE Person 
(
	Id int primary key identity(1,1),
	PersonName varchar(100) not null unique,
	CountryId int not null,
	CONSTRAINT Fk_Country FOREIGN KEY (CountryId)
						  REFERENCES Country(Id)
);
GO

CREATE TABLE Belonging 
(
	Id int primary key identity(1,1),
	PersonId int not null,
	[Name] varchar(200) not null,
	CONSTRAINT Fk_Person FOREIGN KEY (PersonId)
						  REFERENCES Person(Id)
);