CREATE DATABASE CONDITIONAL;

-- SCENARIO 01
/*A training institute wants to generate a student result report.
Students who score 50 or above should be displayed as "Pass", and students scoring below 50 should be displayed as "Fail".
Write a SQL query to generate the report.*/

CREATE TABLE CONDITIONAL.STUDENT(
STD_ID INT,
STD_NAME VARCHAR(30),
MARKS INT,
COURSE VARCHAR(30));

INSERT INTO CONDITIONAL.STUDENT(STD_ID,STD_NAME,MARKS,COURSE)
VALUES(101,'RAVI',85,'SQL'),
(102,'JOHN',45,'PYTHON'),
(103,'MEENA',70,'POWER BI'),
(104,'DAVID',30,'SQL'),
(105,'ALICE',92,'PYTHON'),
(106,'ARUN',60,'EXCEL');

SELECT * FROM CONDITIONAL.STUDENT;

SELECT *,
IF (MARKS>= 50,'PASS','FAIL') AS RESULT
FROM CONDITIONAL.STUDENT ;

-- SCENARIO 02
SELECT * FROM OPERATORS.EMPLOYEE;

/*Employees with a salary of ₹60,000 or more should be
 displayed as "Bonus Eligible"; all others should be displayed as "Not Eligible".*/
SELECT *,
IF (SALARY>=60000,'ELIGIBLE BONUS','NOT ELIGIBLE BONUS') AS BONUS
FROM OPERATORS.EMPLOYEE;

-- SCENARIO 03
/*An online shopping company wants to classify customers based on their total purchase amount.
Customers meeting the company's purchase criteria should be displayed as "Premium Customer", otherwise display "Regular Customer".*/
CREATE TABLE CONDITIONAL.Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Purchase_Amount DECIMAL(10,2)
);

INSERT INTO CONDITIONAL.Customer (Customer_ID, Customer_Name, City, Purchase_Amount)
VALUES
(101, 'Amit', 'Chennai', 2500.50),
(102, 'Priya', 'Bangalore', 4200.00),
(103, 'Rahul', 'Hyderabad', 3150.75),
(104, 'Sneha', 'Mumbai', 5800.20),
(105, 'Kiran', 'Delhi', 1999.99),
(106, 'Anjali', 'Pune', 2750.00),
(107, 'Rohit', 'Kolkata', 4500.60),
(108, 'Divya', 'Coimbatore', 3600.40),
(109, 'Arun', 'Madurai', 2250.80),
(110, 'Meena', 'Mysore', 5100.25),
(111, 'Vijay', 'Salem', 1800.00),
(112, 'Keerthi', 'Trichy', 2999.50);

SELECT * FROM CONDITIONAL.CustomeR;

SELECT * ,
IF (PURCHASE_AMOUNT>5000,'Premium CustomeR','Regular Customer') AS CUSTOMER_STAGE FROM CONDITIONAL.CustomeR;

-- SCENARIO 04
/*An inventory management system wants to display the stock status of every product.
Products satisfying the company's stock condition should display "In Stock", otherwise display "Out of Stock".
Write the SQL query.*/

CREATE TABLE CONDITIONAL.Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Stock_Quantity INT
);

INSERT INTO CONDITIONAL.Product (Product_ID, Product_Name, Category, Stock_Quantity)
VALUES
(101, 'Laptop', 'Electronics', 25),
(102, 'Mobile Phone', 'Electronics', 0),
(103, 'Refrigerator', 'Home Appliances', 8),
(104, 'Washing Machine', 'Home Appliances', 0),
(105, 'Office Chair', 'Furniture', 15),
(106, 'Study Table', 'Furniture', 3),
(107, 'Notebook', 'Stationery', 100),
(108, 'Pen', 'Stationery', 0),
(109, 'Water Bottle', 'Kitchen', 40),
(110, 'Ceiling Fan', 'Electrical', 0);

SELECT * FROM CONDITIONAL.ProducT;

SELECT *,
IF(STOCK_QUANTITY>0,'IN STOCK','OUT OF STOCK') FROM CONDITIONAL.ProducT;

-- SCENARIO 05
/*The HR department wants to classify employee performance into multiple levels based on their performance score.
Generate the report according to the company's performance policy*/

CREATE TABLE CONDITIONAL.Emp_Performance (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Performance_Score INT,
    Department VARCHAR(50)
);

