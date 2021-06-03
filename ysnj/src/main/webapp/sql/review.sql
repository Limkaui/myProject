/*리뷰 게시판*/
create table review(
	rev_num number not null,
	mem_num number not null,
	mem_id varchar2(12) not null,
	acc_num number not null,
	rev_title varchar2(20) not null,
	rev_content varchar2(2000),
	rev_date date default sysdate,
	rev_hits number,
	rev_uploadfile blob,
    rev_filename varchar2(100),
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

create sequence review_seq;

	