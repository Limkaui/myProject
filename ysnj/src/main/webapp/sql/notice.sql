create table notice (
  mem_num number not null,
  
  not_num number not null,
  not_type number(1) not null,
  not_title varchar2(80) not null,
  not_uploadfile blob,
  not_filename varchar2(300),
  not_content clob not null,
  not_date date default sysdate not null,
  constraint notice_pk primary key (not_num),
  constraint notice_fk foreign key(mem_num) references member (mem_num)
  
);

create sequence notice_seq;