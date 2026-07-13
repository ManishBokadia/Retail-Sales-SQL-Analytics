
===============================================================================
                            RETAIL SALES SQL ANALYTICS
===============================================================================

File Name    : 2_Customer_Analysis.sql
Author       : Manish Bokadia
Database     : Retail Sales

Description:
This SQL script analyzes customer behavior by identifying top customers,
customer rankings, customer contribution, regional leaders, and purchasing
patterns.

===============================================================================
TABLE OF CONTENTS
===============================================================================

1. Top 10 Customers by Sales
2. Rank Customers by Sales
3. Top Customer in Each Region
4. Customer Sales Contribution (%)
5. Average Order Value per Customer
6. Customers with Above Average Sales

===============================================================================


******************************************************************************
 BUSINESS QUESTION 1
*******************************************************************************

Question:
Who are the Top 10 customers based on total sales?

Business Objective:
Identify the highest revenue-generating customers.

SQL Concepts Used:
• GROUP BY
• SUM()
• ORDER BY
• LIMIT

******************************************************************************/

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


Business Insight:

Top customers contribute a significant portion of company revenue.

These customers should receive loyalty programs,
priority support, and personalized marketing.



******************************************************************************
 BUSINESS QUESTION 2
*******************************************************************************

Question:
Rank customers according to total sales.

Business Objective:
Assign ranking based on customer revenue.

SQL Concepts Used:
• CTE
• DENSE_RANK()

******************************************************************************/

WITH customer_sales AS
(
    SELECT
        customer_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY customer_name
)

SELECT
    customer_name,
    ROUND(total_sales,2) AS total_sales,
    DENSE_RANK() OVER
    (
        ORDER BY total_sales DESC
    ) AS customer_rank
FROM customer_sales;


Business Insight:

Customer ranking helps management identify
VIP customers and prioritize retention efforts.



******************************************************************************
 BUSINESS QUESTION 3
*******************************************************************************

Question:
Who is the highest sales-generating customer in each region?

Business Objective:
Identify regional top-performing customers.

SQL Concepts Used:
• CTE
• ROW_NUMBER()

******************************************************************************/

WITH customer_sales AS
(
    SELECT
        region,
        customer_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY
        region,
        customer_name
)

SELECT *

FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER
        (
            PARTITION BY region
            ORDER BY total_sales DESC
        ) AS rn
    FROM customer_sales
) x

WHERE rn = 1;

/
Business Insight:

Identifies the most valuable customer
within each region.

Useful for regional relationship management.



******************************************************************************
 BUSINESS QUESTION 4
*******************************************************************************

Question:
What percentage of company sales comes from each customer?

Business Objective:
Measure customer contribution.

SQL Concepts Used:
• CTE
• Window Functions

******************************************************************************/

WITH customer_sales AS
(
    SELECT
        customer_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY customer_name
)

SELECT
    customer_name,
    ROUND(total_sales,2) AS total_sales,

    ROUND
    (
        total_sales * 100 /
        SUM(total_sales) OVER(),
        2
    ) AS contribution_percentage

FROM customer_sales

ORDER BY contribution_percentage DESC;


Business Insight:

Shows whether company revenue
depends heavily on a few customers.

High dependency indicates business risk.



******************************************************************************
 BUSINESS QUESTION 5
*******************************************************************************

Question:
What is the Average Order Value (AOV) of each customer?

Business Objective:
Measure average spending per order.

SQL Concepts Used:
• GROUP BY
• AVG()

******************************************************************************/

SELECT
    customer_name,
    ROUND(AVG(sales),2) AS average_order_value
FROM sales
GROUP BY customer_name
ORDER BY average_order_value DESC;


Business Insight:

Customers with high average order values
are excellent candidates for premium products
and upselling campaigns.



*****************************************************************************
 BUSINESS QUESTION 6
*******************************************************************************

Question:
Which customers generate sales above the overall average customer sales?

Business Objective:
Identify above-average customers.

SQL Concepts Used:
• CTE
• HAVING
• Subquery

******************************************************************************/

WITH customer_sales AS
(
    SELECT
        customer_name,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY customer_name
)

SELECT
    customer_name,
    ROUND(total_sales,2) AS total_sales
FROM customer_sales

WHERE total_sales >
(
    SELECT
        AVG(total_sales)
    FROM customer_sales
)

ORDER BY total_sales DESC;


Business Insight:

Above-average customers represent the
company's most profitable customer base.

These customers should receive focused
retention and engagement strategies.




===============================================================================

END OF FILE

Total Business Questions : 6

SQL Concepts Covered

✔ GROUP BY

✔ Aggregate Functions

✔ CTE

✔ ROW_NUMBER()

✔ DENSE_RANK()

✔ Window Functions

✔ Customer Contribution Analysis

✔ Average Order Value (AOV)

===============================================================================
