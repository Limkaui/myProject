/*리뷰 게시판*/
create table review(
	rev_num number not null,
	mem_num number not null,
	mem_id varchar2(12) not null,
	acc_num number not null,
	rev_title varchar2(20) not null,
	rev_content varchar2(2000),
	rev_date date default sysdate,
	rev_hits number default 0,
	rev_uploadfile blob,
    rev_filename varchar2(100),
    rev_star number(1),
	constraint review_pk primary key (rev_num),
	constraint review_fk1 foreign key (mem_num) references member (mem_num),
	constraint review_fk2 foreign key (acc_num) references accommdation (acc_num)
);

/*리뷰 별점 관리*/
create table review_star(
	rst_num number not null,
	acc_num number not null,
	rst_count number,
	mem_num number,
	rst_date date default sysdate not null,
	constraint review_star_pk primary key (rst_num),
	constraint review_star_fk1 foreign key (acc_num) references accommdation (acc_num),
	constraint review_star_fk2 foreign key (mem_num) references member (mem_num)
);

create table review_reply(
 re_num number not null,
 re_content varchar2(900) not null,
 re_date date default sysdate not null,
 re_mdate date default sysdate not null,
 re_ip varchar2(40) not null,
 rev_num number not null,
 mem_num number not null,
 constraint review_reply_pk primary key (re_num),
 constraint review_reply_fk1 foreign key (rev_num) references review (rev_num),
 constraint review_reply_fk2 foreign key (mem_num) references member (mem_num)                             
);

create sequence review_seq;
create sequence review_star_seq;
create sequence review_reply_seq;
	