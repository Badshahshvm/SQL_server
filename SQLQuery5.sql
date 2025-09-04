create database IndexingQuerry;

use IndexingQuerry;
create table Student(Id int, name varchar(50), age int);
insert into Student (Id, name, age) values(1,'shivam',22);
select * from student;
create table Employees(ID INT Primary Key, Name varchar(50), Gender varchar(20) Not Null, Designation varchar(50), Salary Int);

insert into Employees(Id, Name, Gender, Designation, Salary) Values (8, 'Manish Gupta', 'Male', 'Team Lead', 40000),
(9, 'Anjali Verma', 'Female', 'Software Engineer', 32000),
(10, 'Suresh Yadav', 'Male', 'Clerk', 18000),
(11, 'Pooja Kumari', 'Female', 'Receptionist', 16000),
(12, 'Rajesh Kumar', 'Male', 'Project Manager', 60000),
(13, 'Alok Ranjan', 'Male', 'Developer', 30000),
(14, 'Neha Singh', 'Female', 'Developer', 31000),
(15, 'Vikas Pandey', 'Male', 'Tester', 28000),
(16, 'Meena Kumari', 'Female', 'Assistant', 17000),
(17, 'Rohit Sharma', 'Male', 'Operator', 26000),
(18, 'Kiran Devi', 'Female', 'Intern', 19000),
(19, 'Sunil Kumar', 'Male', 'Designer', 33000),
(20, 'Ankita Raj', 'Female', 'Accountant', 34000),(25, 'Ankit', 'male', 'Accountant', 34000);
insert into Employees(Id, Name, Gender, Designation, Salary) values(22, 'Ankit', 'male', 'Accountant', 34000);
select * from employees;


create index idx_Student_age
on Student (age  asc);

create index idx_Employees_Salary
on Employees (Salary  asc);
select * from employees 
where salary >10000 and salary <20000;

sp_helpindex employees;
sp_helpindex Student;

drop index employees.idx_Employees_Salary;

--composite index--
CREATE CLUSTERED INDEX idx_Employees_Salary_Gender_clustered
ON Employees (Gender DESC, Salary ASC);
