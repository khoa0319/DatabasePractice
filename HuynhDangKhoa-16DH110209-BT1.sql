create database QLDiem
use QLDiem
go;

create table DMSV
(
	MaSV char(3) primary key,
	HoSV nvarchar(30),
	TenSV nvarchar (10),
	Phai bit,
	NgaySinh date,
	NoiSinh nvarchar(25),
	MaKH Char(2),
	HocBong float
)

create table DMMH 
(
	MaMH Char(2) primary key,
	TenMH nvarchar(30),
	SoTiet tinyint
)

create table DMKHOA
(
	MaKhoa Char(2) primary key,
	TenKhoa nvarchar(20)
)

alter table DMSV add constraint FK_MAKH_MAKHOA_12345 foreign key(MaKH) references DMKHOA(MaKhoa)

create table KETQUA
(
	MaSV char(3) foreign key references DMSV(MaSV),
	MaMH char(2) foreign key references DMMH(MaMH),
	LanThi tinyint,
	Diem decimal(4, 2),
	primary key (MaSV, MaMH, LanThi)
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
-----------------------
insert into DMKHOA
values('AV', N'Anh Văn')
insert into DMKHOA
values('TH', N'Tin Học')
insert into DMKHOA
values('TR', N'Triết')
insert into DMKHOA
values('VL', N'Vật Lý')
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
-----------------------------------------
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
---------------------------------------
--4.1
--4.2
Update DMMH set SoTiet = 45 where TenMH = N'Văn phạm'
--4.3
update DMSV set TenSV = N'Kỳ' where TenSV = N'Mai'
--4.4
update DMSV set Phai = 1 where TenSV = N'Kỳ'
--4.5
update DMSV set NgaySinh = '07-05-1997' where TenSV = N'Thủy'
--4.6
update DMSV set HocBong = HocBong + 100000 where MaKH = 'AV'
--4.7 Xoá tất cả những dòng có điểm thi lần 2 nhỏ hơn 5 trong bảng KETQUA.
delete from KETQUA 
where LanThi = 2 and Diem < 5
----------------------------------
-------------------------------
----------------------------
------------------------
--------------------
--1.1 Danh sách các môn học có tên bắt đâu bằng chư T, gồm các thông tin: Mã môn, Tên môn, Sô tiêt.
select MaMH, TenMH, SoTiet from DMMH
where TenMH like N'T%'
go;

--1.2 Liệt kê danh sách nhưng sinh viên có chư cái cuôi cùng trong tên la I, gồm các thông 
--tin: Họ tên sinh viên, Ngay sinh, Phái.

select CONCAT(HoSV, TenSV) as FullName, NgaySinh, Phai from DMSV
where TenSV like N'%I'

--1.3 Danh sách nhưng khoa có ký tự thư hai của tên khoa có chưa chư N, 
--gồm các thông tin: Mã khoa, Tên khoa.
select * from DMKHOA
where TenKhoa like N'_n%'

--1.4 Liệt kê nhưng sinh viên mà họ có chưa chư Thị.
select * from DMSV where HoSV like N'%Thị%'

--1.5 Cho biêt danh sách nhưng sinh viên có ký tự đâu tiên của tên nằm trong khoảng từ a
--đên m, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái, Học bông.
select MaSV, HoSV + ' ' + TenSV as FullName, Phai, HocBong from DMSV
where LEFT(TenSV,1) between 'A' and 'M'

--1.6 Liệt kê các sinh viên có học bông từ 150000 trơ lên va sinh ơ Ha Nội, 
--gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bông.
select HoSV, TenSV, MaKH, NoiSinh, HocBong from DMSV
where NoiSinh = N'Hà Nội' and HocBong > 150000

--1.7 Danh sách các sinh viên của khoa AV văn va khoa VL, 
--gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
select MaSV, MaKH, Phai from DMSV
where MaKH = 'AV' or MaKH = 'VL'

--1.8 Cho biêt nhưng sinh viên có ngay sinh từ ngay 01/01/1992 đên ngay 05/06/1993
--gồm các thông tin: Mã sinh viên, Ngay sinh, Nơi sinh, Học bông.
select MaSV, NgaySinh, NoiSinh, HocBong from DMSV
where NgaySinh between '1/1/1992' and '5/6/1993'
select * from DMSV

--1.9 Danh sách nhưng sinh viên có học bông từ 80.000 đên 150.000, 
--gồm các thông tin: Mã sinh viên, Ngay sinh, Phái, Mã khoa.
select MaSV, NgaySinh, Phai, MaKH, HocBong from DMSV
where HocBong >= 80000 and HocBong <= 150000

--1.10 Cho biêt nhưng môn học có sô tiêt lớn hơn 30 va nhỏ hơn 45, 
--gồm các thông tin: Mã môn học, Tên môn học, Sô tiêt.
select MaMH, TenMH, SoTiet from DMMH
where SoTiet > 30 and SoTiet < 45
go;
--1.11 Liệt kê nhưng sinh viên nam của khoa Anh văn và khoa tin học, 
--gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
select MaSV, HoSV, TenSV, DMKHOA.TenKhoa from DMSV inner join DMKHOA
on DMSV.MaKH = DMKHOA.MaKhoa
where DMKHOA.MaKhoa in 
	(
		select MaKhoa from DMKHOA where TenKhoa in (N'Anh Văn', N'Tin Học') and Phai = '0'
	)
	go;
--1.12 Liệt kê nhưng sinh viên có điểm thi môn sơ sơ dư liệu nhỏ hơn 5, 
--gồm thông tin: Mã sinh viên, Họ tên, phái, điểm

select DMSV.MASV, HOSV, TENSV, PHAI, MAMH, DIEM 
from DMSV inner join KETQUA on DMSV.MASV = KETQUA.MASV
where  KETQUA.MASV in (
select MASV from KETQUA where MAMH =
(select MAMH from DMMH where TENMH = N'Cơ sở dữ liệu') and DIEM < 5)

--1.13 Liệt kê nhưng sinh viên học khoa Anh văn mà không có học bổng, 
--gồm thông tin: Mã sinh viên, Họ và tên, tên khoa, Nơi sinh, Học bổng.
select MaSV, HoSV, TenSV, TenKhoa, NoiSinh, HocBong from DMSV inner join DMKHOA on DMSV.MaKH = DMKHOA.MaKhoa
where DMKHOA.MaKhoa = (select MaKhoa from DMKHOA where TenKhoa = N'Anh Văn')

--sắp xếp Order by
--2.1 Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến m, 
--gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh. Danh sách được sắp xếp tăng dần theo tên sinh viên.
select (HoSV +' ' + TenSV) as FullName, NgaySinh, NoiSinh 
from DMSV
where TenSV like '%[A-M]%'
order by TenSV

--2.2
--Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. 
--Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.
select MaSV, HoSV, TenSV, HocBong from DMSV
order by MaSV

--2.3
--Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. 
--Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select HoSV + ' ' + TenSV as FullName, NgaySinh, HocBong from DMSV
order by NgaySinh asc, HocBong desc;
--2.4
--Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin:
--Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã khoa giảm dần.
select MaSV, HoSV + ' ' + TenSV, MaKH, HocBong from DMSV
where HocBong > 100000
order by MaKH

----------------------------------------------------------------------------------
--9/10/2017

--3.1
--Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin:
--Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select * from DMSV
where NoiSinh = N'Hà Nội' and MONTH(NgaySinh) = 2
--3.2
--Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi, Học bổng.
select * from DMSV
where YEAR(GETDATE() - YEAR(NgaySinh)) > 20
--3.3
--Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
select * from DMSV
where YEAR(GETDATE() - YEAR(NgaySinh)) between 20 and 25
--3.4 Danh sách sinh viên sinh vào mùa xuân năm 1990
--Thông tin: Họ Tên, Phái, Ngày sinh
select HoSV + ' ' + TenSV as [Full Name], Phai, DAY(NgaySinh) as Birthday 
from DMSV
where Datepart(q, NgaySinh) = 1 and YEAR(NgaySinh) = 1993
--3.5
SELECT MaSV, Phai, MaKH,
MucHocBong = CASE 
WHEN HocBong > 500000
then 'HOC BONG CAO' else 'HOC BONG THAP'
end	
FROM DMSV
--3.6 Cho biết kết quả điểm thi của từng sinh viên
--gồm các thông tin: Họ Tên, Mã MH, Lần Thi, Điểm, Kết quả (điểm < 5 là rớt và ngược lại)
select HoSV + ' ' + TenSV as [Ho Ten SV], MaMH, LanThi, Diem,
KetQua = CASE WHEN Diem < 5
THEN N'Rớt' ELSE N'Đậu'
END
from DMSV,KETQUA
where DMSV.MaSV = KETQUA.MaSV

-----------------------------------------------------------------------
--16/10/2017
--4.1 Cho biết tổng số sinh viên của toàn trường
select count(*) as SLSV
from DMSV

--4.2 Cho biết tổng số sinh viên và tổng số sinh viên nữ
select Count(*) as TongSV, SVNu = Sum (case when Phai = 1 then 1 else 0 end)
from DMSV

--4.3 Cho biết tổng số sv của từng khoa
select k.MaKhoa, k.TenKhoa, COUNT(*) as SoSV
from DMKHOA as k inner join DMSV as s on k.MaKhoa = s.MaKH
group by k.TenKhoa, k.MaKhoa

--4.4 Cho biết số lượng sinh viên học từng môn
select  d.TenMH, d.MaMH, Count(distinct MaSV) as SoLuong
from DMMH d inner join KETQUA k on d.MaMH = k.MaMH
group by d.TenMH, d.MaMH

select * from KETQUA
--4.5
--Cho biết số lượng môn học mà mỗi sinh viên đã học


select s.MaSV, s.HoSV + ' ' + s.TenSV as HoTenSV, count(Distinct MaMH) as SoLuong
from KETQUA k, DMSV s
where k.MaSV = s.MaSV
group by s.MaSV, s.HoSV, s.TenSV

--4.6
--Cho biết học bổng cao nhất của mỗi khoa
select k.MaKhoa, k.TenKhoa, MAX(HocBong) as HocBong
from DMSV d, DMKHOA k
where d.MaKH = k.MaKhoa
group by k.MaKhoa, k.TenKhoa

--4.7
--Cho biết tổng số sv nam và nữ của mỗi khoa
select SVNam = Sum(case when Phai = 0 then 1 else 0 end), SVNu = Sum(case when Phai = 1 then 1 else 0 end), k.TenKhoa, k.MaKhoa
from DMKHOA k, DMSV s
where k.MaKhoa = s.MaKH
group by k.TenKhoa, k.MaKhoa

--4.8
--Cho biết số lượng sinh viên theo từng độ tuổi
select (Year(GETDATE()) - YEAR(NgaySinh)) as DoTuoi, Count(*) as SoLuongSV
from DMSV
group by Year(GETDATE()) - YEAR(NgaySinh)

--4.9
--Cho biết số lượng sv đậu và sv rớt của từng môn học trong lần thi 1
select h.MaMH, h.TenMH, SVDau = SUM(case when Diem >= 5 and LanThi = 1 then 1 else 0 end),
						SVRot = SUM(case when Diem < 5 and LanThi = 1 then 1 else 0 end)
from KETQUA k, DMMH h
where k.MaMH = h.MaMH 
and LanThi = 1
group by h.MaMH, H.TenMH

