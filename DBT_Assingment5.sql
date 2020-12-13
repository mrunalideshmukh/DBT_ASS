create database Assingment5;
use Assingment5;
Create table EMP ( EMPNO numeric(4) not null,
 ENAME varchar(30) not null,
 JOB varchar(10),
 MGR numeric(4),
 HIREDATE date,
 SAL numeric(7,2),
 DEPTNO numeric(2) ); 
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30);
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL,DEPTNO ) values(1006,  'Pooja',  'MANAGER'  , 10007, '2000-02-18' ,6000, 10 );
 select * from emp;
 Create table dept (dno numeric(4) not null, dname varchar(10) not null,area varchar(30));
 Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');
select * from dept;
delimiter ##
create procedure ques1(in val1 int,in val2 int)
begin
select val1+val2;
select val1-val2;
select val1*val2;
select val1/val2;
end ##

call ques1(10,20);
----2
delimiter ##
create procedure md_2(inout stm varchar(10))
begin
set stm=(select reverse(stm));
end ##
set @str='DATABASE';
call md_2(@stm);
select @stm as REV
--3
delimiter $$
create procedure que3()
begin
select EMPNO,ENAME ,SAL from EMP order by SAL DESC limit 5;
end $$
call  que3;
---4
delimiter $$
create procedure que4()
begin
create table emp_test (e_id int, e_name varchar(10),e_joining_date date );
end $$
call que4;
---5
delimiter $$
create procedure que5(in x int,in y varchar(10),in z varchar(10))
begin
insert into DEPT values(x,y,z);
end $$
set @y ='Education';
set @z = 'Pune';
call que5(60,@y,@z);
select * from DEPT;
---6
delimiter $$
create procedure que6(inout num int,out sqr int,out cube int)
begin
declare num1 int;
set num1=num;
select num,power(num,2),power(num,3) into num,sqr,cube;
end $$
set @num=2;
call que6(@num,@sqr,@cube);
select @num,@sqr,@cube;
---7
delimiter $$
create procedure que7(out ans int)
begin
declare num int;
set num = 2;
select num into ans;
end $$
call que7(@ans);
select @ans;
---8
delimiter $$
create procedure que8(IN X INT,OUT STR VARCHAR(50))
begin
select concat(E.ENAME,' IS FROM ',D.DNAME) into str FROM EMP E INNER JOIN DEPT D ON D.DNO=E.DEPTNO WHERE E.DEPTNO=X AND E.EMPNO=1004;
end $$
CALL que8(10,@STR);
SELECT @STR;
select * from EMP;
drop procedure que8;


 