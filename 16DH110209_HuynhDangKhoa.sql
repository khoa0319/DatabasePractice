--Bai 1
create database QLDIEM
use QLDIEM
go;

create table DMSV
(
	MASV char(3) primary key,
	HOSV nvarchar(30),
	TENSV nvarchar (10),
	PHAI bit,
	NGAYSINH date,
	NOISINH nvarchar(25),
	MAKH Char(2),
	HOCBONG float
)
alter table DMSV add constraint FK_MAKH_MAKHOA_12345 foreign key(MAKH) references DMKHOA(MAKHOA)

create table DMMH 
(
	MAMH Char(2) primary key,
	TENMH nvarchar(30),
	SOTIET tinyint
)

create table DMKHOA
(
	MAKHOA Char(2) primary key,
	TENKHOA nvarchar(20)
)

create table KETQUA
(
	MASV char(3) foreign key references DMSV(MASV),
	MAMH char(2) foreign key references DMMH(MAMH),
	LANTHI tinyint,
	DIEM decimal(4, 2),
	primary key (MASV, MAMH, LANTHI)
)
------------------------------------------
insert into DMMH 
values('01', N'Cơ sở dữ liệu', 45)
insert into DMMH 
values('02', N'Trí tuệ nhân tạo', 45)
insert into DMMH 
values('03', N'Truyền tin', 45)
insert into DMMH 
values('04', N'Đồ họa', 60)
insert into DMMH 
values('05', N'Văn phạm', 60)
insert into DMMH 
values('06', N'Kỹ thuật lập trình', 45)
delete from DMMH
-----------------------
insert into DMKHOA
values('AV', N'Anh Văn')
insert into DMKHOA
values('TH', N'Tin Học')
insert into DMKHOA
values('TR', N'Triết')
insert into DMKHOA
values('VL', N'Vật Lý')
select * from DMKHOA
-------------------------------
insert into DMSV
values('A01', N'Nguyễn Thị', N'Hải', '1', N'02-23-1993', N'Hà Nội', 'TH', 130000)
insert into DMSV
values('A02', N'Trần Văn', N'Chính', '0', N'12-24-1992', N'Bình Định', 'VL', 150000)
insert into DMSV
values('A03', N'Lê Thu Bạch', N'Yến', '1', N'02-21-1993', N'Tp HCM', 'TH', 170000)
insert into DMSV
values('A04', N'Trần Anh', N'Tuấn', '0', N'12-20-1994', N'Hà Nội', 'AV', 130000)
insert into DMSV
values('B01', N'Trần Thanh', N'Mai', '1', N'08-12-1993', N'Hà Nội', 'TR', 0)
insert into DMSV
values('B02', N'Trần Thị Thu', N'Thủy', '1', N'01-02-1994', N'Hà Nội', 'AV', 0)
delete from DMSV
-----------------------------------------
insert into KETQUA
values('A01','01', 1, 3)
insert into KETQUA
values('A01','01', 2, 6)
insert into KETQUA
values('A01','02', 2, 6)
insert into KETQUA
values('A01','03', 1, 5)
insert into KETQUA
values('A02','01', 1, 4.5)
insert into KETQUA
values('A02','01', 2, 7)
insert into KETQUA
values('A02','03', 1, 10)
insert into KETQUA
values('A02','05', 1, 9)
insert into KETQUA
values('A03','01', 1, 2)
insert into KETQUA
values('A03','01', 2, 5)
insert into KETQUA
values('A03','03', 1, 2.5)
insert into KETQUA
values('A03','03', 2, 4)
insert into KETQUA
values('A04','05', 2, 10)
insert into KETQUA
values('B01','01', 1, 7)
insert into KETQUA
values('B01','03', 1, 2.5)
insert into KETQUA
values('B01','03', 2, 5)
insert into KETQUA
values('B02','02', 1, 6)
insert into KETQUA
values('B02','04', 1, 10)
--delete from DMSV
--3.1
alter table DMKHOA add NamTL int
select * from DMKHOA
--3.2
alter table DMKHOA
alter column NamTL smallint
--3.3
EXEC sp_rename 'DMKHOA.NamTL', 'NamThanhLap'
--3.4
alter table DMKHOA drop column NamThanhLap
--3.5
alter table DMSV drop constraint FK_MAKH_MAKHOA_12345
--3.6
alter table DMSV add constraint FK_MAKH_MAKHOA_12345 foreign key (MAKH) references DMKHOA(MAKHOA)
--4.1
--4.2
Update DMMH set SOTIET = 45 where TENMH = N'Văn phạm'
select * from DMMH
--4.3
update DMSV set TENSV = N'Kỳ' where TENSV = N'Mai'
--4.4
update DMSV set PHAI = 1 where TENSV = N'Kỳ'
--4.5
update DMSV set NGAYSINH = '07-05-1997' where TENSV = N'Thủy'
--4.6
update DMSV set HOCBONG = HOCBONG + 100000 where MAKH = 'AV'
--4.7 Xoá tất cả những dòng có điểm thi lần 2 nhỏ hơn 5 trong bảng KETQUA.
delete from KETQUA 
where LANTHI = 2 and DIEM < 5
----------------------------------
-------------------------------
----------------------------
------------------------
--------------------
--1.1 Danh sách các môn học có tên bắt đâu bằng chư T, gồm các thông tin: Mã môn, Tên môn, Sô tiêt.
select MAMH, TENMH, SOTIET from DMMH
where TENMH like N'T%'
go;

