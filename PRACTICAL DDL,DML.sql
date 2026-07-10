
-- DDL COMMANDS

/* CREATE*/
CREATE DATABASE STUDENT;

CREATE TABLE STUDENT(

student_ID INTEGER PRIMARY KEY,
student_name varchar(20),
student_gender varchar(5));

/*DROP*/
DROP DATABASE STUDENT;

CREATE DATABASE DATA_ENGINEERING;

use data_engineering;

CREATE TABLE data_engineering.STUDENT(

stu_id int primary key,
stu_name varchar(20),
course varchar(20)
);

SELECT * FROM data_engineering.STUDENT;

/*ALTER*/
ALTER TABLE data_engineering.STUDENT
ADD EMAIL varchar(50);

/*SELECT*/
SELECT* FROM data_engineering.STUDENT;

INSERT INTO data_engineering.student(stu_id,stu_name,course,email)
value(1,'Ram','DE','ram@gamil.com');

select * from data_engineering.student;

/*trancate  commands*/
truncate TABLE DATA_ENGINEERING.STUDENT;
 
SELECT * FROM DATA_ENGINEERING.STUDENT;

-- DML COMMANDS 
/*INSERT*/
INSERT INTO data_engineering.STUDENT(STU_ID,STU_NAME, COURSE)
VALUES(101,'ABHI','TESTING'),
(102,'REEMA','JAVA'),
(103,'SUBHA','ETL_TESTING');

SELECT * FROM data_engineering.STUDENT;

ALTER table data_engineering.student;

/*RENAME*/
rename table data_engineering.student to data_engineering.de_students ;

select * from data_engineering.de_students;

/*update and where commands*/
UPDATE  data_engineering.de_STUDENTs
SET COURSE= 'DATA_ANALYST'
WHERE STU_ID=102;

select * from data_engineering.de_students;

/*delete commands*/
delete from data_engineering.de_students
where stu_id ='101';

select * from data_engineering.de_students;

insert into data_engineering.de_students(stu_id,stu_name,course,email)
values(104,'MAHI','GEN_AI','mahi@gmail.com'),
(105,'rajeev','gen_Ai','rajeev@gmail.com');

select * from data_engineering.de_students;

/*insert into data_engineering.de_students(email)
where values id=101('reema@gmail.com');*/

update data_engineering.de_students
set email= 'reema@gmail.com' where stu_id=102;

update data_engineering.de_students
 set email= 'subha@gmail.com' where stu_id=103;
 
 alter table data_engineering.de_students
 add column fees integer;
 
 select * from data_engineering.de_students;
 
/* update data_engineering.de_students
 set fees=40000, where id=102,
 set fees=50000 where id=103
 set 
 */
 
 grant select
 on de_students.*
 to 'john'@'localhost';
 
 start transaction;
 update data_engineering.de_students
 set fees=50000
 where stu_id=103;
 commit;
 

 update data_engineering.de_students
 set course='data_science'
 where stu_id=104;
 rollback;
 
 
 















