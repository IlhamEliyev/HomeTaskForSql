--Library db-s? olsun.
--Books, Authors var v? Genres table-l?ri olsun.
--Bir kitab?n bir authoru ola bil?r.
--Bir kitab?n bir çox genre-? ola bil?r v? bir genre-a bir çox kitab aid ola bil?r.
--Relationlar? qurduqdan sonra bu üç table-ni birl??dir?n bir join yaz?n.

create database Library

use Library

create table Books (
Id int Primary Key Identity,
Name nvarchar(100) not null,
AuthorId int references Authors(Id)
)

Insert into Books values('Bu sheherde kimse yoxdur',1),('Qan ici',1),('Qara Volqa',3),('Reqs Meydancasindan Dunyaya Seyahet',2)

create table Authors (
Id int Primary Key Identity,
Name nvarchar(100) not null,
Surname nvarchar(100) not null
)

insert into Authors Values ('Elxan','Elatli'),('Aqata','Kristi'),('Rovshen','Abduloglu') 

create table Genres (
Id int Primary Key Identity,
Genre nvarchar(100) not null
)

insert into Genres Values ('Romantic'),('Dram'),('Psixoloji'),('Fantastik')

Create Table AuthorToGenre(
Id int primary key Identity,
AuthorId int references Authors(Id),
GenreId int references Genres (Id)
)

insert into AuthorToGenre Values(1,1),(2,2),(3,3)

Select * from AuthorToGenre as ATG
join Authors as A on ATG.AuthorId = A.Id
join Genres as G on ATG.GenreId = G.Id
join Books as B on B.AuthorId = A.Id