INSERT INTO CONDITIONAL.Emp_Performance (Emp_ID, Emp_Name, Performance_Score, Department)
VALUES
(101, 'John', 95, 'IT'),
(102, 'Priya', 88, 'HR'),
(103, 'Rahul', 76, 'Finance'),
(104, 'Sneha', 65, 'Marketing'),
(105, 'Arun', 92, 'IT'),
(106, 'Divya', 81, 'Sales'),
(107, 'Kiran', 58, 'HR'),
(108, 'Meena', 73, 'Finance'),
(109, 'Vijay', 45, 'Support'),
(110, 'Anjali', 99, 'IT'),
(111, 'Rohit', 69, 'Marketing'),
(112, 'Keerthi', 84, 'Sales');

SELECT * FROM CONDITIONAL.Emp_Performance;

SELECT * ,
CASE 
WHEN Performance_Score>=90 THEN 'EXCELLENT'
WHEN Performance_Score>=70 THEN 'GOOD'
WHEN Performance_Score>=50 THEN 'AVERAGE'
ELSE 'NEED TO IMPROVE' END AS PERFORMANCE_SCORE
 FROM CONDITIONAL.Emp_Performance ;
 
 -- SCENARIO 06
/* A university wants to classify students into different scholarship categories based on their semester marks.
Generate the scholarship report according to the university's scholarship rules.*/

CREATE TABLE CONDITIONAL.Student1 (
    Student_ID INT,
    Student_Name VARCHAR(100),
    Course VARCHAR(50),
    Marks INT
);

INSERT INTO CONDITIONAL.Student1 (Student_ID, Student_Name, Course, Marks)
VALUES
(101, 'Amit', 'BCA', 95),
(102, 'Priya', 'BSc', 88),
(103, 'Rahul', 'BCom', 76),
(104, 'Sneha', 'BTech', 91),
(105, 'Arun', 'BCA', 68),
(106, 'Divya', 'BSc', 82),
(107, 'Kiran', 'BCom', 59),
(108, 'Meena', 'BTech', 73),
(109, 'Vijay', 'BCA', 98),
(110, 'Anjali', 'BSc', 85),
(111, 'Rohit', 'BCom', 64),
(112, 'Keerthi', 'BTech', 79);

SELECT * FROM CONDITIONAL.Student1;

SELECT *,
CASE WHEN MARKS>=90 THEN 'FULL_SCHOLARSHIP'
WHEN MARKS>=70 THEN 'HALF_SCHOLARSHIP'
WHEN MARKS>=50 THEN 'QUATER_SCHOLARSHIP'
ELSE 'NO_SCHOLARSHIP' END AS SCHOLARSHIP
FROM CONDITIONAL.Student1;

-- Scenario 07
/*A bank wants to classify loan applications into different approval categories based on the applicant's monthly income.
Generate the loan approval report according to the bank's business policy.*/

CREATE TABLE CONDITIONAL.Loan_Application(
    Application_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Monthly_Income DECIMAL(10,2),
    Loan_Amount DECIMAL(10,2)
);

INSERT INTO CONDITIONAL.Loan_Application
(Application_ID, Customer_Name, Monthly_Income, Loan_Amount)
VALUES
(101, 'Rahul Sharma', 25000.00, 150000.00),
(102, 'Priya Singh', 40000.00, 300000.00),
(103, 'Amit Kumar', 55000.00, 450000.00),
(104, 'Sneha Reddy', 70000.00, 600000.00),
(105, 'Vikram Patel', 85000.00, 800000.00),
(106, 'Neha Gupta', 30000.00, 200000.00),
(107, 'Arjun Nair', 65000.00, 500000.00),
(108, 'Pooja Verma', 95000.00, 1000000.00),
(109, 'Kiran Rao', 45000.00, 350000.00),
(110, 'Anjali Das', 120000.00, 1500000.00);

SELECT * FROM CONDITIONAL.Loan_Application;

SELECT *,
CASE 
WHEN Monthly_Income>= 100000 THEN 'APPROVED'
WHEN Monthly_Income>= 60000 THEN 'CONDITIONALLY APPROVED'
WHEN Monthly_Income>= 30000 THEN 'UNDER REVIEW'
ELSE 'REJECTED' END AS APPROVAL_STATUS 
FROM CONDITIONAL.Loan_Application;

-- SCENARIO 08
/*An e-commerce company wants to classify products into different discount categories based on their selling price.
Generate the discount category report according to the company's pricing policy.
Write the SQL query.*/

