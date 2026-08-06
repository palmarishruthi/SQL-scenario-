USE SUBQUERY;

-- Scenario 1 – Above Department Average Salary
/*The HR department wants to identify employees who earn more than the average salary of their own department.
Display the Employee ID, Employee Name, Department, and Salary.
Sort the result by Salary in descending order*/
CREATE TABLE Employee1
(
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);
INSERT INTO Employee1 VALUES
(101,'Aarav','HR',45000,2),
(102,'Diya','HR',55000,5),
(103,'Rahul','HR',65000,8),

(104,'Sneha','IT',60000,3),
(105,'Arjun','IT',75000,6),
(106,'Priya','IT',90000,10),

(107,'Karan','Finance',50000,2),
(108,'Meera','Finance',70000,7),
(109,'Rohan','Finance',85000,9),

(110,'Ananya','Sales',40000,1),
(111,'Vikram','Sales',60000,5),
(112,'Pooja','Sales',80000,8),

(113,'Nikhil','Marketing',55000,3),
(114,'Kavya','Marketing',70000,6),
(115,'Aditya','Marketing',95000,11);

SELECT * FROM Employee1;

SELECT EMP_ID, EMP_NAME, DEPARTMENT,SALARY FROM EMPLOYEE1 E
WHERE SALARY >( SELECT AVG(SALARY) FROM EMPLOYEE1
WHERE DEPARTMENT = E.DEPARTMENT
)
ORDER BY SALARY DESC;

-- Scenario 2 – Highest Paid Employee in Each Department
/*Scenario
The management wants to identify the employee(s) who receive the highest salary in each department.
Display the Employee Name, Department, Salary, and Experience.
Arrange the result in descending order of Salary.*/

SELECT EMP_NAME, DEPARTMENT, SALARY,EXPERIENCE FROM EMPLOYEE1 E
WHERE SALARY=( SELECT MAX(SALARY) FROM EMPLOYEE1
WHERE DEPARTMENT  = E.DEPARTMENT)
ORDER BY SALARY DESC;


-- Scenario 3 – Customers with Highest Order Amount
/*Scenario
An e-commerce company wants to identify customers who placed the highest-value order.
Display the Customer Name, City, Order ID, and Order Amount.
Arrange the report alphabetically by Customer Name.*/

CREATE TABLE Customer
(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50)
);
INSERT INTO Customer VALUES
(101,'Aarav','Hyderabad'),
(102,'Diya','Bengaluru'),
(103,'Rahul','Chennai'),
(104,'Sneha','Mumbai'),
(105,'Arjun','Delhi'),
(106,'Priya','Hyderabad'),
(107,'Karan','Bengaluru'),
(108,'Meera','Chennai'),
(109,'Rohan','Mumbai'),
(110,'Ananya','Delhi'),
(111,'Vikram','Hyderabad'),
(112,'Pooja','Bengaluru'),
(113,'Nikhil','Chennai'),
(114,'Kavya','Mumbai'),
(115,'Aditya','Delhi');

CREATE TABLE Orders
(
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Amount DECIMAL(10,2),
    Order_Date DATE,
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID)
);

INSERT INTO Orders VALUES
(1001,101,12000,'2026-08-01'),
(1002,101,18000,'2026-08-05'),

(1003,102,25000,'2026-08-02'),
(1004,102,15000,'2026-08-06'),

(1005,103,32000,'2026-08-03'),
(1006,103,22000,'2026-08-07'),

(1007,104,45000,'2026-08-04'),
(1008,104,30000,'2026-08-08'),

(1009,105,50000,'2026-08-05'),
(1010,105,35000,'2026-08-09'),

(1011,106,28000,'2026-08-06'),
(1012,106,40000,'2026-08-10'),

(1013,107,60000,'2026-08-07'),
(1014,108,55000,'2026-08-08'),

(1015,109,75000,'2026-08-09'),
(1016,110,65000,'2026-08-10'),

(1017,111,42000,'2026-08-11'),
(1018,112,38000,'2026-08-12'),

(1019,113,47000,'2026-08-13'),
(1020,114,52000,'2026-08-14'),