--1.2 Liệt kê danh sách nhưng sinh viên có chư cái cuôi cùng trong tên la I, gồm các thông 
--tin: Họ tên sinh viên, Ngay sinh, Phái.

select CONCAT(HOSV, TENSV) as FullName, NGAYSINH, PHAI from DMSV
where TENSV like N'%I'

--1.3 Danh sách nhưng khoa có ký tự thư hai của tên khoa có chưa chư N, 
--gồm các thông tin: Mã khoa, Tên khoa.
select * from DMKHOA
where TENKHOA like N'_n%'

--1.4 Liệt kê nhưng sinh viên mà họ có chưa chư Thị.
select * from DMSV where HOSV like N'%Thị%'

--1.5 Cho biêt danh sách nhưng sinh viên có ký tự đâu tiên của tên nằm trong khoảng từ a
--đên m, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái, Học bông.
select MASV, HOSV + ' ' + TENSV as FullName, PHAI, HOCBONG from DMSV
where LEFT(TENSV,1) between 'A' and 'M'

--1.6 Liệt kê các sinh viên có học bông từ 150000 trơ lên va sinh ơ Ha Nội, 
--gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bông.
select HOSV, TENSV, MAKH, NOISINH, HOCBONG from DMSV
where NOISINH = N'Hà Nội' and HOCBONG > 150000

--1.7 Danh sách các sinh viên của khoa AV văn va khoa VL, 
--gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
select MASV, MAKH, PHAI from DMSV
where MAKH = 'AV' or MAKH = 'VL'

--1.8 Cho biêt nhưng sinh viên có ngay sinh từ ngay 01/01/1992 đên ngay 05/06/1993
--gồm các thông tin: Mã sinh viên, Ngay sinh, Nơi sinh, Học bông.
select MASV, NGAYSINH, NOISINH, HOCBONG from DMSV
where NGAYSINH between '1/1/1992' and '5/6/1993'
select * from DMSV

--1.9 Danh sách nhưng sinh viên có học bông từ 80.000 đên 150.000, 
--gồm các thông tin: Mã sinh viên, Ngay sinh, Phái, Mã khoa.
select MASV, NGAYSINH, PHAI, MAKH, HOCBONG from DMSV
where HOCBONG >= 80000 and HOCBONG <= 150000

--1.10 Cho biêt nhưng môn học có sô tiêt lớn hơn 30 va nhỏ hơn 45, 
--gồm các thông tin: Mã môn học, Tên môn học, Sô tiêt.
select MAMH, TENMH, SOTIET from DMMH
where SOTIET > 30 and SOTIET < 45
go;
--1.11 Liệt kê nhưng sinh viên nam của khoa Anh văn và khoa tin học, 
--gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select MASV, HOSV, TENSV, DMKHOA.TENKHOA from DMSV inner join DMKHOA
on DMSV.MAKH = DMKHOA.MAKHOA
where DMKHOA.MAKHOA in 
	(
		select MAKHOA from DMKHOA where TENKHOA in (N'Anh Văn', N'Tin Học') and PHAI = '0'
	)
--1.12 Liệt kê nhưng sinh viên có điểm thi môn sơ sơ dư liệu nhỏ hơn 5, 
--gồm thông tin: Mã sinh viên, Họ tên, phái, điểm

