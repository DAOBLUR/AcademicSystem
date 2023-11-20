--CREATE database AcademicSystem;

CREATE TABLE "Course" (
	Id int NOT NULL PRIMARY key,
	Name varchar(100) NOT NULL
);

CREATE TABLE "Student" (
	Id int NOT NULL PRIMARY key,
	Name varchar(75) NOT NULL,
	Email varchar(30) unique NOT NULL,
	BirthDate date NOT NULL,
	Address varchar(75) NOT NULL,
	Phone varchar(9) unique NOT NULL
);

CREATE TABLE "Teacher" (
	Id int NOT NULL PRIMARY key,
	Name varchar(75) NOT NULL,
	Email varchar(30) unique NOT NULL,
	Phone varchar(9) unique NOT NULL
);

CREATE TABLE "Enrollment" (
	Id int NOT NULL PRIMARY KEY,
	StudentId int NOT NULL REFERENCES "Student",
	CourseId int NOT NULL REFERENCES "Course",
	TeacherId int NOT NULL REFERENCES "Teacher",
	EnrollmentDate DATE NOT NULL,
	Grade numeric(4,2) NOT NULL
);

---------------------------------------------------

create sequence SeqCourse increment 1 start 1;

create sequence SeqStudent increment 1 start 1;

create sequence SeqTeacher increment 1 start 1;

create sequence SeqEnrollment increment 1 start 1;

---------------------------------------------------

insert into "Course" values (nextval('SeqCourse'), 'Introduction to Computers and Engineering Problem Solving');
insert into "Course" values (nextval('SeqCourse'), 'Uncertainty in Engineering');
insert into "Course" values (nextval('SeqCourse'), 'Project Evaluation');
insert into "Course" values (nextval('SeqCourse'), 'Introduction to Civil Engineering Design');
select * from "Course";


insert into "Student" values (nextval('SeqStudent'), 'Ernesto Morena', 'emorena@email.com', '2000-10-10', '742 de Evergreen Terrace', '987654320');
insert into "Student" values (nextval('SeqStudent'), 'Toño Gennady', 'tgennady@email.com', '2000-10-11', '742 de Evergreen Terrace', '987654321');
insert into "Student" values (nextval('SeqStudent'), 'Baldo Gerasim', 'bgerasim@email.com', '2000-10-12', '742 de Evergreen Terrace', '987654322');
insert into "Student" values (nextval('SeqStudent'), 'Orfeo Pierina', 'opierina@email.com', '2000-10-13', '742 de Evergreen Terrace', '987654323');
insert into "Student" values (nextval('SeqStudent'), 'Fausta Alessio', 'falessio@email.com', '2000-10-14', '742 de Evergreen Terrace', '987654324');
insert into "Student" values (nextval('SeqStudent'), 'Wilmer Fabiano', 'wfabiano@email.com', '2000-10-15', '742 de Evergreen Terrace', '987654325');
insert into "Student" values (nextval('SeqStudent'), 'Leticia Nazario', 'lnazario@email.com', '2000-10-16', '742 de Evergreen Terrace', '987654326');
select * from "Student";


insert into "Teacher" values (nextval('SeqTeacher'), 'Angelino Leopoldo', 'aleopoldo@email.com', '987654324');
insert into "Teacher" values (nextval('SeqTeacher'), 'Imelda Nicolina', 'inicolina@email.com', '987654325');
insert into "Teacher" values (nextval('SeqTeacher'), 'Nevio Conchita', 'nconchita@email.com', '987654326');
insert into "Teacher" values (nextval('SeqTeacher'), 'Faddey Romualdo', 'fromualdo@email.com', '987654327');
select * from "Teacher";


insert into "Enrollment" values (nextval('SeqEnrollment'), 1, 1, 1, '2020-10-10', 0);
insert into "Enrollment" values (nextval('SeqEnrollment'), 2, 1, 1, '2020-10-10', 0);

insert into "Enrollment" values (nextval('SeqEnrollment'), 3, 2, 2, '2020-10-11', 0);
insert into "Enrollment" values (nextval('SeqEnrollment'), 4, 2, 2, '2020-10-12', 0);

insert into "Enrollment" values (nextval('SeqEnrollment'), 5, 3, 3, '2020-10-13', 0);
insert into "Enrollment" values (nextval('SeqEnrollment'), 6, 3, 3, '2020-10-14', 0);

insert into "Enrollment" values (nextval('SeqEnrollment'), 7, 4, 4, '2020-01-15', 16.75);
select * from "Enrollment";