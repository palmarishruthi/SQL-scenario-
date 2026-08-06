use windows;
-- Scenario 1 – Employee Search Performance
/*The HR department frequently searches employees using their Email Address. As the Employee table has grown to over 10 lakh records, searching has become slow.
Create an appropriate Index to improve the search performance.*/
CREATE TABLE Employe3 (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Email VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employe3 VALUES
(101,'Aarav','aarav@gmail.com','Finance',85000.00),
(102,'Bhavya','bhavya@gmail.com','HR',65000.00),
(103,'Charan','charan@gmail.com','IT',90000.00),
(104,'Deepika','deepika@gmail.com','Finance',78000.00),
(105,'Eshan','eshan@gmail.com','Sales',62000.00),
(106,'Farah','farah@gmail.com','Marketing',70000.00),
(107,'Gokul','gokul@gmail.com','IT',95000.00),
(108,'Harini','harini@gmail.com','HR',68000.00),
(109,'Ishaan','ishaan@gmail.com','Finance',83000.00),
(110,'Janani','janani@gmail.com','Sales',72000.00);
select * from Employe3;
CREATE INDEX idx_employee_email
ON Employe3 (Email);
SHOW INDEX FROM Employe3;
SELECT *
FROM Employe3
WHERE Email = 'charan@gmail.com';
EXPLAIN
SELECT *
FROM Employe3
WHERE Email = 'charan@gmail.com';

-- Scenario 2 – Product Search Optimization
/*An e-commerce company frequently searches products based on both Category and Price.
The Product table contains more than 5 million records, and the search queries are taking too much time.
Create a suitable index to improve the performance.*/

CREATE TABLE Product1 (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Brand VARCHAR(50)
);
INSERT INTO Product1 VALUES
(101,'iPhone 16','Electronics',85000.00,'Apple'),
(102,'Galaxy S25','Electronics',78000.00,'Samsung'),
(103,'MacBook Air','Electronics',98000.00,'Apple'),
(104,'Laptop Pro','Electronics',65000.00,'Dell'),
(105,'Bluetooth Speaker','Electronics',8000.00,'Sony'),
(106,'LED TV','Electronics',55000.00,'LG'),
(107,'Washing Machine','Home Appliances',45000.00,'LG'),
(108,'Refrigerator','Home Appliances',62000.00,'Samsung'),
(109,'Office Chair','Furniture',12000.00,'IKEA'),
(110,'Dining Table','Furniture',35000.00,'Godrej');

CREATE INDEX idx_category_price
ON Product1(Category, Price);
SHOW INDEX FROM Product;

  EXPLAIN
SELECT *
FROM Product
WHERE Category = 'Electronics'
  AND Price > 50000;
  
-- Scenario 3 – Employee Audit Log
/*Whenever a new employee joins the company, the HR team wants to automatically maintain an Employee Audit Log.
Every new employee inserted into the Employee table should automatically create a record in the Employee_Log table.*/
CREATE TABLE Employe4 (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
CREATE TABLE Employee_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Action_Performed VARCHAR(50),
    Action_Time DATETIME
);
DELIMITER $$

CREATE TRIGGER trg_employee_insert
AFTER INSERT
ON Employe4
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Log
    (
        Employee_ID,
        Action_Performed,
        Action_Time
    )
    VALUES
    (
        NEW.Employee_ID,
        'Inserted',
        NOW()
    );
END$$

DELIMITER ;
INSERT INTO Employe4 VALUES
(101,'Aarav','Finance',85000.00),
(102,'Bhavya','HR',65000.00),
(103,'Charan','IT',92000.00),
(104,'Deepika','Sales',78000.00),
(105,'Eshan','Marketing',70000.00);
SELECT * FROM Employe4;
SELECT * FROM Employee_Log;

-- Scenario 4 – Salary Validation
/*The Finance department has introduced a new rule.
An employee's salary should never become negative.
If any user tries to update a salary with a negative value, the database should reject the update and display an error message.*/
DELIMITER $$

CREATE TRIGGER trg_salary_validation
BEFORE UPDATE
ON Employe4
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$
DELIMITER ;


-- Scenario 5 – Customer Email Validation
/*A banking application stores customer details.
Business requirements:
1. No two customers should have the same Email Address.
2. The customer's Age must be at least 18 years before registration.*/

CREATE TABLE Customer1 (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Age INT
);
CREATE UNIQUE INDEX idx_customer_email
ON Customer1(Email);
DELIMITER $$

CREATE TRIGGER trg_customer_age_validation
BEFORE INSERT
ON Customer1
FOR EACH ROW
BEGIN
    IF NEW.Age < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer must be at least 18 years old';
    END IF;
END$$
DELIMITER ;
INSERT INTO Customer1
VALUES
(101,'Aarav','aarav@gmail.com',25);
INSERT INTO Customer1
VALUES
(102,'Bhavya','bhavya@gmail.com',22);
INSERT INTO Customer1
VALUES
(103,'Charan','charan@gmail.com',16);
INSERT INTO Customer1
VALUES
(104,'Deepika','aarav@gmail.com',24);