select DMSV.MASV, HOSV, TENSV, PHAI, MAMH, DIEM 
from DMSV inner join KETQUA on DMSV.MASV = KETQUA.MASV
where  KETQUA.MASV in (
select MASV from KETQUA where MAMH =
(select MAMH from DMMH where TENMH = N'Cơ sở dữ liệu') and DIEM < 5)

--1.13 Liệt kê nhưng sinh viên học khoa Anh văn mà không có học bổng, 
--gồm thông tin: Mã sinh viên, Họ và tên, tên khoa, Nơi sinh, Học bổng.
select MASV, HOSV, TENSV, TENKHOA, NOISINH, HOCBONG from DMSV inner join DMKHOA on DMSV.MAKH = DMKHOA.MAKHOA
where DMKHOA.MAKHOA = (select MAKHOA from DMKHOA where TENKHOA = N'Anh Văn')

--sắp xếp Order by
--2.1 Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến m, 
--gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh. Danh sách được sắp xếp tăng dần theo tên sinh viên.
select (HOSV +' ' + TENSV) as FullName, NGAYSINH, NOISINH from DMSV
where TENSV like '%[A-M]%'
order by TENSV

--2.2
--Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. 
--Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.
select MASV, HOSV, TENSV, HOCBONG from DMSV
order by MASV

--2.3
--Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. 
--Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select HOSV + ' ' + TENSV as FullName, NGAYSINH, HOCBONG from DMSV
order by NGAYSINH asc, HOCBONG desc;
--2.4
--Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin:
--Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã khoa giảm dần.
select MASV, HOSV + ' ' + TENSV, MAKH, HOCBONG from DMSV
where HOCBONG > 100000
order by MAKH
--3.1
--Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin:
--Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select * from DMSV
where NOISINH = N'Hà Nội' and MONTH(NGAYSINH) = 2
--3.2
--Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi, Học bổng.
select * from DMSV
where YEAR(GETDATE() - YEAR(NGAYSINH)) > 20
--3.3
--Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
select * from DMSV
where YEAR(GETDATE() - YEAR(NGAYSINH)) between 20 and 25
--3.4





----------------------------------------------------------------
--Bài tập 2 Quản lý đề án công ty
create database CONGTY
use CONGTY
go;

create table NHANVIEN
(
	HONV varchar(7),
	TENLOT varchar(7),
	TEN varchar(7),
	MANV char(9) Primary key,
	NGSINH date,
	DCHI varchar(40),
	PHAI varchar(3) Check (PHAI in ('NAM', 'Nu')),
	LUONG int,
	MA_NQL char(9) references NHANVIEN(MANV),
	PHG int
)
alter table NHANVIEN add constraint FK_NVIEN_PHG foreign key (PHG) references PHONGBAN(MAPH)
EXEC sp_rename 'NHANVIEN.Luong', 'LUONG'
select * from NHANVIEN
go;

create table PHONGBAN
(
	TENPHG varchar(20),
	MAPH int primary key,
	TRPHG char(9) foreign key references NHANVIEN(MANV),
	NG_NHANCHUC date
)
select * from PHONGBAN
go;

create table DIADIEM_PHG
(
	MAPHG int references PHONGBAN(MAPH),
	DIADIEM varchar(15),
	primary key (MAPHG, DIADIEM)
)
select * from DIADIEM_PHG
go;

create table THANNHAN
(
	MA_NVIEN char(9) references NHANVIEN(MANV),
	TENTN varchar(10),
	PHAI varchar(3) check (PHAI in ('Nam', 'Nu')),
	NGSINH date,
	QUANHE varchar(20),
	primary key (MA_NVIEN, TENTN)
)
select * from THANNHAN
go;

create table DEAN
(
	TENDA varchar(20),
	MADA int primary key,
	DDIEM_DA varchar(20),
	PHONG int references PHONGBAN(MAPH)
)
select * from DEAN
go;

