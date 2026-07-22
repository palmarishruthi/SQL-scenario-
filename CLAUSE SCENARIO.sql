USE CLAUSE;
-- CLAUSE 
-- SCENARIO 1
/*The HR department wants to identify departments where the average employee salary is greater than the 
company's salary benchmark is ₹60,000.
Display the Department and its Average Salary.
Sort the result by Average Salary in descending order and display only the top 3 departments*/

CREATE TABLE Department1 
( 
Department_ID INT PRIMARY KEY, 
Department_Name VARCHAR(30) 
); 
INSERT INTO Department1 VALUES 
(1,'Sales'), 
(2,'HR'), 
(3,'Finance'), 
(4,'IT'), 
(6,'Marketing');

SELECT * FROM Department1;

CREATE TABLE clause.Employee1 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);
INSERT INTO clause.Employee1 (Emp_ID, Emp_Name, Department, Salary, Experience) VALUES
(101, 'Amit', 'HR', 55000.00, 3),
(102, 'Priya', 'HR', 65000.00, 5),
(103, 'Rahul', 'IT', 85000.00, 7),
(104, 'Sneha', 'IT', 90000.00, 8),
(105, 'Kiran', 'Finance', 70000.00, 6),
(106, 'Anjali', 'Finance', 68000.00, 5),
(107, 'Rohit', 'Marketing', 58000.00, 4),
(108, 'Pooja', 'Marketing', 62000.00, 5),
(109, 'Vikram', 'Sales', 75000.00, 6),
(110, 'Meena', 'Sales', 72000.00, 5),
(111, 'Arun', 'Admin', 50000.00, 2),
(112, 'Divya', 'Admin', 52000.00, 3),
(113, 'Naveen', 'Operations', 80000.00, 9),
(114, 'Kavya', 'Operations', 78000.00, 7),
(115, 'Suresh', 'IT', 95000.00, 10);

select * from clause.Employee1 ;


select D.Department_ID, D.Department_Name, AVG(E.SALARY) AS AVG_SALARY from EMPLOYEE1 E
INNER JOIN DEPARTMENT D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING AVG(E.SALARY) >=60000
ORDER BY AVG_SALARY DESC
LIMIT 3;

-- SCENARIO 02
/*An e-commerce company wants to identify the top-selling products. Display each Product Category along with the total quantity sold.
Only display categories that have sold more than the company's minimum sales requirement 100 units.
Sort the result from highest to lowest quantity sold and display only the top 5 categories.*/

CREATE TABLE Sales
(
    Sale_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Sale_Date DATE
);
INSERT INTO Sales (Sale_ID, Product_Name, Category, Quantity, Sale_Date) VALUES
(1, 'iPhone 15', 'Electronics', 25, '2025-01-05'),
(2, 'Samsung TV', 'Electronics', 30, '2025-01-10'),
(3, 'Laptop Dell', 'Electronics', 20, '2025-01-15'),
(4, 'Headphones', 'Electronics', 35, '2025-02-01'),
(5, 'Running Shoes', 'Fashion', 40, '2025-02-05'),
(6, 'Jeans', 'Fashion', 25, '2025-02-10'),
(7, 'Jacket', 'Fashion', 30, '2025-02-15'),
(8, 'T-Shirt', 'Fashion', 20, '2025-03-01'),
(9, 'Office Chair', 'Furniture', 45, '2025-03-05'),
(10, 'Dining Table', 'Furniture', 35, '2025-03-10'),
(11, 'Sofa Set', 'Furniture', 25, '2025-03-15'),
(12, 'Washing Machine', 'Home Appliances', 50, '2025-04-01'),
(13, 'Refrigerator', 'Home Appliances', 40, '2025-04-05'),
(14, 'Microwave Oven', 'Home Appliances', 30, '2025-04-10'),
(15, 'Novel Book', 'Books', 60, '2025-04-15'),
(16, 'Science Book', 'Books', 55, '2025-04-20'),
(17, 'Cooking Book', 'Books', 45, '2025-04-25'),
(18, 'Smart Watch', 'Accessories', 70, '2025-05-01'),
(19, 'Sunglasses', 'Accessories', 40, '2025-05-05'),
(20, 'Wallet', 'Accessories', 30, '2025-05-10');

SELECT * FROM Sales;

SELECT CATEGORY, SUM(QUANTITY) AS TOTAL_QUANTITY_SOLD FROM SALES S
GROUP BY CATEGORY 
HAVING SUM(QUANTITY)> 100
ORDER BY TOTAL_QUANTITY_SOLD DESC
LIMIT 5;

-- SCENARIO 03
/*A retail company wants to prepare a customer purchase report.
Display only customers whose purchase amount satisfies the company's Purchase_Amount ≥ ₹25,000.
Remove duplicate city names in the report and display the customers in ascending alphabetical order.*/

