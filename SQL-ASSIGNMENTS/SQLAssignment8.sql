create database ASSIGNMENT8
use ASSIGNMENT8
go

create table emp
(
EID int,
Ename varchar(20),
Eage int,
Esalary money,
Email varchar(30),
MID int foreign key references manager(MID)
)

create table LogTable
(
ID int identity(1,1),
Logs nvarchar(1000)
)

create table manager
(
MID int primary key,
Mname varchar(20)
)

create table Product
(
PID int,
Pname varchar(20),
Price money,
Quantity int
)


insert into manager values
(201, 'Divy')
insert into manager values
(202, 'Venish')
insert into manager values
(203, 'Keshav')
select * from manager


insert into Product values
(301, 'AC', 40000, 2),
(302, 'Mobile', 30000, 1),
(303, 'Laptop', 70000, 3)
select * from Product

--1. Create an AFTER INSERT trigger to log new employees.

--this is used for temporary data validation
/*
create trigger trAfterInsert 
on emp
for insert 
as
begin 
    print 'Data successfully inserted.'
    select * from inserted;
end
*/

--this is used for audit purpose
create trigger trAfterInsert
on emp
for insert 
as
begin 
    declare @ID int 
    select @ID=EID from inserted
    insert into LogTable
    values('New employee with ID=' +cast(@ID as nvarchar(5)) +' is added at '+cast(GETDATE() as nvarchar(20)))
end

--this can be used only for Views, validation
/*
create trigger trAfterInsert2
on emp
instead of insert 
as
begin 
    declare @ID int 
    select @ID=EID from inserted
    insert into LogTable
    values('New employee with ID=' +cast(@ID as nvarchar(5)) +' is added at '+cast(GETDATE() as nvarchar(20)))
end
*/

insert into emp values
(101, 'Miren', 20, 20000, 'mirenpatel@gmail.com', 201)

insert into emp values
(102, 'Smit', 21, 25000, 'smitpatel@gmail.com', 202)

select * from emp
select * from LogTable

--2. Create a trigger to prevent salary < 10000.
create trigger trPreventSalary
on emp
for insert, update 
as
begin
    if exists (select 1 from inserted where Esalary<10000)
    begin
        print 'You are not allowed to enter salary less than 10000'
        rollback transaction;
    end
end

--drop trigger trPreventSalary

insert into emp values 
(103, 'Kirtan', 19, 9999, 'kirtanvaland@gmail.com',203)

--ID in log table continues based on trigger ; if we have error to enter less than salary 10000 that ID is preserved on log table; not it display the data, when we try to enter the new data rocords greater than 10000 then it ID starts after from last reserved ID of trigger;
insert into emp values 
(104, 'Vraj', 18, 10000, 'vrajpatel@gmail.com',203)

/*
delete from emp
where EID=103
*/
/*
delete from LogTable
where ID in (3,4,5)
*/
select * from emp
select * from LogTable

--3. Create AFTER DELETE trigger to log deleted records.
create trigger trDeleteLog
on emp
for delete 
as 
begin
    declare @ID int
    select @ID=EID from deleted
    insert into LogTable 
    values ('Employee with ID='+cast(@ID as nvarchar)+' is deleted at '+ cast(getdate() as nvarchar))
end

delete from emp 
where EID=104

select * from emp
select * from LogTable

--4. How to disable a trigger?
disable trigger trPreventSalary on emp

--5. How to enable a trigger?
enable trigger trPreventSalary on emp

--6. How to drop a trigger?
drop trigger trPreventSalary

--7. Prevent deletion of Manager role.
create trigger trPreventManagerRoleDelete
on manager
for delete 
as 
begin
    if exists (select 1 from emp e
    join deleted d
    on d.MID=e.MID)
    begin
        print 'Manager cannot be deleted because employees are assigned to them.'
        rollback transaction
    end
end

select * from emp
select * from manager

--foreign key conflict error
delete from manager
where MID=201

--dropping constraint 
alter table emp 
drop constraint FK__emp__MID__5EBF139D

--trigger works
delete from manager
where MID=201

--8. Create trigger to prevent duplicate email.
create trigger trPreventDuplicateEmail
on emp
for insert,update 
as
begin
     if exists (select 1 from emp e
     join inserted i
     on i.Email=e.Email
     and i.EID<>e.EID)
     begin
        print 'You are not allowed to add duplicate email.' 
        rollback transaction
     end
end 

select * from emp

--getting trigger error
insert into emp values
(103, 'Vraj', 19, 18000, 'mirenpatel@gmail.com', 203)

--getting trigger error 
update emp
set Email='smitpatel@gmail.com'
where EID=101

--this gives error; while we are trying to update any other records; so we need to add  
update emp
set Eage=22
where EID=101

--altering trigger to add id  
alter trigger trPreventDuplicateEmail
on emp
for insert,update 
as
begin
     if exists (select 1 from emp e
     join inserted i
     on i.Email=e.Email
     and i.EID<>e.EID)
     begin
        print 'You are not allowed to add duplicate email.' 
        rollback transaction
     end
end 

--9. How to check existing triggers on a table?
select * from sys.triggers
select name,OBJECT_NAME(parent_id) from sys.triggers

--10.Create a trigger to prevent UPDATE of primary key.

alter table emp
alter column EID int not null

alter table emp
add constraint pk_emp primary key (EID)

create trigger trPreventUpdatePrimary
on emp
for update
as
begin
    if update(EId)
    begin
       print 'You are not allowed to update primary key column.'
       rollback transaction
    end
end

--getting error because of trigger;
update emp
set EID=103
where EID=101

--11.Create a trigger to prevent table drop.
create trigger trPreventDropTable
on database
for drop_table
as 
begin
    print 'You are not allowed to drop any table.'
    rollback transaction
end

--getting error due to drop trigger
drop table emp

--12.Create a trigger to log when an employee record is deleted.
--same as 3.

--13.Create a trigger to prevent negative stock quantity.
create trigger trPreventNegativeStock
on Product
for insert, update 
as
begin
   if exists (select 1 from inserted where quantity<0)
   begin
       print 'You are not allowed to enter or update quantity<0.'
       rollback transaction
   end
end 

--getting error due to trigger
insert into Product values 
(304, 'Refridgerator', 45000, -1)

--getting error due to trigger
update Product
set Quantity=-1
where PID=301

--14.Create a trigger to ensure the Salary is non negative.
create trigger trPreventNegativeSalary
on emp
for insert, update 
as 
begin
   if exists (select 1 from inserted where Esalary<0)
   begin
        print 'You are not allowed to enter negative employee salary.'
        rollback transaction
   end
end 

select * from emp

--getting error due to trigger
insert into emp values
(103, 'Dhaval', 26, -10000, 'dhavalpatel@gmail.com', 203)

--getting error due to trigger
update emp
set Esalary=-20000
where EID=101



--15.Disable all triggers on a table.
disable trigger all on emp

