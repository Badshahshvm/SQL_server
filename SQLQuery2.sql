--Create New Database--
Create Database College;
--Select Datbase--
Use College;

--to Check Current Dtabase are you present--
SELECT DB_NAME()

--Drop Dtabase--

Drop Database College;

--Rename Dtabase--
ALTER DATABASE  college 
MODIFY NAME = School;

--Create new table --
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    City VARCHAR(50)
);

-- Drop Table--
DROP TABLE Students;


-- Truncate Table--
TRUNCATE TABLE Students;

-- Copy Table--
SELECT * 
INTO Students_Copy
FROM Students;

--Temperory Table--
CREATE TABLE #TempStudents (
    ID INT,
    Name VARCHAR(50)
);

-- Alter Table--
ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Students DROP COLUMN City;

--Insert Single Value--
INSERT INTO Students (StudentID, Name, Age, City, Email)
VALUES (5, 'Amit Singh', 20, 'Delhi', 'amit.kumar@example.com');

--Show table--
Select * from Students;

--Insert Multiple Value--
INSERT INTO Students (StudentID, Name, Age, City, Email)
VALUES 
    (2, 'Neha Sharma', 21, 'Mumbai', 'neha.sharma@example.com'),
    (3, 'Rahul Verma', 22, 'Kolkata', 'rahul.verma@example.com'),
    (4, 'Priya Singh', 19, 'Bangalore', 'priya.singh@example.com');

-- UPDATE Records--
UPDATE Students SET Age = 25 WHERE StudentID = 2;

-- DELETE Record--
DELETE FROM Students WHERE StudentID = 3;


--4. Clause--

-- WHERE
SELECT * FROM Students WHERE Age > 20;

-- WITH --
WITH Older AS (SELECT * FROM Students WHERE Age > 21)
SELECT * FROM Older;

-- HAVING---
SELECT City, COUNT(*) FROM Students
GROUP BY City
HAVING COUNT(*) > =1;


-- ORDER BY--
SELECT * FROM Students ORDER BY Age DESC;

-- GROUP BY--
SELECT City, AVG(Age) FROM Students GROUP BY City;

-- LIMIT --
--SELECT * FROM Students LIMIT 2;--
SELECT TOP 2 * 
FROM Students;


-- DISTINCT--
SELECT DISTINCT City FROM Students;

-- Aliases--
SELECT Name AS StudentName, Age AS Years FROM Students;


---Aggregrate Function--

SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT SUM(Age) AS TotalAge FROM Students;
SELECT MIN(Age) AS Youngest FROM Students;
SELECT MAX(Age) AS Oldest FROM Students;
SELECT AVG(Age) AS AverageAge FROM Students;


--Intigrity Constraint--
--Not Null--
CREATE TABLE Teachers (ID INT NOT NULL, Name VARCHAR(50) NOT NULL);

-- PRIMARY KEY--
CREATE TABLE Courses (CourseID INT PRIMARY KEY, CourseName VARCHAR(50));

-- CHECK--
ALTER TABLE Students ADD CONSTRAINT check_age CHECK (Age >= 18);


-- DEFAULT--
ALTER TABLE Students 
ADD Country VARCHAR(20) DEFAULT 'India';

