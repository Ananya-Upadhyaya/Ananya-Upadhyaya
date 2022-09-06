/****** Script for SelectTopNRows command from SSMS  ******/
create database Ananya

create table empdb
(
emp_id int not null,
emp_Fname varchar(30),
emp_Lname varchar(30),
emp_dept int,
primary key(emp_id),
);

insert into empdb(emp_id,emp_fname,emp_Lname,emp_dept) values
(127323,'Michale','Robbin',57),
(526689,'Carlos','snares',63),
(843795,'Enric','Dosio',57),
(328717,'Jhon','Snares',63),
(444527,'Joseph','Dosni',47),
(659831,'Zanifer','Emily',47),
(847674,'Kuleswar','Sitaraman',57),
(748681,'Henray','Gabriel',47),
(555935,'Alex','Manuel',57)

select * from empdb where emp_dept = 57;

create  table sub
(year int, subject varchar(30), winner varchar(45), country varchar(40), category varchar(40));

insert into sub(year,subject,winner,country,category) values
(1970,'physics','Hannes Alfven', 'Sweden','Scientist'),
(1970,'chemistry','Louis Federico Leloi','France','Scientist'),
(1970,'Physiology','Uff Von Euler','Sweden','Scientist'),
(1970,'physiology','Bernard Katz','Germany','Scientist'),
(1970,'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),
(1970,'Economics','Paul Samuelson','USA','Economist'),
(1970,'physiology','Julius Axelord','USA','Scientist'),
(1971,'Physics','Dennis Gabor','Hungary','Scientist'),
(1971,'Chemistry','Gerhard Herzberg','Germany','Scientist'),
(1971,'Peace','Willy B','Germany','Chancellor'),
(1971,'Literature','Pabola Neruda','Chile','Linguist'),
(1971,'Economics','Simon K','Russia','Economist'),
(1978,'Peace','Anwar al','Egypt','President'),
(1978,'Peace','Menachem Begin','Isreal','Prime minister'),
(1987,'Chemistry','Donald J','USA','Scientist'),
(1987,'Chemistry','Jean M Lehn','France','scientist'),
(1987,'Physiology','Susumu T','Japan','Scientist'),
(1994,'Economics','R Selten','Germany','Economist'),
(1987,'Peace','Yitzhak Rabin','isreal','Prime Minister'),
(1987,'Physics','Johannes G','Germany','Scientist'),
(1987,'Literature','Joseph B','Russia','linguist'),
(1987,'Economics','Robert Solow','USA','Economist'),
(1994,'Literature','Kenzaburo Oe','Japan','Linguist');

select winner from sub where subject = 'Literature' and year = 1970;

select year,subject, winner from sub where year =1971;

select year, subject from sub where winner = 'Dennis Gabor';

select * from sub where subject not like 'P%' order by year desc, winner Asc;