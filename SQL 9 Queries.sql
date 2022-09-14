/* query1 */

CREATE TABLE Worker (
	WORKER_ID int NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY int,
	JOINING_DATE CHAR(25),
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select * from Worker

/* query 2*/

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE char(25),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

select * from Bonus

/*query 3*/

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM CHAR(25),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 select * from Title

 /* question 1*/

 1. Write an SQL query to fetch the list of employees with the same salary.
 
 select * from Worker where salary in 
 (select salary from Worker w
 where Worker.WORKER_ID <> w.WORKER_ID);

  /* question 2*/

  2. Write an SQL query to show the second highest salary from a table.

  select * from Worker
  where WORKER_ID IN (select WORKER_ID from Worker where SALARY = (select MAX(SALARY) from Worker
  where SALARY <(select MAX(SALARY) from Worker)) 
  );


  /* question 3*/

  3. Write an SQL query to fetch the first 50% records from a table. 

  select TOP 50 percent * from Worker

  /* question 4*/

  4. Write an SQL query to show all departments along with the number of people in there. 

select DEPARTMENT, count(*)
from Worker
group by DEPARTMENT

  /* question 5*/

  5. Write an SQL query to fetch departments along with the total salaries paid for each of them. 

  select DEPARTMENT, SUM(SALARY)
  from Worker
  group by DEPARTMENT

  /* question 6*/

  6. Write an SQL query to fetch the names of workers who earn the highest salary. 

 select FIRST_NAME, SALARY from Worker 
 where SALARY = (select MAX(SALARY) from Worker)

  /* question 7*/

  7. Write an SQL query to show the last record from a table

  select Top 1 * from Worker
  order by WORKER_ID DESC

 /* question 8*/

 8. Write an SQL query to fetch three min salaries from a table

 select DISTINCT SALARY from Worker w 
 where 3 >= (select count(DISTINCT SALARY) from Worker w1 
 where w1.SALARY <= w.SALARY)
 ORDER BY w.SALARY DESC

  /* question 9*/

  9. Write an SQL query to print the name of employees having the highest salary in each department 

  select FIRST_NAME, SALARY, DEPARTMENT from Worker 
  where SALARY IN (select MAX(SALARY) from Worker 
  group by DEPARTMENT)