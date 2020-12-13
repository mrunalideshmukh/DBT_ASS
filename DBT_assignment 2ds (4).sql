create database Assignment2;
use Assignment;
 CREATE TABLE PUBLISHERS
(
    PUBID     int(3)   PRIMARY KEY,
    PNAME     int(30),
    EMAIL     int(50)  UNIQUE,
    PHONE      int(30)
);
alter table Publishers modify phone bigint;
alter table publishers modify pname varchar(30);
alter table publishers modify email varchar(30);
CREATE TABLE  SUBJECTS
(
    SUBID      VARCHAR(5) PRIMARY KEY,
    SNAME      VARCHAR(30)
);
CREATE TABLE  AUTHORS
(
    AUID     int(5)  PRIMARY KEY,
    ANAME      VARCHAR(30),
    EMAIL      VARCHAR(50)  UNIQUE,
    PHONE      VARCHAR(30)
);
CREATE TABLE  TITLES
(
    TITLEID    int(5) PRIMARY KEY,
    TITLE      VARCHAR(30),
    PUBID      int(3),
    SUBID      VARCHAR(5),
    PUBDATE    DATE,
    COVER      CHAR(1)  CHECK ( COVER IN ('P','H','p','h')),
    PRICE      int(4),
	CONSTRAINT TITLES_PUBID_FK FOREIGN KEY (PUBID) REFERENCES PUBLISHERS(PUBID),
	CONSTRAINT TITLES_SUBID_FK FOREIGN KEY (SUBID) REFERENCES SUBJECTS(SUBID)
);

CREATE TABLE  TITLEAUTHORS
(
    TITLEID    int(5) ,
    AUID      int(5) ,
    IMPORTANCE int(2),
   PRIMARY KEY(TITLEID,AUID),
   CONSTRAINT  TITLESAUTHORS_TITLEID_FK FOREIGN KEY (TITLEID) REFERENCES TITLES(TITLEID),
   CONSTRAINT  TITLESAUTHORS_AUTHID_FK FOREIGN KEY (AUID) REFERENCES AUTHORS(AUID)
);
CREATE TABLE  SUBJECTS_BACKUP
(
    SUBID      VARCHAR(5) PRIMARY KEY,
    SNAME      VARCHAR(30)
);

INSERT INTO SUBJECTS VALUES ('ORA','ORACLE DATABASE 10g');
INSERT INTO SUBJECTS VALUES ('JAVA','JAVA LANGUAGE');
INSERT INTO SUBJECTS VALUES ('JEE','JAVA ENTEPRISE EDITION');
INSERT INTO SUBJECTS VALUES ('VB','VISUAL BASIC.NET');
INSERT INTO SUBJECTS VALUES ('ASP','ASP.NET');

INSERT INTO PUBLISHERS VALUES (1,'WILLEY','WDT@VSNL.NET','911123260877');
 INSERT INTO PUBLISHERS VALUES (2,'WROX','INFO@WROX.COM',NULL);
INSERT INTO PUBLISHERS VALUES (3,'TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','911133333322');
 INSERT INTO PUBLISHERS VALUES (4,'TECHMEDIA','BOOKS@TECHMEDIA.COM','911133257660');
 
 
 INSERT INTO AUTHORS VALUES (101, 'HERBERT SCHILD','HERBERT@YAHOO.COM',NULL);
