﻿
create database duAnCoro

---bảng màu sắc
go
use duAnCoro
go
create table MauSac
(

    maMS           nvarchar(30)       not null,
	ten		       nvarchar(30)       null,
	ngayTao        Date				null,
	ngaySua	       Date               null,
	trangThai      int				null,

   CONSTRAINT PK_MauSac    PRIMARY KEY(maMS)

)
insert into MauSac values (N'MS1',N'ĐỎ','2003-01-01','2002-02-02',0)
insert into MAUSAC values (N'MS2',N'TRẮNG','2003-01-01','2002-02-02',1)
insert into MAUSAC values (N'MS3',N'ĐEN','2003-01-01','2002-02-02',1)
insert into MAUSAC values (N'MS4',N'XANH','2003-01-01','2002-02-02',1)
insert into MAUSAC values (N'MS5',N'HỒNG','2003-01-01','2002-02-02',0)
go
---bảng chất liệu

create table ChatLieu
(

   maCL			nvarchar(30)            not null,
   ten          nvarchar(30)		    null,
   ngayTao      Date				    null,
   ngaySua	     Date                   null,
   trangThai    int				        null,

   CONSTRAINT PK_ChatLieu   PRIMARY KEY(maCL)

)
insert into CHATLIEU values (N'CL1',N'Cotton','2003-03-03','2009-09-09',0)
insert into CHATLIEU values (N'CL2',N'Nỉ','2003-03-03','2009-09-09',1)
insert into CHATLIEU values (N'CL3',N'Polyester','2003-03-03','2009-09-09',0)

---bảng môn thể thao

	create table MonTheThao
	(

		 maMTT			nvarchar(30)			not null,
		 ten		nvarchar(30)			    null,
		 ngayTao    Date						null,
		 ngaySua	Date						null,
		 trangThai  int							null,
 
		CONSTRAINT PK_MonTheThao   PRIMARY KEY(maMTT)

	)
	INSERT INTO MonTheThao (maMTT, ten, ngayTao, ngaySua, trangThai)
	VALUES
	('MTT001', N'Đá bóng', '2023-07-01', '2023-07-03', 1),
	('MTT002', N'Chạy bộ', '2023-07-02', '2023-07-04', 1),
	('MTT003', N'Bơi', '2023-07-01', '2023-07-02', 1),
	('MTT004', N'Gym', '2023-07-03', '2023-07-05', 1)

go
---bảng loại sản phẩm

create table LoaiSanPham
(
    
	 maLSP			nvarchar(30)			not null,
	 ten		nvarchar(30)			    null,
	 ngayTao    Date						null,
	 ngaySua	Date                        null,
     trangThai  int							null,

	 Constraint PK_LoaiSanPham   Primary key(maLSP)

)
INSERT INTO LoaiSanPham (maLSP, ten, ngayTao, ngaySua, trangThai)
VALUES
('LSP001', 'Áo', '2023-07-01', '2023-07-03', 1),
('LSP002', 'Quần', '2023-07-02', '2023-07-04', 1)
go
---bảng Size

create table Size
(

    maSize			nvarchar(30)			not null,
	size		int						null,
	soLuong     int						null,
	ngayTao		Date				    null,
	ngaySua	    Date					null,
	trangThai	int						null,

	Constraint PK_Size  Primary key(maSize)

)
INSERT INTO Size (maSize, size, soLuong, ngayTao, ngaySua, trangThai)
VALUES
('S001', 32, 10, '2023-07-01', '2023-07-03', 1),
('S002', 34, 15, '2023-07-02', '2023-07-04', 1),
('S003', 36, 20, '2023-07-01', '2023-07-02', 1),
('S004', 38, 12, '2023-07-03', '2023-07-05', 1),
('S005', 40, 8, '2023-07-04', '2023-07-06', 1);
go
---bảng sản phẩm

	create table SanPham
	(
    
		  maSP			nvarchar(30)      not null,
		  tenSP			nvarchar(30)      null,
		  soLuong		int				  null,
		  ngayTao       Date              null,
		  ngaySua		Date			  null,
		  trangThai	    int				  null,
		 [Image]       nvarchar    (max)  NULL,
	  

		  Constraint PK_SanPham    Primary key(maSP)

	)
	INSERT INTO SanPham (maSP, tenSP, soLuong, ngayTao, ngaySua, trangThai, [Image])
