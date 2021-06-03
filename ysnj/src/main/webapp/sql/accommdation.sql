/* 숙소 정보 관리 */
create table accommdation(
	acc_num number not null,
	mem_num number not null,
	acc_category number(1) not null, /*1:호텔, 2:모텔, 3:게스트하우스*/
	acc_name varchar2(50) not null,
	acc_tel varchar2(15) not null,
	acc_checkin varchar2(10),
	acc_checkout varchar2(10),
	acc_address varchar2(200) not null,
	acc_status number(1) not null,/*1:가능, 2:불가능*/
	acc_guide clob not null,
	acc_amenity varchar2(100),
	acc_uploadfile1 blob,
	acc_filename1 varchar2(300),
	acc_uploadfile2 blob,
	acc_filename2 varchar2(300),
	acc_uploadfile3 blob,
	acc_filename3 varchar2(300),
	acc_uploadfile4 blob,
	acc_filename4 varchar2(300),
	acc_uploadfile5 blob,
	acc_filename5 varchar2(300),
	acc_uploadfile6 blob,
	acc_filename6 varchar2(300),
	acc_date date not null,
	constraint accommdation_pk primary key(acc_num),
	constraint accommdation_fk foreign key (mem_num) references member (mem_num)
);

create sequence accommdation_seq;

/* 객실 정보 관리 */
create table room(
	roo_num number not null,
	acc_num number not null,
	roo_name varchar2(50) not null,
	roo_price number(7) not null,
	roo_status number(1) not null, /*1:가능, 2:불가능*/
	roo_guide clob not null,
	roo_capacity number(3),
	roo_amenity varchar2(100),
	roo_uploadfile1 blob,
	roo_filename1 varchar2(300),
	roo_uploadfile2 blob,
	roo_filename2 varchar2(300),
	roo_uploadfile3 blob,
	roo_filename3 varchar2(300),
	roo_uploadfile4 blob,
	roo_filename4 varchar2(300),
	roo_uploadfile5 blob,
	roo_filename5 varchar2(300),
	roo_uploadfile6 blob,
	roo_filename6 varchar2(300),
	roo_date date not null,
	constraint room_pk primary key(roo_num),
	constraint room_fk foreign key (acc_num) references accommdation (acc_num)
);

create sequence room_seq;

create table acc_fav(
	acf_num number not null,
	acc_num number not null,
	mem_num number,
	acf_date date default sysdate not null,
	constraint acc_fav_pk primary key (acf_num),
	constraint acc_fav_fk1 foreign key (acc_num) references accommdation (acc_num),
	constraint acc_fav_fk2 foreign key (mem_num) references member (mem_num)
);

create sequence acc_fav_seq;