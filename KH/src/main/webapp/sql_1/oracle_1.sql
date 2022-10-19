--select * from emp;
--select * from dept;
--
--create table student(
--   id      varchar2(20)   NOT NULL ,
--   passwd   varchar2(20)   NOT NULL ,
--   name   varchar2(20)   NOT NULL ,
--   year   number         NULL,
--   snum   varchar2(10)   NULL,
--   depart   varchar2(40)   NULL,
--   mobile1   char(3)         NULL,
--   mobile2   varchar2(10)   NULL,
--   address   varchar2(65)   NULL,
--   email   varchar2(30)   NULL,
--   PRIMARY KEY(id)
--);
--
--select * from student;
--
--
--
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('javajsp', 'java8394', '김정수', 2010, '1077818', '컴퓨터공학과', '011', '7649-9875', '서울시', 'java2@gmail.com');
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('gonji', 'young', '공지영', 2009, '2065787', '컴퓨터공학과', '016', '2975-9854', '인천시', 'gong@hotmail.com');
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('water', 'javayoung', '조수영', 2010, '1176432', '인터넷비즈니스과', '011', '5531-6677', '서울시', 'singer@gmail.com');
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('novel', 'elephant', '조경란', 2011, '2056485', '기술경영과', '016', '3487-9919', '부산시', 'novel@hanmail.com');
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('korea', '9943inner', '안익태', 2010, '1987372', '컴퓨터공학과', '017', '2670-4593', '천안시', 'wing@gmail.com');
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('korea22', '9943inner', '홍길동', 2010, '1987372', '컴퓨터공학과', '017', '2670-4593', '천안시', 'wing@gmail.com');
--
--
--insert into student (id, passwd, name, year, snum, depart, mobile1, mobile2, address, email) 
--values ('mlolw2', 'mlolw2', '전민우', 1998, '1987372', '산업경영공학과', '017', '2670-4593', '용인시', 'wing@gmail.com');
--
--
--
--select * from STUDENT;



create table board_3(
id number(20) not null,
name varchar2(20) not null,
passwd varchar2(20) not null,
title varchar2(100) null,
address varchar2(100) null,
email varchar2(30) null,
regdate date null,
content varchar2(3000) null,
primary key(id))


create sequence board_1_seq
start with 1
increment by 1
maxvalue 10000
nocache

select * from board_1




create table student_1(
	num number(5),
	name VARCHAR2(20),
	primary key(num))
	
	
select * from student_1


insert into student_1 values(1,'라일락');
insert into student_1 values(2,'수선화');
insert into student_1 values(3,'장미');
insert into student_1 values(4,'들국화');
insert into student_1 values(5,'코스모스');
insert into student_1 values(6,'달맞이꽃');
insert into student_1 values(7,'국화');
insert into student_1 values(8,'해당화');
insert into student_1 values(9,'백합');
insert into student_1 values(10,'개나리');






