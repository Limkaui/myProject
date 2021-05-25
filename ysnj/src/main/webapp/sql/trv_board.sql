/*여행지 추천글 목록 테이블*/
create table trv_board(
trv_num number not null primary key,
mem_num number not null,
trv_local varchar2(20) not null,
trv_cate number(1) not null,
trv_title varchar2(150) not null,
trv_intro clob not null,
trv_date date default sysdate not null,
trv_place varchar2(150) not null,
trv_call varchar2(15) not null,
trv_uploadfile1 blob,
trv_filename1 varchar2(300),
trv_uploadfile2 blob,
trv_filename2 varchar2(300),
trv_uploadfile3 blob,
trv_filename3 varchar2(300),
trv_uploadfile4 blob,
trv_filename4 varchar2(300),
trv_uploadfile5 blob,
trv_filename5 varchar2(300),
CONSTRAINT FK_board_memnum FOREIGN KEY(mem_num) REFERENCES member(mem_num)
);
/*여행지 추천글 시퀀스*/
CREATE SEQUENCE trvboard_seq;

/*리뷰(댓글) 게시판*/
create table trv_star(
trs_num number not null primary key,
trv_num number not null,
mem_num number not null,
trs_date date not null,
CONSTRAINT FK_star_memnum FOREIGN KEY(mem_num) REFERENCES member(mem_num)
);