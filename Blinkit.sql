-- ============================================================
-- Blinkit Retail Sales Analysis
-- SQL Data Analytics Project
-- ============================================================
-- Objective:
-- Analyze retail sales, product characteristics and
-- outlet performance using SQL.
--
-- SQL Concepts Used:
-- SELECT, WHERE, DISTINCT, ORDER BY, GROUP BY,
-- aggregate functions, IN, BETWEEN, filtering
-- and analytical queries.
-- ============================================================
drop table grocery_data;
create table Grocery_Data (
Item_Identifier varchar(500),
Item_Weight decimal,
Item_Fat_Content varchar(500),
Item_Visibility decimal (10,9),
Item_Type varchar(500),
Item_MRP decimal,
Outlet_Identifier varchar(500),
Outlet_Establishment_Year int,
Outlet_Size varchar (500),
Outlet_Location_Type varchar(500),
Outlet_Type varchar(500),
Item_Outlet_Sales decimal);

-- Source dataset is loaded into the grocery_data table.

select * from grocery_data;

-- ============================================================
-- SECTION 1: BASIC DATA EXPLORATION
-- ============================================================

select item_Identifier 
from grocery_data;

select count(Item_Identifier) 
from grocery_data;

select max(Item_Weight) 
from grocery_data;

select min(Item_Weight) 
from grocery_data;

select avg(Item_Weight) 
from grocery_data;

select count(Item_Fat_Content) 
from grocery_data 
where Item_Fat_Content = "Low Fat";

select count(Item_Fat_Content) 
from grocery_data 
where Item_Fat_Content = "Regular";

select max(Item_MRP) 
from grocery_data;

select min(Item_MRP) 
from grocery_data;

-- ============================================================
-- SECTION 2: PRODUCT ANALYSIS
-- ============================================================

select Item_Identifier, Item_Fat_Content, Item_Type, Item_MRP 
from grocery_data 
where Item_MRP > 200;

select max(Item_MRP) 
from grocery_data 
where Item_Fat_Content = "Low Fat";

select min(Item_MRP) 
from grocery_data 
where Item_Fat_Content = "Low Fat";

select * from grocery_data 
where Item_MRP 
between 50 and 100;

select distinct (trim(Item_Fat_Content)) 
from grocery_data;

select distinct (trim(Item_Type)) 
from grocery_data;

select * from grocery_data 
order by Item_MRP desc;

select * from grocery_data
order by Item_Outlet_Sales;

select * from grocery_data
order by Item_Type;

select * from Grocery_data 
where item_type in ("dairy","meat");

-- ============================================================
-- SECTION 3: OUTLET ANALYSIS
-- ============================================================

select distinct (trim(Outlet_Size)) 
from grocery_data;

select distinct (trim(Outlet_Location_Type)) 
from grocery_data;

select distinct (trim(Outlet_Type)) 
from grocery_data;

select count(Item_Type) 
from grocery_data 
group by Item_Type 
order by count(Item_Type)desc;

select Outlet_Type,
count(*) as Outlet_Count
from grocery_data
group by Outlet_Type
order by Outlet_Count asc;

select Outlet_Type,
count(*) as Outlet_Count
from grocery_data
group by Outlet_Type
order by Outlet_Count desc;

select count(Outlet_Location_Type) 
from grocery_data 
group by Outlet_Location_Type 
order by Outlet_Location_Type desc;

-- ============================================================
-- SECTION 4: PRODUCT & PRICING ANALYSIS
-- ============================================================

select Item_Type,
max(Item_MRP) as Maximum_MRP
from grocery_data
group by Item_Type
order by Maximum_MRP DESC;

select min(Item_MRP), Item_Type 
from grocery_data 
group by Item_Type;

select min(Item_MRP) as Min_Item_MRP, Outlet_Establishment_Year 
from grocery_data 
group by Outlet_Establishment_Year 
order by Outlet_Establishment_Year desc;

select max(Item_MRP) as Max_Item_MRP, Outlet_Establishment_Year 
from grocery_data 
group by Outlet_Establishment_Year 
order by Outlet_Establishment_Year desc;

select Outlet_Size,avg(Item_MRP) as Average_MRP
from grocery_data
group by Outlet_Size
order by Average_MRP desc;

select avg(Item_MRP) as Average_MRP, Outlet_Type 
from grocery_data 
group by Outlet_Type 
order by Outlet_Type asc;

select max(Item_MRP) as Max_Item_MRP, Outlet_Type 
from grocery_data 
group by Outlet_Type;

select max(Item_Weight) as Max_Item_Weight, Item_Type 
from grocery_data 
group by Item_Type;

select max(Item_Weight) as Max_Item_Weight, Outlet_Establishment_Year 
from grocery_data 
group by Outlet_Establishment_Year;

select min(Item_Weight) as Minimum_Item_Weight, Outlet_Type grocery_data 
from grocery_data
group by Outlet_Type;

select avg(Item_Weight) as Avg_Item_Weight, Outlet_Location_Type 
from grocery_data 
group by Outlet_Location_Type 
order by Outlet_Location_Type desc;

-- ============================================================
-- SECTION 5: SALES & PERFORMANCE ANALYSIS
-- ============================================================

select max(Item_Outlet_Sales) as Max_Item_Outlet_Sales, Item_Type 
from grocery_data 
group by Item_Type;

select min(Item_Outlet_Sales) as Min_Item_Outlet_Sales, Item_Type 
from grocery_data 
group by Item_Type;

select min(Item_Outlet_Sales) as Min_Item_Outlet_Sales, Outlet_Establishment_Year 
from grocery_data 
group by Outlet_Establishment_Year;

select max(Item_Outlet_Sales) as Maximum_Outlet_Sales, Outlet_Establishment_Year 
from grocery_data 
group by Outlet_Establishment_Year 
order by Outlet_Establishment_Year desc;

select avg(Item_Outlet_Sales) as Avg_Item_Outlet_Sales, Outlet_Size 
from grocery_data 
group by Outlet_Size 
order by Outlet_Size desc;

select avg(Item_Outlet_Sales) as Avg_Item_Outlet_Sales, Outlet_Type 
from grocery_data 
group by Outlet_Type;

select max(Item_Outlet_Sales) as Maximum_Outlet_Sales, Outlet_Type 
from grocery_data 
group by Outlet_Type;

select Item_Type,round(sum(Item_Outlet_Sales),2) as Total_Sales
from grocery_data
group by Item_Type
order by Total_Sales desc;

select sum(Item_Outlet_Sales) as Total_Sales, Item_Fat_Content 
from grocery_data 
group by Item_Fat_Content;

select max(Item_Visibility), Item_Type 
from grocery_data 
group by Item_Type;

select min(Item_Visibility), Item_Type 
from grocery_data 
group by Item_Type;

select sum(Item_Outlet_Sales) as Total_Sales, Item_Type 
from grocery_data 
where Outlet_Location_Type = "Tier 1" 
group by Item_Type;

select sum(Item_Outlet_Sales) as Total_Sales, Item_Type 
from grocery_data 
where Item_Fat_Content in ("Low Fat" , "LF") 
group by Item_Type;
