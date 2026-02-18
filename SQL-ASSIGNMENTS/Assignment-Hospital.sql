Create Database Hospital_DB
Use Hospital_DB

CREATE TABLE PATIENTS
(PatientID Int,
Aadhaar varchar(12),
Gender varchar(20),
DOB Date)

Create Table Doctor
(DoctorID Int,
Email varchar(30),
DepartmentID Int,
Experience Int)

Create TABLE Departments
(DepartmentID Int,
DepartmentName Varchar(20))

Create table Rooms
(RoomID Int,
RoomType Varchar(20),
ChargesPerDay Money)

Create table Appointments
(AppointmentID Int,
PatientID Int,
DoctorID Int,
AppointmentDate Date)

Create Table Admissions
(AdmissionID Int,
PatientID Int,
RoomID Int,
AdmitDate Date,
DischargeDate Date)

Create Table Treatments
(TreatmentID Int,
AdmissionID Int,
TreatmentCost Money)

Create Table Bills
(BillID Int,
AdmissionID Int,
TotalAmount Money)

Create Table Payments
(PaymentID Int,
BillID Int,
PaymentMode Varchar(20),
PaidAmount Money)

--Patients Table
Select * from PATIENTS

Alter table PATIENTS
ALTER column PatientID int NOT NULL

Alter table PATIENTS
Add Constraint pk_patients Primary Key (PatientID)

Alter table PATIENTS
Add Constraint uq_patients UNIQUE (Aadhaar)

Alter table PATIENTS
Add Constraint ck_patients Check (Gender IN ('Male', 'Female'))

Alter table PATIENTS
alter column DOB Date NOT NULL


--Doctor Table
Select * from Doctor

Alter table Doctor
Alter column DoctorID Int NOT NULL

Alter table Doctor
Add Constraint pk_doctor Primary Key (DoctorID)

Alter table Doctor 
Add Constraint uc_doctor UNIQUE (Email)

Alter table Doctor
Add Constraint fk_doctor Foreign Key (DepartmentID) references Departments (DepartmentID)  
--will execute after nxt table creation

Alter table Doctor
Add Constraint ck_doctor CHECK (Experience > 0)


--Department Table
Select * from Departments

Alter table Departments 
Alter column DepartmentID INT NOT NULL

Alter table Departments
Add Constraint pk_departments Primary Key (DepartmentID)

Alter table Departments
Add Constraint uk_departments UNIQUE (DepartmentName)


--Rooms Table
Select * from Rooms

Alter table Rooms
Alter column RoomID INT NOT NULl

Alter table Rooms
Add Constraint pk_rooms Primary Key (RoomID) 

Alter table Rooms
Add Constraint ck_rooms Check (RoomType IN ('General', 'ICU', 'Private'))

Alter table Rooms
Add Constraint ck_rooms1 Check (ChargesPerDay > 0)


--Appointments Table
Select * from Appointments

Alter table Appointments
alter column AppointmentID INT NOT NULL

Alter table Appointments
Add Constraint pk_appointment Primary Key (AppointmentID)

Alter table Appointments
Add Constraint fk_appointment Foreign Key (PatientID) references PATIENTS(Patientid)

Alter table Appointments
Add Constraint fk_appointment1 Foreign Key (DoctorID) references Doctor(DoctorID)

Alter table Appointments
Add Constraint df_appointment Default GetDate() for AppointmentDate


--Admissions Table
Select * from Admissions

Alter table Admissions
Alter column AdmissionID Int Not NULL

Alter table Admissions 
Add Constraint pk_admission Primary Key (AdmissionID)

Alter table Admissions
Add Constraint fk_admission Foreign Key (PatientID) references PATIENTS(PatientId)

Alter table Admissions
Add Constraint fk_admission1 Foreign Key (RoomID) references Rooms(RoomID)

Alter table Admissions
Add Constraint df_admission Default GETDATE() FOR AdmitDate

Alter table Admissions
Alter Column DischargeDate Date NULL


--Treatments Table
Select * from Treatments

Alter table Treatments
alter column TreatmentID Int NOT NULL

Alter table Treatments
Add Constraint pk_treatments Primary Key (TreatmentID)

Alter table Treatments
Add Constraint fk_treatment Foreign Key (AdmissionID) references Admissions(AdmissionID)

