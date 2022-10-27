create table member_2(
id varchar2(15),
password varchar2(10),
name varchar2(15),
age number,
addr varchar2(40),
tel varchar2(20),
gender varchar2(5),
hobby varchar2(50),
email varchar2(30),
primary key(id)
)

select * from member_2;

drop table member_2 purge;

alter table member_2 add tel varchar2(20);






