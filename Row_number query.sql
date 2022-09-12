select * from Production.Product

/*excercise1*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory,
c.name as ProductCategory from Production.Product p
inner join Production.ProductSubCategory  s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory  c
on s.ProductCategoryID = c.ProductCategoryID

/*Excercise 2*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory, c.name as ProductCategory,
PriceRank = Row_number() over( order by p.ListPrice Desc)
from Production.Product p
inner join Production.ProductSubCategory  s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory  c
on s.ProductCategoryID = c.ProductCategoryID 


/* Excercise 3*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory, c.name as ProductCategory,
PriceRank = Row_Number() over(order by p.Listprice desc ),
CategoryPriceRank = Row_number() over(partition by c.name order by p.Listprice desc)
from Production.Product as p
inner join Production.ProductSubCategory as s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory as c
on s.ProductCategoryID = c.ProductCategoryID 


/* Excercise 4*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory, c.name as ProductCategory,
PriceRank = ROW_NUMBER() over( Partition by p.ListPrice order by c.Name Desc),
CategoryPriceRank = Rank() over( Partition by c.Name order by p.ListPrice desc),

Case when rank() over ( Partition by p.Name order by p.ListPrice desc) > 5 
then 'No'
else 'Yes'
end as Top5PriceInCategory

from Production.Product p
inner join Production.ProductSubCategory  s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory  c
on s.ProductCategoryID = c.ProductCategoryID 
order by p.ListPrice,ProductCategory







