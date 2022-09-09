select * from Production.Product
select * from Production.ProductSubcategory

/*excercise1*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory,
c.name as ProductCategory from Production.Product p
inner join Production.ProductSubCategory s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory c
on s.ProductCategoryID = c.ProductCategoryID

/*excercise2*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory,
c.name as ProductCategory,AvgPriceByCategory = avg(p.ListPrice) over(),
AvgPriceByCategoryandSubCategory = avg(p.ListPrice) over(partition by c.name)
from Production.Product p
inner join Production.ProductSubCategory s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory c
on s.ProductCategoryID = c.ProductCategoryID

/*excercise3*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory,
c.name as ProductCategory,AvgPriceByCategory = avg(p.ListPrice) over(partition by c.name),
AvgPriceByCategoryandSubCategory = avg(p.ListPrice) over(partition by c.name)
from Production.Product p
inner join Production.ProductSubCategory s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory c
on s.ProductCategoryID = c.ProductCategoryID

/*excercise4*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory,
c.name as ProductCategory,AvgPriceByCategory = avg(p.ListPrice) over(partition by c.name),
AvgPriceByCategoryandSubCategory = avg(p.ListPrice) over(partition by c.name),
ProductVsCategoryDelta = p.ListPrice - avg(p.ListPrice) over(partition by c.name) 
from Production.Product p
inner join Production.ProductSubCategory s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory c
on s.ProductCategoryID = c.ProductCategoryID
