-- Task 1: Project and Database Introduction
-- Objective: Explore different databases to understand their structure, including the columns and the type of information they contain.

```sql
-- View data from Customers table
SELECT *
FROM Customers;

-- View data from Categories table
SELECT *
FROM Categories;

-- View data from Employees table
SELECT *
FROM Employees;

-- Other tables (such as Products, Orders, OrderDetails) can be explored similarly
```

-- Task 2: A Look at the Question and the Suggested Solution
-- Objective: Identify the structure of different databases and, based on the question to be answered, select the most relevant databases to obtain accurate insights.
-- Business Problem: We need to identify the top 5 employees with the highest sales to award them bonuses.

-- SQL Code
-- View data from Orders table
SELECT *
FROM Orders;

-- View data from OrderDetails table
SELECT *
FROM OrderDetails
ORDER BY OrderID;

-- View data from Products table
SELECT *
FROM Products;


---

-- Task 3: Joining Tables Together in SQL to Obtain Data for Analysis
-- Objective:** Retrieve the necessary data to answer a business question by joining relevant fields from multiple tables using SQL.

-- SQL Code
-- Join Employees, Orders, OrderDetails, and Products tables to get the necessary data
SELECT LastName, FirstName, Orders.OrderID, Products.ProductID,
       Quantity, Price
FROM (((Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID)
    INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID)
    INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID)
ORDER BY LastName, FirstName;

---

-- Task 4: Calculate and Summarize Sales for each Order
-- Objective: Write SQL code to calculate and aggregate data by determining the total sales value per order. This involves multiplying quantity by price for each line item and then summarizing the results to obtain the overall order total.

-- SQL Code
-- Calculate the total sales value for each line item
SELECT LastName, FirstName, Orders.OrderID, Products.ProductID,
       Quantity, Price, Quantity * Price as SalesAmount
FROM (((Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID)
    INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID)
    INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID)
ORDER BY LastName, FirstName;

-- SQL Code
-- Summarize the sales amounts per order
SELECT LastName, FirstName, Orders.OrderID, SUM(Quantity * Price) as SalesAmount
FROM (((Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID)
    INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID)
    INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID)
GROUP BY LastName, FirstName, Orders.OrderID;


-- Task 5: Display the Solution
-- Objective: Present data in a structured format that provides valuable insights to support informed business decisions.

-- SQL Code
-- Display the top 5 employees with the highest total sales
SELECT TOP 5 LastName, FirstName, Orders.OrderID, SalesAmount
FROM (
    SELECT LastName, FirstName, Orders.OrderID, SUM(Quantity * Price) as SalesAmount
    FROM (((Employees
        INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID)
        INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID)
        INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID)
    GROUP BY LastName, FirstName, Orders.OrderID
) AS Subquery
ORDER BY SalesAmount DESC;
