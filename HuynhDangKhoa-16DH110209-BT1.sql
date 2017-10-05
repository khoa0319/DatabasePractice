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