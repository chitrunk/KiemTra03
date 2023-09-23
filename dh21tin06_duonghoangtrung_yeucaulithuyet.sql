--dh21tin06_219835_duonghoangtrung
--bai tap 2

create database qldh
use qldh
create table nhacungcap(
	macongty nvarchar(10) primary key,
	tencongty nvarchar(500) not null,
	tengiaodich nvarchar(500) null,
	diachi nvarchar(500) null,
	dienthoai nvarchar(20) null,
	fax nvarchar (20) null,
	email nvarchar(50) null
	)

create table loaihang(
	maloaihang int primary key,
	tenloaihang nvarchar(15) not null unique 
	)

create table mathang(
	mahang nvarchar (10),
	tenhang nvarchar (50) not null,
	macongty nvarchar (10) null,

	soluong int null constraint chk_soluong
		check (soluong >=0), 
	donvitinh nvarchar(20) null,
	giahang money null,
	constraint fk_mathang_loaihang foreign key (maloaihang)
	references loaihang (maloaihang)
	)
drop table mathang