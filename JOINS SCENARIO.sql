CREATE DATABASE JOINS;

-- JOINS
-- SCENARIO 01
/*The HR department wants to generate a report showing employee details along with their department names.
Display the Employee ID, Employee Name, Department Name, and Salary for employees who are assigned to a valid department.
Sort the report by Salary in descending order.*/
USE JOINS;

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL
);

INSERT INTO Department (Department_ID, Department_Name) VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'Information Technology'),
(104, 'Marketing'),
(105, 'Sales'),
(106, 'Operations');

SELECT * FROM  Department;

CREATE TABLE Employee1 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Department_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);


INSERT INTO Employee1 (Emp_ID, Emp_Name, Department_ID, Salary) VALUES
(1, 'Aarav Sharma', 103, 75000.00),
(2, 'Priya Patel', 101, 55000.00),
(3, 'Rohan Gupta', 102, 68000.00),
(4, 'Sneha Reddy', 104, 62000.00),
(5, 'Vikram Singh', 105, 70000.00),
(6, 'Neha Verma', 106, 58000.00),
(7, 'Karan Mehta', 103, 82000.00),
(8, 'Ananya Das', 104, 61000.00),
(9, 'Rahul Kumar', 105, 73000.00),
(10, 'Pooja Nair', 101, 56000.00),
(11, 'Aditya Joshi', 102, 69000.00),
(12, 'Meera Iyer', 106, 60000.00),
(13, 'Arjun Kapoor', 103, 90000.00),
(14, 'Divya Mishra', 104, 64000.00),
(15, 'Sanjay Rao', 105, 72000.00);
SELECT * FROM Employee1;

SELECT EMP_ID, EMP_NAME, DEPARTMENT_NAME, SALARY FROM EMPLOYEE1 E
INNER JOIN DEPARTMENT D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY SALARY DESC;

-- SCENARIO 02
/*An online shopping company wants to identify customers who have registered on the website but have not placed any orders.
Display the Customer ID, Customer Name, City, and Order ID.
Arrange the result in ascending order of Customer Name*/


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    City VARCHAR(50)
);


INSERT INTO Customer (Customer_ID, Customer_Name, City) VALUES
(1, 'Aarav Sharma', 'Delhi'),
(2, 'Priya Patel', 'Mumbai'),
(3, 'Rohan Gupta', 'Pune'),
(4, 'Sneha Reddy', 'Hyderabad'),
(5, 'Vikram Singh', 'Chennai'),
(6, 'Neha Verma', 'Kolkata'),
(7, 'Karan Mehta', 'Ahmedabad'),
(8, 'Ananya Das', 'Bengaluru'),
(9, 'Rahul Kumar', 'Jaipur'),
(10, 'Pooja Nair', 'Kochi'),
(11, 'Aditya Joshi', 'Nagpur'),
(12, 'Meera Iyer', 'Coimbatore'),
(13, 'Arjun Kapoor', 'Lucknow'),
(14, 'Divya Mishra', 'Indore'),
(15, 'Sanjay Rao', 'Visakhapatnam');

SELECT * FROM Customer;
DROP TABLE CUSTOMER;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Amount) VALUES
(101, 1, '2025-01-10', 1500.00),
(102, 2, '2025-01-15', 2300.50),
(103, 3, '2025-02-01', 1750.00),
(104, 5, '2025-02-08', 3200.00),
(105, 6, '2025-02-15', 980.75),
(106, 7, '2025-03-01', 4500.00),
(107, 9, '2025-03-05', 2100.25),
(108, 10, '2025-03-10', 3600.00),
(109, 11, '2025-03-18', 1999.99),
(110, 12, '2025-03-25', 2750.00),
(111, 13, '2025-04-02', 1850.50),
(112, 14, '2025-04-10', 4100.00);

SELECT * FROM Orders;

SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, C.CITY,O.ORDER_ID
FROM CUSTOMER C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID= O.CUSTOMER_ID
WHERE O.ORDER_ID IS null
ORDER BY C.CUSTOMER_NAME ASC;

-- SCENARIO 03
/*The management wants to identify departments that currently have no employees assigned.
Display the Department ID, Department Name, Employee ID, and Employee Name.
Sort the result by Department Name*/


CREATE TABLE Department1 (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL
);

INSERT INTO Department1 (Department_ID, Department_Name) VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'Information Technology'),
(104, 'Marketing'),
(105, 'Sales'),
(106, 'Operations'),
(107, 'Research'),
(108, 'Legal');
SELECT * FROM Department1;

