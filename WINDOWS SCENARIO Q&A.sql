USE WINDOWS;

-- SCENARIO 01
/*Scenario
The HR department wants to assign a unique sequence number to every employee based on the highest salary.
Display the Employee ID, Employee Name, Department, Salary, and Sequence Number.
Arrange the employees from the highest salary to the lowest salary.*/

CREATE TABLE Employee2 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee2 (Emp_ID, Emp_Name, Department, Salary) VALUES
(101, 'Alice', 'HR', 55000.00),
(102, 'Bob', 'HR', 62000.00),
(103, 'Charlie', 'IT', 85000.00),
(104, 'David', 'IT', 78000.00),
(105, 'Emma', 'Finance', 92000.00),
(106, 'Frank', 'Finance', 88000.00),
(107, 'Grace', 'Marketing', 67000.00),
(108, 'Henry', 'Marketing', 61000.00),
(109, 'Ivy', 'Sales', 73000.00),
(110, 'Jack', 'Sales', 69000.00),
(111, 'Kevin', 'HR', 58000.00),
(112, 'Linda', 'IT', 81000.00),
(113, 'Mike', 'Finance', 76000.00),
(114, 'Nancy', 'Sales', 72000.00),
(115, 'Oliver', 'Marketing', 64000.00);

SELECT * FROM Employee2;

SELECT EMP_ID, EMP_NAME, DEPARTMENT, SALARY, row_number()
OVER(
 
ORDER BY SALARY DESC 
) AS SEQUENCE_NUMBER
FROM EMPLOYEE2;

-- SCENARIO 02
/* Scenario
The HR team wants to rank employees based on salary within each department.
Display the Employee Name, Department, Salary, and Rank.
Highest salary should receive Rank 1 in every department.*/

INSERT INTO Employee2 (Emp_ID, Emp_Name, Department, Salary) VALUES
(116, 'Sophia', 'HR', 65000.00),
(117, 'William', 'IT', 90000.00),
(118, 'Ava', 'Finance', 83000.00),
(119, 'James', 'Sales', 71000.00),
(120, 'Charlotte', 'Marketing', 68000.00);
SELECT * FROM Employee2;

SELECT  EMP_NAME, DEPARTMENT, SALARY, RANK()
OVER(
 PARTITION BY DEPARTMENT
ORDER BY SALARY DESC 

) AS RANKNUMBER
FROM EMPLOYEE2;

-- SCENARIO 03
/*Scenario
A company has multiple branches.
Assign a unique row number to employees within each branch based on Employee ID.
Display the Employee Name, Branch, Employee ID, and Row Number.*/

CREATE TABLE Employe2 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Branch VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employe2 (Emp_ID, Emp_Name, Branch, Salary) VALUES
(101, 'Alice', 'Chennai', 55000.00),
(102, 'Bob', 'Chennai', 62000.00),
(103, 'Charlie', 'Chennai', 58000.00),
(104, 'David', 'Bangalore', 75000.00),
(105, 'Emma', 'Bangalore', 82000.00),
(106, 'Frank', 'Bangalore', 79000.00),
(107, 'Grace', 'Hyderabad', 68000.00),
(108, 'Henry', 'Hyderabad', 71000.00),
(109, 'Ivy', 'Hyderabad', 69000.00),
(110, 'Jack', 'Mumbai', 90000.00),
(111, 'Kevin', 'Mumbai', 85000.00),
(112, 'Linda', 'Mumbai', 88000.00),
(113, 'Mike', 'Delhi', 73000.00),
(114, 'Nancy', 'Delhi', 76000.00),
(115, 'Oliver', 'Delhi', 72000.00),
(116, 'Sophia', 'Pune', 64000.00),
(117, 'William', 'Pune', 67000.00),
(118, 'Ava', 'Pune', 66000.00);

SELECT * FROM Employe2;

SELECT EMP_NAME,BRANCH, EMP_ID, row_number()
OVER(
PARTITION BY BRANCH
ORDER BY EMP_ID
) AS ROWNUMBER
FROM EMPLOYE2;

-- SCENARIO 04
/*The Finance department wants employees having the same salary to receive the same rank, and the next rank should not skip any number.
Display the Employee Name, Salary, and Salary Rank.*/

