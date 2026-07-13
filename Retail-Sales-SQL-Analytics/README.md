# 📊 Retail Sales SQL Analytics

## 📌 Project Overview

This project demonstrates how **SQL** can be used to solve real-world retail business problems by transforming raw sales data into meaningful business insights.

The project covers customer analytics, product performance, regional sales analysis, contribution analysis, ranking, and trend analysis using advanced SQL concepts such as **Common Table Expressions (CTEs), Window Functions, Aggregate Functions, Ranking Functions, and Running Totals**.

The objective is to showcase how SQL can support business decision-making before building Business Intelligence dashboards.

---

# 🎯 Business Problem

Retail companies generate thousands of sales transactions every month.

Business managers need answers to questions such as:

- Which region generates the highest sales?
- Who are our most valuable customers?
- Which products contribute the most revenue?
- Which products should receive more marketing investment?
- How much does each region contribute to total company sales?
- Which products fall under Category A, B and C (ABC Analysis)?
- Which customers show consistent sales growth?

This project answers these business questions using SQL.

---

# 📂 Dataset

Retail_sales.csv

The dataset contains retail transaction information including:

- Order Date
- Customer Name
- Product Name
- Category
- Region
- Sales
- Profit
- Quantity

---

# 💻 SQL Skills Demonstrated

This project demonstrates the following SQL concepts:

- Aggregate Functions
- GROUP BY
- HAVING
- ORDER BY
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- Running Totals
- Percentage Contribution Analysis
- CASE Statements
- ABC Classification
- Customer & Product Ranking

---

# 📈 Business Problems Solved

| No. | Business Problem | SQL Concepts Used |
|----:|------------------|-------------------|
| 1 | Regional Sales Analysis | GROUP BY |
| 2 | Top Customer in Each Region | CTE + DENSE_RANK() |
| 3 | Top 10 Customers | GROUP BY + ORDER BY |
| 4 | Top 10 Products | GROUP BY + ORDER BY |
| 5 | Sales Contribution by Region | Window Functions |
| 6 | Running Sales Percentage | SUM() OVER() |
| 7 | ABC Product Classification | CASE + Window Functions |
| 8 | Month-over-Month Sales Comparison | LAG() |
| 9 | Difference Between Top & Second Customer | LEAD() |
| 10 | Ranking Products by Sales | DENSE_RANK() |

---

# 📊 Key Business Insights

The SQL analysis revealed several important business insights:

- West region generated the highest sales.
- Electronics contributed the highest share of company revenue.
- A small number of customers generated a significant portion of total sales.
- Product sales followed the Pareto Principle, where a limited number of products contributed most of the company's revenue.
- Significant variation existed between top-performing and low-performing products, highlighting opportunities for targeted marketing and inventory planning.

---

# 📁 Project Structure

```
Retail-Sales-SQL-Analytics/
│
├── Dataset/
│   └── Retail_sales.csv
│
├── SQL Queries/
│   ├── 01_Sales_Analysis.sql
│   ├── 02_Customer_Analysis.sql
│   ├── 03_Product_Analysis.sql
│   ├── 04_Window_Functions.sql
│   ├── 05_CTE_Analysis.sql
│   └── 06_ABC_Analysis.sql
│
├── Images/
│   └── SQL_Output.png
│
└── README.md
```

---

# 🚀 Learning Outcomes

Through this project I strengthened my understanding of:

- Writing efficient SQL queries
- Solving business problems using SQL
- Advanced Window Functions
- Business Analytics using SQL
- Customer & Product Analytics
- Data-driven decision making

---

# 👨‍💻 Author

**Manish Bokadia**


---

⭐ If you found this project useful, please consider giving it a star.
