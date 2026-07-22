create database functions;

-- Scenario1

create table functions.employee(
emp_id integer,
emp_name varchar(100),
department varchar(50),
salary decimal(10,2));

insert into functions.employee( emp_id,emp_name,department, salary)
values(1, 'Abhi','HR',30000),
(2,'rahul','IT',45000),
(3,'shiva','Finance',35000),
(4,'Ram','HR',18000),
(5,'Raju','IT',55000),
(6, 'venu','finance',39899.76);

select * from functions.employee;

Select upper(emp_name)as EMPNAME from functions.employee;

-- Scenario2

create table functions.product(
product_id integer,
product_name varchar(100),
price decimal(10,2),
category varchar(50));

insert into functions.product(product_id, product_name, price, category)
values(201,'laptop',55000, 'electronics'),
(301,'mobile',35000,'electronics'),
(401,'Rice bag',2000.87,'grocery'),
(501,'blazer',35000,'clothing'),
(601,'pant',3500.74,'clothing'),
(701,'jower bag',3500.50,'grocery'),
(801,'milk',35.20,'dairy'),
(901,'curd',55.56,'dairy');
 
 Select * from functions.product;
 
 select price,round(price) from functions.product;
 
 select price,ceiling(price) from functions.product;
 
  select price,floor(price) from functions.product;
  
  -- scenario 3
  
create table functions.employee1(
emp_id integer,
emp_name varchar(100),
department varchar(50),
join_date datetime);

insert into functions.employee1( emp_id,emp_name,department, join_date)
values(1, 'Abhi','HR',20260706),
(2,'rahul','IT',20220522),
(3,'shiva','Finance',19990518),
(4,'Ram','HR',20021205),
(5,'Raju','IT',20030912),
(6, 'venu','finance',20160513),
(7, 'vetri','finance',20160413);

select * from functions.employee1;

select emp_name from functions.employee1;

select year(join_date) as joining_year from functions.employee1;

select month(join_date) as joining_month from functions.employee1;

select date(join_date) as joining_date from functions.employee1;

select day(join_date) as joining_day from functions.employee1;

-- Scenario 4

create table functions.customer1(
cust_id integer,
cust_name varchar(100),
mobile_no varchar(50),
email varchar(100));


INSERT INTO functions.customer1 (Cust_ID, Cust_Name, Mobile_No, Email)
 VALUES
(101, 'Aarav', '9876543210', 'aarav@gmail.com'),
(102, 'Diya', NULL, 'diya@gmail.com'),
(103, 'Rahul', '9123456789', NULL),
(104, 'Sneha', NULL, NULL),
(105, 'Karan', '9988776655', 'karan@yahoo.com'),
(106, 'Meera', '9012345678', NULL),
(107, 'Vikram', NULL, 'vikram@hotmail.com'),
(108, 'Ananya', '9090909090', 'ananya@gmail.com');

select * from functions.customer1;

select cust_id,cust_name,
ifnull(mobile_no, 'not available') as mobile_no,
ifnull(email, 'no_email_id') as email from functions.customer1;

-- Scenario 5

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Marks INT,
    Course VARCHAR(50)
);


INSERT INTO Student (Student_ID, Student_Name, Marks, Course) VALUES
(101, 'Aarav', 95, 'Java'),
(102, 'Diya', 82, 'Python'),
(103, 'Rahul', 68, 'C++'),
(104, 'Sneha', 45, 'Java'),
(105, 'Karan', 77, 'Python'),
(106, 'Meera', 89, 'Data Science'),
(107, 'Vikram', 56, 'C'),
(108, 'Ananya', 91, 'Java'),
(109, 'Riya', 38, 'Python'),
(110, 'Arjun', 72, 'C++');

SELECT
    Student_Name,
    Marks,
    CASE
        WHEN Marks >= 90 THEN 'Excellent'
        WHEN Marks >= 75 THEN 'Good'
        WHEN Marks >= 50 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS Performance_Status
FROM Student;










