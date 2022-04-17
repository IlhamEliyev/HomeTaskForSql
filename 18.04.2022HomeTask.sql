Create database Spotify

use Spotify

Create table Artists(
Id int primary key Identity(1,1),
Name nvarchar(50) not null,
Surname nvarchar(50) not null
)

Insert into Artists Values ('Billie','Elish'),('2','Pack'),('Ekber','Novruzlu')

Create table Musics(
Id int primary key Identity(1,1),
Name nvarchar(50) not null,
TotalSecond time,
IsDeleted bit default 0,
ListenerCount int
)

Insert into Musics (Name,ListenerCount) values ('Happier Than Ever',583000),('Lovely',5834000),('Hit"em up',1223144),('California Love',323424),('Hani mene pul',514124),('Qirmizi winston',121221)

Create table Albums(
Id int primary key Identity(1,1),
Name nvarchar(50) not null,
MusicCount int
)

insert into Albums Values('All eyes on me',18),('Me against the world',12),('When we all fall assleep',13),('Don"t smile at me',16),('salam',15),('sagol',14)

Create table AlbumToArtist(
Id int primary key Identity(1,1),
AlbumId int references Albums(Id),
ArtistId int references Artists(Id)
)

insert into AlbumToArtist values (1,2),(2,2),(3,1),(4,1),(5,3),(6,3)

Create table MusicToArtist(
Id int primary key Identity(1,1),
MusicId int references Musics(Id),
ArtistId int references Artists(Id)
)

insert into MusicToArtist values (3,1),(4,1),(5,2),(6,2),(7,3),(8,3)

-- Query 1

create view GetMusicInfo 
as
Select M.Name 'Music Name',M.TotalSecond 'Duration',concat(Ar.Name,Ar.Surname) 'Artist FullName',Al.Name 'Album Name' from Artists as Ar
join AlbumToArtist as ATA on Ar.Id = ATA.ArtistId
join Albums as Al on ATA.AlbumId = Al.Id
join MusicToArtist as MTA on Ar.Id = MTA.ArtistId
join Musics as M on MTA.MusicId = M.Id

Select * from GetMusicInfo

-- Query 2

create view GetAlbumInfo 
as
Select Name 'Album Name', MusicCount 'Music Count' from Albums

Select * from GetAlbumInfo


-- Query 3

create procedure GetMusicNames (@ListenerCount int ,@Search nvarchar)
as
Select M.Name 'Music Name',M.TotalSecond 'Duration',concat(Ar.Name,Ar.Surname) 'Artist FullName',Al.Name 'Album Name' from Artists as Ar
join AlbumToArtist as ATA on Ar.Id = ATA.ArtistId
join Albums as Al on ATA.AlbumId = Al.Id
join MusicToArtist as MTA on Ar.Id = MTA.ArtistId
join Musics as M on MTA.MusicId = M.Id  
where ListenerCount> @ListenerCount And Charindex(@Search, M.Name) > 0

exec GetMusicNames 23123,'s'

-- query 4
create trigger InsteadOfDelete
on Musics
Instead of delete
as
begin
	Update Musics set IsDeleted = 1 where Id = (Select Id from deleted Musics)
end

delete  from Musics where Id = 4
Select * from Musics 
