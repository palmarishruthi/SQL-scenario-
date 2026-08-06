use windows;

-- Scenario 1 – Department Salary Benchmark Analysis (Advanced)
/*The HR department wants to identify employees who are earning more than the average salary of their respective department.
Additionally, management wants to include only those departments where the department's average salary is greater than the overall company average salary.
Display the following details:
• Employee ID
• Employee Name
• Department
• Employee Salary
• Department Average Salary
• Company Average Salary
Sort the result by:
1. Department (Ascending)
2. Employee Salary (Descending)*/

CREATE TABLE Employee4 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee4 VALUES
(101, 'Aara',   'Finance',   85000.00),
(102, 'Bhavya',  'Finance',   70000.00),
(103, 'Charan',  'Finance',   95000.00),

(104, 'Deepika', 'IT',        90000.00),
(105, 'Eshan',   'IT',        80000.00),
(106, 'Farah',   'IT',        75000.00),

(107, 'Gokul',   'HR',        50000.00),
(108, 'Harini',  'HR',        55000.00),
(109, 'Ishaan',  'HR',        45000.00),

(110, 'Janani',  'Sales',     65000.00),
(111, 'Karan',   'Sales',     60000.00),
(112, 'Lavanya', 'Sales',     70000.00);

select * from employee4;

with dept_avg as
(
select department,avg(salary) as dept_avg_sal from employee4
group by department
),
cmp_avg as
(
select avg(salary) as cmp_avg_sal from employee4
)
select e4.emp_id,e4.emp_name,e4.department,e4.salary,d.dept_avg_sal,c.cmp_avg_sal from employee4 e4

JOIN Dept_Avg D
    ON E4.Department = D.Department
CROSS JOIN Cmp_Avg C
WHERE E4.Salary > D.Dept_Avg_Sal
  AND D.Dept_Avg_Sal > C.Cmp_Avg_Sal
ORDER BY E4.Department ASC,
         E4.Salary DESC;

-- Scenario 2 – Top Performing Customers Analysis (Advanced)
/*The Sales team wants to identify high-value customers based on their total purchase amount.
Generate a report that displays only customers who satisfy all of the following conditions:
• Their total purchase amount is greater than the average total purchase amount of all customers.
• They have placed more than 3 orders.
• Their latest order was placed in the current year.
Display:
• Customer ID
• Customer Name
• Total Orders
• Total Purchase Amount
• Latest Order Date
Sort the report by:
1. Total Purchase Amount (Descending)
2. Total Orders (Descending)*/

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100)
);
INSERT INTO Customer VALUES
(101, 'Aarav'),
(102, 'Bhavya'),
(103, 'Charan'),
(104, 'Deepika'),
(105, 'Eshan'),
(106, 'Farah'),
(107, 'Gokul'),
(108, 'Harini'),
(109, 'Ishaan'),
(110, 'Janani');

CREATE TABLE Orders1 (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
DROP TABLE ORDERS;
INSERT INTO Orders1 VALUES
(1,101,'2026-01-10',1200.00),
(2,101,'2026-02-18',1500.00),
(3,101,'2026-04-15',1800.00),
(4,101,'2026-07-20',2500.00),

(5,102,'2026-01-25',800.00),
(6,102,'2026-03-12',900.00),
(7,102,'2026-05-22',700.00),
(8,102,'2026-06-10',600.00),

(9,103,'2025-11-15',2500.00),
(10,103,'2025-12-20',2600.00),
(11,103,'2026-02-18',3000.00),

(12,104,'2026-01-08',3500.00),
(13,104,'2026-02-14',4000.00),
(14,104,'2026-03-18',4500.00),
(15,104,'2026-07-25',5000.00),

(16,105,'2025-09-12',1200.00),
(17,105,'2025-11-15',1500.00),

(18,106,'2026-01-11',1000.00),
(19,106,'2026-03-15',1200.00),
(20,106,'2026-05-10',1500.00),
(21,106,'2026-08-01',1800.00),

(22,107,'2026-02-05',900.00),
(23,107,'2026-04-15',950.00),
(24,107,'2026-06-20',1100.00),

(25,108,'2026-01-05',6000.00),
(26,108,'2026-03-05',5500.00),
(27,108,'2026-05-05',6500.00),
(28,108,'2026-07-05',7000.00),

(29,109,'2025-10-10',1800.00),
(30,110,'2026-08-10',2200.00);

SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS1;
WITH Customer_Summary AS
(
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        COUNT(o.Order_ID) AS Total_Orders,
        SUM(o.Order_Amount) AS Total_Purchase_Amount,
        MAX(o.Order_Date) AS Latest_Order_Date
    FROM Customer c
    JOIN Orders1 o
        ON c.Customer_ID = o.Customer_ID
    GROUP BY
        c.Customer_ID,
        c.Customer_Name
),

Average_Purchase AS
(
    SELECT
        AVG(Total_Purchase_Amount) AS Avg_Total_Purchase
    FROM Customer_Summary
)

SELECT
    cs.Customer_ID,
    cs.Customer_Name,
    cs.Total_Orders,
    cs.Total_Purchase_Amount,
    cs.Latest_Order_Date
FROM Customer_Summary cs
CROSS JOIN Average_Purchase ap
WHERE cs.Total_Purchase_Amount > ap.Avg_Total_Purchase
  AND cs.Total_Orders > 3
  AND YEAR(cs.Latest_Order_Date) = YEAR(CURDATE())
ORDER BY
    cs.Total_Purchase_Amount DESC,
    cs.Total_Orders DESC;