CREATE TABLE Employe (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department1(Department_ID)
);

INSERT INTO Employe (Emp_ID, Emp_Name, Department_ID) VALUES
(1, 'Aarav Sharma', 101),
(2, 'Priya Patel', 102),
(3, 'Rohan Gupta', 103),
(4, 'Sneha Reddy', 104),
(5, 'Vikram Singh', 105),
(6, 'Neha Verma', 106),
(7, 'Karan Mehta', 101),
(8, 'Ananya Das', 102),
(9, 'Rahul Kumar', 103),
(10, 'Pooja Nair', 104),
(11, 'Aditya Joshi', 105),
(12, 'Meera Iyer', 106);
SELECT * FROM Employe;

SELECT D.Department_ID, D.Department_Name, E.Emp_ID,E.Emp_Name FROM DEPARTMENT1 D
LEFT JOIN EMPLOYE E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.EMP_ID IS null
ORDER BY D.DEPARTMENT_NAME ASC;

-- SCENARIO 04
/*An inventory management team wants to compare the Product Master table with the Warehouse Stock table.
Generate a report containing:
• Products available in both tables
• Products available only in the Product Master
• Products available only in the Warehouse Stock
Display the Product ID, Product Name, Warehouse Quantity.
Sort the report by Product ID.*/

CREATE TABLE Product_Master
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100)
);
INSERT INTO Product_Master (Product_ID, Product_Name) VALUES
(101, 'Laptop'),
(102, 'Desktop'),
(103, 'Keyboard'),
(104, 'Mouse'),
(105, 'Monitor'),
(106, 'Printer'),
(107, 'Scanner'),
(108, 'Webcam'),
(109, 'Speaker'),
(110, 'Projector'),
(111, 'Router'),
(112, 'Hard Disk'),
(113, 'SSD'),
(114, 'Graphics Card'),
(115, 'UPS');
SELECT * FROM Product_Master;

CREATE TABLE Warehouse_Stock
(
    Product_ID INT PRIMARY KEY,
    Quantity INT
);
INSERT INTO Warehouse_Stock (Product_ID, Quantity) VALUES
(101, 50),
(102, 30),
(103, 120),
(104, 80),
(105, 40),
(106, 25),
(107, 60),
(109, 75),
(111, 45),
(113, 90),
(116, 35),
(117, 20);
SELECT * FROM Warehouse_Stock;

SELECT * 
FROM Product_Master P
LEFT JOIN Warehouse_Stock W
ON P.PRODUCT_ID=W.PRODUCT_ID
UNION
SELECT * 
FROM Product_Master P
RIGHT JOIN Warehouse_Stock W
ON P.PRODUCT_ID=W.PRODUCT_ID;

SELECT * 
FROM Product_Master P
INNER JOIN Warehouse_Stock W
ON P.PRODUCT_ID=W.PRODUCT_ID
ORDER BY P.PRODUCT_ID ASC;


-- SCENARIO 05
/*A company wants to generate an organization hierarchy report.
Display each Employee Name along with their Reporting Manager Name.
Include employees even if they do not have a manager.
Sort the report alphabetically by Employee Name.*/

CREATE TABLE Employee
(
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Manager_ID INT,
    Department VARCHAR(50)
);
INSERT INTO Employee (Emp_ID, Emp_Name, Manager_ID, Department) VALUES
(101, 'Amit Sharma', NULL, 'Management'),
(102, 'Priya Patel', 101, 'HR'),
(103, 'Rahul Verma', 101, 'Finance'),
(104, 'Sneha Reddy', 101, 'IT'),
(105, 'Vikram Singh', 104, 'IT'),
(106, 'Neha Kapoor', 104, 'IT'),
(107, 'Karan Mehta', 103, 'Finance'),
(108, 'Ananya Das', 103, 'Finance'),
(109, 'Rohan Gupta', 102, 'HR'),
(110, 'Pooja Nair', 102, 'HR'),
(111, 'Aditya Joshi', 104, 'IT'),
(112, 'Meera Iyer', 105, 'IT'),
(113, 'Arjun Kapoor', 101, 'Marketing'),
(114, 'Divya Mishra', 113, 'Marketing'),
(115, 'Sanjay Rao', 113, 'Marketing');

SELECT * FROM EMPLOYEE;

SELECT E.EMP_ID, E.EMP_NAME AS EMPNAME,M.MANAGER_ID, M.EMP_NAME AS MANAGER_NAME FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M
ON E.EMP_ID =M.MANAGER_ID;