VALUES
('SP001', N'Áo chạy bộ', 20, '2023-07-01', '2023-07-03', 1, 'image1.jpg'),
('SP002', N'Áo đá bóng', 15, '2023-07-02', '2023-07-04', 1, 'image2.jpg'),
('SP003', N'Quần chạy bộ', 30, '2023-07-01', '2023-07-02', 1, 'image3.jpg'),
('SP004', N'Áo tập gym', 25, '2023-07-03', '2023-07-05', 1, 'image4.jpg'),
('SP005', N'Quần tập gym', 10, '2023-07-04', '2023-07-06', 1, 'image5.jpg');
go

---bảng chi tiết sản phẩm


create table ChiTietSanPham
(
     maCTSP        nvarchar(30)      not null,
	 maSize        nvarchar(30)      not null,
	 maMS          nvarchar(30)      not null,
	 maCL    	   nvarchar(30)      not null,
	 maSP		   nvarchar(30)      not null,
     maLSP         nvarchar(30)      not null,
     maMTT         nvarchar(30)      not null,
	 soLuong       int				 null,
	 gia		   money			 null,
	 ngayTao	   Date				 null,
	 ngaySua	   Date				 null,
	 trangThai	   int				 null,

	 Constraint PK_ChiTietSanPham              Primary key(maCTSP),
	 Constraint FK_ChiTietSanPham_Size         Foreign key(maSize) References Size,
	 Constraint FK_ChiTietSanPham_MauSac       Foreign key(maMS)   References MauSac,
	 Constraint FK_ChiTietSanPham_ChatLieu     Foreign key(maCL)   References ChatLieu,
	 Constraint FK_ChiTietSanPham_SanPham	   Foreign key(maSP)   References SanPham,
	 Constraint FK_ChiTietSanPham_LoaiSanPham  Foreign key(maLSP)  References LoaiSanPham,
	 Constraint FK_ChiTietSanPham_MonTheThao   Foreign key(maMTT)  References MonTheThao
	
)
INSERT INTO ChiTietSanPham (maCTSP, maSize, maMS, maCL, maSP, maLSP, maMTT, soLuong, gia, ngayTao, ngaySua, trangThai)
VALUES
('CTSP001', 'S001', 'MS1', 'CL1', 'SP001', 'LSP001', 'MTT001', 10, 500000, '2023-07-01', '2023-07-03', 1),
('CTSP002', 'S002', 'MS2', 'CL2', 'SP002', 'LSP002', 'MTT002', 15, 600000, '2023-07-02', '2023-07-04', 1),
('CTSP003', 'S003', 'MS2', 'CL3', 'SP003', 'LSP001', 'MTT003', 20, 700000, '2023-07-01', '2023-07-02', 1),
('CTSP004', 'S004', 'MS4', 'CL2', 'SP004', 'LSP001', 'MTT004', 12, 800000, '2023-07-03', '2023-07-05', 1)

go

---bảng khách hàng

create table KhachHang
(

     maKH					nvarchar(30)     not null,
	 tenKH					nvarchar(30)     null,
	 ngaySinh				Date			 null,
	 gioiTinh               nvarchar(30)	 null,
	 soDienThoai			int				 null,
	 diaChi					nvarchar(50)	 null,
	 ngayTao				Date			 null,
	 ngaySua				Date             null,
	 trangThai				int				 null,


	 Constraint PK_KhachHang    Primary key(maKH)

)
INSERT INTO KhachHang (maKH, tenKH, ngaySinh, gioiTinh, soDienThoai, diaChi, ngayTao, ngaySua, trangThai)
VALUES
('KH001', 'Nguyễn Văn A', '2000-01-01', 'Nam', 123456789, 'Hoàng Hoa Thám, Hà Nội', '2023-07-01', '2023-07-03', 1),
('KH002', 'Nguyễn Thị B', '1998-05-10', 'Nữ', 987654321, 'Nguyễn Khuyến, Hà Nội', '2023-07-02', '2023-07-04', 1),
('KH003', 'Trần Văn C', '2002-09-15', 'Nam', 567891234, 'Ba Đình, Hà Nội', '2023-07-01', '2023-07-02', 1),
('KH004', 'Lê Thị D', '1995-03-20', 'Nữ', 345678912, 'Cầu Giấy, Hà Nội', '2023-07-03', '2023-07-05', 1),
('KH005', 'Phạm Văn E', '1997-07-25', 'Nam', 789123456, 'Đống Đa, Hà Nội', '2023-07-04', '2023-07-06', 1);
go

