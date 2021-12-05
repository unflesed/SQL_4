create database MyJoinsDB;
use MyJoinsDB;

create table Employees(
id int auto_increment not null,
name varchar(30) not null,
phone varchar(30) not null,
Salaries_id int not null,
info_id int not null,
foreign key (Salaries_id) references Salaries(id),
foreign key (info_id) references info(id),
primary key(id)
);

create table Salaries(
id int auto_increment not null,
salary int not null,
post varchar(30) not null,
primary key(id)
);

create table info(
id int auto_increment not null,
family varchar(30) not null,
dateOfBirth date not null,
adress varchar(30) not null,
primary key(id)
);

insert into Salaries (salary, post)
values (1000, 'worker'),
(1100, 'worker'),
(1200, 'worker'),
(1500, 'manager'),
(1600, 'manager'),
(2500, 'chief');

insert into info (family, dateOfBirth, adress)
values ('Y', 19800101, 'Lenina 12'),
('Y', 19810101,'Pushkina 10'),
('Y', 19820101,'Shevchenko 11'),
('N', 19830101,'Kolasa 5'),
('N', 19840101, 'Kupaly 3'),
('N', 19850101, 'Cetkin 5');

insert into Employees (name, phone, Salaries_id, info_id)
values ('Pupkin', '+19800101', 1, 1),
('Utkin', '+19810101', 2, 2),
('Ivanov', '+19820101', 3, 3),
('Petrov', '+19830101', 4, 4),
('Sidorov', '+19840101',  5, 5),
('Antonov', '+19850101',  6, 6);

select * from Employees;
select * from Salaries;
select * from info;

-- 1
select name, phone, info.adress
from Employees
join info on Employees.info_id = info.id;

-- 2
select name, phone, info.dateofbirth
from Employees
join info on Employees.info_id = info.id
where info.family = 'N';

-- 3
select Salaries.post, phone, info.dateofbirth
from Employees
join info on Employees.info_id = info.id
join Salaries on Employees.info_id = Salaries.id
where Salaries.post = 'manager';