SELECT EMP_NAME, SALARY, dense_rank()
OVER(

ORDER BY SALARY DESC
) AS SAMESALARY
FROM EMPLOYE2;

-- SCENARIO 05
/*The company wants to rank employees separately for every Branch and Department combination based on salary.
Display the Employee Name, Branch, Department, Salary, and Rank.*/

CREATE TABLE Employee3 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Branch VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee3 (Emp_ID, Emp_Name, Branch, Department, Salary) VALUES
(101, 'Alice',    'Chennai',   'HR',        55000.00),
(102, 'Bob',      'Chennai',   'HR',        62000.00),
(103, 'Charlie',  'Chennai',   'IT',        85000.00),
(104, 'David',    'Chennai',   'IT',        78000.00),
(105, 'Emma',     'Bangalore', 'Finance',   92000.00),
(106, 'Frank',    'Bangalore', 'Finance',   88000.00),
(107, 'Grace',    'Bangalore', 'HR',        60000.00),
(108, 'Henry',    'Bangalore', 'HR',        60000.00),
(109, 'Ivy',      'Hyderabad', 'Sales',     73000.00),
(110, 'Jack',     'Hyderabad', 'Sales',     69000.00),
(111, 'Kevin',    'Hyderabad', 'IT',        81000.00),
(112, 'Linda',    'Hyderabad', 'IT',        81000.00),
(113, 'Mike',     'Mumbai',    'Finance',   76000.00),
(114, 'Nancy',    'Mumbai',    'Finance',   83000.00),
(115, 'Oliver',   'Mumbai',    'Sales',     72000.00),
(116, 'Sophia',   'Mumbai',    'Sales',     72000.00),
(117, 'William',  'Delhi',     'HR',        65000.00),
(118, 'Ava',      'Delhi',     'HR',        68000.00),
(119, 'James',    'Delhi',     'IT',        90000.00),
(120, 'Mia',      'Delhi',     'IT',        87000.00),
(121, 'Noah',     'Pune',      'Finance',   75000.00),
(122, 'Olivia',   'Pune',      'Finance',   75000.00),
(123, 'Ethan',    'Pune',      'Sales',     70000.00),
(124, 'Sophie',   'Pune',      'Sales',     68000.00),
(125, 'Lucas',    'Chennai',   'Finance',   95000.00);
SELECT * FROM Employee3;

SELECT EMP_NAME, DEPARTMENT, BRANCH, SALARY,RANK()
OVER(
partition by BRANCH, DEPARTMENT
ORDER BY SALARY  DESC
) AS RANKS
FROM EMPLOYEE3;

-- SCENARIO 06
/*The HR department wants employees sorted by highest salary.
If two employees receive the same salary, arrange them alphabetically by Employee Name.
Display the Employee Name, Salary, and Row Number*/

INSERT INTO Employe2 (Emp_ID, Emp_Name, Branch, Salary) VALUES
(119, 'VINI', 'Chennai', 90000.00);

SELECT EMP_NAME, SALARY, row_number()
OVER(
ORDER BY SALARY DESC, EMP_NAME ASC
) AS ROWNUMBER
FROM EMPLOYE2;

-- Scenario 7 – Department-wise Experience Ranking
/*Scenario
The HR department wants to rank employees within each department.
Employees should first be sorted by Experience (Highest to Lowest).
If two employees have the same experience, sort them by Salary (Highest to Lowest).
Display the Employee Name, Department, Experience, Salary, and Rank.*/

CREATE TABLE Employee5 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);
INSERT INTO Employee5 VALUES
(101, 'Aarav',   'Finance',   10, 90000.00),
(102, 'Bhavya',  'Finance',    8, 85000.00),
(103, 'Charan',  'Finance',    8, 80000.00),
(104, 'Deepika', 'Finance',    5, 70000.00),
(105, 'Eshan',   'Finance',    3, 60000.00),

(106, 'Farah',   'IT',        12, 110000.00),
(107, 'Gokul',   'IT',         10, 100000.00),
(108, 'Harini',  'IT',         10, 95000.00),
(109, 'Ishaan',  'IT',          7, 80000.00),
(110, 'Janani',  'IT',          5, 75000.00),

