use functions;

-- SQL Multiple Row Functions (Aggregate Functions) 
-- Scenario1
A companys HR department wants to know the total salary expense paid to all employees
every month.
Write a SQL query to generate the required report.

create table functions.employee5(
emp_id integer,
emp_name varchar(100),
department varchar(50),
salary decimal(10,2));

insert into functions.employee5(emp_id,emp_name,department,salary)
values(1, 'Abhi','HR',30000),
(2,'rahul','IT',45000),
(3,'shiva','Finance',35000),
(4,'Ram','HR',18000),
(5,'Raju','IT',55000),
(6, 'venu','finance',39899.76),
(7, 'veni','sales',50000),
(8, 'vetri','HR',30000);

select * from functions.employee5;
select sum(salary) from functions.employee5;

-- scenario2
CREATE TABLE functions.Student2 (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Marks INT,
    Course VARCHAR(50)
);
INSERT INTO functions.Student2 (Student_ID, Student_Name, Marks, Course) 
VALUES(101, 'Aarav', 95, 'Java'),
(102, 'Diya', 82, 'Python'),
(103, 'Rahul', 68, 'C++'),
(104, 'Sneha', 45, 'Java'),
(105, 'Karan', 77, 'Python'),
(106, 'Meera', 89, 'Data Science'),
(107, 'Vikram', 56, 'C'),
(108, 'Ananya', 91, 'Java'),
(109, 'Riya', 38, 'Python'),
(110, 'Arjun', 72, 'C++');

Select * from functions.student2;
select Avg(marks) from functions.student2;

-- Scenario3
create table functions.product2(
product_id integer,
product_name varchar(100),
price decimal(10,2),
category varchar(50));

insert into functions.product2(product_id, product_name, price, category)
values(201,'laptop',55000, 'electronics'),
(301,'mobile',35000,'electronics'),
(401,'Rice bag',2000.87,'grocery'),
(501,'blazer',35000,'clothing'),
(601,'pant',3500.74,'clothing'),
(701,'jower bag',3500.50,'grocery'),
(801,'milk',35.20,'dairy'),
(901,'curd',55.56,'dairy');
 select * from functions.product2;
 select max(price),min(price) from functions.product2;
  
  -- Scenario 4
  create table functions.customer3(
cust_id integer,
cust_name varchar(100),
mobile_no varchar(50),
city varchar(100));


INSERT INTO functions.customer3 (Cust_ID, Cust_Name, Mobile_No, city)
 VALUES
(101, 'Aarav', '9876543210', 'banglore'),
(102, 'Diya', NULL, 'chennai'),
(103, 'Rahul', '9123456789',' banglore'),
(104, 'Sneha', NULL, 'banglore'),
(105, 'Karan', '9988776655', 'chennai'),
(106, 'Meera', '9012345678', 'banglore'),
(107, 'Vikram', NULL, 'chennai'),
(108, 'vijay', NULL, 'chennai'),
(109, 'veni', 9876543210, 'chennai'),
(110, 'aishu', NULL, 'banglore'),
(111, 'Aarvi', NULL, 'banglore'),
(112, 'Ananya', '9090909090', 'chennai');

select * from functions.customer3;
select count(cust_id) from functions.customer3;

-- Scenario5

create table functions.employee6(
emp_id integer,
emp_name varchar(100),
department varchar(50),
salary decimal(10,2));

insert into functions.employee6(emp_id,emp_name,department,salary)
values(1, 'Abhi','HR',30000),
(2,'rahul','IT',45000),
(3,'shiva','Finance',35000),
(4,'Ram','HR',18000),
(5,'Raju','IT',55000),
(6, 'venu','finance',39899.76),
(7, 'veni','sales',50000),
(8, 'vetri','HR',30000),
(9, 'raji','it',55000),
(10, 'mani','HR',30000);


select * from functions.employee6;
select count(emp_id) from functions.employee6;
select sum(salary) from functions.employee6;
select avg(salary) from functions.employee6;
select max(salary) from functions.employee6;
select min(salary) from functions.employee6;

