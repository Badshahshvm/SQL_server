
USE SAMPLE_DB;

-- Step 1: Create table
CREATE TABLE Students (
    Id INT,
    Name VARCHAR(50)
);

-- Step 2: Insert duplicate data
INSERT INTO Students (Id, Name) VALUES
(1, 'Shivam'),
(2, 'Amit'),
(3, 'Neha'),
(4, 'Amit'),   -- duplicate
(5, 'Neha'),   -- duplicate
(6, 'Rohit'),
(7, 'Ganesh');

-- Step 3: Remove duplicates (keep lowest Id, delete higher Ids)
DELETE FROM Students
WHERE Id NOT IN (
    SELECT MIN(Id)
    FROM Students
    GROUP BY Name
);

-- Step 4: Check final data
SELECT * FROM Students;




--solution2 Using Self Join--

SELECT s2.*
FROM students s1
JOIN students s2
  ON s1.Name = s2.Name
WHERE s1.Id < s2.Id;


-- Step 4: Check final data
SELECT * FROM Students;
