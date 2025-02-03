# Data Analysis: Data extraction for business decision making with SQL
🔍 Data Analysis | 📈 Business Insights 

#### Author: Deiber Cubillos
#### Date: February 2, 2025

## **Introduction**
We will explore the different databases of a fictitious company (Northwind database), which seeks to make the decision of paying a bonus to the employees who have made the 5 highest sales.

As a method of increasing future sales, the company has decided to give employee bonuses for exemplary performance in sales. 
Bonuses will be awarded to those employees who are responsible for the five highest order amounts.
How can we identify those employees?


## **Task 1 : Project and Database Introduction**
**Objective:** Explore different databases to understand their structure, including the columns and the type of information they contain.

**Key Takeaways**
- A database is a collection of related tables.
- Data is stored in tables and is organized into rows and columns.
- The W3Schools SQL Tryit Editor provides a place to write and run SQL code. 

Here is our database overview:
![Image](https://github.com/user-attachments/assets/3b66bbbb-1526-47c0-ab20-6fae985a57b4)

```
SELECT *
FROM Customers;

SELECT *
FROM Categories;

SELECT *
FROM Employees;

...
```

# **Task 2 : A Look at the Question and the Suggested Solution**
**Objective:** Identify the structure of different databases and, based on the question to be answered, select the most relevant databases to obtain accurate insights.

**Key Takeaways**
- The data analyst strives to use data to answer business questions.
- A business problem is best solved by examining the data available and visualizing which pieces of data should make up the solution.
- Data from multiple tables may be required to solve a business problem.

We are going to use 4 tables in order to solve our business problem: Employees, Orders, Order Details and  Products.
![Image](https://github.com/user-attachments/assets/b5bb05ed-771b-4a5a-9a08-85722b55b4f4)
Values must sometimes be calculated:  
    <ins> Sales amount per item = Quantity multiplied by Unit Price </ins>
```
SELECT *
FROM Orders;

SELECT *
FROM Orderdetails
ORDER BY OrderId;

SELECT *
FROM Products;
```

## **Task 3 : Joining Tables Together in SQL to Obtain Data for Analysis**
**Objective:** Retrieve the necessary data to answer a business question by joining relevant fields from multiple tables using SQL.

**Key Takeaways**
- To join two tables, they must share a common column.
- The SQL INNER JOIN command returns only rows that match between two tables.
- An SQL query can be keyed into the SQL Tryit editor without regard to case; however, correct spelling and punctuation is critical

To achieve this, we will use the following fields found in different data tables, as shown in the diagram below
| Tables | Fields |
| ------- | ---------|
| Employees | LastName and FirstName |
| Orders | OrderID |
| OrderDetails | ProductID and Quantity |
| Products | Price |

![Image](https://github.com/user-attachments/assets/2389f205-9250-4337-994e-27707bf374dd)
> [!TIP]
>**Reminder:** Tables must have a common field to establish relationships between them.

```
SELECT LastName, FirstName, Orders.OrderID, Products.ProductID,
            Quantity, Price
FROM Employees
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY LastName, FirstName;

```



