--Assignment-2

Use HumanResources

--1)Add a record for 'Suresh Patel’, age 28, salary 55000, in 'IT' with EID 101.

Create table emps (EID Int Identity(101, 1), EName Varchar(50), EAge INT, ESalary Decimal(10, 2), EDepartment Varchar(100))

Select * from emps

Insert into emps values ('Suresh', 28, 50000, 'IT')

Update emps set ESalary=55000 where EID=101

--2)Add a record for 'Mahesh Patel' (EID 102) where the Edepartment is explicitly set to NULL.

Insert into emps(EName, EAge, ESalary) values ('Mahesh', 29, 45000)

Select * from emps

--3)Add three employees (EIDs 103, 104, 105) using a single VALUES list.

Insert into emps values ('Rajesh', 30, 40000, 'EC'), ('Prakash', 31, 35000, 'CE'), ('Naresh', 32, 30000, 'CS')

Select * from emps

--4)Add a record for 'Jayesh Patel' (EID 106) specifying only the EID and Ename columns.

Insert into emps(EName) values ('Jayesh')

Select * from emps

--5)Add a record for a new hire in 'HR' with EID 107.

Insert into emps(EDepartment) values ('HR')

Select * from emps

--6)Change the Edepartment to 'Marketing' for any employee whose current department IS NULL.

Update emps set EDepartment='Marketing' where EID=106

Select * from emps

--7)Change the Edepartment to 'Tech' for any employee whose City is Vadodara

Update emps set EDepartment='Tech' where EID=102

select * from emps

--8)Update the salary to 75000 for employees whose EID is IN the list (101, 103).

Update emps set ESalary=75000 where EID in (101, 103)

Select * from emps

--9)Update the Edepartment to 'Management' for employees whose Eage is 22.

Update emps set EAge=22 where EAge=32

Update emps set EDepartment='Management' where Eage = 22

Select * from emps

--10)Update the Esalary to 80000 for everyone whose name is Suresh

Update emps set ESalary=80000 where EName='Suresh'

Select * from emps

--11)Remove the record for the employee whose EID is (105).

Delete from emps where EID=105

Select * from emps

--12)Remove all employees who work in departments 'Marketing'.

Delete from emps where EDepartment='Marketing'

Select * from emps

--13)Remove employees whose Eage is 25.

Delete from emps where Eage=30

Select * from emps

--14)Remove records where the Esalary IS NULL.

Delete from emps where ESalary is Null

Select * from emps

--15)Use the TRUNCATE command to empty the entire table at once (this avoids using a WHERE clause entirely).

Truncate table emps

Select * from emps


