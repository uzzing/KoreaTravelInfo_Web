
create table administrator(
    adminid varchar2(20) primary key
    ,adminpwd varchar2(20) not null
);

create table user_info(
    userid varchar2(20) primary key
    ,userpwd varchar2(20) not null
);

create table ask(
    ASK_SEQ	number primary key
    ,ASK_TITLE VARCHAR2(100) not null
    ,USERID VARCHAR2(20) REFERENCES user_info(userid) on delete cascade
    ,ASK_TEXT VARCHAR2(800) not null
    ,ASK_DATE date DEFAULT sysdate
);

create table Comment_ask(
    comment_seq number primary key
    ,adminID varchar2(20) REFERENCES Administrator(adminID) on delete cascade
    ,comment_text varchar2(300) not null
    ,comment_date date DEFAULT sysdate   
    ,ask_seq number REFERENCES ask(ask_seq) on delete cascade
);

create sequence comment_seq;
create sequence ask_seq;