-- 2021년 11월

DROP TABLE bookmark;

CREATE TABLE bookmark
(
	contentId   varchar2(50) primary key,
	title  		varchar2(300) not null,
	addr 		varchar2(300) not null,
	userid		varchar2(50) not null,
	typeOf		varchar2(5) not null
);