#eser w7d1
use AdventureWorksDW;

#1 verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. 
select * from dimproduct;

describe dimproduct; #mostra come è impostata ProductKey

select count(*)
from dimproduct
where ProductKey is null
;

select distinct ProductKey
from dimproduct
;

#2 Scrivi una query per verificare 
#che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
describe factresellersales;

select distinct SalesOrderNumber and SalesOrderLineNumber
from factresellersales;

select  distinct SalesOrderNumber or SalesOrderLineNumber
from factresellersales;

select count(*) as InvalidData
from factresellersales 
where SalesOrderLineNumber is null or SalesOrderNumber is null
;


#3 Conta il numero transazioni SalesOrderLineNumber) 
#realizzate ogni giorno a partire dal 1 Gennaio 2020.

select distinct SalesOrderLineNumber, count(ShipDate) as ProductReceived 
from factresellersales
where ShipDate is not null and ShipDate > "2020-01-01"
group by SalesOrderLineNumber
;

select distinct SalesOrderLineNumber, count(ShipDate) as ProductReceived 
from factresellersales
where ShipDate is not null and ShipDate > "2020-01-01"
;


#4 Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta FactResellerSales.OrderQuantity) 
#e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020. 
#Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. 
#I campi in output devono essere parlanti!

select *
from factresellersales;

select *
from dimproduct;

select F.ProductKey, 
	EnglishProductName as Product, 
	sum(SalesAmount) as TotalSales,
	sum(OrderQuantity) as TotalQuantity,
	round(avg(UnitPrice),2) as AvaragePrice,
    F.OrderDate as FromOrderDate
from factresellersales F
join dimproduct P on F.ProductKey = P.ProductKey
where OrderDate >= '2020-01-01'
group by Product
order by OrderDate asc
;

#5 Calcola il fatturato totale (FactResellerSales.SalesAmount) 
#e la quantità totale venduta (FactResellerSales.OrderQuantity) per Categoria prodotto DimProductCategory). 
#Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. 
#I campi in output devono essere parlanti!

select * from factresellersales;
select * from dimproductcategory;
select * from dimproduct;

select F.ProductKey, 
	CAT.EnglishProductCategoryName as ProductCategory,
	sum(SalesAmount) as TotalSales,
	sum(OrderQuantity) as TotalQuantity
from factresellersales F
join dimproduct P on F.ProductKey = P.ProductKey
join dimproductsubcategory SUB on P.ProductSubcategoryKey = SUB.ProductSubcategoryKey
join dimproductcategory CAT on CAT.ProductCategoryKey = SUB.ProductCategoryKey
group by ProductCategory
;


#6 Calcola il fatturato totale per area città DimGeography.City) realizzato a partire dal 1 Gennaio 2020. 
#Il result set deve esporre lʼelenco delle città con fatturato realizzato superiore a 60K.


select * from factresellersales;
select * from dimgeography;

select G.EnglishCountryRegionName as Region,
	sum(SalesAmount) as TotalSales
from factresellersales F
join dimgeography G on F.SalesTerritoryKey = G.SalesTerritoryKey
where Orderdate >= '2020-01-01' 
group by Region
having TotalSales > 60000
;