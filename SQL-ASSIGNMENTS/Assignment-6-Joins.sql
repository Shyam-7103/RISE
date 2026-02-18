Use HumanResources

Create table Employee1
(EID VARCHAR(20),
ENAME VARCHAR(255),
MID INT,
DID INT)

Create table Department
(DID INT,
DNAME VARCHAR(255))

Create table Project 
(PID VARCHAR(20),
PNAME VARCHAR(255),
EID VARCHAR(20))

Create table Manager
(MID INT,
MNAME VARCHAR(255))

INSERT INTO Employee1 VALUES
('E01', 'Rohan', 101, 2),
('E02', 'Sneha', 102, 1),
('E03', 'Arjun', 101, 2),
('E04', 'Kavya', 103, 3),
('E05', 'Manish', 104, 4),
('E06', 'Anita', 105, 5);

INSERT INTO Department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

INSERT INTO Project VALUES
('P01', 'Payroll System', 'E01'),
('P02', 'Website Revamp', 'E03'),
('P03', 'Recruitment App', 'E02'),
('P04', 'Finance Audit', 'E04'),
('P05', 'Marketing Campaign', 'E05'),
('P06', 'Supply Chain Tool', 'E06');

INSERT INTO Manager VALUES
(101, 'Amit Shah'),
(102, 'Neha Patel'),
(103, 'Rahul Mehta'),
(104, 'Priya Nair'),
(105, 'Suresh Kumar');

Select * from Employee1
Select * from Department
Select * from Project
Select * from Manager

--1. Display each employee's name and their corresponding department name.

Select E.ENAME, D.DNAME
From Employee1 E join Department D
ON E.DID = D.DID

--2. List all projects along with the name of the employee assigned to them.

Select P.PNAME, E.ENAME
FROM Project P JOIN Employee1 E
ON P.EID = E.EID

--3. Show the names of employees and the names of their managers.

Select E.ENAME, M.MNAME 
FROM Employee1 E JOIN Manager M
ON E.MID = M.MID

--4. Display the Project ID and the Department ID for every project.

SELECT P.PID, E.DID 
FROM Project P JOIN Employee1 E
ON P.EID = E.EID

--5. List employees who work in the 'IT' department.

SELECT E.ENAME, D.DNAME 
FROM Employee1 E JOIN Department D
ON E.DID = D.DID
WHERE DNAME = 'IT';

--6. Display employee names and their manager names for all employees in department 10.

SELECT E.ENAME, M.MNAME 
FROM Employee1 E JOIN Manager M
ON E.MID = M.MID
WHERE E.DID = 10;

--7. Show all projects handled by ‘Suresh’.

SELECT E.ENAME, P.PNAME
FROM Employee1 E JOIN Project P
ON E.EID = P.EID
WHERE  ENAME = 'Suresh';

--8. Find the department name associated with Project ID 101.

SELECT D.DNAME, P.PID 
FROM Department D JOIN Employee1 E 
ON D.DID = E.DID
JOIN Project P
ON E.EID = P.EID
WHERE PID = 'P01'

--9. List all employees whose manager's name is 'Suresh'.

SELECT E.ENAME, M.MNAME
FROM Employee1 E JOIN Manager M
ON E.MID = M.MID
WHERE MNAME = 'SURESH'

--10.Display the count of employees in each department name.

SELECT COUNT(E.EID), D.DNAME
FROM Employee1 E JOIN Department D
ON E.DID = D.DID
GROUP BY D.DNAME



Select * from Employee1
Select * from Department
Select * from Project
Select * from Manager

--11. List all departments and the employees working in them (including departments with no employees).

SELECT D.DNAME, E.ENAME
FROM Department D JOIN Employee1 E
ON D.DID = E.DID

--12.Display all employees and the projects they are assigned to (including those with no projects).

SELECT E.ENAME, P.PNAME
FROM Employee1 E JOIN Project P
ON E.EID = P.EID

--13. Show the names of employees, their department names, and their manager names in one result.

SELECT E.ENAME, D.DNAME, M.MNAME
FROM Employee1 E JOIN Department D
ON E.DID = D.DID
JOIN Manager M
ON M.MID = E.MID

--14. Find all projects and the department name they belong to.

SELECT P.PNAME, D.DNAME 
FROM Project P JOIN Employee1 E
ON P.EID = E.EID
JOIN Department D
ON D.DID = E.DID

--15. List all managers and the names of employees reporting to them (including managers with no reporters).

SELECT MNAME, ENAME
FROM Manager M JOIN Employee1 E
ON M.MID = E.MID

--16. Find employees who are NOT assigned to any project.

SELECT E.ENAME FROM Employee1 E JOIN Project P
ON E.EID = P.EID
WHERE PNAME IS NULL

--17.Display the names of all employees and the names of projects, but only for those in the ‘IT’ department.

SELECT E.ENAME, P.PNAME
FROM Employee1 E JOIN Project P
ON E.EID = P.EID
JOIN Department D
ON D.DID = E.DID
WHERE DNAME = 'IT';

--18. Show the names of managers who are managing employees in the 'Finance' department.

SELECT M.MNAME, E.ENAME
FROM Manager M JOIN Employee1 E
ON M.MID = E.MID
JOIN Department D
ON D.DID = E.DID
WHERE DNAME = 'FINANCE';

--19.Display Department Name, Employee Name, and Project Name for all matches.

SELECT D.DNAME, E.ENAME, P.PNAME 
FROM Department D JOIN Employee1 E
ON D.DID = E.DID
JOIN Project P
ON P.EID = E.EID

--20. List all projects and the manager's name responsible for the employee assigned to that project.

SELECT P.PNAME, M.MNAME
FROM Project P JOIN Employee1 E 
ON P.EID = E.EID
JOIN Manager M
ON M.MID = E.MID 