create table PHANCONG
(
	MA_NVIEN char(9) references NHANVIEN(MANV),
	SODA int references DEAN(MADA),
	THOIGIAN float,
	primary key (MA_NVIEN, SODA)
)
go;
--------------------------------------------------
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Dinh', 'Ba', 'Tien', 123456789, '01-09-1955', '731 Tran Hung Dao, Q1
, TPHCM', 'Nam', 30000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Nguyen', 'Thanh', 'Tung', 333445555, '12-08-1945', '638 Nguyen Van Cu, Q5
, TPHCM', 'Nam', 40000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Bui', 'Thuy', 'Vu', 999887777, '07-19-1958', '332 Nguyen Thai Hoc, Q1
, TPHCM', 'Nam', 25000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Le', 'Thi', 'Nhan', 987654321, '06-20-1931', '291 Ho Van Hue, QPN
, TPHCM', 'Nu', 43000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Nguyen', 'Manh', 'Hung', 666884444, '09-15-1952', '975 Ba Ria, Vung Tau', 'Nam', 38000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Tran', 'Thanh', 'Tam', 453453453, '07-31-1962', '543 Mai Thi Luu, Q1
, TPHCM', 'Nam', 25000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Tran', 'Hong', 'Quan', 987987987, '03-29-1959', '980 Le Hong Phong, Q10
, TPHCM', 'Nam', 25000)
insert into NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, Luong)
values('Vuong', 'Ngoc', 'Quyen', 888665555, '10-10-1927', '450 Trung Vuong, Ha Noi', 'Nu', 55000)
select * from NHANVIEN
go;
select * from NHANVIEN where MONTH(NGSINH) = 7
insert into PHONGBAN
values ('Nghien cuu', 5, '333445555', '05-22-1978')
insert into PHONGBAN
values ('Dieu hanh', 4, '987987987', '01-01-1985')
insert into PHONGBAN
values ('Quan ly', 1, '888665555', '06-19-1971')
go;

update NHANVIEN set MA_NQL = '333445555',PHG = 5
where MANV = 123456789
update NHANVIEN set MA_NQL = '888665555',PHG = 5
where MANV = 333445555
update NHANVIEN set MA_NQL = '987654321',PHG = 4
where MANV = 999887777
update NHANVIEN set MA_NQL = '888665555',PHG = 4
where MANV = 987654321
update NHANVIEN set MA_NQL = '333445555',PHG = 5
where MANV = 666884444
update NHANVIEN set MA_NQL = '333445555',PHG = 5
where MANV = 453453453
update NHANVIEN set MA_NQL = '987654321',PHG = 4
where MANV = 987987987
update NHANVIEN set PHG = 1
where MANV = 888665555
go;

insert into DIADIEM_PHG
values (1, 'TP HCM')
insert into DIADIEM_PHG
values (4, 'HA NOI')
insert into DIADIEM_PHG
values (5, 'VUNG TAU')
insert into DIADIEM_PHG
values (5, 'NHA TRANG')
insert into DIADIEM_PHG
values (5, 'TP HCM')
go;

insert into THANNHAN
values('333445555', 'Quang', 'Nu', '04-05-1976', 'Con gai')
insert into THANNHAN
values('333445555', 'Khang', 'Nam', '10-25-1973', 'Con trai')
insert into THANNHAN
values('333445555', 'Duong', 'Nu', '05-03-1948', 'Vo chong')
insert into THANNHAN
values('987654321', 'Dang', 'Nam', '02-29-1932', 'Vo Chong')
insert into THANNHAN
values('123456789', 'Duy', 'Nam', '01-01-1978', 'Con trai')
insert into THANNHAN
values('123456789', 'Chau', 'Nu', '12-31-1978', 'Con gai')
insert into THANNHAN
values('123456789', 'Phuong', 'Nu', '05-05-1957', 'Vo chong')
go;

insert into DEAN
values('San pham X', 1, 'VUNG TAU', 5)
insert into DEAN
values('San pham Y', 2, 'NHA TRANG', 5)
insert into DEAN
values('San pham Z', 3, 'TP HCM', 5)
insert into DEAN
values('Tin hoc hoa', 10, 'HA NOI', 4)
insert into DEAN
values('Cap quang', 20, 'TP HCM', 1)
insert into DEAN
values('Dao tao', 30, 'HA NOI', 4)
go;

insert into PHANCONG
values('123456789', 1, 32.5)
insert into PHANCONG
values('123456789', 2, 7.5)
insert into PHANCONG
values('666884444', 3, 40.0)
insert into PHANCONG
values('453453453', 1, 20.0)
insert into PHANCONG
values('453453453', 2, 20.0)
insert into PHANCONG
values('333445555', 3, 10.0)
insert into PHANCONG
values('333445555', 10, 10.0)
insert into PHANCONG
values('333445555', 20, 10.0)
insert into PHANCONG
values('999887777', 30, 30.0)
insert into PHANCONG
values('999887777', 10, 10.0)
insert into PHANCONG
values('987987987', 10, 35)
insert into PHANCONG
values('987987987', 30, 5.0)
insert into PHANCONG
values('987654321', 30, 20.0)
insert into PHANCONG
values('987654321', 20, 15.0)
insert into PHANCONG(MA_NVIEN, SODA)
values('888665555', 20)
select * from PHANCONG
----------------------------------------------------






