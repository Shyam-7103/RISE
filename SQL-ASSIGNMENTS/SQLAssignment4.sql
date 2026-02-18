--Assignment-4

Use HumanResources

--1) Return the Name column from Employeedetails where the Name column is equal to "Suresh".

Create table Employeedetails
(empid int,
ename varchar(50),
eage int,
salary money,
department varchar(50),
location varchar(50)
)

Select * from Employeedetails

INSERT INTO Employeedetails VALUES
(1, 'Suresh', 25, 30000, 'QA', 'New York'),
(2, 'Ramesh', 28, 45000, 'DA', 'Chicago'),
(3, 'Anita', 22, 18000, 'FS', 'New York'),
(4, 'Aarav', 24, 52000, 'DE', 'Boston'),
(5, 'Neha', 21, 0, 'QA', 'Dallas'),
(6, 'Kiran', 26, 25000, NULL, 'New York'),
(7, 'Asha', 23, 22000, 'HR', 'Seattle'),
(8, 'Divya', 29, 60000, 'FS', 'Chicago'),
(9, 'Bala', 27, 48000, 'DE', 'New York'),
(10, 'Charan', 20, 15000, NULL, 'Miami'),
(11, 'Akash', 24, 35000, 'QA', 'Boston'),
(12, 'Pooja', 30, 70000, 'DA', 'New York')

Select ename from Employeedetails where ename = 'Suresh'

--2) Find the top 100 rows from Employeedetails where the Salary is not equal to 0.

select top(100) * from Employeedetails WHERE salary <> 0

--3) Return all rows and columns from Employeedetails where the employee’s Name starts with a letter less than “D”.

Select * from Employeedetails WHERE ename < 'D'

--4) Return all rows and columns from Employeedetails where the City column is equal to "New York".

Select * from Employeedetails Where location = 'New York'

--5) Return the Name column from Employeedetails where the Name is equal to "Ramesh". Give the column alias "Employee Name".

Select ename AS Employee_Name from Employeedetails WHERE ename = 'Ramesh'

--6) Using the Employeedetails table, find all employees with a Department equal to "QA" or all employees who have an Age greater than 23 and a Salary less than 50000.

Select * from Employeedetails where department = 'QA' OR (eage > 23 AND salary < 50000)

--7) Find all employees from Employeedetails who have a Department in the list of: "DA", "FS", and "DE". Complete this query twice – once using the IN operator in the WHERE clause and a second time using multiple OR operators.

Select * from Employeedetails WHERE department IN ('DA', 'FS', 'DE')

Select * from Employeedetails WHERE department='DA' OR department='FS' OR department='DE'

--8) Find all employees from Employeedetails whose Name starts with the letter “A”.

Select * from Employeedetails Where ename LIKE 'A%'

--9) Find all employees from Employeedetails whose Name ends with the letter “a”.#

Select * from Employeedetails Where ename LIKE '%a'

--10) Return all columns from the Employeedetails table for all employees who have a Department. That is, return all rows where the Department column does not contain a NULLvalue.

Select * from Employeedetails WHERE department <> 'NULL'

--11) Return the EID and Salary columns from Employeedetails for all employees who have a Department and whose Salary exceeds 20,000.

Select empid, salary from Employeedetails WHERE department <> 'NULL' AND salary > 20000