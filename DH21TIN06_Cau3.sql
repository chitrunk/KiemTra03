/*
	LỚP: DH21TIN06
	MSSV: 219835
	HỌ TÊN: duong hoang trung
*/

--BÀI TẬP 3:
CREATE DATABASE QLBS

USE QLBS

--CÂU 1:

CREATE TABLE THELOAI (
	MaTL char(5),
	TenTL nvarchar(30),
	CONSTRAINT PK_THELOAI PRIMARY KEY (MaTL)
)


--CÂU 2:

CREATE TABLE NHANVIEN (
	MaNV char(5),
	HoLot nvarchar(30),
	Ten nvarchar(20),
	Phai nvarchar(5),
	NgaySinh Smalldatetime,
	DiaChi nvarchar(50),
	SDT char(10),
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MaNV),
	CONSTRAINT Phai CHECK (Phai IN('NAM','NU')),
	CONSTRAINT SDT CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

--CÂU 3:

CREATE TABLE SACH (
	MaSach char(5),
	TenSach nvarchar(50),
	TacGia nvarchar(50),
	MaTL char(5),
	DonGia numeric(5,2),
	SLTon smallint,
	CONSTRAINT PK_SACH PRIMARY KEY (MaSach),
	CONSTRAINT FK_SACH_THELOAI FOREIGN KEY (MaTL) REFERENCES THELOAI(MaTL),
	CONSTRAINT SLTon CHECK (SLTon <=100)
)

--CÂU 4:

CREATE TABLE HOADON (
	idHD smallint IDENTITY(1,1),
	NgayBan SmallDatetime,
	MaNV char(5),
	CONSTRAINT PK_HOADON PRIMARY KEY (idHD),
	CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
)

ALTER TABLE HOADON
ADD CONSTRAINT df_NgayBan DEFAULT GETDATE() FOR NgayBan

--CÂU 5:

CREATE TABLE ChiTietHoaDon (
	idHD smallint,
	MaSach char(5),
	SLBan Smallint,
	CONSTRAINT PK_ChiTietHoaDon PRIMARY KEY (idHD),
	CONSTRAINT FK_ChiTietHoaDon_SACH FOREIGN KEY (MaSach) REFERENCES SACH(MaSach),
	CONSTRAINT SLBan CHECK (SLBan >= 0)
)

