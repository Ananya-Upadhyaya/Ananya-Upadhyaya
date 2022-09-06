/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[Color]
      ,[StandardCost]
      ,[ListPrice]
      ,[Size]
      ,[Weight]
      ,[ProductCategoryID]
      ,[ProductModelID]
      ,[SellStartDate]
      ,[SellEndDate]
      ,[DiscontinuedDate]
      ,[ThumbNailPhoto]
      ,[ThumbnailPhotoFileName]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [SalesLT].[Product]

  select * from SalesLT.Product;

  select Name,StandardCost, ListPrice
  from SalesLT.Product;

  select Name, ListPrice - StandardCost from SalesLT.Product;

  select Name AS ProductName, ListPrice ,StandardCost AS Markup from SalesLT.Product;

  select ProductNumber, Color, size, color + ',' + size as ProductDetails from SalesLT.Product;

  select Cast(ProductID as varchar(10)) + ': ' + Name as ProductName from SalesLT.Product;

  select CONVERT(varchar(10),productID) + ':' + name as ProductName from SalesLT.Product;

  select SellStartDate, 
  CONVERT(nvarchar(30),SellStartDate) As ConvertedDate,
  CONVERT(nvarchar(30), SellStartDate, 126) As ISO8601FormatDate from SalesLT.Product;

  select Name, Try_CAST(size as integer) as NumericSize from SalesLT.Product;

  select Name, ISNULL(Try_Cast(Size as integer),0) AS Numericsize from SalesLT.Product;
   
  select ProductNumber, ISNULL(color, ' ')+ ', ' + ISNULL(Size, ' ') as ProductDetails from SalesLT.Product;

  select Name, NULLIF(color, 'multi') AS SingleColor from SalesLT.Product;

  select Name, Coalesce(sellenddate, sellstartdate) as statuslastupdated from SalesLT.Product;

  select Name,
          Case
		     when sellenddate IS NULL THEN 'Currently for sale'
			 ELSE 'No Longer available'
		END AS SalesStatus
From SalesLT.Product;


select Name,
      Case size
	        when 'S' THEN 'SMALL'
			when 'M' THEN ' MEDIUM'
			when 'XL' THEN 'EXTRA LARGE'
			ELSE ISNULL(Size, 'n/a')
	End as ProductSize
From SalesLT.Product;


UPDATE SalesLT.Customer
Set EmailAddress = NULL
Where CustomerID % 7 = 1;

Update SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT * FROM SalesLT.Customer;

SELECT TITLE, FIRSTNAME, MIDDLENAME, LASTNAME, SUFFIX
FROM SalesLT.Customer;

Select SalesPerson, title + ' ' + lastname as CustomerName, phone
from SalesLT.Customer;

select CAST(CustomerID AS varchar) + ': ' + CompanyName AS CustomerCompany
from SalesLT.Customer;

SELECT SalesOrderNumber + '( ' +STR(RevisionNumber, 1) + ')' AS OrderRevision, CONVERT(nvarchar(30), orderDate,102) AS OrderDate
from SalesLT.SalesOrderHeader;

select FirstName + ' ' + ISNULL(MiddleName + ' ',' ') + lastName as CustomerName
from SalesLT.Customer;

select CustomerID, COALESCE(EmailAddress, phone) AS PrimaryContact
from SalesLT.Customer;

select SalesOrderID, OrderDate,
Case
when Shipdate IS null then ' Awaiting Shipment'
else 'Shipped'
end as ShippingStatus
from SalesLT.SalesOrderHeader;