(111, 'Karan',   'HR',          9, 70000.00),
(112, 'Lavanya', 'HR',          9, 68000.00),
(113, 'Manoj',   'HR',          6, 60000.00),
(114, 'Nithya',  'HR',          4, 50000.00),
(115, 'Omkar',   'HR',          2, 45000.00),

(116, 'Priya',   'Sales',      11, 95000.00),
(117, 'Rahul',   'Sales',       8, 85000.00),
(118, 'Sneha',   'Sales',       8, 82000.00),
(119, 'Tarun',   'Sales',       5, 65000.00),
(120, 'Varun',   'Sales',       3, 55000.00);

SELECT * FROM EMPLOYEE5;
SELECT Emp_Name, Department, Experience, Salary, Rank()
OVER
( PARTITION BY DEPARTMENT
ORDER BY EXPERIENCE DESC
) AS RANKS
FROM EMPLOYEE5;

-- Scenario 8 – Multi-Level Employee Ranking
/*Scenario
The management wants to assign row numbers separately for each Country and Branch.
Within each group, employees should be sorted by:
1. Salary (Highest)
2. Experience (Highest)
3. Employee Name (Alphabetically)
Display the Employee Name, Country, Branch, Salary, Experience, and Row Number.*/
USE WINDOWS;
SELECT * FROM EMPLOYE6;

CREATE TABLE Employe6 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Country VARCHAR(50),
    Branch VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);
INSERT INTO Employe6 VALUES
(101,'Aarav','India','Hyderabad',90000.00,8),
(102,'Bhavya','India','Hyderabad',85000.00,6),
(103,'Charan','India','Hyderabad',90000.00,5),
(104,'Deepika','India','Hyderabad',75000.00,7),
(105,'Eshan','India','Hyderabad',70000.00,4),

(106,'Farah','India','Bangalore',95000.00,9),
(107,'Gokul','India','Bangalore',88000.00,8),
(108,'Harini','India','Bangalore',88000.00,6),
(109,'Ishaan','India','Bangalore',78000.00,5),
(110,'Janani','India','Bangalore',65000.00,3),

(111,'Karan','USA','New York',120000.00,10),
(112,'Lavanya','USA','New York',115000.00,8),
(113,'Manoj','USA','New York',115000.00,7),
(114,'Nithya','USA','New York',98000.00,6),
(115,'Omkar','USA','New York',92000.00,4),

(116,'Priya','USA','Chicago',110000.00,9),
(117,'Rahul','USA','Chicago',105000.00,8),
(118,'Sneha','USA','Chicago',105000.00,6),
(119,'Tarun','USA','Chicago',93000.00,5),
(120,'Varun','USA','Chicago',85000.00,3),

(121,'Akash','UK','London',98000.00,8),
(122,'Bindu','UK','London',94000.00,7),
(123,'Chetan','UK','London',94000.00,6),
(124,'Divya','UK','London',86000.00,5),
(125,'Elina','UK','London',78000.00,3),

(126,'Faisal','UK','Manchester',96000.00,9),
(127,'Geetha','UK','Manchester',90000.00,8),
(128,'Hari','UK','Manchester',90000.00,7),
(129,'Indu','UK','Manchester',82000.00,5),
(130,'Joseph','UK','Manchester',76000.00,2);

SELECT EMP_NAME,COUNTRY,BRANCH,SALARY,EXPERIENCE, row_number()
OVER
(
PARTITION BY COUNTRY,BRANCH
ORDER BY SALARY DESC,EXPERIENCE DESC, EMP_NAME ASC
) AS ROW_NUM
FROM EMPLOYE6;

-- Scenario 9 – Product Price Ranking by Category
/*Scenario
The inventory team wants to rank products based on price within each product category.
Products with the same price should receive the same rank.
Display the Product Name, Category, Price, and Rank.*/
SELECT * FROM PRODUCT;

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO Product VALUES
(101,'Laptop Pro','Electronics',85000.00),
(102,'Smartphone X','Electronics',65000.00),
(103,'Tablet Plus','Electronics',65000.00),
(104,'Smart Watch','Electronics',25000.00),
(105,'Bluetooth Speaker','Electronics',12000.00),

