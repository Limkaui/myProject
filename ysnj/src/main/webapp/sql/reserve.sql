/* 예약 */
create table reserve(
	rsv_num number not null, 
	mem_num number not null, 
	roo_num number not null, 
	rsv_state number(1) not null, /* 0 : 예약대기, 1 : 예약확정 , 2 : 예약취소 */ 
	rsv_visitnum number(3) not null, 
	rsv_iname varchar2(30) not null, 
	rsv_iphone varchar2(15) not null, 
	rsv_start varchar2(10) not null, 
	rsv_end varchar2(10) not null, 
	rsv_date date not null,
	constraint reserve_pk primary key (rsv_num),
	constraint reserve_fk1 foreign key (mem_num) references member (mem_num),
	constraint reserve_fk2 foreign key (roo_num) references room (roo_num)
);

create sequence reserve_seq;

/* 포인트 */
create table point(
	poi_num number not null, 
	mem_num number not null, 
	poi_add number(7), 
	poi_minus number(7),
	poi_detail varchar2(90) not null,
	poi_date date not null,
	constraint point_pk primary key (poi_num),
	constraint point_fk foreign key (mem_num) references member (mem_num)
);

create sequence point_seq;

/* 결제 */
create table payment(
	pay_num number not null, 
	rsv_num number not null, 
	pay_state number not null, /* 0 : 입금대기, 1 : 결제완료 2: 결제취소(환불)  */
	pay_money number(9) not null,
	pay_kind number(1) not null,
	pay_name varchar2(30),
	pay_date date not null,
	constraint payment_pk primary key (pay_num),
	constraint payment_fk foreign key (rsv_num) references reserve (rsv_num)
);

create sequence payment_seq;