(1021,115,75000,'2026-08-15'),
(1022,115,25000,'2026-08-18'),

(1023,107,30000,'2026-08-16'),
(1024,109,35000,'2026-08-17'),
(1025,110,28000,'2026-08-19');

SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

SELECT CUSTOMER_NAME, CITY, ORDER_ID, ORDER_AMOUNT FROM CUSTOMER c 
JOIN ORDERS o 
ON C.CUSTOMER_ID =O.CUSTOMER_ID 
WHERE O.ORDER_AMOUNT =(SELECT MAX(ORDER_AMOUNT) FROM ORDERS)
ORDER BY C.CUSTOMER_NAME ;

-- Scenario 4 – Employees Working in Departments with More Than Three Employees
/*Scenario
The HR department wants to generate a report of employees who work in departments having more than three employees.
Display the Employee Name, Department, Salary, and Age.
Sort the result by Department and then by Salary in descending order.*/


CREATE TABLE Employee2
(
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT
);

INSERT INTO Employee2 VALUES
(101,'Aarav','HR',45000,25),
(102,'Diya','HR',55000,28),
(103,'Rahul','HR',65000,32),
(104,'Sneha','HR',50000,27),

(105,'Arjun','IT',75000,30),
(106,'Priya','IT',90000,35),
(107,'Karan','IT',70000,29),
(108,'Meera','IT',80000,31),
(109,'Rohan','IT',68000,27),

(110,'Ananya','Finance',60000,29),
(111,'Vikram','Finance',72000,33),
(112,'Pooja','Finance',85000,36),

(113,'Nikhil','Sales',55000,26),
(114,'Kavya','Sales',65000,30),
(115,'Aditya','Sales',70000,34),
(116,'Neha','Sales',75000,32),

(117,'Siddharth','Marketing',62000,28),
(118,'Aisha','Marketing',71000,31),
(119,'Manish','Admin',48000,26),
(120,'Ritika','Admin',52000,29);
SELECT * FROM Employee2;

SELECT EMP_NAME, DEPARTMENT, SALARY,AGE FROM EMPLOYEE2
WHERE DEPARTMENT IN ( SELECT DEPARTMENT FROM EMPLOYEE2
GROUP BY DEPARTMENT
HAVING COUNT(*) > 3)
ORDER BY DEPARTMENT,SALARY DESC
;

-- Scenario 5 – Products Never Ordered
/*Scenario
An online shopping company wants to identify products that have never been ordered.
Display the Product ID, Product Name, Category, and Price.
Sort the report by Product Name.*/

CREATE TABLE Product
(
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO Product VALUES
(101,'Laptop','Electronics',65000),
(102,'Smartphone','Electronics',30000),
(103,'Headphones','Electronics',2500),
(104,'Keyboard','Electronics',1800),
(105,'Mouse','Electronics',900),
(106,'Monitor','Electronics',12000),
(107,'Printer','Electronics',15000),
(108,'Tablet','Electronics',28000),
(109,'Smart Watch','Electronics',9000),
(110,'Camera','Electronics',45000),

(111,'Office Chair','Furniture',7000),
(112,'Study Table','Furniture',10000),
(113,'Bookshelf','Furniture',8500),
(114,'Sofa','Furniture',35000),
(115,'Dining Table','Furniture',40000),

(116,'Water Bottle','Accessories',500),
(117,'Backpack','Accessories',1800),
(118,'Travel Bag','Accessories',3500),
(119,'Pen Drive','Accessories',900),
(120,'Power Bank','Accessories',2000);

CREATE TABLE Order_Items
(
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY(Product_ID)
    REFERENCES Product(Product_ID)
);
INSERT INTO Order_Items VALUES
(1001,101,1),
(1001,103,2),
(1002,102,1),
(1002,104,1),
(1003,105,3),

(1004,106,1),
(1005,108,2),
(1006,109,1),
(1007,110,1),
(1008,111,2),

(1009,112,1),
(1010,114,1),
(1011,116,5),
(1012,117,2),
(1013,119,4),

(1014,101,1),
(1015,102,2),
(1016,103,1),
(1017,104,3),
(1018,105,2),

(1019,106,1),
(1020,108,1),
(1021,109,2),
(1022,110,1),
(1023,111,1);

SELECT * FROM PRODUCT;
SELECT * FROM ORDER_ITEMS;
SELECT PRODUCT_ID, PRODUCT_NAME,CATEGORY, PRICE FROM PRODUCT 
WHERE PRODUCT_ID NOT IN ( SELECT PRODUCT_ID FROM  order_ITEMS
)
order by PRODUCT_NAME;
 
-- Scenario 6 – Employees Matching Department and Experience
/*Scenario
The HR team wants to identify employees whose Department and Experience match the Department and 
Experience of employees working in the Finance department.
Display the Employee Name, Department, Experience, and Salary.
Arrange the report by Experience in descending order.*/
use subquery;
select * from Employee2;




CREATE TABLE Employee3 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);