(106,'Office Chair','Furniture',15000.00),
(107,'Dining Table','Furniture',45000.00),
(108,'Sofa Set','Furniture',45000.00),
(109,'Bookshelf','Furniture',18000.00),
(110,'Study Desk','Furniture',22000.00),

(111,'T-Shirt','Clothing',1200.00),
(112,'Jeans','Clothing',2200.00),
(113,'Jacket','Clothing',3500.00),
(114,'Hoodie','Clothing',3500.00),
(115,'Shoes','Clothing',5000.00),

(116,'Rice Bag','Groceries',1800.00),
(117,'Cooking Oil','Groceries',2200.00),
(118,'Sugar','Groceries',900.00),
(119,'Tea Powder','Groceries',2200.00),
(120,'Coffee Powder','Groceries',3200.00);
SELECT Product_Name, Category, Price, Rank()
OVER
(
PARTITION BY CATEGORY
ORDER BY PRICE DESC
) AS PRODUCT_RANK
FROM PRODUCT;

-- Scenario 10 – Customer Order Sequence
/*Scenario
An e-commerce company wants to assign order numbers separately for each Customer and Order Status.
Within each group, orders should be arranged by:
1. Order Date (Latest First)
2. Order Amount (Highest First)
Display the Customer ID, Order ID, Order Status, Order Date, Order Amount, and Sequence Number.*/
SELECT * FROM Orders2;
use windows;

CREATE TABLE Orders2 (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Status VARCHAR(30),
    Order_Date DATE,
    Order_Amount DECIMAL(10,2)
);
INSERT INTO Orders2 VALUES
(101, 1, 'Delivered', '2026-08-10', 2500.00),
(102, 1, 'Delivered', '2026-07-15', 1800.00),
(103, 1, 'Pending',   '2026-08-12', 3200.00),
(104, 1, 'Pending',   '2026-08-05', 2800.00),
(105, 1, 'Cancelled', '2026-06-18', 1500.00),

(106, 2, 'Delivered', '2026-08-08', 4500.00),
(107, 2, 'Delivered', '2026-08-02', 4200.00),
(108, 2, 'Pending',   '2026-08-11', 3500.00),
(109, 2, 'Cancelled', '2026-07-25', 2000.00),
(110, 2, 'Pending',   '2026-07-28', 3100.00),

(111, 3, 'Delivered', '2026-08-09', 5000.00),
(112, 3, 'Delivered', '2026-07-30', 4500.00),
(113, 3, 'Pending',   '2026-08-13', 3800.00),
(114, 3, 'Pending',   '2026-08-01', 3400.00),
(115, 3, 'Cancelled', '2026-06-20', 1700.00),

(116, 4, 'Delivered', '2026-08-07', 2700.00),
(117, 4, 'Delivered', '2026-07-29', 2600.00),
(118, 4, 'Pending',   '2026-08-10', 3900.00),
(119, 4, 'Cancelled', '2026-07-15', 1800.00),
(120, 4, 'Pending',   '2026-08-03', 3600.00),

(121, 5, 'Delivered', '2026-08-06', 4100.00),
(122, 5, 'Delivered', '2026-07-22', 3700.00),
(123, 5, 'Pending',   '2026-08-14', 4300.00),
(124, 5, 'Pending',   '2026-08-04', 3000.00),
(125, 5, 'Cancelled', '2026-07-01', 2200.00),

(126, 6, 'Delivered', '2026-08-05', 5200.00),
(127, 6, 'Pending',   '2026-08-09', 4800.00),
(128, 6, 'Delivered', '2026-07-18', 4700.00),
(129, 6, 'Cancelled', '2026-06-25', 2500.00),
(130, 6, 'Pending',   '2026-08-01', 4500.00);

SELECT Customer_ID, Order_ID, Order_Status, Order_Date, Order_Amount,row_number()
OVER
(
        PARTITION BY Customer_ID, Order_Status
        ORDER BY Order_Date DESC,
                 Order_Amount DESC
    ) AS Sequence_Number
FROM Orders2
ORDER BY Customer_ID,
         Order_Status,
         Sequence_Number;