CREATE TABLE CONDITIONAL.Product1 (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO conditional.Product1 (Product_ID, Product_Name, Category, Price) 
VALUES
(101, 'Laptop', 'Electronics', 75000.00),
(102, 'Smartphone', 'Electronics', 30000.00),
(103, 'Headphones', 'Electronics', 2500.00),
(104, 'Refrigerator', 'Home Appliances', 45000.00),
(105, 'Washing Machine', 'Home Appliances', 38000.00),
(106, 'Office Chair', 'Furniture', 6500.00),
(107, 'Study Table', 'Furniture', 8500.00),
(108, 'Microwave Oven', 'Home Appliances', 12000.00),
(109, 'LED TV', 'Electronics', 55000.00),
(110, 'Mixer Grinder', 'Kitchen', 3500.00),
(111, 'Air Conditioner', 'Home Appliances', 48000.00),
(112, 'Coffee Maker', 'Kitchen', 5000.00),
(113, 'Bluetooth Speaker', 'Electronics', 4000.00),
(114, 'Dining Table', 'Furniture', 25000.00),
(115, 'Electric Kettle', 'Kitchen', 1800.00);

SELECT * FROM  conditional.Product1;

SELECT *, CASE
WHEN PRICE >= 50000 THEN '45%'
WHEN PRICE >= 25000 THEN '20%'
WHEN PRICE >= 10000 THEN '10%'
ELSE 'NO DISCOUNT' END  AS DISCOUNT
FROM conditional.Product1;

-- SCENARIO 09
/*A hospital wants to categorize patients based on their health score into different treatment priority levels.
Generate the patient priority report according to the hospital's treatment policy.*/


CREATE TABLE CONDITIONAL.Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Age INT,
    Health_Score INT
);
INSERT INTO CONDITIONAL.Patient (Patient_ID, Patient_Name, Age, Health_Score) VALUES
(101, 'Aarav', 25, 95),
(102, 'Bhavna', 34, 82),
(103, 'Charan', 45, 68),
(104, 'Divya', 29, 54),
(105, 'Eshan', 61, 39),
(106, 'Farah', 50, 76),
(107, 'Gopal', 38, 88),
(108, 'Harini', 41, 47),
(109, 'Ishaan', 22, 91),
(110, 'Jyoti', 57, 63),
(111, 'Karan', 31, 28),
(112, 'Lavanya', 27, 73);

SELECT * FROM CONDITIONAL.Patient;

SELECT *, CASE
WHEN Health_Score>= 90 THEN 'CRITICAL'
WHEN Health_Score>= 70 THEN 'HIGH PRIORITY'
WHEN Health_Score>= 50 THEN 'MEDIUM PRIORITY'
ELSE 'LOW PRIORITY' END AS HEALTH_PRIORITY
FROM CONDITIONAL.Patient;

-- SCENARIO 10
/*The Finance department wants to classify employees into different salary bands based on their monthly salary.
Generate the salary band report according to the company's salary classification policy.*/

CREATE TABLE CONDITIONAL.Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO CONDITIONAL.Employee (Emp_ID, Emp_Name, Department, Salary) VALUES
(101, 'Aarav', 'HR', 25000.00),
(102, 'Bhavna', 'Finance', 42000.00),
(103, 'Charan', 'IT', 58000.00),
(104, 'Divya', 'Marketing', 67000.00),
(105, 'Eshan', 'Sales', 81000.00),
(106, 'Farah', 'IT', 39000.00),
(107, 'Gopal', 'Finance', 47000.00),
(108, 'Harini', 'HR', 53000.00),
(109, 'Ishaan', 'Marketing', 72000.00),
(110, 'Jyoti', 'Sales', 29000.00),
(111, 'Karan', 'IT', 91000.00),
(112, 'Lavanya', 'Finance', 61000.00),
(113, 'Manoj', 'HR', 36000.00),
(114, 'Neha', 'Marketing', 45000.00),
(115, 'Omkar', 'Sales', 76000.00);

SELECT * FROM CONDITIONAL.Employee;

SELECT *, CASE
WHEN SALARY >= 80000 THEN 'DIAMOND BAND'
WHEN SALARY >= 60000 THEN 'GOLDEN BAND'
WHEN SALARY >= 40000 THEN 'SILVER BAND'
ELSE 'BRONZ BAND' END AS EMPLOYEE_BANDS
FROM CONDITIONAL.Employee;










