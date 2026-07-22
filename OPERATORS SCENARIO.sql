
-- OPERATORS
CREATE DATABASE OPERATORS;

-- SCENARIO1
/*A company is planning to provide a fixed salary increment of ₹5,000 to every employee. The HR department wants to generate a 
report showing both the current salary and the revised salary after the increment.*/

CREATE TABLE OPERATORS.Employee
(
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Age INT
);

INSERT INTO OPERATORS.Employee (Emp_ID, Emp_Name, Department, Salary, Age)
VALUES
(101, 'John',     'Sales',   45000.00, 25),
(102, 'Alice',    'HR',      55000.00, 30),
(103, 'David',    'Finance', 60000.00, 35),
(104, 'Ravi',     'IT',      50000.00, 28),
(105, 'Meena',    'Sales',   40000.00, 24),
(106, 'Karthik',  'HR',      65000.00, 32);
INSERT INTO OPERATORS.Employee (Emp_ID, Emp_Name, Department, Salary, Age)
VALUES
(107, 'JOY',     'Sales',   45000.00, 29),
(108, 'VIKY',    'HR',      65000.00, 32);

SELECT * FROM OPERATORS.EMPLOYEE;

SELECT Emp_id, salary, salary+5000 as revised_salary from operators.employee;

-- SCENARIO 02
/*The HR department wants to identify employees who belong to the Sales department and whose salary is 
greater than ₹45,000.*/

SELECT EMP_ID, SALARY, DEPARTMENT FROM operators.employee
WHERE DEPARTMENT= 'SALES' AND SALARY >= 45000 ;

-- SCENARIO 03
/*The management wants to retrieve employees who are working in 
either the HR department or the IT department.*/

SELECT EMP_ID , DEPARTMENT FROM operators.employee
WHERE DEPARTMENT ='hr' OR DEPARTMENT ='it';

SELECT EMP_ID , DEPARTMENT FROM operators.employee
WHERE DEPARTMENT in ('hr','it');

-- SCENARIO 04
/*The recruitment team wants to identify employees whose names start 
with the letter 'A' and employees whose names end with the letter 'n'.*/

SELECT EMP_ID, EMP_NAME FROM operators.employee
WHERE EMP_NAME LIKE 'A%' OR '%N';

-- SCENARIO 5
/*A company has migrated employee records from another system. During migration, some employees were assigned a department, while others were left without one.
Generate the following reports:
• Employees whose department information is missing.
• Employees whose department information is available. */

INSERT INTO OPERATORS.Employee (Emp_ID, Emp_Name, Department, Salary, Age)
VALUES
(109, 'VENI',     'NULL',   35000.00, 35),
(110, 'VETRI',    'NULL',      55800.00, 20),
(111, 'AISHU',    'NULL', 40000.00, 25);

SELECT * FROM OPERATORS.EMPLOYEE
WHERE DEPARTMENT = 'NULL';

SELECT * FROM OPERATORS.EMPLOYEE
WHERE DEPARTMENT!= NULL;





