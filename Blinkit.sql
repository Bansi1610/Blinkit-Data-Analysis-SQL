#Blinkit Project	

create table Grocery_Sales (
Item_Identifier varchar(500),
Item_Weight decimal,
Item_Fat_Content varchar(500),
Item_Visibility decimal (10,9),
Item_Type varchar(500),
Item_MRP decimal,
Outlet_Identifier varchar(500),
Outlet_Establishment_Year date,
Outlet_Size varchar (500),
Outlet_Location_Type varchar(500),
Outlet_Type varchar(500),
Item_Outlet_Sales decimal);

#1 import data
select * from grocery_data;

#2 show all Item_Identifier
select item_Identifier from grocery_data;

#3 show count of total Item_Identifier
select count(Item_Identifier) from grocery_data;

#4 show maximum Item Weight
select max(Item_Weight) from grocery_data;

#5 show minimum Item Weight
select min(Item_Weight) from grocery_data;

#6 show average Item_Weight
select avg(Item_Weight) from grocery_data;

#7 show count of Item_Fat_Content WHERE Item_Fat_Content is Low Fat
select count(Item_Fat_Content) from grocery_data where Item_Fat_Content = "low fat";

#8 show count of Item_Fat_Content WHERE Item_Fat_Content is Regular
select count(Item_Fat_Content) from grocery_data where Item_Fat_Content = "regular";

#9 show maximum Item_MRP
select max(Item_MRP) from grocery_data;

#10 show minimum Item_MRP
select min(Item_MRP) from grocery_data;

#11 show Item_Identifier , Item_Fat_Content ,Item_Type, Item_MRP whose Item_MRP is greater than 200
select Item_Identifier, Item_Fat_Content, Item_Type, Item_MRP 
from grocery_data where Item_MRP > 200;

#12 show maximum Item_MRP WHERE Item_Fat_Content is Low Fat
select max(Item_MRP) from grocery_data where Item_Fat_Content = "Low Fat";

#13 show minimum Item_MRP whose Item_Fat_Content is Low Fat
select min(Item_MRP) from grocery_data where Item_Fat_Content = "Low Fat";

#14 show ALL DATA WHERE Item_MRP is BETWEEN 50 to 100
select * from grocery_data where Item_MRP between 50 and 100;

#15 show ALL UNIQUE value of Item_Fat_Content
select distinct (trim(Item_Fat_Content)) from grocery_data;

#16 show ALL UNIQUE value of  Item_Type
select distinct (trim(Item_Type)) from grocery_data;

#17 show ALL DATA in descending ORDER by Item MRP
select * from grocery_data 
order by Item_MRP desc;

#18 show ALL DATA in ascending ORDER by Item_Outlet_Sales
select * from grocery_data
order by Item_Outlet_Sales;

#19 show ALL DATA in ascending by Item_Type
select * from grocery_data
order by Item_Type;

#20 show DATA of item_type dairy & Meat
select * from Grocery_data where item_type in ("dairy","meat");

#21 show ALL UNIQUE value of Outlet_Size
select distinct (TRIM(Outlet_Size)) from grocery_data;

#22 show ALL UNIQUE value of Outlet_Location_Type
select distinct (TRIM(Outlet_Location_Type)) from grocery_data;

#23 show ALL UNIQUE value of Outlet_Type 
select distinct (TRIM(Outlet_Type)) from grocery_data;

#24 show count of number of items by Item_Type and order it in descending order
select count(Item_Type) from grocery_data 
group by Item_Type order by count(Item_Type)desc;

#25 show count of number of items by Outlet_Size and ordered it in ascending order
select count(Outlet_Size) from grocery_data 
group by Outlet_Size order by count(Outlet_Size) asc;

#26 show count of number of items by Outlet_Type  and ordered it in descending order
select count(Outlet_Type) from grocery_data 
group by Outlet_Type order by Outlet_Type desc;

#27 show count of items by Outlet_Location_Type and order it descending order
select count(Outlet_Location_Type) from grocery_data 
group by Outlet_Location_Type order by Outlet_Location_Type desc;

#28 show maximum MRP by Item_Type 
select max(Item_MRP), Item_Type from grocery_data 
group by Item_Type;

