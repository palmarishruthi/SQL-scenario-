Scenario-Based Interview Questions–Constraint

1. Employee Registration System (PRIMARY KEY & AUTO_INCREMENT)
Scenario:
You are designing an Employee Management System for a company. Every new employee must
have a unique Employee ID, and the application should automatically generate this ID without
manual entry.

create table constraints.employee(
empid integer primary key auto_increment,
empname varchar(20));

/*Interview Question:
Which SQL constraint(s) would you use to ensure each employee gets a unique,
automatically generated Employee ID, and why?*/

Answer: Primarykey and Autoincrement because primarykey used to remove duplicates and uniques values and 
autoincrement is used increment the values automatically.

2. Online Banking Application (UNIQUE Constraint)
Scenario:
Abank allows customers to register for internet banking. Each customer must register with a
unique email address,and duplicate email IDs should not be allowed.

create table constraints.customer(
custid integer,
custname varchar(20),
custemail varchar(50) unique);

/*Interview Question:
Which SQL constraint would you use to prevent duplicate email addresses in the Customer
table? Explain your choice.*/
Answer:Unique constraints is used to remove the duplicate values and it makes email should be unique.

3. College Management System (FOREIGN KEY Constraint)
Scenario:A collegehas two tables: Department and Student. Every student must belong to an existing
department. Studentsshould not be assigned to a department that does not exist.

create table constraints.dept(
deptid integer,
deptname varchar(20) not null);

create table constraints.student(
stuid integer primary key,
stuname varchar(20),
foreign key (deptid)
references dept(deptid));

Interview Question:
Which SQL constraint would you use to maintain the relationship between the Student and
Department tables and prevent invalid department assignments?
Answer:foreign key is used to make relationship bw student and department.

4. E-Commerce Order Management (CHECK Constraint)
Scenario:
An e-commerce company stores product prices in the database. The business rule states that the
product price should always be greater than zero. Negative or zero prices should never be
accepted.
create table constraints.company(
productid integer,
productname varchar(20),
productprice integer(20) check(productprice>0));

Interview Question:
Which SQL constraint would you use to enforce this business rule and prevent invalid
product prices?
Answer:check constraints 

5.Scenario:
A hospital is developing a Patient Registration System. Every patient must have a name, but if
the patient bloodgroup is not entered during registration,it should automatically bestored as 'unknown'
create table hospital(
patientid integer,
patientname varchar(20) not null,
bloodgroup varchar(10) default='unknown' );

Interview Question:
Which SQL constraints would you use to ensure the patient name is always provided and a
default blood group is assigned when no value is entered?
Answer:default








