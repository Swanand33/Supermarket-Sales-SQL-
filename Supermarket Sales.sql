CREATE SCHEMA supermarket_sales_db;




CREATE TABLE supermarket_sales (
    Invoice_ID VARCHAR(20),
    Branch CHAR(1),
    City VARCHAR(50),
    Customer_type VARCHAR(10),
    Gender VARCHAR(10),
    Product_line VARCHAR(50),
    Unit_price DECIMAL(10, 2),
    Quantity INT,
    Tax_5 DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Date DATE,
    Time TIME,
    Payment VARCHAR(20),
    cogs DECIMAL(10, 2),
    gross_margin_percentage DECIMAL(10, 2),
    gross_income DECIMAL(10, 2),
    Rating DECIMAL(3, 1)
);

# Count of Transactions
SELECT COUNT(*) AS transaction_count
FROM supermarket_sales;

   #Total Sales by Branch
SELECT Branch, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY Branch;


  #Average Rating by Product Line
SELECT Product_line, AVG(Rating) AS average_rating
FROM supermarket_sales
GROUP BY Product_line;


  #Total Quantity Sold by City
SELECT City, SUM(Quantity) AS total_quantity_sold
FROM supermarket_sales
GROUP BY City;


  #Sales by Payment Method
SELECT Payment, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY Payment;


  #Top 5 Products by Sales Amount
SELECT Product_line, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY Product_line
ORDER BY total_sales DESC
LIMIT 5;


  #Monthly Sales Trend
SELECT DATE_FORMAT(Date, '%Y-%m') AS month, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY month
ORDER BY month;


  #Branch with Highest Average Rating
SELECT Branch, AVG(Rating) AS average_rating
FROM supermarket_sales
GROUP BY Branch
ORDER BY average_rating DESC
LIMIT 1;


 #Top 3 Cities by Number of Transactions
SELECT City, COUNT(*) AS transaction_count
FROM supermarket_sales
GROUP BY City
ORDER BY transaction_count DESC
LIMIT 3;


 #Gender Distribution by Product Line
SELECT Product_line, Gender, COUNT(*) AS gender_count
FROM supermarket_sales
GROUP BY Product_line, Gender;


 #Sales Contribution of Each Product Line in Each City
SELECT City, Product_line, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY City, Product_line
ORDER BY City, total_sales DESC;


  #Yearly Sales Analysis
SELECT YEAR(Date) AS year, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY year
ORDER BY year;




