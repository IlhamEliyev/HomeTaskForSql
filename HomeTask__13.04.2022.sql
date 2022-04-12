create database HomeTask13_04_2022

use HomeTask13_04_2022

create table Employees(
Id int unique,
[Name] nvarchar(100) not null,
Surname nvarchar(100) not null,
Profession nvarchar(100),
Salary decimal
)

insert into Employees  values(1,'Vusal','Nasirli','BackEndDeveloper',2000,1),(2,'Ezmemmed','Cabrayilov','BackEndDeveloper',2500,2),(3,'Emiliya','Ahmadova','FrontEndDeveloper',3000,3)
insert into Employees values(4,'Ahmed','Ahmadov','BackEndDeveloper',10000,2)

create table Departments(
Id int unique,
[Name] nvarchar(100) not null,
EmployeesCount int,
CreateTime DateTime default getdate()
)

insert into Departments values(1,'AileShirketi',48,default,1)
insert into Departments values(2,'Rahat',56,default,2),(3,'Salam',89,default,3)

create table Managers(
Id int unique,
[Name] nvarchar(100) not null,
Surname nvarchar(100) not null,
Profession nvarchar(100),
Salary decimal
)

Insert into Managers values (1,'Ilham','Aliyev','FullStackDeveloper',5000),(2,'Ulvi','Abdullazade','FullStackDeveloper',7000),(3,'Bashir','Azizov','FullStackDeveloper',7000)



alter table Departments
add ManagerId int references Managers (Id)

alter table Employees
add DepartmentId int references Departments (Id)

--Query 1

Select [Name],Surname,Salary From Employees where Salary < (Select avg(Salary)  from Employees)

--Query 2

Select [Name],Surname,Salary From Employees where Salary > (Select avg(Salary)  from Managers)

--Query 3

Select [Name],Surname,Salary From Employees Where DepartmentId = (Select Id From Departments where Name = 'Rahat')

--Query 4

Select [Name],Surname,Salary From Employees where DepartmentId = (Select Id From Departments where ManagerId = (Select Id from Managers where [Name] = 'Ilham')) 
 
 