#29 show minimum MRP by Item_Type
select min(Item_MRP), Item_Type from grocery_data 
group by Item_Type;

#30 show minimum MRP by Outlet_Establishment_Year and order it in descending order
select min(Item_MRP), Outlet_Establishment_Year from grocery_data 
group by Outlet_Establishment_Year order by Outlet_Establishment_Year desc;

#31 show maximum MRP by Outlet_Establishment_Year and order it in descending order
select max(Item_MRP), Outlet_Establishment_Year from grocery_data 
group by Outlet_Establishment_Year order by Outlet_Establishment_Year desc;

#32 show average MRP by Outlet_Size and order it in descending order
select avg(Item_MRP), Outlet_Establishment_Year from grocery_data 
group by Outlet_Establishment_Year order by Outlet_Establishment_Year desc;

#33 Average MRP by Outlet_Type and ordered in ascending order
select avg(Item_MRP), Outlet_Type from grocery_data 
group by Outlet_Type order by Outlet_Type asc;

#34 show maximum MRP by Outlet_Type
select max(Item_MRP), Outlet_Type from grocery_data 
group by Outlet_Type;

#35 show maximum Item_Weight by Item_Type
select max(Item_Weight), Item_Type from grocery_data 
group by Item_Type;

#36 show maximum Item_Weight by Outlet_Establishment_Year
select max(Item_Weight), Outlet_Establishment_Year from grocery_data 
group by Outlet_Establishment_Year;

#37 show minimum Item_Weight by Outlet_Type
select min(Item_Weight), Outlet_Type from grocery_data 
group by Outlet_Type;

#38 show average Item_Weight by Outlet_Location_Type and arrange it by descending order
select avg(Item_Weight), Outlet_Location_Type from grocery_data 
group by Outlet_Location_Type order by Outlet_Location_Type desc;

#39 show maximum Item_Outlet_Sales by Item_Type
select max(Item_Outlet_Sales), Item_Type from grocery_data group by Item_Type;

#40 show minimum Item_Outlet_Sales by Item_Type
select min(Item_Outlet_Sales), Item_Type from grocery_data group by Item_Type;

#41 show minimum Item_Outlet_Sales by Outlet_Establishment_Year 
select min(Item_Outlet_Sales), Outlet_Establishment_Year from grocery_data group by Outlet_Establishment_Year;

#42 show maximum Item_Outlet_Sales by Outlet_Establishment_Year and order it by descending order
select max(Item_Outlet_Sales), Outlet_Establishment_Year from grocery_data 
group by Outlet_Establishment_Year order by Outlet_Establishment_Year desc;

#43 show average Item_Outlet_Sales by Outlet_Size and order it it descending order
select avg(Item_Outlet_Sales), Outlet_Size from grocery_data 
group by Outlet_Size order by Outlet_Size desc;

#44 show average Item_Outlet_Sales by Outlet_Type
select avg(Item_Outlet_Sales), Outlet_Type from grocery_data group by Outlet_Type;

#45 show maximum Item_Outlet_Sales by Outlet_Type
select max(Item_Outlet_Sales), Outlet_Type from grocery_data group by Outlet_Type

#46 show total Item_Outlet_Sales by Item_Type
select sum(Item_Outlet_Sales), Item_Type from grocery_data 
group by Item_Type;

#47 show total Item_Outlet_Sales by Item_Fat_Content
select sum(Item_Outlet_Sales), Item_Fat_Content from grocery_data 
group by Item_Fat_Content;

#48 show maximum Item_Visibility by Item_Type
select max(Item_Visibility), Item_Type from grocery_data group by Item_Type;

#49 show Minimum Item_Visibility by Item_Type
select min(Item_Visibility), Item_Type from grocery_data group by Item_Type;

#50 show total Item_Outlet_Sales by Item_Type but only WHERE Outlet_Location_Type is Tier 1
select sum(Item_Outlet_Sales), Item_Type from grocery_data where Outlet_Location_Type = "Tier 1" group by Item_Type;

#51 show total Item_Outlet_Sales by Item_Type WHERE Item_Fat_Content is ONLY Low Fat & LF
select sum(Item_Outlet_Sales), Item_Type from grocery_data where Item_Fat_Content in ("Low Fat" , "LF") group by Item_Type;
