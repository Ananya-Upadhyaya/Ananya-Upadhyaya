/****** Script for SelectTopNRows command from SSMS  ******/
Select * from Person.Person

select * from HumanResources.Employee

select * from HumanResources.EmployeePayHistory



/*excercise 1*/

select p.FirstName, p.LastName, e.JobTitle, c.Rate, averageRate = avg(c.rate) over()
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on p.BusinessEntityID = c.BusinessEntityID


/*excercise 2*/

select p.FirstName, p.LastName, e.JobTitle, c.rate, AverageRate = avg(c.rate) over(), MaximumRate = max(c.rate)  over()
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on e.BusinessEntityID = c.BusinessEntityID

/*excercise 3*/

select p.FirstName, p.LastName, e.JobTitle, c.rate, AverageRate = avg(c.rate) over(), MaximumRate = max(c.rate) over(),
DiffFromAvg = c.Rate - avg(c.rate) over()
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on e.BusinessEntityID = c.BusinessEntityID

/*excercise 4*/
  
select p.FirstName, p.LastName, e.JobTitle, c.rate, AverageRate = avg(c.rate) over(), MaximumRate = max(c.rate) over(),
DiffFromAvg = c.Rate - avg(c.rate) over(),PercentOfMaxRate = c.rate/max(c.rate) over() *100
from Person.Person as p
join HumanResources.Employee as e
on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on e.BusinessEntityID = c.BusinessEntityID

*100 = Ken Sánchez