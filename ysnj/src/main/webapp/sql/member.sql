/*회원정보*/
create table member(
	mem_num number not null,
	mem_id varchar2(10) not null,
	mem_type number(1) not null,/*0탈퇴회원,1정지회원,2일반회원,3판매회원,4관리자*/
	constraint member_pk primary key (mem_num)
);

/*회원상세정보*/
create table member_detail(
	mem_num number not null,
	mem_pw varchar2(15) not null,
	mem_name varchar2(15) not null,
	mem_birth varchar2(6),
	mem_conum varchar2(20),
	mem_account varchar2(50),
	mem_cell varchar2(13) not null,
	mem_email varchar2(50) not null,
	mem_zipcode varchar2(5) not null,
	mem_address1 varchar2(100) not null,
	mem_address2 varchar2(100) not null,
	mem_date date default sysdate,
constraint member_detail_pk primary key(mem_num),
constraint member_detail_fk foreign key(mem_num)
								references member (mem_num)
);

create sequence member_seq;