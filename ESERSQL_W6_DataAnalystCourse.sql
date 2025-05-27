show databases;
select * from dimproduct;

select ProductKey, ProductAlternateKey, EnglishProductName as ProductName,
 Color, StandardCost, FinishedGoodsFlag from dimproduct;
 
 select ProductKey, ProductAlternateKey, EnglishProductName as ProductName,
 Color, StandardCost, FinishedGoodsFlag as FinishedGoods from dimproduct;

 select ProductKey, ProductAlternateKey, EnglishProductName as ProductName,
 Color, StandardCost, FinishedGoodsFlag as FinishedGoods from dimproduct
 where FinishedGoodsFlag = 1;
 
 select ProductKey, ProductAlternateKey, EnglishProductName as ProductName,
 Color, StandardCost, FinishedGoodsFlag as FinishedGoods from dimproduct
 where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%';

select ProductKey, ProductAlternateKey, EnglishProductName as ProductName,
 StandardCost, ListPrice from dimproduct
 where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%';
 
 select ProductKey, ProductAlternateKey, EnglishProductName as ProductName,
 StandardCost, ListPrice, ListPrice - StandardCost as Markup from dimproduct
 where ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%';
 
  select ProductKey, ProductAlternateKey as Model, EnglishProductName as ProductName,
 StandardCost, ListPrice, ListPrice - StandardCost as Markup,
 FinishedGoodsFlag as FinishedGoods from dimproduct
 where (FinishedGoodsFlag = 1)
 and (ListPrice >1000 and ListPrice <2000)
 and (ProductAlternateKey like 'FR%' or ProductAlternateKey like 'BK%')
 ;
 
 select * from dimemployee
 where SalespersonFlag = 1;

/*Esponi in output lʼelenco delle transazioni registrate a partire dal 1 gennaio 2020 
 dei soli codici prodotto: 597, 598, 477, 214. 
 Calcola per ciascuna transazione il profitto SalesAmount - TotalProductCost).
*/

 select SalesOrderNumber, SalesOrderLineNumber, OrderDate, DueDate,
 ShipDate, ProductKey, ResellerKey, PromotionKey, EmployeeKey,
 SalesTerritoryKey, OrderQuantity, UnitPrice, TotalProductCost, SalesAmount,
 SalesAmount - TotalProductCost as TotalProfit
 from factresellersales
 where (OrderDate > '2020-01-01')
 and (ProductKey in (597, 598, 477, 214))
 ;
 
 
 