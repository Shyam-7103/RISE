--Assignment-1
--Literal SELECT Statement Practice Problems

--1) Execute a literal select statement that returns your name.
Select 'Shyam' as Name

--2) Write the literal select statement that evaluates the product of 7 and 4.
Select 7*4 as Products

--3) Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8.
Select (7-4)*8 as Diff

--4) Write a literal select statement that returns the phrase “Brewster’s SQL Training Class”. (Hint: note the single apostrophe in the string).
SELECT 'Brewster''s SQL Training Class';

--5) Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one column and the result of 5*3 in another column.
SELECT 'Day 1 of Training' AS Description, 5 * 3 AS Result;


--Select Statement Practice Problems

--6) Retrieve all rows from the HumanResources.Employee table. Return only the NationalIDNumber column.
Create database HumanResources
Use HumanResources

Create table Employee (NationalIDNumber INT, EName Varchar(20), JobTitle varchar(20), BirthDate Date)
Select * from Employee

Insert into Employee VALUES (101, 'Shyam', 'MERN', '2000-09-05')

Insert into Employee VAlUES (102, 'Miren','NodeJS','2003-11-23'), (103, 'Shiv', 'DevOps', '2004-12-27'), (104, 'Shakti', 'ReactJS', '2000-05-15')
Select * from Employee

--Delete From Employee where EName='Shyam' 

Select NationalIDNumber from Employee

--7) Retrieve all rows from the HumanResources.Employee table. Return the NationalIDNumber and JobTitle columns.

Select * from Employee
Select NationalIDNumber, JobTitle from Employee

--8) Retrieve the top 20 percent of rows from the HumanResources.Employee table.Return the NationalIDNumber, JobTitle and BirthDate columns.

Select Top(20)percent * from Employee
Select NationalIDNumber, JobTitle, BirthDATE FROM Employee

--9) Retrieve the top 500 rows from the HumanResources.Employee table. Return the NationalIDNumber, JobTitle and BirthDate columns. Give the NationalIDNumber column an alias, “SSN”, and the JobTitle column an alias, “Job Title”.

Select top(500) * from Employee
Select NationalIDNumber, JobTitle, BirthDate FROM Employee
sp_rename 'Employee.NationalIDNumber', 'SSN'
sp_rename 'Employee.JobTitle', 'Job Title'
Select * from Employee

--10) Return all rows and all columns from the Sales.SalesOrderHeader table.

Select * from SalesOrderHeader

--11)Return the top 50 percent of rows and all columns from the Sales.Customer table.

Select Top(50)percent * from Customer

--12)Return the Name column from the Production.ProductAndDescription table. Give this column an alias “Product’s Name”.

Select Name from the Production
sp_rename 'ProductionAndDescription.Name', 'Products Name'

--13)Return the top 400 rows from HumanResources.Department

Select Top(400) * from HumanResourses.Department

--14)Return all rows and columns from the table named Production.BillOfMaterials

Select * from Production.BillOfMaterials

--15)Return the top 1500 rows and columns from the view named Sales.vPersonDemographics

Select Top(1500) * from Sales.vPersonDemographics;

