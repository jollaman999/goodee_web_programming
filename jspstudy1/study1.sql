-- study1.sql
create table member (
	id varchar(20) primary key,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(15),
	email varchar(50),
	picture varchar(200)
)

create table board (
	num int primary key,
	name varchar(30),
	pass varchar(20),
	subject varchar(100),
	content varchar(4000),
	file1 varchar(100),
	regdate datetime,
	readcnt int(10),
	ref int,
	reflevel int(3),
	refstop int(5)
)