CREATE TABLE Customer1
(
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Purchase_Amount DECIMAL(10,2)
);
INSERT INTO Customer1 
(Customer_ID, Customer_Name, City, Purchase_Amount) VALUES
(1, 'Amit Sharma', 'Delhi', 35000.00),
(2, 'Priya Patel', 'Mumbai', 28000.00),
(3, 'Rahul Verma', 'Pune', 22000.00),
(4, 'Sneha Reddy', 'Hyderabad', 45000.00),
(5, 'Vikram Singh', 'Delhi', 30000.00),
(6, 'Neha Kapoor', 'Bangalore', 18000.00),
(7, 'Karan Mehta', 'Mumbai', 52000.00),
(8, 'Ananya Das', 'Kolkata', 27000.00),
(9, 'Rohan Gupta', 'Pune', 40000.00),
(10, 'Pooja Nair', 'Chennai', 15000.00),
(11, 'Aditya Joshi', 'Hyderabad', 60000.00),
(12, 'Meera Iyer', 'Bangalore', 33000.00),
(13, 'Arjun Kapoor', 'Delhi', 25000.00),
(14, 'Divya Mishra', 'Mumbai', 29000.00),
(15, 'Sanjay Rao', 'Kolkata', 12000.00);
SELECT * FROM Customer1;

SELECT DISTINCT CITY,CUSTOMER_ID, CUSTOMER_NAME, PURCHASE_AMOUNT AS TPA FROM CUSTOMER1
HAVING PURCHASE_AMOUNT >= 25000
ORDER BY CUSTOMER_NAME ASC;

-- SCENARIO 04
/*A hospital wants to analyze the number of patients treated in each department. Display the Department Name and Total Patients.
Show only those departments that have treated more than the hospital's required More than 3 patients.
Sort the result based on the total number of patients in descending order.*/

CREATE TABLE Patient
(
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Department VARCHAR(50),
    Treatment_Cost DECIMAL(10,2)
);
INSERT INTO Patient
(Patient_ID, Patient_Name, Department, Treatment_Cost) VALUES
(1, 'Amit Sharma', 'Cardiology', 50000.00),
(2, 'Priya Patel', 'Cardiology', 45000.00),
(3, 'Rahul Verma', 'Cardiology', 55000.00),
(4, 'Sneha Reddy', 'Cardiology', 60000.00),

(5, 'Vikram Singh', 'Neurology', 70000.00),
(6, 'Neha Kapoor', 'Neurology', 65000.00),
(7, 'Karan Mehta', 'Neurology', 80000.00),

(8, 'Ananya Das', 'Orthopedics', 40000.00),
(9, 'Rohan Gupta', 'Orthopedics', 35000.00),
(10, 'Pooja Nair', 'Orthopedics', 45000.00),
(11, 'Aditya Joshi', 'Orthopedics', 50000.00),

(12, 'Meera Iyer', 'Pediatrics', 30000.00),
(13, 'Arjun Kapoor', 'Pediatrics', 28000.00),

(14, 'Divya Mishra', 'Dermatology', 25000.00),
(15, 'Sanjay Rao', 'Dermatology', 22000.00),
(16, 'Kavya Nair', 'Dermatology', 27000.00),

(17, 'Naveen Kumar', 'ENT', 18000.00),
(18, 'Suresh Patel', 'ENT', 20000.00),

(19, 'Raj Mehta', 'Neurology', 75000.00),
(20, 'Simran Kaur', 'Pediatrics', 32000.00);
SELECT * FROM Patient;

SELECT DEPARTMENT, COUNT(PATIENT_ID) AS TOTAL_PATIENT FROM PATIENT
GROUP BY DEPARTMENT
HAVING TOTAL_PATIENT > 3
ORDER BY TOTAL_PATIENT DESC;

-- SCENARIO 05
/*A company wants to prepare a report of employees who satisfy both the company's age criteria
and salary criteria Age ≥ 30 and Salary ≥ ₹60,000.
Display the employee details, arrange the report by Salary in descending order, and return only the top 5 employees.*/

CREATE TABLE Employee2
(
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT
);
INSERT INTO Employee2
(Emp_ID, Emp_Name, Department, Salary, Age) VALUES
(1, 'Amit Sharma', 'HR', 55000.00, 32),
(2, 'Priya Patel', 'Finance', 65000.00, 35),
(3, 'Rahul Verma', 'IT', 85000.00, 30),
(4, 'Sneha Reddy', 'IT', 90000.00, 34),
(5, 'Vikram Singh', 'Sales', 72000.00, 29),
(6, 'Neha Kapoor', 'Marketing', 62000.00, 31),
(7, 'Karan Mehta', 'Finance', 78000.00, 36),
(8, 'Ananya Das', 'HR', 58000.00, 28),
(9, 'Rohan Gupta', 'IT', 95000.00, 40),
(10, 'Pooja Nair', 'Sales', 68000.00, 33),
(11, 'Aditya Joshi', 'Operations', 60000.00, 30),
(12, 'Meera Iyer', 'Marketing', 75000.00, 37),
(13, 'Arjun Kapoor', 'IT', 88000.00, 26),
(14, 'Divya Mishra', 'Finance', 67000.00, 42),
(15, 'Sanjay Rao', 'Operations', 54000.00, 38);
SELECT * FROM Employee2;

SELECT EMP_ID, EMP_NAME, SALARY, AGE FROM EMPLOYEE2
WHERE AGE>30 AND SALARY>60000
ORDER BY SALARY DESC
LIMIT 5;