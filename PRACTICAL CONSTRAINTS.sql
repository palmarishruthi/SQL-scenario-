
create database constraints1;

create table constraints1.department(
deptid integer primary key,
deptname varchar(20));

insert into constraints1.department (deptid, deptname)
values(1,'HR'),
(2,'IT'),
(3,'finance');
select * from constraints1.department;
drop table constraints1.department;

create table constraints1.employee(
emp_id integer primary key auto_increment,
emp_name varchar(20) not null,
email varchar(50) unique,
deptid int,
salary decimal(7,2) check(salary>25000),
city varchar(20) default('chennai'),
age integer check(age>18),
foreign key(deptid) references department(deptid)
);

drop table constraints1.employee;
select * from constraints1.employee;

insert into constraints1.employee(emp_id,emp_name,email,salary,deptid,age)
values(101,'abhi','abhi@gmail.com',26000,1,25);

insert into constraints1.employee(emp_name,email,salary,deptid,age)
values('bhanu','bhanu@gmail.com',50000,2,40),
('Shiv','shiv@gmail.com',35000,3,37),
('vetri','vetri@gmail.com',29000,2,30),
('tilak','tilak@gmail',33000,3,19);