--BT3 Cơ sở dữ liệu hàng không
create database HANGKHONG
use HANGKHONG
GO;

create table CHUYENBAY
(
	MaCB char(5) primary key,
	GaDi char(3),
	GaDen char(3),
	DoDai int,
	GioDi time,
	GioDen time,
	ChiPhi int
)

create table MAYBAY
(
	MaMB char(3) primary key,
	Loai varchar(50),
	TamBay int
)

create table NHANVIEN
(
	MaNV char(9) primary key,
	Ten varchar(30),
	Luong int 
)

create table CHUNGNHAN
(
	MaNV char(9) references NHANVIEN(MaNV),
	MaMB char(3) references MAYBAY(MaMB),
	Primary key(MaNV, MaMB)
)
GO;
----------------------------------------
insert into CHUYENBAY
values('VN431', 'SGN', 'CAH', 3693,'05:55', '06:55', 236)
insert into CHUYENBAY
values('VN320', 'SGN', 'DAD', 2798,'06:00', '07:10', 221)
insert into CHUYENBAY
values('VN464', 'SGN', 'DLI', 2002,'07:20', '08:05', 225)
insert into CHUYENBAY
values('VN216', 'SGN', 'DIN', 4170,'10:30', '14:20', 262)
insert into CHUYENBAY
values('VN280', 'SGN', 'HPH', 11979,'06:00', '08:00', 1279)
insert into CHUYENBAY
values('VN254', 'SGN', 'HUI', 8765,'18:40', '20:00', 781)
insert into CHUYENBAY
values('VN338', 'SGN', 'BMV', 4081,'15:25', '16:25', 375)
insert into CHUYENBAY
values('VN440', 'SGN', 'BMV', 4081,'18:30', '19:30', 426)
insert into CHUYENBAY
values('VN651', 'DAD', 'SGN', 2798,'19:30', '08:00', 221)
insert into CHUYENBAY
values('VN276', 'DAD', 'CXR', 1283,'09:00', '12:00', 203)
insert into CHUYENBAY
values('VN374', 'HAN', 'VII', 510,'11:40', '13:25', 120)
insert into CHUYENBAY
values('VN375', 'VII', 'CXR', 752,'14:15', '16:00', 181)
insert into CHUYENBAY
values('VN269', 'HAN', 'CXR', 1262,'14:10', '15:50', 202)
insert into CHUYENBAY
values('VN315', 'HAN', 'DAD', 134,'11:45', '13:00', 112)
insert into CHUYENBAY
values('VN317', 'HAN', 'UIH', 827,'15:00', '16:15', 190)
insert into CHUYENBAY
values('VN741', 'HAN', 'PXU', 395,'06:30', '08:30', 120)
insert into CHUYENBAY
values('VN474', 'PXU', 'PQC', 1586,'08:40', '11:20', 102)
GO;

insert into MAYBAY
values('747', 'Boeing 747 - 400', 13488)
insert into MAYBAY
values('737', 'Boeing 737 - 800', 5413)
insert into MAYBAY
values('340', 'Airbus A - 300', 11392)
insert into MAYBAY
values('757', 'Boeing 757 - 300', 6416)
insert into MAYBAY
values('777', 'Boeing 777 - 300', 10306)
insert into MAYBAY
values('767', 'Boeing 767 - 400ER', 10360)
insert into MAYBAY
values('320', 'Airbus A320', 4168)
insert into MAYBAY
values('319', 'Airbus A319', 2888)
insert into MAYBAY
values('727', 'Boeing 727', 2406)
insert into MAYBAY
values('154', 'Tupolev 154', 6565) 
GO;

