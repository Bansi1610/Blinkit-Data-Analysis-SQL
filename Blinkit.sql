-- ============================================================
-- BLINKIT RETAIL SALES ANALYSIS
-- SQL DATA ANALYTICS PROJECT
-- ============================================================
-- Objective:
-- Analyze retail sales, product characteristics, outlet
-- characteristics, pricing, visibility and sales performance.
--
-- SQL Concepts Used:
-- SELECT, WHERE, DISTINCT, ORDER BY, GROUP BY,
-- Aggregate Functions, IN, BETWEEN, CASE,
-- CTEs, Correlated Subqueries and Window Functions.
-- ============================================================


-- ============================================================
-- 1. BASIC DATA EXPLORATION
-- ============================================================

-- View complete dataset
SELECT *
FROM grocery_data;


-- View item identifiers
SELECT Item_Identifier
FROM grocery_data;


-- Total number of records
SELECT COUNT(*) AS Total_Item_Records
FROM grocery_data;


-- Maximum item weight
SELECT MAX(Item_Weight) AS Maximum_Item_Weight
FROM grocery_data;


-- Minimum item weight
SELECT MIN(Item_Weight) AS Minimum_Item_Weight
FROM grocery_data;


-- Average item weight
SELECT ROUND(AVG(Item_Weight), 2) AS Average_Item_Weight
FROM grocery_data;


-- Count of Low Fat items
SELECT COUNT(*) AS Low_Fat_Item_Count
FROM grocery_data
WHERE LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf');


-- Count of Regular items
SELECT COUNT(*) AS Regular_Item_Count
FROM grocery_data
WHERE LOWER(TRIM(Item_Fat_Content)) IN ('regular', 'reg');


-- Maximum MRP
SELECT MAX(Item_MRP) AS Maximum_MRP
FROM grocery_data;


-- Minimum MRP
SELECT MIN(Item_MRP) AS Minimum_MRP
FROM grocery_data;



-- ============================================================
-- 2. DATA QUALITY & STANDARDIZATION
-- ============================================================

-- Check different fat-content values
SELECT
    Item_Fat_Content,
    COUNT(*) AS Record_Count
FROM grocery_data
GROUP BY Item_Fat_Content
ORDER BY Record_Count DESC;


-- Standardize fat-content categories
SELECT
    CASE
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf')
            THEN 'Low Fat'
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('regular', 'reg')
            THEN 'Regular'
        ELSE TRIM(Item_Fat_Content)
    END AS Standardized_Fat_Content,
    COUNT(*) AS Record_Count
FROM grocery_data
GROUP BY
    CASE
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf')
            THEN 'Low Fat'
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('regular', 'reg')
            THEN 'Regular'
        ELSE TRIM(Item_Fat_Content)
    END
ORDER BY Record_Count DESC;


