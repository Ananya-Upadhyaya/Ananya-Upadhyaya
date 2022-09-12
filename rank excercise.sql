/* Excercise 1*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory, c.name as ProductCategory,
PriceRank = Row_number() over( order by p.ListPrice Desc),
CategoryPriceRankWithRank = rank() over(Partition by c.name order by p.ListPrice desc)
from Production.Product p
inner join Production.ProductSubCategory  s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory  c
on s.ProductCategoryID = c.ProductCategoryID 
order by p.ListPrice desc, ProductCategory;


/*Excercise 2*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory, c.name as ProductCategory,
CategoryPriceRank = Row_number() over( order by p.ListPrice Desc),
CategoryPriceRankWithRank = rank() over(Partition by c.name order by p.ListPrice desc),
CategoryPriceRankWithDenseRank = dense_rank() over(Partition by c.name order by p.ListPrice desc)
from Production.Product p
inner join Production.ProductSubCategory  s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory  c
on s.ProductCategoryID = c.ProductCategoryID 
order by p.ListPrice desc, ProductCategory;

/*Excercise 3*/

select p.Name as productname, p.ListPrice,
s.name as ProductSubCategory, c.name as ProductCategory,
CategoryPriceRankWithRank = rank() over(Partition by p.name order by p.ListPrice desc),
CategoryPriceRankWithDenseRank = dense_rank() over(Partition by c.name order by p.ListPrice desc),
Case when dense_rank() over ( Partition by p.Name order by p.ListPrice desc) > 5 
then 'No'
else 'Yes'
end as Top5PriceInCategory

from Production.Product p
inner join Production.ProductSubCategory  s
on p.ProductSubCategoryID = s.ProductSubCategoryID
inner join Production.ProductCategory  c
on s.ProductCategoryID = c.ProductCategoryID 
order by p.ListPrice,ProductCategory