Alter table Treatments
Add Constraint ck_treatment Check (TreatmentCost > 0)


--Bills table
Select * from Bills

Alter table Bills
Alter column BillID Int NOT NULL

Alter table Bills
Add Constraint pk_bills Primary Key (BillID)

Alter table Bills
Add Constraint fk_bills Foreign Key (AdmissionID) references Admissions(AdmissionID)

Alter table Bills
Add Constraint ck_bills Check (TotalAmount > 0)


--Payments Table
Select * from Payments

Alter table Payments
Alter Column PaymentID Int NOT NULL

Alter table Payments
Add Constraint pk_payments Primary Key (PaymentID)

Alter table Payments
Add Constraint fk_payments Foreign Key (BillID) references Bills(BillID)

Alter table Payments
Add Constraint ck_payment Check (PaymentMode IN('Cash', 'Card', 'UPI'))

Alter table Payments
Add Constraint ck_payment1 Check (PaidAmount > 0)


--Insert Data --DML

INSERT INTO Departments VALUES
(1,'Cardiology'),
(2,'Orthopedics'),
(3,'Neurology'),
(4,'Pediatrics'),
(5,'General');

Select * from Departments

INSERT INTO Doctor VALUES
(1,'sharma@hospital.com',1,15),
(2,'mehta@hospital.com',2,12),
(3,'rao@hospital.com',3,10),
(4,'gupta@hospital.com',4,8),
(5,'khan@hospital.com',5,9),
(6,'iyer@hospital.com',1,20),
(7,'verma@hospital.com',2,11),
(8,'singh@hospital.com',3,14);

Select * from Doctor

INSERT INTO PATIENTS VALUES
(1,'111122223333','Male','1985-04-12'),
(2,'111122223334','Female','1992-07-21'),
(3,'111122223335','Male','1998-02-10'),
(4,'111122223336','Female','1980-11-05'),
(5,'111122223337','Male','1975-06-18'),
(6,'111122223338','Female','2000-09-09'),
(7,'111122223339','Male','1989-01-14'),
(8,'111122223340','Male','1970-03-30'),
(9,'111122223341','Female','1983-12-25'),
(10,'111122223342','Male','1999-08-19'),
(11,'111122223343','Male','1981-10-10'),
(12,'111122223344','Female','1993-05-15'),
(13,'111122223345','Male','1987-06-06'),
(14,'111122223346','Female','1995-02-22'),
(15,'111122223347','Male','1978-09-01'),
(16,'111122223348','Female','1986-11-11'),
(17,'111122223349','Male','1972-07-07'),
(18,'111122223350','Female','1984-04-04'),
(19,'111122223351','Male','2001-01-01'),
(20,'111122223352','Female','1990-03-03');

Select * from PATIENTS

INSERT INTO Rooms VALUES
(1,'General',1500),
(2,'General',1500),
(3,'General',1500),
(4,'Private',3500),
(5,'Private',3500),
(6,'Private',3500),
(7,'ICU',7000),
(8,'ICU',7000),
(9,'ICU',7000),
(10,'General',1500),
(11,'Private',3500),
(12,'ICU',7000),
(13,'General',1500),
(14,'Private',3500),
(15,'ICU',7000);

Select * from Rooms

INSERT INTO Appointments (AppointmentID,PatientID,DoctorID) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,1),(10,10,2),
(11,11,3),(12,12,4),(13,13,5),(14,14,6),(15,15,7),
(16,16,8),(17,17,1),(18,18,2),(19,19,3),(20,20,4),
(21,1,5),(22,2,6),(23,3,7),(24,4,8),(25,5,1),
(26,6,2),(27,7,3),(28,8,4),(29,9,5),(30,10,6);

Select * from Appointments

INSERT INTO Admissions (AdmissionID,PatientID,RoomID,DischargeDate) VALUES
(1,1,4,'2026-02-05'),
(2,2,1,'2026-02-04'),
(3,3,7,'2026-02-06'),
(4,4,5,'2026-02-06'),
(5,5,8,'2026-02-10'),
(6,6,2,'2026-02-08'),
(7,7,3,'2026-02-09'),
(8,8,6,'2026-02-12'),
(9,9,10,'2026-02-11'),
(10,10,11,'2026-02-13'),
(11,11,12,'2026-02-14'),
(12,12,13,'2026-02-15'),
(13,13,14,'2026-02-16'),
(14,14,15,'2026-02-18'),
(15,15,4,'2026-02-19');