-- Check missing values
SELECT
    SUM(CASE WHEN Item_Identifier IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Identifier,
    SUM(CASE WHEN Item_Weight IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Weight,
    SUM(CASE WHEN Item_Fat_Content IS NULL THEN 1 ELSE 0 END) AS Missing_Fat_Content,
    SUM(CASE WHEN Item_Visibility IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Visibility,
    SUM(CASE WHEN Item_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Item_Type,
    SUM(CASE WHEN Item_MRP IS NULL THEN 1 ELSE 0 END) AS Missing_MRP,
    SUM(CASE WHEN Outlet_Identifier IS NULL THEN 1 ELSE 0 END) AS Missing_Outlet_Identifier,
    SUM(CASE WHEN Outlet_Size IS NULL THEN 1 ELSE 0 END) AS Missing_Outlet_Size,
    SUM(CASE WHEN Outlet_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Outlet_Type,
    SUM(CASE WHEN Item_Outlet_Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales
FROM grocery_data;



-- ============================================================
-- 3. PRODUCT & PRICING ANALYSIS
-- ============================================================

-- Products with MRP greater than 200
SELECT
    Item_Identifier,
    Item_Fat_Content,
    Item_Type,
    Item_MRP
FROM grocery_data
WHERE Item_MRP > 200
ORDER BY Item_MRP DESC;


-- Maximum MRP for Low Fat products
SELECT
    MAX(Item_MRP) AS Maximum_Low_Fat_MRP
FROM grocery_data
WHERE LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf');


-- Minimum MRP for Low Fat products
SELECT
    MIN(Item_MRP) AS Minimum_Low_Fat_MRP
FROM grocery_data
WHERE LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf');


-- Products with MRP between 50 and 100
SELECT *
FROM grocery_data
WHERE Item_MRP BETWEEN 50 AND 100
ORDER BY Item_MRP;


-- Unique fat-content categories
SELECT DISTINCT
    TRIM(Item_Fat_Content) AS Item_Fat_Content
FROM grocery_data
ORDER BY Item_Fat_Content;


-- Unique item types
SELECT DISTINCT
    TRIM(Item_Type) AS Item_Type
FROM grocery_data
ORDER BY Item_Type;


-- Products ordered by highest MRP
SELECT *
FROM grocery_data
ORDER BY Item_MRP DESC;


-- Products ordered by lowest sales
SELECT *
FROM grocery_data
ORDER BY Item_Outlet_Sales ASC;


-- Products grouped alphabetically by item type
SELECT *
FROM grocery_data
ORDER BY Item_Type;


-- Dairy and Meat products
SELECT *
FROM grocery_data
WHERE LOWER(TRIM(Item_Type)) IN ('dairy', 'meat')
ORDER BY Item_Type;



-- ============================================================
-- 4. OUTLET ANALYSIS
-- ============================================================

-- Unique outlet sizes
SELECT DISTINCT
    TRIM(Outlet_Size) AS Outlet_Size
FROM grocery_data
ORDER BY Outlet_Size;


-- Unique outlet location types
SELECT DISTINCT
    TRIM(Outlet_Location_Type) AS Outlet_Location_Type
FROM grocery_data
ORDER BY Outlet_Location_Type;


-- Unique outlet types
SELECT DISTINCT
    TRIM(Outlet_Type) AS Outlet_Type
FROM grocery_data
ORDER BY Outlet_Type;


-- Number of records by item type
SELECT
    Item_Type,
    COUNT(*) AS Item_Count
FROM grocery_data
GROUP BY Item_Type
ORDER BY Item_Count DESC;


-- Number of records by outlet type
SELECT
    Outlet_Type,
    COUNT(*) AS Outlet_Record_Count
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Outlet_Record_Count DESC;


-- Number of records by outlet location
SELECT
    Outlet_Location_Type,
    COUNT(*) AS Outlet_Record_Count
FROM grocery_data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Record_Count DESC;


-- Number of records by outlet size
SELECT
    Outlet_Size,
    COUNT(*) AS Outlet_Record_Count
FROM grocery_data
GROUP BY Outlet_Size
ORDER BY Outlet_Record_Count DESC;



-- ============================================================
-- 5. PRODUCT & OUTLET CHARACTERISTICS
-- ============================================================

-- Maximum MRP by item type
SELECT
    Item_Type,
    MAX(Item_MRP) AS Maximum_MRP
FROM grocery_data
GROUP BY Item_Type
ORDER BY Maximum_MRP DESC;


-- Minimum MRP by item type
SELECT
    Item_Type,
    MIN(Item_MRP) AS Minimum_MRP
FROM grocery_data
GROUP BY Item_Type
ORDER BY Minimum_MRP ASC;


-- Minimum MRP by outlet establishment year
SELECT
    Outlet_Establishment_Year,
    MIN(Item_MRP) AS Minimum_MRP
FROM grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC;


-- Maximum MRP by outlet establishment year
SELECT
    Outlet_Establishment_Year,
    MAX(Item_MRP) AS Maximum_MRP
FROM grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC;


-- Average MRP by outlet size
SELECT
    Outlet_Size,
    ROUND(AVG(Item_MRP), 2) AS Average_MRP
FROM grocery_data
GROUP BY Outlet_Size
ORDER BY Average_MRP DESC;


-- Average MRP by outlet type
SELECT
    Outlet_Type,
    ROUND(AVG(Item_MRP), 2) AS Average_MRP
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Average_MRP DESC;


-- Maximum MRP by outlet type
SELECT
    Outlet_Type,
    MAX(Item_MRP) AS Maximum_MRP
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Maximum_MRP DESC;


-- Maximum item weight by item type
SELECT
    Item_Type,
    MAX(Item_Weight) AS Maximum_Item_Weight
FROM grocery_data
GROUP BY Item_Type
ORDER BY Maximum_Item_Weight DESC;


-- Maximum item weight by establishment year
SELECT
    Outlet_Establishment_Year,
    MAX(Item_Weight) AS Maximum_Item_Weight
FROM grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC;


-- Minimum item weight by outlet type
SELECT
    Outlet_Type,
    MIN(Item_Weight) AS Minimum_Item_Weight
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Minimum_Item_Weight ASC;


-- Average item weight by outlet location
SELECT
    Outlet_Location_Type,
    ROUND(AVG(Item_Weight), 2) AS Average_Item_Weight
FROM grocery_data
GROUP BY Outlet_Location_Type
ORDER BY Average_Item_Weight DESC;



-- ============================================================
-- 6. SALES & PERFORMANCE ANALYSIS
-- ============================================================

-- Maximum sales by item type
SELECT
    Item_Type,
    MAX(Item_Outlet_Sales) AS Maximum_Item_Outlet_Sales
FROM grocery_data
GROUP BY Item_Type
ORDER BY Maximum_Item_Outlet_Sales DESC;


-- Minimum sales by item type
SELECT
    Item_Type,
    MIN(Item_Outlet_Sales) AS Minimum_Item_Outlet_Sales
FROM grocery_data
GROUP BY Item_Type
ORDER BY Minimum_Item_Outlet_Sales ASC;


-- Minimum sales by establishment year
SELECT
    Outlet_Establishment_Year,
    MIN(Item_Outlet_Sales) AS Minimum_Item_Outlet_Sales
FROM grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC;


-- Maximum sales by establishment year
SELECT
    Outlet_Establishment_Year,
    MAX(Item_Outlet_Sales) AS Maximum_Item_Outlet_Sales
FROM grocery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC;


-- Average sales by outlet size
SELECT
    Outlet_Size,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Average_Item_Outlet_Sales
FROM grocery_data
GROUP BY Outlet_Size
ORDER BY Average_Item_Outlet_Sales DESC;


-- Average sales by outlet type
SELECT
    Outlet_Type,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Average_Item_Outlet_Sales
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Average_Item_Outlet_Sales DESC;


-- Maximum sales by outlet type
SELECT
    Outlet_Type,
    MAX(Item_Outlet_Sales) AS Maximum_Item_Outlet_Sales
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Maximum_Item_Outlet_Sales DESC;


-- Total sales by item type
SELECT
    Item_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM grocery_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;


-- Total sales by standardized fat content
SELECT
    CASE
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf')
            THEN 'Low Fat'
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('regular', 'reg')
            THEN 'Regular'
        ELSE TRIM(Item_Fat_Content)
    END AS Standardized_Fat_Content,
    ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM grocery_data
GROUP BY
    CASE
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf')
            THEN 'Low Fat'
        WHEN LOWER(TRIM(Item_Fat_Content)) IN ('regular', 'reg')
            THEN 'Regular'
        ELSE TRIM(Item_Fat_Content)
    END
ORDER BY Total_Sales DESC;


-- Maximum item visibility by item type
SELECT
    Item_Type,
    MAX(Item_Visibility) AS Maximum_Item_Visibility
FROM grocery_data
GROUP BY Item_Type
ORDER BY Maximum_Item_Visibility DESC;


-- Minimum item visibility by item type
SELECT
    Item_Type,
    MIN(Item_Visibility) AS Minimum_Item_Visibility
FROM grocery_data
GROUP BY Item_Type
ORDER BY Minimum_Item_Visibility ASC;


-- Total sales for Tier 1 locations
SELECT
    Item_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS Tier_1_Total_Sales
FROM grocery_data
WHERE TRIM(Outlet_Location_Type) = 'Tier 1'
GROUP BY Item_Type
ORDER BY Tier_1_Total_Sales DESC;


-- Total sales for Low Fat products
SELECT
    Item_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS Low_Fat_Total_Sales
FROM grocery_data
WHERE LOWER(TRIM(Item_Fat_Content)) IN ('low fat', 'lf')
GROUP BY Item_Type
ORDER BY Low_Fat_Total_Sales DESC;



-- ============================================================
-- 7. ADVANCED SQL ANALYSIS
-- ============================================================

-- ------------------------------------------------------------
-- 7.1 Rank item types by total sales
-- ------------------------------------------------------------

WITH ItemTypeSales AS (
    SELECT
        Item_Type,
        SUM(Item_Outlet_Sales) AS Total_Sales
    FROM grocery_data
    GROUP BY Item_Type
)
SELECT
    Item_Type,
    ROUND(Total_Sales, 2) AS Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM ItemTypeSales
ORDER BY Sales_Rank;


-- ------------------------------------------------------------
-- 7.2 Rank outlet types by average sales
-- ------------------------------------------------------------

WITH OutletTypePerformance AS (
    SELECT
        Outlet_Type,
        AVG(Item_Outlet_Sales) AS Average_Sales
    FROM grocery_data
    GROUP BY Outlet_Type
)
SELECT
    Outlet_Type,
    ROUND(Average_Sales, 2) AS Average_Sales,
    DENSE_RANK() OVER (
        ORDER BY Average_Sales DESC
    ) AS Performance_Rank
FROM OutletTypePerformance
ORDER BY Performance_Rank;


-- ------------------------------------------------------------
-- 7.3 Products priced above overall average MRP
-- ------------------------------------------------------------

SELECT
    Item_Identifier,
    Item_Type,
    Item_MRP
FROM grocery_data
WHERE Item_MRP > (
    SELECT AVG(Item_MRP)
    FROM grocery_data
)
ORDER BY Item_MRP DESC;


-- ------------------------------------------------------------
-- 7.4 Item types with sales above average item-type sales
-- ------------------------------------------------------------

WITH ItemTypeSales AS (
    SELECT
        Item_Type,
        SUM(Item_Outlet_Sales) AS Total_Sales
    FROM grocery_data
    GROUP BY Item_Type
)
SELECT
    Item_Type,
    ROUND(Total_Sales, 2) AS Total_Sales
FROM ItemTypeSales
WHERE Total_Sales > (
    SELECT AVG(Total_Sales)
    FROM ItemTypeSales
)
ORDER BY Total_Sales DESC;


-- ------------------------------------------------------------
-- 7.5 Compare outlet performance with overall average
-- ------------------------------------------------------------

SELECT
    Outlet_Type,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Average_Outlet_Sales,
    ROUND(
        AVG(Item_Outlet_Sales) -
        (
            SELECT AVG(Item_Outlet_Sales)
            FROM grocery_data
        ),
        2
    ) AS Difference_From_Overall_Average
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Difference_From_Overall_Average DESC;


-- ------------------------------------------------------------
-- 7.6 Top 3 item types by total sales
-- ------------------------------------------------------------

WITH ItemTypeSales AS (
    SELECT
        Item_Type,
        SUM(Item_Outlet_Sales) AS Total_Sales
    FROM grocery_data
    GROUP BY Item_Type
),
RankedItems AS (
    SELECT
        Item_Type,
        Total_Sales,
        DENSE_RANK() OVER (
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ItemTypeSales
)
SELECT
    Item_Type,
    ROUND(Total_Sales, 2) AS Total_Sales,
    Sales_Rank
FROM RankedItems
WHERE Sales_Rank <= 3
ORDER BY Sales_Rank;


-- ------------------------------------------------------------
-- 7.7 Sales contribution percentage by item type
-- ------------------------------------------------------------

WITH ItemTypeSales AS (
    SELECT
        Item_Type,
        SUM(Item_Outlet_Sales) AS Total_Sales
    FROM grocery_data
    GROUP BY Item_Type
)
SELECT
    Item_Type,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        Total_Sales * 100.0 /
        (SELECT SUM(Item_Outlet_Sales) FROM grocery_data),
        2
    ) AS Sales_Contribution_Percentage
FROM ItemTypeSales
ORDER BY Sales_Contribution_Percentage DESC;


-- ------------------------------------------------------------
-- 7.8 Compare average sales across outlet location tiers
-- ------------------------------------------------------------

SELECT
    Outlet_Location_Type,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Average_Sales,
    ROUND(
        AVG(Item_Outlet_Sales) -
        (
            SELECT AVG(Item_Outlet_Sales)
            FROM grocery_data
        ),
        2
    ) AS Difference_From_Overall_Average
FROM grocery_data
GROUP BY Outlet_Location_Type
ORDER BY Average_Sales DESC;



-- ============================================================
-- 8. BUSINESS INSIGHT QUERIES
-- ============================================================

-- Highest-selling item type
SELECT
    Item_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM grocery_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC
LIMIT 1;


-- Best-performing outlet type based on average sales
SELECT
    Outlet_Type,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Average_Sales
FROM grocery_data
GROUP BY Outlet_Type
ORDER BY Average_Sales DESC
LIMIT 1;


-- Highest-priced product
SELECT
    Item_Identifier,
    Item_Type,
    Item_MRP
FROM grocery_data
ORDER BY Item_MRP DESC
LIMIT 1;


-- Highest-sales product record
SELECT
    Item_Identifier,
    Item_Type,
    Outlet_Identifier,
    Item_Outlet_Sales
FROM grocery_data
ORDER BY Item_Outlet_Sales DESC
LIMIT 1;


-- Highest visibility item type
SELECT
    Item_Type,
    ROUND(AVG(Item_Visibility), 4) AS Average_Item_Visibility
FROM grocery_data
GROUP BY Item_Type
ORDER BY Average_Item_Visibility DESC
LIMIT 1;



-- ============================================================
-- END OF BLINKIT RETAIL SALES ANALYSIS
-- ============================================================
