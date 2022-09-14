/*EXCERCISE SUB QUERY*/

select * from Purchasing.PurchaseOrderHeader;

with MostExp AS
(select PurchaseOrderID, VendorID, OrderDate, TaxAmt, Freight, TotalDue,
MOST_EXPENSIVE_RANK = ROW_NUMBER () over ( Partition by VendorID Order by TotalDue desc )
from Purchasing.PurchaseOrderHeader)

select PurchaseOrderID, VendorID, OrderDate, TaxAmt, Freight, MOST_EXPENSIVE_RANK, TotalDue
from MostExp
where MOST_EXPENSIVE_RANK <= 3