Select * from Admissions

INSERT INTO Treatments VALUES
(1,1,2500),(2,1,1200),(3,2,800),(4,2,1500),(5,3,5000),
(6,3,1200),(7,4,700),(8,4,600),(9,5,3000),(10,5,2000),
(11,6,500),(12,6,1200),(13,7,1800),(14,7,2200),(15,8,4500),
(16,8,1500),(17,9,800),(18,9,1200),(19,10,3000),(20,10,2000),
(21,11,2500),(22,12,900),(23,13,3500),(24,14,5000),(25,15,2800);

Select * from Treatments

INSERT INTO Bills VALUES
(1,1,12000),(2,2,6000),(3,3,18000),(4,4,5500),(5,5,25000),
(6,6,4500),(7,7,5200),(8,8,20000),(9,9,7000),(10,10,15000),
(11,11,22000),(12,12,9000),(13,13,11000),(14,14,17000),(15,15,13000);

Select * from Bills

INSERT INTO Payments VALUES
(1,1,'Cash',12000),
(2,2,'UPI',6000),
(3,3,'Card',10000),
(4,3,'UPI',8000),
(5,4,'Cash',5500),
(6,5,'Card',15000),
(7,5,'UPI',10000),
(8,6,'Cash',4500),
(9,7,'UPI',5200),
(10,8,'Card',20000),
(11,9,'Cash',7000),
(12,10,'UPI',15000),
(13,11,'Card',22000),
(14,12,'Cash',9000),
(15,13,'UPI',11000),
(16,14,'Card',17000),
(17,15,'Cash',13000),
(18,1,'Cash',500),
(19,2,'UPI',300),
(20,4,'Card',1000);

Select * from Payments


--Section 4 — Basic Queries (DQL)

--1. Display all patients.

Select * from PATIENTS

--2. Show patients born after the year 2000.

Select * from PATIENTS Where DOB > '2000-01-01'

--3. Display all ICU rooms.

Select * from Rooms Where RoomType = 'ICU'

--4. Show doctors with more than 5 years of experience.

Select * from Doctor WHERE Experience > 5

--5. Count total number of patients.

Select Count(PatientID) AS Total_Patients from PATIENTS


--Section 5 — Group By / Having
--1. Department-wise doctor count.

Select DepartmentID, COUNT(DoctorID) AS Total_Doctors from Doctor Group By DepartmentID

--2. Room type-wise admission count.
--join
select * from Rooms
select * from Admissions
select RoomID from Admissions

select RoomType,count(*) as Admission_Count from Rooms
where RoomID in (select RoomID from Admissions)
group by RoomType

--3. Patient-wise total bill amount greater than 50,000.
--join
select * from Patients
select * from Payments
select * from Bills

--4. Doctor-wise appointment count.
select DoctorID, count(*) as Appointment_Count from Appointments
group by DoctorID


--Section 6 — Subqueries
--1. Find the patient with the highest bill amount.


--2. Find the doctor who handled the maximum patients.



--3. Find patients who were never admitted.
select * from Patients
where PatientID not in
(select PatientID from Admissions)

--4. Find rooms that were never used.
select * from Rooms
where RoomID not in 
(select RoomID from Admissions)


--Section 7 — Update / Delete
--1. Increase all room charges by 10%.
update Rooms
set ChargesPerDay=ChargesPerDay*1.10

--2. Change a doctor’s department.
update Doctors
set DepartmentID=3
where DoctorID=104

--3. Delete a patient safely (handle foreign key issues).
select * from Patients

--4. Update discharge date for admitted patients.
update Admissions
set DischargeDate='2025-02-05'
where AdmissionID=12



--Section 8 — Alter Table
--1. Add a column BloodGroup in Patients.
alter table Patients
add BloodGroup varchar(10)

--2. Add a column Qualification in Doctors.
alter table Doctors
add Qualification varchar(50)

--3. Modify datatype of a column.
alter table Doctors
alter column Qualification varchar(100)

--4. Drop a column from any table.
alter table Doctors
drop column Qualification

