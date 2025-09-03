Create Database JoinQuerry;
use JoinQuerry;
---Create Table---
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

--Insert Data in aDepartmnet table--
INSERT INTO Department (DeptID, DeptName) VALUES (1, 'HR'), (2, 'Finance'), (3, 'IT'), (4, 'Sales');

--Create a ne Employee Table--
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT NULL,  
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

--Insert Data in Employee Table--
INSERT INTO Employee (EmpID, EmpName, DeptID) VALUES (101, 'Ravi Kumar', 1),
 (102, 'Anita Sharma', 2),
(103, 'Suresh Singh', 3),
 (104, 'Priya Verma', NULL); -- No dept (105, 'Amit Patel', 2);

 --Inner Join--
 SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employee e
INNER JOIN Department d ON e.DeptID = d.DeptID;

--Left Join--

 SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employee e
LEFT JOIN Department d ON e.DeptID = d.DeptID;

--Right Join--
 
 SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employee e
RIGHT JOIN Department d ON e.DeptID = d.DeptID;

--OUTER jOIN--
SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employee e
FULL OUTER JOIN Department d ON e.DeptID = d.DeptID;


--CROSS JOIN--
SELECT e.EmpName, d.DeptName
FROM Employee e
CROSS JOIN Department d;


--SELF JOIN--
ALTER TABLE Employee ADD ManagerID INT NULL;

--View--

CREATE VIEW [Employee 2] AS
SELECT EmpID, DeptID, EmpName
FROM Employee
WHERE DeptID = 2;

select * from [Employee 2];


DROP VIEW [Employee 2];

ALTER VIEW [Employee 2] AS
SELECT EmpID, EmpName, DeptID,
FROM Employee
WHERE EmpID = 101;



