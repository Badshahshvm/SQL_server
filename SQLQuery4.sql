Create Database IndexQuerry;
Use IndexQuerry;

Create Table Customer (CustomerID INT PRIMARY KEY, CustomerName varchar(100) Not Null, Email varchar(100) Unique, City Varchar(50),Phone Varchar(50));
 INSERT INTO Customer (CustomerID, CustomerName, Email, City, Phone) Values(7,'Sonu', 'shon@gmail.com','Patna','2345678999' );
 select * from customer;


 ---INDEX---

 --Craete Index--
 CREATE INDEX idx_customer_name on Customer (CustomerName);


 --Drop Index--
 Drop Index Customer.idx_customer_phone;

 --Show Index--
 Exec sp_helpindex 'Customer';

 --Unique Index--

 Create Unique Index idx_customer_phone on Customer(Phone);

 --Custered Index--
 Create CLUSTERED Index idx_customer_city On Customer (City);

 ---Non Clustered Index--
 Create NONCLUSTERED Index idx_customer_city On Customer (City);

 ---Wilcrad Operators--

 select * from Customer where CustomerName like 'Sh%';
 select * from Customer Where CustomerName like '____';
 select * from Customer Where CustomerName like 's%';
  --start with s but second letter can be h,o--
 select * from Customer Where CustomerName like 's[h,o]%';
 --start with s but second letter cannot be o--
 select * from Customer Where CustomerName like 's[^o]%';


 --Date Functions--
 select getDate() as CurrentDateTime;
 select year(getdate()) as year,
 Month (Getdate())as Month,
 Day(GetDate()) as Day;

 --String Function--

 Select UPPER('shivam')as UpperCase;
 
 Select LOWER('SHIVAM')as LowerrCase;

 select Len('shivam') as Length;
 select LTRIM('   SHIVAM KUMAR') as NoLeadingSpaces;
 select RTRIM('SHIVAM KUMAR     ') as TrailingSpaces;
 select Concat('shivam','kumar')as FullText;
 select substring('shivamkuarsingh',1,5) as substringExmaple;



 --Numeric Function--
 Select abs(-123) as AbsoluteValue;
 select Round(4.45678,2) as Rondvalue;
 Select sqrt(25) as SqaureRoot;
 select power (2,3) as TwoPowerThree;
 select Rand() as RandomValue;
 select ceiling(4.2) as CeilingValue;


 ---Conversion --
 select CAST('123' as Int) as CastToInt;
 select convert(varchar,123) as  ConvertToVarchar;

 --Json Function--

 Declare @json nvarchar(max)=
 N'{"id":1,"name":"shivam", "skills":["SQL","C#","java"]}'
 select json_value(@json,'$.name') as EmployeeName;
 select value as skill from openjson(@json,'$skills');



 --Store Procedure--
 CREATE PROCEDURE AllRecords
AS
BEGIN
    -- Select all records from the Customer table
    SELECT *
    FROM Customer;
END;
GO


exec ALLRecords;


--single parameter--
 CREATE PROCEDURE AllRecord2 @City varchar(20)
AS

    -- Select all records from the Customer table
    SELECT *
    FROM Customer where City=@City;

GO
exec ALLRecord2 @City='Delhi';


--with multiple parameter--
 CREATE PROCEDURE AllRecord3 @City varchar(20), @CustomerName varchar(50)
AS

    -- Select all records from the Customer table
    SELECT *
    FROM Customer where City=@City AND CustomerName=@CustomerName;

GO

exec ALLRecord3 @City='Delhi' ,@CustomerName='Shivam Kumar';
select * from Customer;