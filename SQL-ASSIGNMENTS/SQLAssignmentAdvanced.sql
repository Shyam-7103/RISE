USE HumanResources

CREATE TABLE Student_Assessments (
    assessment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    assessment_type VARCHAR(20) 
    CHECK (assessment_type IN ('Quiz', 'Assignment', 'Project', 'Exam')),
    assessment_date DATE NOT NULL,
    total_marks INT 
    CHECK (total_marks > 0),
    obtained_marks INT 
    CHECK (obtained_marks >= 0),
    attendance_status VARCHAR(10) 
    CHECK (attendance_status IN ('Present', 'Absent')),
    trainer_name VARCHAR(50) NOT NULL,
    remarks VARCHAR(100) NULL);

Select * from Student_Assessments

INSERT INTO Student_Assessments (assessment_id, student_id, student_name, course_name, assessment_type, assessment_date, total_marks, obtained_marks, attendance_status, trainer_name, remarks) VALUES
(1, 101, 'Alice Johnson', 'Mathematics', 'Quiz', '2024-01-15', 20, 18, 'Present', 'Dr. Smith', 'Good performance'),
(2, 102, 'Bob Smith', 'Mathematics', 'Assignment', '2024-01-20', 30, 25, 'Present', 'Dr. Smith', 'Well done'),
(3, 103, 'Charlie Brown', 'Physics', 'Project', '2024-01-25', 50, 45, 'Present', 'Prof. Johnson', 'Excellent work'),
(4, 104, 'Diana Prince', 'Chemistry', 'Exam', '2024-02-01', 100, 90, 'Present', 'Dr. Lee', 'Great job'),
(5, 105, 'Ethan Hunt', 'Biology', 'Quiz', '2024-02-05', 20, 0, 'Absent', 'Dr. Green', 'Missed due to illness'),
(6, 101, 'Alice Johnson', 'Mathematics', 'Assignment', '2024-02-10', 30, 28, 'Present', 'Dr. Smith', ''),
(7, 102, 'Bob Smith', 'Mathematics', 'Project', '2024-02-15', 50, 40, 'Present', 'Dr. Smith', ''),
(8, 103, 'Charlie Brown', 'Physics', 'Exam', '2024-02-20', 100, 85, 'Present', 'Prof. Johnson', ''),
(9, 104, 'Diana Prince', 'Chemistry', 'Quiz', '2024-02-25', 20, 19, 'Present', 'Dr. Lee', ''),
(10, 105, 'Ethan Hunt', 'Biology', 'Assignment', '2024-03-01', 30, 0, 'Absent', 'Dr. Green', ''),
(11, 106, 'Fiona Gallagher', 'Mathematics', 'Quiz', '2024-03-05', 20, 15, 'Present', 'Dr. Smith', ''),
(12, 107, 'George Michael', 'Physics', 'Assignment', '2024-03-10', 30, 27, 'Present', 'Prof. Johnson', ''),
(13, 108, 'Hannah Baker', 'Chemistry', 'Project', '2024-03-15', 50, 48, 'Present', 'Dr. Lee', ''),
(14, 109, 'Ian Malcolm', 'Biology', 'Exam', '2024-03-20', 100, 92, 'Present', 'Dr. Green', ''),
(15, 106, 'Fiona Gallagher', 'Mathematics', 'Assignment', '2024-03-25', 30, 0, 'Absent', 'Dr. Smith', ''),
(16, 107, 'George Michael', 'Physics', 'Project', '2024-03-30', 50, 44, 'Present', 'Prof. Johnson', ''),
(17, 108, 'Hannah Baker', 'Chemistry', 'Exam', '2024-04-04', 100, 88, 'Present', 'Dr. Lee', ''),
(18, 109, 'Ian Malcolm', 'Biology', 'Quiz', '2024-04-09', 20, 18, 'Present', 'Dr. Green', ''),
(19, 110, 'Jack Sparrow', 'Mathematics', 'Quiz', '2024-04-14', 20, 0, 'Absent', 'Dr. Smith', ''),
(20, 110, 'Jack Sparrow', 'Mathematics', 'Assignment', '2024-04-19', 30, 22, 'Present', 'Dr. Smith', ''),
(21, 111, 'Karen Page', 'Physics', 'Project', '2024-04-24', 50, 47, 'Present', 'Prof. Johnson', ''),
(22, 112, 'Leo Messi', 'Chemistry', 'Exam', '2024-04-29', 100, 95, 'Present', 'Dr. Lee', ''),
(23, 111, 'Karen Page', 'Physics', 'Quiz', '2024-05-04', 20, 19, 'Present', 'Prof. Johnson', ''),
(24, 112, 'Leo Messi', 'Chemistry', 'Assignment', '2024-05-09', 30, 0, 'Absent', 'Dr. Lee', ''),
(25, 113, 'Mia Wallace', 'Biology', 'Project', '2024-05-14', 50, 46, 'Present', 'Dr. Green', '');

--1)Display records with obtained marks > 70%.

Select * from Student_Assessments where obtained_marks > 0.70

