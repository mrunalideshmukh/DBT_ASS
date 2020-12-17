create database assignment4;
use assignment4;
create table Department (dept_id int primary key ,
dept_name varchar(50));
create table Employee(empid int,
	emp_name varchar(25),
	dept_id int,
    salary float,	 
    manager char(30),
    constraint dept_id_fk foreign key (dept_id) references department (dept_id)
);
insert into Department values(1,"Finance");
insert into Department values(2,"Training");
insert into Department values(3,"Marketing");
select * from Department;
insert into Employee values(1,"Arun",1,8000,4);
insert into Employee values(2,"kiran",1,7000,1);
insert into Employee values(3,"Scott",1,3000,1);
insert into Employee values(4,"Max",2,9000,null);
insert into Employee values(5,"Jack",2,8000,4);
insert into Employee values(6,"King",null,6000,1);
select * from Employee;

-- joins
select D.dept_name,E.emp_name from  Department D join Employee E on D.dept_id=E.dept_id;
select D.dept_name,D.dept_id,E.emp_name from  Department D left join Employee E on D.dept_id=E.dept_id;
select D.dept_name,E.emp_name from  Department D right join Employee E on D.dept_id=E.dept_id;
select * from Department;
select * from Employee;
select * from  Department D join  Employee E on  D.dept_id=E.dept_id;
select D.dept_id,sum(E.salary) as sum from Department D join Employee E on D.dept_id=E.dept_id group by D.dept_id;
select D.dept_name,E.emp_name from Employee E right outer join Department D  on D.dept_id=E.dept_id;
select * from Department;
select * from Employee;
select D.dept_name,E.emp_name from Department D right outer join Employee E on D.dept_id=E.dept_id;
select D.dept_name,E.emp_name from Employee E left outer join Department D  on D.dept_id=E.dept_id;

-- union 
create table Emp1(emp_no int , emp_name varchar(25))
insert into Emp1 values(1,'A');
insert into Emp1 values(2,'B');
insert into Emp1 values(3,'c');
create  table Emp2(emp_no int,emp_name varchar(25))
insert into Emp2 values (1,'A');
insert into Emp2 values (2,'B');
insert into  Emp2 values (4,'D');
insert into Emp2 values (5,'E');
select * from emp1;
select * from emp2;
select emp_no from emp1 union select emp_no from emp2;
select emp_name from emp1 union select emp_name from emp2;

-- subquery

-- 1

select * from Employee where salary = (select salary from Employee where emp_name= 'Arun') and emp_name not  like 'Arun';

-- 2

select * from Employee where dept_id = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_NAME='jack');

-- 3 select name of employee havin lowest salary.

select * from Employee where salary =(SELECT SALARY FROM EMPLOYEE ORDER BY SALARY LIMIT 1 );

-- update salary =15000 of employees belonging to same dept as 'Max'

UPDATE  EMPLOYEE SET SALARY=15000  WHERE DEPT_ID = (select dept_id from(SELECT DEPT_ID FROM employee  WHERE EMP_NAME='Max') as a) and EMP_NAME!='Max';


