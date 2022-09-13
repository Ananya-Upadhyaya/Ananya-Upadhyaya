CREATE TABLE ProductDescription
(ProductID INT, ProductDescription VARCHAR(800) )
GO
 
INSERT INTO Product VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
 
INSERT INTO ProductDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')

select * from  ProductDescription

/*Stored Procedures*/
                                                                            
create Procedure GetProdDescp as
begin							
Set NOCOUNT ON 
select p.ProductID, p.ProductName, PD.ProductDescription
from Product AS p
inner join ProductDescription PD
on p.ProductID = PD.ProductID
end

Exec GetProdDescp


/* Stored Procedures with parameters*/

create Procedure GetProdDescp_withparameters(@PID int)
as
begin
Set NOCOUNT ON 
select p.ProductID, p.ProductName, PD.ProductDescription
from Product AS p
inner join ProductDescription PD
on p.ProductID = PD.ProductID
where p.ProductID = @PID
end

Exec GetProdDescp_withparameters 707



create table Employees(EmpID int identity (1,1), EmpName varchar(500))

select * from Employees

create Procedure NewEmp_withoutparameters1(@Ename varchar(50), @EID int output)
as
begin
set NOCOUNT ON
insert into Employees (EmpName) values (@Ename)

select @EID = SCOPE_IDENTITY()
end 

declare @EmpID int

Exec NewEmp_withoutparameters1 'mountain', @EmpID output

select @EmpID


create Procedure GetEmployees
with Encryption
as
begin
SET NOCOUNT ON

select EmpID,EmpName
from Employees
end

sp_helptext GetEmployees

/*local temp*/

create Procedure #Temp
as
begin
Print('Local temp Procedure')
end

exec #Temp

/*global temp*/

create Procedure ##Temp
as
begin
Print('Global temp Procedure')
end

exec ##Temp