INSERT INTO AUTHORS VALUES (102, 'JAMES GOODWILL','GOODWILL@HOTMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (103, 'DAVAID HUNTER','HUNTER@HOTMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (104, 'STEPHEN WALTHER','WALTHER@GMAIL.COM',NULL);
INSERT INTO AUTHORS VALUES (105, 'KEVIN LONEY','LONEY@ORACLE.COM',NULL);
INSERT INTO AUTHORS VALUES (106, 'ED. ROMANS','ROMANS@THESERVERSIDE.COM',NULL);

INSERT INTO TITLES VALUES (1001,'ASP.NET UNLEASHED',4,'ASP','2002-02-12','P',540);
INSERT INTO TITLES VALUES (1002,'ORACLE10G COMP. REF.',3,'ORA','2005-05-01','P',575);
INSERT INTO TITLES VALUES (1003,'MASTERING EJB',1,'JEE','2005-02-03','P',475);
INSERT INTO TITLES VALUES (1004,'JAVA COMP. REF',3,'JAVA','2005-04-03','P',499);
INSERT INTO TITLES VALUES (1005,'PRO. VB.NET',2,'VB','2005-06-15','P',450);

 INSERT INTO TITLEAUTHORS VALUES (1001,104,1);
 INSERT INTO TITLEAUTHORS VALUES (1002,105,1);
INSERT INTO TITLEAUTHORS VALUES (1003,106,1);
INSERT INTO TITLEAUTHORS VALUES (1004,101,1);
INSERT INTO TITLEAUTHORS VALUES (1005,103,1);
INSERT INTO TITLEAUTHORS VALUES (1005,102,2);

select pname,phone email from Publishers;
select aname,phone from Authors;
select titleid, title, pubdate from Titles;
select auid, titleid, importance from titleauthors;


select sname from subjects where sname like 'oracle%';
select subid from subjects where subid like 'j%';
select subid from subjects where subid like '%.net%';
select aname from authors where aname like '%er';
select aname from authors where aname like '%er';
select pname from publishers where pname like '%hill ';

select price from titles where price<500;
select pubdate from titles where pubdate<'2005-05-01';
select sname from subjects subject where subid= 'java' or 'jee';
select auid from authors where auid>103;
select *from titles where titleid =101 or price>400;

create table Employee1(emp_id int ,emp_name char(50));

insert into employee1 values(102 , "Monika"); 
insert into employee1 values(103 , "Shital");
insert into employee1 values(104 , "pallavi"); 
insert into employee1 values(105 , "amit"); 
insert into employee1 values(106, "Rashmi"); 

alter table Employee1 add column dept_id varchar(3);  
alter table employee1 modify column emp_name varchar(12);
update employee1 set emp_name = "Scott" where emp_id=106;
truncate table employee1;

create table emp(SAL float(7,3));
insert into emp values(1234.567);
insert into emp values(1530.019);
insert into emp values(1652.786);
insert into emp values(1775.156);
desc emp;
select * from emp;


select round(1234.567);
select round(1775.156,2);
select round(1775.156,1);
select round(1775.156,0);

select truncate(1.22 , 0);
select truncate(23.44 , 1);
select truncate(234.34*100 , 1);
select truncate(45.676 , -2);

select ceil(8.1);
select ceil(1775.156);

select floor(1775.156);
select floor(8.1);

select sign(-1775.156);
select sign(1775.156);
select sign(0);

select mod(23,2);
select mod(12,2);

select sqrt(4);
select sqrt(3);

select power(2,2);
select power(12,3);
select power(2,3);

select char_length("CDAC  juhu");
select concat("CDAC","JUHU");
select concat('CDA','C','  ',"juhu");
select concat_ws(" - ", 'CDAC','juhu');
select find_in_set('a' , "f,g,k,a,b");
select find_in_set('a' , "fgkab");
select find_in_set('ju',"cdac,ju,juhu");
select find_in_set('ju',"cdac ,ju,juhu");
select find_in_set('ju',"cdac,ju,juhu");
select locate("u", "cadc juhu");
select locate("uhu", "cadc juhu");
select lower("CADC JUHU");
select lower("Cadc JUHU");
select repeat("CDAC-" , 3);
select repeat("CDAC - " , 3);
select replace("CDAC juhu",'u','kh');
select reverse("CDAC juhu");
select space(3);
select strcmp("CADC","CADC");
select strcmp("CDAC","juhu");
select strcmp("juhu" , "CDAC");
select substring("CADC mumbai",4);
select substring("CADC mumbai", 6 , 3);

select upper("cdac");
select unhex("cdac");
select UNHEX("cdac");
select UNHEX('WWW');
select hex('www');
select ucase('www');
select format(5273.2474,2);
select position("ac" in "cdacmumbai");
select make_Set(1|4,"c","d","a","c","m");
select make_Set(1|4|2,"c","d","a","c","m");
select elt(1,"c","d","a","c");
select elt(1,"cdac");
select elt(0,"c","d","a","c");
select elt(5,"c","d","a","c");
select left("cdacmumbai",4);
select right("cdacmumbai",4);
select length("cdac");
select mid("cdacmumbai",2,3);
SELECT ASCII('CDAC juhu');
SELECT BIN('CDAC');


select sysdate();
select current_date();
select current_date()+1;
SELECT CURDATE()+0;
select CURRENT_TIME();
select current_time()+0;
select monthname("1998-08-16");
select dayname("1996-11-06");
select dayofweek("1998-08-16");
SELECT LAST_DAY('1998-08-16');
select makedate(2021,130);
 SELECT HOUR('11:05:03');
 select now();
 SELECT DATE_ADD('1998-07-16', INTERVAL 31 DAY);




     


