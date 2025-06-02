
#describe dimproduct;

select * from dimproduct D 
join dimproductsubcategory SUBCAT 
ON D.ProductSubcategoryKey = SUBCAT.ProductSubcategoryKey
join dimproductcategory CAT 
on SUBCAT.ProductCategoryKey = CAT.ProductCategoryKey
;

select * from dimproduct D
join factresellersales F 
on D.ProductKey = F.ProductKey
;

select * from dimproduct D
left join factresellersales F 
on D.ProductKey = F.ProductKey
where SalesOrderNumber is null
and FinishedGoodsFlag = 1
;

select * from dimproduct D
left join factresellersales F 
on D.ProductKey = F.ProductKey
join dimproductsubcategory SUBCAT 
ON D.ProductSubcategoryKey = SUBCAT.ProductSubcategoryKey
where SalesOrderNumber is not null
;

describe dimreseller;
select * from dimreseller R
left join dimgeography G
on R.GeographyKey = G.GeographyKey
;

select F.SalesOrderNumber, F.SalesOrderLineNumber, 
F.OrderDate, F.UnitPrice, F.OrderQuantity, F.TotalProductCost,
D.EnglishProductName, SUBCAT.EnglishProductSubcategoryName, 
R.ResellerName, G.EnglishCountryRegionName
from factresellersales F 
left join dimproduct D on F.ProductKey = D.ProductKey
left join dimproductsubcategory SUBCAT on D.ProductSubcategoryKey = SUBCAT.ProductSubcategoryKey
left join dimreseller R on F.ResellerKey = R.ResellerKey
left join dimgeography G on R.GeographyKey = G.GeographyKey
;