---bảng hình thức thanh toán

create table HinhThucThanhToan
(
    maHTTT					nvarchar(30)				not null,
	tenHTTT					nvarchar(30)				null,
	ngayTao					Date       				    null,
	ngaySua					Date						null,
	trangThai				int						    null,
	Constraint PK_HinhThucThanhToan				Primary key(maHTTT)
)
INSERT INTO HinhThucThanhToan (maHTTT, tenHTTT, ngayTao, ngaySua, trangThai)
VALUES
    ('HTTT001', 'Tiền mặt', '2023-07-01', '2023-07-03', 1),
    ('HTTT002', 'Chuyển khoản', '2023-07-02', '2023-07-04', 1)
go

---bảng chức vụ

create table ChucVu
(
    maCV       nvarchar(30)				not null,
	tenCV	   nvarchar(30)				not null,
	ngayTao    Date						    null,
	ngaySua	   Date							null,
	trangThai  int							null,

	Constraint PK_ChucVu    Primary key(maCV)

)
INSERT INTO ChucVu (maCV, tenCV, ngayTao, ngaySua, trangThai)
VALUES

    ('CV002', 'Quản lý', '2023-07-02', '2023-07-04', 1),
    ('CV003', 'Nhân viên', '2023-07-01', '2023-07-02', 1)
go
---bảng nhân viên

create table Users
(
    
	  maNV				nvarchar(30)				not null,
	  maCV				nvarchar(30)				not null,
	  tenNV				nvarchar(30)					null,
	  diaChi			nvarchar(30)					null,
	  gioiTinh			nvarchar(30)					null,
	  email				nvarchar(30)					null,
	  soDienThoai       int							    null,
	 
	  ngaySinh          nvarchar(30)				    null,
	  ngayTao			Date							null,
	  ngaySua			Date							null,
	  trangThai		    int								null,
	  [role]            nvarchar(30)                    null,

	  Constraint PK_Users               Primary key(maNV),
	  Constraint FK_Users_ChucVu        Foreign key(maCV)  References ChucVu

)
INSERT INTO Users (maNV, maCV, tenNV, diaChi, gioiTinh, email, soDienThoai, ngaySinh, ngayTao, ngaySua, trangThai, [role])
VALUES
    ('NV001', 'CV002', 'Nguyễn Văn A', 'Hà Nội', 'Nam', 'nva@example.com', 123456789, '2000-01-01', '2023-07-01', '2023-07-03', 1, 'Admin'),
    ('NV002', 'CV002', 'Nguyễn Thị B', 'HCM', 'Nữ', 'ntb@example.com', 987654321, '1998-05-10', '2023-07-02', '2023-07-04', 1, 'User'),
    ('NV003', 'CV003', 'Trần Văn C', 'Đà Nẵng', 'Nam', 'tvc@example.com', 567891234, '2002-09-15', '2023-07-01', '2023-07-02', 1, 'User'),
    ('NV004', 'CV002', 'Lê Thị D', 'Hà Nội', 'Nữ', 'ltd@example.com', 345678912, '1995-03-20', '2023-07-03', '2023-07-05', 1, 'User'),
    ('NV005', 'CV003', 'Phạm Văn E', 'HCM', 'Nam', 'pve@example.com', 789123456, '1997-07-25', '2023-07-04', '2023-07-06', 1, 'User');


go
---bảng hóa đơn