--2)Students scoring full marks.

Select * from Student_Assessments where  total_marks = obtained_marks

Select * from Student_Assessments

--3)Absent students.

Select * from Student_Assessments where attendance_status = 'Absent'

--4)Marks between 40 and 60.

Select * from Student_Assessments where obtained_marks between 40 and 60

--5)Assessments after 1 Jan 2024.

Select * from Student_Assessments where assessment_date > '2024-01-01'

--6)Assessments not by Rahul Sharma.

Select * from Student_Assessments where trainer_name <> 'Rahul Sharma'

--7)Power BI Project assessments.

Select * from Student_Assessments where assessment_type='Project' AND course_name='Power BI'

--8)SQL or Azure course records.

Select * from Student_Assessments where course_name IN ('SQL', 'Azure');

--9)Students not absent.

Select * from Student_Assessments where attendance_status <> 'absent'

--10)Marks <50 and present.

Select * from Student_Assessments where obtained_marks < 50 AND attendance_status='present'

--11)Names starting with A.

Select * from Student_Assessments where student_name LIKE 'A%'

--12)Trainers containing 'an'.

Select * from Student_Assessments where trainer_name LIKE '%an%'

Select * from Student_Assessments  #

--13)Courses ending with BI.

Select * from Student_Assessments where course_name LIKE '%BI'

--14)Remarks containing 'late'.

Select * from Student_Assessments where remarks LIKE '%late%'

--15)Calculate percentage.

Select student_id, student_name, (obtained_marks * 100.0 / total_marks) AS Percentage from Student_Assessments

--16)Failed students (<40%). 

Select student_id, student_name AS Failed_students from Student_Assessments where obtained_marks * 100 / total_marks < 40

--17)Grace marks for 35–39.

Select student_name, obtained_marks, (obtained_marks + 5) AS Graced_Marks from Student_Assessments where obtained_marks BETWEEN 35 AND 39 

--18)Add 5% marks to quizzes (display).

Select * from Student_Assessments

Select course_name, assessment_type, obtained_marks, (obtained_marks * 1.05) AS Extra from Student_Assessments where assessment_type='Quiz'

--19)Average marks per course.

Select course_name, AVG(obtained_marks) AS Average_marks from Student_Assessments GROUP BY course_name

--20)Max & Min per assessment type.

Select assessment_type, Max(obtained_marks) As Maximum_Marks, Min(obtained_marks) AS Minimum_Marks from Student_Assessments GROUP BY assessment_type

--21)Absent count per course.

Select course_name, COUNT(*) AS Absent_Count from Student_Assessments Where  attendance_status='Absent'Group BY course_name

--22)Total assessments per trainer.

SELECT trainer_name, COUNT(*) AS Total_Assessments FROM Student_Assessments GROUP BY trainer_name;

--23)Pass count per course (≥40%)

Select * from Student_Assessments

Select course_name, Count(*) AS Pass_Count from Student_Assessments where obtained_marks * 100.0 / total_marks >= 40 Group by course_name

--24)Trainers with >5 assessments.

SELECT trainer_name FROM Student_Assessments GROUP BY trainer_name HAVING COUNT(*) > 5;

--25)Students with >3 assessments.

Select student_name From Student_Assessments Group By student_name HAVING COUNT(*) > 3;

--26)Courses with avg >65.

Select * from Student_Assessments

Select course_name, AVG(obtained_marks) AS AVG_GRADES
From Student_Assessments
Group by course_name
Having AVG(obtained_marks) > 65

--27)Assessment types with >20% absentees.

SELECT assessment_type
FROM Student_Assessments
GROUP BY assessment_type
HAVING SUM(CASE WHEN attendance_status = 'Absent' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) > 20;


--28)Students above overall average.

SELECT *
FROM Student_Assessments
WHERE obtained_marks > (SELECT AVG(obtained_marks) FROM Student_Assessments);

--29) Top scorer per course.

    Select *
    From Student_Assessments
    where  obtained_marks = (SELECT MAX(obtained_marks) FROM Student_Assessments WHERE course_name = s.course_name);


--30) Below course average.

SELECT *
FROM Marks m
WHERE m.MARKS < (
    SELECT AVG(MARKS)
    FROM Marks
    WHERE COURSE_ID = m.COURSE_ID
);

--31) Never absent students.

SELECT *
FROM Student
WHERE SID NOT IN (
    SELECT SID
    FROM Attendance
    WHERE ABSENT = 1
);

--32) Trainers with avg <50.

SELECT TID
FROM Marks
GROUP BY TID
HAVING AVG(MARKS) < 50;

--33) Update remarks <40.

UPDATE Student
SET REMARKS = 'Fail'
WHERE MARKS < 40;

--34) Delete records older than 2 years.

DELETE FROM Student
WHERE JOIN_DATE < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

--35) Update marks to 0 where absent.

UPDATE Marks
SET MARKS = 0
WHERE SID IN (
    SELECT SID
    FROM Attendance
    WHERE ABSENT = 1
);

