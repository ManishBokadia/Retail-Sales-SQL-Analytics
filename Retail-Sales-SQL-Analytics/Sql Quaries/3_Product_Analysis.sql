
===============================================================================
                            RETAIL SALES SQL ANALYTICS
===============================================================================

File Name    : 3_Product_Analysis.sql
Author       : Manish Bokadia
Database     : Retail Sales

Description:
This SQL script analyzes product performance by identifying top-selling
products, category leaders, product contribution, and products requiring
business attention.

===============================================================================
TABLE OF CONTENTS
===============================================================================

1. Top 10 Best Selling Products
2. Bottom 10 Products by Sales
3. Rank Products by Sales
4. Product Sales Contribution (%)
5. Top Selling Product in Each Category
6. Products Selling Above Average

===============================================================================



******************************************************************************
 BUSINESS QUESTION 1
*******************************************************************************

Question:
Which are the Top 10 best-selling products?

Business Objective:
Identify products generating the highest revenue.

SQL Concepts Used:
• GROUP BY
• SUM()
• ORDER BY
• LIMIT

******************************************************************************/

SELECT

    product_name,

    ROUND(SUM(sales),2) AS total_sales

FROM sales

GROUP BY product_name

ORDER BY total_sales DESC

LIMIT 10;



Business Insight:

Top-selling products are responsible for a significant portion
of business revenue.

These products should always remain in stock and receive
priority inventory planning.




******************************************************************************
 BUSINESS QUESTION 2
*******************************************************************************

Question:
Which are the Bottom 10 products by sales?

Business Objective:
Identify underperforming products.

SQL Concepts Used:
• GROUP BY
• SUM()
• ORDER BY
• LIMIT

******************************************************************************/

SELECT

    product_name,

    ROUND(SUM(sales),2) AS total_sales

FROM sales

GROUP BY product_name

ORDER BY total_sales

LIMIT 10;



Business Insight:

Low-performing products may require

• Better marketing

• Bundle offers

• Product redesign

or discontinuation.




******************************************************************************
 BUSINESS QUESTION 3
*******************************************************************************

Question:
Rank all products according to sales.

Business Objective:
Assign ranking to products based on revenue.

SQL Concepts Used:
• CTE
• DENSE_RANK()

******************************************************************************/

WITH product_sales AS

(

SELECT

    product_name,

    SUM(sales) AS total_sales

FROM sales

GROUP BY product_name

)

SELECT

    product_name,

    ROUND(total_sales,2) AS total_sales,

    DENSE_RANK()

    OVER(

        ORDER BY total_sales DESC

    ) AS product_rank

FROM product_sales;



Business Insight:

Product ranking helps management identify

Top performers

Average performers

Low performers

for inventory planning.




******************************************************************************
 BUSINESS QUESTION 4
*******************************************************************************

Question:
What percentage of company sales comes from each product?

Business Objective:
Measure product contribution.

SQL Concepts Used:
• CTE
• Window Functions

******************************************************************************/

WITH product_sales AS

(

SELECT

    product_name,

    SUM(sales) AS total_sales

FROM sales

GROUP BY product_name

)

SELECT

    product_name,

    ROUND(total_sales,2) AS total_sales,

    ROUND

    (

        total_sales*100

        /

        SUM(total_sales) OVER(),

        2

    ) AS contribution_percentage

FROM product_sales

ORDER BY contribution_percentage DESC;



Business Insight:

Shows how dependent the company is on
individual products.

Useful for portfolio diversification.




******************************************************************************
 BUSINESS QUESTION 5
*******************************************************************************

Question:
Find the highest-selling product in each category.

Business Objective:
Identify category leaders.

SQL Concepts Used:
• CTE
• ROW_NUMBER()

******************************************************************************/

WITH product_sales AS

(

SELECT

    category,

    product_name,

    SUM(sales) AS total_sales

FROM sales

GROUP BY

    category,

    product_name

)

SELECT *

FROM

(

SELECT

    *,

    ROW_NUMBER()

    OVER(

        PARTITION BY category

        ORDER BY total_sales DESC

    ) AS rn

FROM product_sales

) x

WHERE rn=1;



Business Insight:

Category leaders represent the strongest
products within each category.

These products should receive
additional promotion and inventory.




******************************************************************************
 BUSINESS QUESTION 6
*******************************************************************************

Question:
Which products generate above-average sales?

Business Objective:
Identify high-performing products.

SQL Concepts Used:
• CTE
• Subquery

******************************************************************************/

WITH product_sales AS

(

SELECT

    product_name,

    SUM(sales) AS total_sales

FROM sales

GROUP BY product_name

)

SELECT

    product_name,

    ROUND(total_sales,2) AS total_sales

FROM product_sales

WHERE total_sales >

(

SELECT

    AVG(total_sales)

FROM product_sales

)

ORDER BY total_sales DESC;



Business Insight:

Above-average products are the company's
core revenue generators.

Management should ensure

• Continuous availability

• Better marketing

• Premium positioning


===============================================================================

END OF FILE

Total Business Questions : 6

SQL Concepts Covered

✔ GROUP BY

✔ Aggregate Functions

✔ CTE

✔ DENSE_RANK()

✔ ROW_NUMBER()

✔ Window Functions

✔ Product Contribution

✔ Product Ranking

===============================================================================
*/