create table HoaDon
(
  
      maHD        nvarchar(30)				not null,
	  maKH	      nvarchar(30)				not null,
	  maHTTT      nvarchar(30)				not null,
	  maNV        nvarchar(30)				not null,
      ghiChu	  nvarchar(30)				    null,
	  thanhTien	  money							null,
	  ngayTao	  Date							null,
	  ngaySua	  Date							null,
	  trangThai	  int							null,

	  Constraint PK_HoaDon			             Primary key(maHD),
	  Constraint FK_HoaDon_KhachHang             Foreign key(maKH)     References KhachHang,
      Constraint FK_HoaDon_HinhThucThanhToan     Foreign key(maHTTT)   References HinhThucThanhToan,
	  Constraint FK_HoaDon_Users			 Foreign key(maNV)     References Users

)
INSERT INTO HoaDon (maHD, maKH, maHTTT, maNV, ghiChu, thanhTien, ngayTao, ngaySua, trangThai)
VALUES
    ('HD001', 'KH001', 'HTTT001', 'NV001', 'Giao hàng nhanh', 500000, '2023-07-01', '2023-07-03', 1),
    ('HD002', 'KH002', 'HTTT002', 'NV002', 'Gửi qua chuyển phát', 800000, '2023-07-02', '2023-07-04', 1),
    ('HD003', 'KH003', 'HTTT001', 'NV003', NULL, 1200000, '2023-07-01', '2023-07-02', 1),
    ('HD004', 'KH004', 'HTTT001', 'NV004', 'Giao hàng tận nơi', 950000, '2023-07-03', '2023-07-05', 1),
    ('HD005', 'KH005', 'HTTT001', 'NV005', NULL, 700000, '2023-07-04', '2023-07-06', 1);


go
---bảng hóa đơn chi tiết

create table HoaDonChiTiet
(
   
   maHDCT        nvarchar(30)				not null,
   maCTSP        nvarchar(30)				not null,
   maHD          nvarchar(30)				not null,
   soLuong       int							null,
   gia		     money							null,
   thanhTien	 money							null,
   ghiChu		 nvarchar(30)				    null,
   ngayTao		 Date							null,
   ngaySua		 Date							null,
   trangThai     int							null,

   Constraint PK_HoaDonChiTiet                        Primary key(maHDCT),
   Constraint FK_HoaDonChiTiet_ChiTietSanPham         Foreign key(maCTSP)   References ChiTietSanPham,
   Constraint FK_HoaDonChiTiet_HoaDon				  Foreign key(maHD)     References HoaDon

)
INSERT INTO HoaDonChiTiet (maHDCT, maCTSP, maHD, soLuong, gia, thanhTien, ghiChu, ngayTao, ngaySua, trangThai)
VALUES
    ('HDCT001', 'CTSP001', 'HD001', 2, 250000, 500000, 'Màu xanh', '2023-07-01', '2023-07-03', 1),
    ('HDCT002', 'CTSP002', 'HD001', 1, 800000, 800000, 'Size M', '2023-07-02', '2023-07-04', 1),
    ('HDCT003', 'CTSP003', 'HD002', 3, 400000, 1200000, NULL, '2023-07-01', '2023-07-02', 1),
    ('HDCT004', 'CTSP004', 'HD003', 2, 475000, 950000, 'Ghi chú chi tiết', '2023-07-03', '2023-07-05', 1),
    ('HDCT005', 'CTSP001', 'HD003', 1, 700000, 700000, NULL, '2023-07-04', '2023-07-06', 1);

go

CREATE TABLE KHUYENMAI(
	MaKM INT IDENTITY(1, 1) NOT NULL,
	TenKM NVARCHAR(50) NOT NULL,
	NgayBatDau DATE,
	NgayKetThuc DATE,
	GiamGia money NOT NULL,
	NgayTao date not null,
	NgaySua date not null,
	TrangThai BIT DEFAULT 1 NOT NULL
	PRIMARY KEY(MaKM)
)
insert into KHUYENMAI values (N'KM1','2018-02-02','2019-01-01',0,'2003-01-01','2002-02-02',0)
insert into KHUYENMAI values (N'KM2','2018-02-02','2019-01-01',100,'2003-01-01','2002-02-02',1)
insert into KHUYENMAI values (N'KM3','2018-02-02','2019-01-01',600,'2003-01-01','2002-02-02',1)
insert into KHUYENMAI values (N'KM4','2018-02-02','2019-01-01',700,'2003-01-01','2002-02-02',0)
insert into KHUYENMAI values (N'KM5','2018-02-02','2019-01-01',1000,'2003-01-01','2002-02-02',0)



select * from KHUYENMAI