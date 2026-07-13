
===============================================================================
                            RETAIL SALES SQL ANALYTICS
===============================================================================

File Name    : 5_CTE_Analysis.sql
Author       : Manish Bokadia
Database     : Retail Sales

Description:
This SQL script demonstrates Common Table Expressions (CTEs) for solving
real-world business problems. It includes single CTEs, multiple CTEs,
nested analysis, and business reporting.

===============================================================================
TABLE OF CONTENTS
===============================================================================

1. Sales by Region using CTE
2. Top 5 Customers using CTE
3. Category Contribution using CTE
4. Monthly Sales Growth using Multiple CTEs
5. Top Product in Each Category using CTE
6. Above Average Region Sales

===============================================================================



******************************************************************************
 CTE QUESTION 1
*******************************************************************************

Question:
Calculate total sales for each region using a CTE.

Business Objective:
Analyze regional performance.

SQL Concepts Used:
• CTE
• GROUP BY
• SUM()

******************************************************************************/

WITH region_sales AS
(
    SELECT
        region,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY region
)

SELECT *
FROM region_sales
ORDER BY total_sales DESC;


Business Insight:

CTEs improve query readability and make complex
business logic easier to understand.




******************************************************************************
 CTE QUESTION 2
*******************************************************************************

Question:
Find Top 5 Customers using a CTE.

Business Objective:
Identify highest revenue-generating customers.

SQL Concepts Used:
• CTE
• GROUP BY
• ORDER BY
• LIMIT

******************************************************************************/

WITH customer_sales AS
(
    SELECT
        customer_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY customer_name
)

SELECT *

FROM customer_sales

ORDER BY total_sales DESC

LIMIT 5;


Business Insight:

Top customers deserve loyalty programs
and premium customer service.




******************************************************************************
 CTE QUESTION 3
*******************************************************************************

Question:
Calculate each category's contribution to company sales.

Business Objective:
Measure category contribution.

SQL Concepts Used:
• CTE
• Window Functions

******************************************************************************/

WITH category_sales AS
(
    SELECT
        category,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY category
)

SELECT

    category,

    ROUND(total_sales,2) total_sales,

    ROUND(

        total_sales*100/

        SUM(total_sales) OVER(),

        2

    ) contribution_percentage

FROM category_sales

ORDER BY contribution_percentage DESC;


Business Insight:

Shows how much revenue each category contributes
to the overall business.

*/


/******************************************************************************
 CTE QUESTION 4
*******************************************************************************

Question:
Compare monthly sales with previous month.

Business Objective:
Track sales growth.

SQL Concepts Used:
• Multiple CTE
• LAG()

******************************************************************************/

WITH monthly_sales AS
(
    SELECT

        YEAR(order_date) AS order_year,

        MONTH(order_date) AS order_month,

        SUM(sales) AS total_sales

    FROM sales

    GROUP BY

        YEAR(order_date),

        MONTH(order_date)
),

growth AS
(
    SELECT

        *,

        LAG(total_sales)

        OVER(

            ORDER BY order_year,order_month

        ) previous_month

    FROM monthly_sales
)

SELECT *

FROM growth;

/*
Business Insight:

Helps identify periods of business growth
and decline.

*/


/******************************************************************************
 CTE QUESTION 5
*******************************************************************************

Question:
Find the top-selling product in each category.

Business Objective:
Identify category leaders.

SQL Concepts Used:
• Multiple CTE
• ROW_NUMBER()

******************************************************************************/

WITH product_sales AS
(
    SELECT

        category,

        product_name,

        SUM(sales) total_sales

    FROM sales

    GROUP BY

        category,

        product_name
),

ranking AS
(
    SELECT

        *,

        ROW_NUMBER()

        OVER(

            PARTITION BY category

            ORDER BY total_sales DESC

        ) rn

    FROM product_sales
)

SELECT

    category,

    product_name,

    ROUND(total_sales,2) total_sales

FROM ranking

WHERE rn=1;

/*
Business Insight:

Category leaders should receive additional
inventory and promotional support.

*/


/******************************************************************************
 CTE QUESTION 6
*******************************************************************************

Question:
Find regions whose sales are above the average region sales.

Business Objective:
Identify high-performing regions.

SQL Concepts Used:
• CTE
• Subquery

******************************************************************************/

WITH region_sales AS
(
    SELECT

        region,

        SUM(sales) total_sales

    FROM sales

    GROUP BY region
)

SELECT

    region,

    ROUND(total_sales,2) total_sales

FROM region_sales

WHERE total_sales >

(

SELECT

AVG(total_sales)

FROM region_sales

)

ORDER BY total_sales DESC;

/*
Business Insight:

Regions performing above average
can be used as benchmarks for
other regions.

*/



===============================================================================

END OF FILE

SQL Concepts Covered

✔ Common Table Expressions (CTE)

✔ Multiple CTEs

✔ Window Functions

✔ LAG()

✔ ROW_NUMBER()

✔ GROUP BY

✔ Aggregate Functions

===============================================================================