INSERT INTO Employee3 VALUES
(101, 'Aarav',    'Finance',   5, 55000.00),
(102, 'Bhavya',   'HR',        3, 42000.00),
(103, 'Charan',   'IT',        5, 60000.00),
(104, 'Deepika',  'Finance',   8, 75000.00),
(105, 'Eshan',    'Sales',     4, 45000.00),
(106, 'Farah',    'Marketing', 8, 68000.00),
(107, 'Gokul',    'Finance',   2, 40000.00),
(108, 'Harini',   'IT',        8, 72000.00),
(109, 'Ishaan',   'Finance',   6, 65000.00),
(110, 'Janani',   'HR',        5, 50000.00),
(111, 'Karan',    'Finance',   10, 90000.00),
(112, 'Lavanya',  'Sales',     2, 38000.00),
(113, 'Manoj',    'Finance',   4, 50000.00),
(114, 'Nithya',   'Marketing', 6, 62000.00),
(115, 'Omkar',    'Finance',   3, 46000.00);
select * from Employee3;

select emp_name, department, experience, salary from employee3
where (department,experience) in
(
SELECT Department,
           Experience
    FROM Employee
    WHERE Department = 'Finance'
    )
order by experience desc;

-- Scenario 7 – Employees Reporting to the Manager with the Highest Salary
/*Scenario
The company wants to identify employees who report directly to the manager who receives the highest salary in the organization.
Display the Employee Name, Manager ID, Department, and Salary.
Sort the report by Employee Name.*/
 CREATE TABLE Employee4 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Manager_ID INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employee4 VALUES
(101, 'Aarav',    NULL, 'Management', 150000.00),
(102, 'Bhavya',   101,  'HR',          65000.00),
(103, 'Charan',   101,  'IT',          80000.00),
(104, 'Deepika',  101,  'Finance',     90000.00),

(105, 'Eshan',    NULL, 'Management', 170000.00), -- Highest Paid Manager

(106, 'Farah',    105,  'Finance',     70000.00),
(107, 'Gokul',    105,  'Finance',     68000.00),
(108, 'Harini',   105,  'IT',          85000.00),
(109, 'Ishaan',   105,  'HR',          60000.00),
(110, 'Janani',   105,  'Sales',       72000.00),
(111, 'Karan',    105,  'Marketing',   69000.00),
(112, 'Lavanya',  105,  'IT',          78000.00),

(113, 'Manoj',    101,  'Sales',       75000.00),
(114, 'Nithya',   101,  'Finance',     82000.00),
(115, 'Omkar',    101,  'HR',          64000.00),

(116, 'Priya',    104,  'Finance',     55000.00),
(117, 'Rahul',    103,  'IT',          58000.00),
(118, 'Sneha',    103,  'IT',          62000.00),
(119, 'Tarun',    104,  'Finance',     60000.00),
(120, 'Varun',    110,  'Sales',       50000.00);
select * from employee4;

SELECT Emp_Name,
       Manager_ID,
       Department,
       Salary
FROM Employee4
WHERE Manager_ID =
(
    SELECT Emp_ID
    FROM Employee4
    WHERE Salary =
    (
        SELECT MAX(Salary)
        FROM Employee4
    )
)
ORDER BY Emp_Name;