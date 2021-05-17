/* 숙소 정보 관리 */
create table accommdation(
	acc_num number not null,
	mem_num number not null,
	acc_category number(1) not null, /*1:호텔, 2:모텔, 3:게스트하우스*/
	acc_name varchar2(30) not null,
	acc_tel varchar2(15) not null,
	acc_checkin varchar2(10),
	acc_checkout varchar2(10),
	acc_address varchar2(50) not null,
	acc_status number(1) not null,/*1:가능, 2:불가능*/
	acc_guide clob not null,
	acc_amenity varchar2(100),
	acc_date date not null,
	constraint accommdation_pk primary key(acc_num),
	constraint accommdation_fk foreign key (mem_num) references member (mem_num)
);

create sequence accommdation_seq;

/* 객실 정보 관리 */
create table room(
	roo_num number not null,
	acc_num number not null,
	roo_name varchar2(30) not null,
	roo_price number(7) not null,
	roo_status number(1) not null, /*1:가능, 2:불가능*/
	roo_guide clob not null,
	roo_capacity number(3),
	rm_date date not null,
	constraint room_pk primary key(roo_num),
	constraint room_fk foreign key (acc_num) references accommdation (acc_num)
);

create sequence room_seq;

/* 숙소/객실의 이미지 관리 */
create table acc_image(
	aci_num number not null,
	acc_num number,
	roo_num number,
	aci_uploadfile blob,
	constraint acc_image_pk primary key (aci_num),
	constraint acc_image_fk1 foreign key (acc_num) references accommdation (acc_num),
	constraint acc_image_fk2 foreign key (roo_num) references room (roo_num)
);

create sequence acc_image_seq;

