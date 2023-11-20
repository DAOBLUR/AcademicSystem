CREATE TABLE Course (
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name varchar(100) NOT NULL
);

CREATE TABLE Student (
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name varchar(75) NOT NULL,
	Email varchar(30) unique NOT NULL,
	BirthDate date NOT NULL,
	Address varchar(75) NOT NULL,
	Phone varchar(9) unique NOT NULL
);

CREATE TABLE Teacher (
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name varchar(75) NOT NULL,
	Email varchar(30) unique NOT NULL,
	Phone varchar(9) unique NOT NULL
);

CREATE TABLE Enrollment (
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	StudentId int NOT NULL REFERENCES Student,
	CourseId int NOT NULL REFERENCES Course,
	TeacherId int NOT NULL REFERENCES Teacher,
	EnrollmentDate DATE NOT NULL,
	Grade numeric(4,2) NOT NULL
);


insert into Course values ('Introduction to Computers and Engineering Problem Solving');
insert into Course values ('Uncertainty in Engineering');
insert into Course values ('Project Evaluation');
insert into Course values ('Introduction to Civil Engineering Design');
select * from Course;


insert into Student values ('Ernesto Morena', 'emorena@email.com', '2000-10-10', '742 de Evergreen Terrace', '987654320');
insert into Student values ('To�o Gennady', 'tgennady@email.com', '2000-10-11', '742 de Evergreen Terrace', '987654321');
insert into Student values ('Baldo Gerasim', 'bgerasim@email.com', '2000-10-12', '742 de Evergreen Terrace', '987654322');
insert into Student values ('Orfeo Pierina', 'opierina@email.com', '2000-10-13', '742 de Evergreen Terrace', '987654323');
insert into Student values ('Fausta Alessio', 'falessio@email.com', '2000-10-14', '742 de Evergreen Terrace', '987654324');
insert into Student values ('Wilmer Fabiano', 'wfabiano@email.com', '2000-10-15', '742 de Evergreen Terrace', '987654325');
insert into Student values ('Leticia Nazario', 'lnazario@email.com', '2000-10-16', '742 de Evergreen Terrace', '987654326');
select * from Student;


insert into Teacher values ('Angelino Leopoldo', 'aleopoldo@email.com', '987654324');
insert into Teacher values ('Imelda Nicolina', 'inicolina@email.com', '987654325');
insert into Teacher values ('Nevio Conchita', 'nconchita@email.com', '987654326');
insert into Teacher values ('Faddey Romualdo', 'fromualdo@email.com', '987654327');
select * from Teacher;


insert into Enrollment values (1, 1, 1, '2020-10-10', 0);
insert into Enrollment values (2, 1, 1, '2020-10-10', 0);
insert into Enrollment values (3, 2, 2, '2020-10-11', 0);
insert into Enrollment values (4, 2, 2, '2020-10-12', 0);
insert into Enrollment values (5, 3, 3, '2020-10-13', 0);
insert into Enrollment values (6, 3, 3, '2020-10-14', 0);
insert into Enrollment values (7, 4, 4, '2020-01-15', 16.75);
select * from Enrollment;