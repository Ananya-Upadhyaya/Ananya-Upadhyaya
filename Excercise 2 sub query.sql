/*EXCERCISE2 SUB QUERY*/

select * from Purchasing.PurchaseOrderHeader;

with P as
(
select DISTINCT Top 3 VendorID, PurchaseOrderID, OrderDate, TotalDue, TaxAmt, Freight,
MostExpOrder = ROW_NUMBER() over( Order by TotalDue DESC),
Top3 = ROW_NUMBER() over (Order by TotalDue DESC)
from Purchasing.PurchaseOrderHeader)
select * from P where MostExpOrder<=3;

/* Scalar Excercise 1 using CTE*/

with P as
( select BusinessEntityID, JobTitle, VacationHours,
MaxVacationHours = MAX(VacationHours) over (order by VacationHours desc)
from HumanResources.Employee
)
select * from P

/* Scalar Excercise 1 Using subquery*/

select BusinessEntityID, JobTitle, VacationHours,
(
select MAX(VacationHours)
from HumanResources.Employee) as MaxVacationHours
from HumanResources.Employee

/* Excercise 2*/
/*Add a new derived field to your query from Exercise 1, which returns the percent an individual employees' 
vacation hours are, of the maximum vacation hours for any employee. 
For example,
the record for the employee with the most vacation hours should have a value of 1.00, or 100%, in this column*/


select BusinessEntityID, JobTitle, VacationHours,
VacationHours * 100.00/(select MAX(VacationHours) 
from HumanResources.Employee) as 'Percentage'
from HumanResources.Employee

/*Refine your output with a criterion in the
WHERE clause that filters out any employees
whose vacation hours are less then 80% of the maximum amount of vacation hours for any one employee.
In other words, return only employees who have at least 80% as much vacation time as the employee with the most vacation time*/ 
Hint: The query should return 60 rows. 

select BusinessEntityID, JobTitle, VacationHours,
VacationHours * 100.00/(select MAX(VacationHours) 
from HumanResources.Employee) as 'Percentage'
from HumanResources.Employee
where VacationHours >80




