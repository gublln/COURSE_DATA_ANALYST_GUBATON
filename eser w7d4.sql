#w7d4 eser

use adventureworks;
#create view [denominazione] as (query)

#1 Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa. 
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto, 
#il nome della sottocategoria associata e il nome della categoria associata.

select distinct P.ProductKey as ProductKey , P.EnglishProductName as Product, 
	(select distinct P.ProductSubcategoryKey from dimproduct) as SubcategoryKey,
    SC.EnglishProductSubcategoryName as Subcategory,
	(select distinct SC.ProductCategoryKey from dimproductsubcategory) as CategoryKey,
    C.EnglishProductCategoryName as Category
from dimproduct P
join dimproductsubcategory SC on P.ProductSubcategoryKey = SC.ProductSubcategoryKey
join dimproductcategory C on SC.ProductCategoryKey = C.ProductCategoryKey
;


create view Product
as (select P.ProductKey as ProductKey , P.EnglishProductName as Product, 
	P.ProductSubcategoryKey as SubcategoryKey,
    SC.EnglishProductSubcategoryName as Subcategory,
	SC.ProductCategoryKey as CategoryKey,
    C.EnglishProductCategoryName as Category
from dimproduct P
join dimproductsubcategory SC on P.ProductSubcategoryKey = SC.ProductSubcategoryKey
join dimproductcategory C on SC.ProductCategoryKey = C.ProductCategoryKey)
;
#2 Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa. 
#La vista, se interrogata o utilizzata come sorgente dati, 
#deve esporre il nome del reseller, il nome della città e il nome della regione.

select G.GeographyKey as 'Code',
	R.ResellerName as Reseller,
	G.City as City, 
    G.CountryRegionCode as Region,
    G.SalesTerritoryKey as TerritoryKey
from dimreseller R
join dimgeography G on R.GeographyKey = G.GeographyKey
;

create view Reseller as
(select G.GeographyKey as 'Code',
	R.resellerName as Reseller,
	G.City as City, 
    G.CountryRegionCode as Region
	G.SalesTerritoryKey as TerritoryKey
from dimreseller R
join dimgeography G on R.GeographyKey = G.GeographyKey)
;

#3 Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento, 
#la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.

select *
from factsales
#where ResellerKey is null
where TotalProductCost is not null
;

select * from dimproduct;

select * 
from factresellersales
order by SalesOrderNumber asc
;

select *
from factinternetsales
order by SalesOrderNumber asc
;

select SalesOrderNumber as OrderNumber,
	SalesOrderLineNumber as OrderLineNumber,
    FS.ProductKey as ProductKey, 
    OrderDate, SalesTerritoryKey,
    OrderQuantity, SalesAmount, 
	ifnull ((SalesAmount - TotalProductCost), SalesAmount) as TotalProfit
from factsales FS
join dimproduct P on FS.ProductKey = P.ProductKey
order by TotalProfit asc
;



#4 Crea un report in Excel che consenta ad un utente di analizzare quantità venduta, 
#importo totale e profitti per prodotto/categoria prodotto e reseller/regione. 