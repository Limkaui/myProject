//여행지 추천글 목록 테이블
create table trv_board(
trv_num number not null primary key,
mem_num number not null,
trv_local varchar2(20) not null,
trv_cate number(1) not null,
trv_title varchar2(150) not null,
trv_intro clob not null,
trv_date Date not null,
trv_place varchar2(150) not null,
trv_call varchar2(15) not null,
CONSTRAINT FK_mem_num FOREIGN KEY(mem_num) REFERENCES member(mem_num)
);
//여행지 추천글 시퀀스
CREATE SEQUENCE trvboard_seq;

//여행지 이미지 목록저장소 테이블
create table trv_image(
tri_num number not null primary key,
trv_num number not null,
tri_uploadfile blob,
CONSTRAINT FK_trv_num FOREIGN KEY(trv_num) REFERENCES member(trv_image)
);

//리뷰(댓글) 게시판
create table trv_star(
trs_num table not null primary key,
trv_num number not null,
mem_num number not null,
trs_date date not null,
CONSTRAINT FK_mem_num FOREIGN KEY(mem_num) REFERENCES member(mem_num)
);