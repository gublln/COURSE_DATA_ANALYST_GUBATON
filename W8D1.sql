create database Hypo_Company;

use Hypo_Company;

create table Region (
	RegionID INT auto_increment PRIMARY KEY,
	CityName VARCHAR(50),
    StateProvince VARCHAR(50),
    RegionName VARCHAR(50)
    )
;

desc Region; #controllo che abbia preso bene la sintassi

create table Category (
	CategoryID INT auto_increment PRIMARY KEY,
    CategoryName VARCHAR(100)
    )
;

create table Store (
	StoreID INT auto_increment PRIMARY KEY,
    StoreName VARCHAR (50),
    OpeningDate DATE,
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
    )
;

create table Product (
	ProductID INT auto_increment PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
    )
;

ALTER TABLE Store
ADD CategoryID INT;

ALTER TABLE Store
ADD CONSTRAINT FK_CategoryID
    FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID);

desc Store;


insert into Region (CityName, StateProvince, RegionName) values
('Balistrerimouth','NewYork','Morocco'),
('West Benedictside','Maryland','Guam'),
('Verlieland','Montana','Anguilla'),
('Helgafurt','Texas','Hong Kong'),
('Lake Liamport','California','Barbuda');

select * from Region;


desc Category;
insert into Category (CategoryName) values
 ('Tech'),
 ('Retail'),
 ('Stationary');
 
 select * from Category;

insert into Store (StoreName, OpeningDate, RegionID, CategoryID) values
('Roberts Passage','1999-03-14','2','2'),
('Everett Canyon','2002-12-23','3','3'),
('Hoppe Harbor','2015-12-18','1','3'),
('Lilliana Route','2019-08-03','5','1'),
('Hermann Expressway','2022-05-04','4','1'),
('Adelia Port','1999-09-29','1','3'),
('Mitchell Roads','2020-04-28','4','1'),
('Armstrong Haven','2003-08-28','1','1'),
('Kiehn Track','2001-09-01','3','1'),
('Trantow Gardens','2025-01-25','3','2'),
('Fisher Port','2012-04-12','5','2'),
('German Plain','2008-05-25','2','3'),
('Vella Creek','2015-05-26','3','1');

select * from Store
order by OpeningDate ASC;

drop table if exists Store;

create table Store (
	StoreID INT auto_increment PRIMARY KEY,
    StoreName VARCHAR (50),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
    OpeningDate DATE
    )
;

insert into Store (StoreName, CategoryID, RegionID, OpeningDate) values
('Roberts Passage','2','2','1999-03-14'),
('Adelia Port','3','1','1999-09-29'),
('Kiehn Track','1','3','2001-09-01'),
('Everett Canyon','3','3','2002-12-23'),
('Armstrong Haven','1','1','2003-08-28'),
('German Plain','3','2','2008-05-25'),
('Fisher Port','2','5','2012-04-12'),
('Vella Creek','1','3','2015-05-26'),
('Hoppe Harbor','3','1','2015-12-18'),
('Lilliana Route','1','5','2019-08-03'),
('Mitchell Roads','1','4','2020-04-28'),
('Hermann Expressway','1','4','2022-05-04'),
('Trantow Gardens','2','3','2025-01-25')
;

select * from Store;

delete from Store
where StoreID = '2';


insert into Store (StoreName, CategoryID, RegionID, OpeningDate) values
('Hettinger Mall','1','4','2025-05-06'),
('Koelpin Locks',NULL,'2','2025-01-10')
;

insert into Category (CategoryName) values
('Home Decor');

select * from Category;

start transaction;

update Store
set CategoryID = '4'
where StoreID in ("14","16");

rollback;

select * from Store;

start transaction;

update Store
set CategoryID = '4'
where StoreID in ("14","16");

commit;

select * from Store;

start transaction;

update Store
set StoreName = 'Robinsons Mall'
where StoreID = '15';

rollback;

select * from Store;

start transaction;

update Store
set StoreName = 'Robinsons Mall'
where StoreID = '15';

commit;

select * from Store;
    