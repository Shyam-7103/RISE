--Assignment-3

Use HumanResources

--1)Display the Ename and a 10% bonus amount for every employee

Select EName, ESalary, (ESalary*0.10) AS Bonus_Amount from emps

Select * from emps

--2)Calculate the new salary for all employees if everyone gets a flat raise of ₹5,000.

Select EID, EName, (ESalary+5000) AS New_Salary from emps

Select * from emps

--3)If an employee's age is increased by 2, what would it be? Display Ename and ProjectedAge.

Select EName, (EAge + 2) AS ProjectedAge from emps

Select * from emps

--4)Show the Ename and the monthly salary deduction if a 2% professional tax is applied to the current salary.

SElect EName, (ESalary-(ESalary*0.02)) AS MonthlySalaryDeduction from emps

--5)List all employees who are exactly 20 years old.

Select * from emps where EAge = 20

Select * from emps

--6)Find all employees whose salary is greater than 20,000.

Select * from emps where ESalary > 20000

--7)Display details of employees who do not belong to the 'Cloud' department.

Select * from emps where EDepartment <> 'Cloud'

Select * from emps

--8)List employees who were hired at an age of 25 or younger.

Select * from emps where Hiring_Age <= 25

--9)Find employees whose salary is less than or equal to 25,000.

Select * from emps where ESalary <= 25000

--10)List employees who work in the 'IT' department AND have a salary greater than 30,000.

Select  * from emps where EDepartment = 'CE' AND ESalary > 30000

Select * from emps

--11)Display employees who are older than 30 but do NOT work in the 'Finance' department.

Select * from emps where EAge > 30 OR EDepartment<>'EC'

--12)Find employees who are either in the 'Sales' department OR the 'Marketing' department.

Select * from emps where EDepartment = 'EC' OR EDepartment='CE'

--13)Find employees whose age is 28 AND salary is exactly 30,000.

Select * from emps where Eage=28 AND ESalary=30000

--14)List all employees who are NOT in the 'Admin' department and have a salary above 20,000.

Select * from emps where ESalary=20000 AND EDepartment<>'Admin'

--15)Find employees whose age is between 25 and 35 (inclusive).

Select * from emps where EAge BETWEEN 25 AND 35

--16)List employees who work in any of these departments: 'IT', 'HR', or 'Operations'.

Select * from emps where EDepartment IN ('IT', 'HR', 'Operations')

--17)Find all employees whose name starts with the letter 'A'.

Select * from emps where EName like 'R%'

--18)List employees whose salary is in the range of 25,000 to 35,000 using the BETWEEN operator.

Select * from emps where ESalary between 25000 and 35000

--19)Find employees whose Department value is missing.List employees who are NOT IN the 'IT' or 'Sales' departments using the NOT IN operator.

Select * from emps where EDepartment is Null

Select * from emps where EDepartment not in ('CE', 'EC') 

--20)Find employees whose name ends with the letter 'n'.

Select * from emps where EName like '%n'

--21)Show employees whose age is NOT between 20 and 30.

Select * from emps where EAge not between 20 and 30