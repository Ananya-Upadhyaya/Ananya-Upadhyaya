select * from Purchasing.PurchaseOrderHeader

/*Excercise 1*/

select o.PurchaseOrderID, o.OrderDate, o.TotalDue,o.VendorID, b.BusinessEntityID, b.Name as VendorName
from Purchasing.PurchaseOrderHeader as o
join  Purchasing.Vendor as b
on o.VendorID = b.BusinessEntityID
where OrderDate > '2013 -05-23' and TotalDue >$500

/*Excercise 2*/

select o.PurchaseOrderID, o.OrderDate, o.TotalDue,o.VendorID, b.BusinessEntityID, b.Name as VendorName,
PrevOrderFromVendorAmt = lag(TotalDue,1) over( order by o.VendorID)
from Purchasing.PurchaseOrderHeader as o
join  Purchasing.Vendor as b
on o.VendorID = b.BusinessEntityID
where OrderDate > '2013 -05-23' and TotalDue >$500

/*Excercise 3*/

select o.PurchaseOrderID, o.OrderDate, o.TotalDue,o.VendorID, o.EmployeeID, b.BusinessEntityID, b.Name as VendorName,
NextOrderByEmployeeVendor = Lead(b.Name,1) over( order by o.EmployeeID)
from Purchasing.PurchaseOrderHeader as o
join  Purchasing.Vendor as b
on o.VendorID = b.BusinessEntityID
where OrderDate > '2013 -05-23' and TotalDue >$500

/*Excercise 4*/

select o.PurchaseOrderID, o.OrderDate, o.TotalDue,o.VendorID, o.EmployeeID, b.BusinessEntityID, b.Name as VendorName,
Next2OrderByEmployeeVendor = Lead(b.Name,2) over( order by o.EmployeeID)
from Purchasing.PurchaseOrderHeader as o
join  Purchasing.Vendor as b
on o.VendorID = b.BusinessEntityID
where OrderDate > '2013 -05-23' and TotalDue >$500
