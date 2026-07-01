create database assessment;

/*SCENARIO 01*/
create table assessment.employee(
empid integer primary key,
empname varchar(50),
department varchar(30),
salary integer);

select * from assessment.employee;

insert into assessment.employee(empid, empname,department,salary)
values (101,'john','IT',45000),
(102,'mary','HR',35000),
(103,'david','finance',55000),
(104,'sam','IT',40000),
(105,'priya','HR',38000);

select * from assessment.employee;

/*SCENARIO 02*/
create table assessment.student(
stu_id integer,
stu_name varchar(50),
course varchar(30));

select *from assessment.student;

insert into assessment.student(stu_id,stu_name,course)
values (1,'Rahul','SQL'),
(2,'Priya','Python'),
(3,'Arun','Power BI'),
(4,'Sneha','Java'),
(5,'Karthik','SQL');

select *from assessment.student;

alter table assessment.student
add email varchar(50);

select *from assessment.student;


/*SCENARIO 03*/
create table assessment.product(
productID integer,
productname varchar(50),
price integer);

select * from assessment.product;

insert into assessment.product(productid,productname, price)
values(101,'laptop',60000),
(102,'mouse',800),
(103,'keyboard',1200),
(104,'monitor',15000),
(105,'printer',9000);

select * from assessment.product;

update assessment.product
set price=1500 where productid=103;

select * from assessment.product;

/*SCENARIO 04*/
create table assessment.patient(
patientid integer,
patientname varchar(50),
disease varchar(50));

select * from assessment.patient;

insert into assessment.patient( patientid,patientname,disease)
values(1,'ramesh','fever'),
(2,'suresh','cold'),
(3,'Anitha','diabites'),
(4,'Meena','Asthama'),
(5,'kumar','typhoid');

select * from assessment.patient;

delete from assessment.patient
where patientid=2;

select * from assessment.patient;

/*SCENARIO 05*/
create table assessment.eventregistration(
studentid integer,
studentname varchar(50),
eventname varchar(50));

select * from assessment.eventregistration;

insert into assessment.eventregistration(studentid, studentname, eventname)
values (1,'rahul','dance'),
(2, 'priya','singing'),
(3,'arun','drawing'),
(4,'sneha','quiz'),
(5,'karthik','drama');
select * from assessment.eventregistration;

truncate table assessment.eventregistration;

/*SCENARIO 06*/
create table assessment.employee1(
empid integer,
empname varchar(20),
salary integer);

select * from assessment.employee1;

insert into assessment.employee1(empid,empname,salary)
values(101,'john',45000),
(102,'mary',35000),
(103,'david',50000),
(104,'sam',42000),
(105,'priya',39000);
select * from assessment.employee1;

rename table assessment.employee1 to assessment.staff;
select * from assessment.staff;

/*SCENARIO 07*/
create table assessment.account(
accountno integer,
customername varchar(50),
balance integer);
select * from assessment.account;

insert into assessment.account(accountno,customername,balance)
values (1001,'john',50000),
(1002,'mary',30000),
(1003,'david',70000),
(1004,'sam',45000),
(1005,'priya',60000);
select * from assessment.account;

update assessment.account
set balance=35000 where accountno=1002;
commit;
select * from assessment.account;

/*SCENARIO 08*/
create table assessment.book(
bookid integer,
bookname varchar(50),
author varchar(50));
select * from assessment.book;

insert into assessment.book(bookid,bookname,author)
values (1, 'sqlbasics','james'),
(2,'python guide','robert'),
(3,'java programming','john'),
(4,'power BI','David'),
(5,'data science','peter');
select * from assessment.book;

delete from assessment.book
where bookid=3;

rollback ;  /*unsuccessful*/

/*SCENARIO 09*/
create table assessment.employee2(
empid integer,
empname varchar(50),
department varchar(50),
salary integer);

select * from assessment.employee2;
insert into assessment.employee2(empid,empname,department,salary)
values(101,'john','IT',45000),
(102,'mary','HR',35000),
(103,'david','finance',50000),
(104,'sam','IT',42000),
(105,'Priya','HR',38000);

savepoint student1;

/*SCENARIO 10*/
create table assessment.customerdetails2026(
customerid integer,
customername varchar(50),
city varchar(50));
select * from assessment.customerdetails2026;

insert into assessment.customerdetails2026(customerid, customername,city)
values(1,'john','chennai'),
(2,'mary','banglore'),
(3,'david','hydrabad'),
(4,'sam','coimbatore'),
(5,'priya','madurai');

drop table assessment.customerdetails2026;


create table assesment.employee2(
empid integer,
empname varchar(20),
department varchar(20),
salary integer(20),
city varchar(20));

select * from assessment.employee2
where department='HR';
rollback;

select * from assessment.employee2;




