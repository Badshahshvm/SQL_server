Create  database RankQuerry;
use RankQuerry
create table teast_data (id int, Name varchar(50));
insert into teast_data (id, name) values(1,'shivam'),
(2, 'Amit'),
(3, 'Neha'),
(4, 'Amit'),   
(5, 'Neha'),   
(6, 'Rohit'),
(7, 'Ganesh'),(8,'Mohan'),(8,'Mohan');
select * from teast_data;

drop table teast_data;
SELECT 
    id,
    Name,
    RANK() OVER (ORDER BY Name) AS RankNo,
    DENSE_RANK() OVER (ORDER BY Name) AS DenseRankNo,
    ROW_NUMBER() OVER (ORDER BY Name) AS RowNum
FROM teast_data;

--Checking Dublicate VALUE--
WITH CTE AS (
    SELECT 
        id,
        name,
        ROW_NUMBER() OVER (PARTITION BY name ORDER BY id) AS RowNum
    FROM teast_data
)
SELECT * FROM CTE;

WITH CTE AS (
    SELECT 
        id,
        name,
        ROW_NUMBER() OVER (PARTITION BY name ORDER BY id) AS RowNum
    FROM teast_data
)
DELETE FROM CTE WHERE RowNum > 1;


select * from teast_data;