insert into NHANVIEN
values('242518965', 'Tran Van Son', 120433)
insert into NHANVIEN
values('141582651', 'Doan Thi Mai', 178345)
insert into NHANVIEN
values('011564812', 'Ton Van Quy', 153972)
insert into NHANVIEN
values('567354612', 'Quan Cam Ly', 256481)
insert into NHANVIEN
values('552455318', 'La Que', 101745)
insert into NHANVIEN
values('550156548', 'Nguyen Thi Cam', 205187)
insert into NHANVIEN
values('390487451', 'Le Van Luat', 212156)
insert into NHANVIEN
values('274878974', 'Mai Quoc Minh', 99890)
insert into NHANVIEN
values('254099823', 'Nguyen Thi Quynh', 24450)
insert into NHANVIEN
values('356187925', 'Nguyen Vinh Bao', 44740)
insert into NHANVIEN
values('355548984', 'Tran Thi Hoai An', 212156)
insert into NHANVIEN
values('310454876', 'Ta Van Do', 212156)
insert into NHANVIEN
values('489456522', 'Nguyen Thi Quy Linh', 127984)
insert into NHANVIEN
values('489221823', 'Bui Quoc Chinh', 23980)
insert into NHANVIEN
values('548977562', 'Le Van Quy', 84476)
insert into NHANVIEN
values('310454877', 'Tran Van Hao', 33546)
insert into NHANVIEN
values('142519864', 'Nguyen Thi Xuan Dao', 227489)
insert into NHANVIEN
values('287321212', 'Duong Van Minh', 48090)
insert into NHANVIEN
values('552455348', 'Bui Thi Dung', 92013)
insert into NHANVIEN
values('248965255', 'Tran Thi Ba', 43723)
insert into NHANVIEN
values('159542516', 'Le Van Ky', 48250)
insert into NHANVIEN
values('348121549', 'Nguyen Van Thanh', 32899)
insert into NHANVIEN
values('574489457', 'Bui Van Lap', 20)
insert into NHANVIEN
values('269734834', 'Nguyen Huy Hung', 20000000)
select * from NHANVIEN where MaNV = '269734834'
GO;

insert into CHUNGNHAN
values('567354612', '747')
insert into CHUNGNHAN
values('567354612', '737')
insert into CHUNGNHAN
values('567354612', '757')
insert into CHUNGNHAN
values('567354612', '777')
insert into CHUNGNHAN
values('567354612', '727')
insert into CHUNGNHAN
values('567354612', '767')
insert into CHUNGNHAN
values('567354612', '340')
insert into CHUNGNHAN
values('552455318', '737')
insert into CHUNGNHAN
values('552455318', '319')
insert into CHUNGNHAN
values('552455318', '747')
insert into CHUNGNHAN
values('552455318', '767')
insert into CHUNGNHAN
values('390487451', '340')
insert into CHUNGNHAN
values('390487451', '320')
insert into CHUNGNHAN
values('390487451', '319')
insert into CHUNGNHAN
values('274878974', '757')
insert into CHUNGNHAN
values('274878974', '767')
insert into CHUNGNHAN
values('355548984', '154')
insert into CHUNGNHAN
values('310454876', '154')
insert into CHUNGNHAN
values('142519864', '747')
insert into CHUNGNHAN
values('142519864', '757')
insert into CHUNGNHAN
values('142519864', '777')
insert into CHUNGNHAN
values('142519864', '767')
insert into CHUNGNHAN
values('142519864', '737')
insert into CHUNGNHAN
values('142519864', '340')
insert into CHUNGNHAN
values('142519864', '320')
insert into CHUNGNHAN
values('269734834', '747')
insert into CHUNGNHAN
values('269734834', '737')
insert into CHUNGNHAN
values('269734834', '340')
insert into CHUNGNHAN
values('269734834', '757')
insert into CHUNGNHAN
values('269734834', '777')
insert into CHUNGNHAN
values('269734834', '767')
insert into CHUNGNHAN
values('269734834', '320')
insert into CHUNGNHAN
values('269734834', '319')
insert into CHUNGNHAN
values('269734834', '727')
insert into CHUNGNHAN
values('269734834', '154')
insert into CHUNGNHAN
values('242518965', '737')
insert into CHUNGNHAN
values('242518965', '757')
insert into CHUNGNHAN
values('141582651', '737')
insert into CHUNGNHAN
values('141582651', '757')
insert into CHUNGNHAN
values('141582651', '767')
insert into CHUNGNHAN
values('011564812', '737')
insert into CHUNGNHAN
values('011564812', '757')
insert into CHUNGNHAN
values('574489457', '154')
delete from CHUNGNHAN