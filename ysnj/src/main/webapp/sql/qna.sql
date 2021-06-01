create table qna(
  qna_num number not null primary key,
  mem_qnum number,
  mem_anum number,
  qna_title varchar2(400),
  qna_cate number not null,
  qna_question varchar2(4000),
  qna_answer varchar2(4000),
  qna_reply number,
  qna_status number,
  qna_qdate date default sysdate not null,
  qna_adate date not null,
  constraint qna_fk1 foreign key (mem_qnum) references member (mem_num),
  constraint qna_fk2 foreign key (mem_anum) references member (mem_num)
);

create sequence qna_seq;