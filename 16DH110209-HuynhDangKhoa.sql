create database QLDiem
use QLDiem

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
insert into DMSV
values('B03', N'Nguyễn Huy', N'Hùng', '0', N'03-25-1995', N'Hà Nội', 'TH', 1000000)
insert into DMSV
values('B04', N'Phạm Huy', N'Hoàng', '0', N'06-8-1995', N'Tp HCM', 'TH', 1200000)
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
insert into KETQUA
values('B02', '03', 2, 4.5)
insert into KETQUA
values('B02', '05', 2, 1.5)
insert into KETQUA
values('B03', '01', 2, 4.5)
insert into KETQUA
values('B03', '05', 2, 2.5)
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

--5.1
--Cho biết năm sinh nào có 2 sinh viên đang theo học tại trường.
select YEAR(NgaySinh) as NamSinh, COUNT(MaSV) as SoSV
from DMSV
group by YEAR(NgaySinh)
having COUNT(MaSV) = 2

--5.2
--Cho biết nơi nào có hơn 2 sinh viên đang theo học tại trường
select k.MaKhoa, COUNT(*) as SoSV
from DMSV s inner join DMKHOA k on s.MaKH = k .MaKhoa
group by k.MaKhoa
having COUNT(*) >= 2

--5.3
--cho biết môn nào có trên 3 sinh viên dự thi
select d.TenMH, d.MaMH , Count(distinct k.MaSV) as SoSV
from KETQUA k inner join DMMH d on k.MaMH = d.MaMH
group by d.TenMH, d.MaMH
having Count(distinct k.MaSV) >= 3

--5.4
--Cho biết sinh viên thi lại trên 2 lần
select * from KETQUA
select k.MaSV, d.HoSV, d.TenSV, k.MaMH, count(LanThi) as SoLanThi
from KETQUA k inner join DMSV d on k.MaSV = d.MaSV
group by k.MaSV, d.HoSV, d.TenSV, k.MaMH
having COUNT(LanThi) >= 2

SELECT	s.MaSV,HoSV+' '+TenSV as HoTenSV,AVG(Diem) as DTB
FROM	DMSV s ,KETQUA k
where	s.MaSV=k.MaSV and Phai ='0'  and  LanThi=1
GROUP BY	s.MaSV,HoSV+' '+TenSV
HAVING AVG(Diem)>=7.0

--5.6
select s.MaSV,HoSV+' '+TenSV AS HoTenSV,MonRot=sum(case when Diem<5 then 1 else 0 end)
from	DMSV S,KETQUA K
where s.MaSV=k.MaSV and LanThi=1
GROUP by  s.MaSV,HoSV+' '+TenSV 
having sum(case when Diem<5 then 1 else 0 end)>=2

--5.7
select	k.MaKhoa,TenKhoa,SVNam=SUM(case when Phai='0' then 1 else 0 end)
from	DMKHOA k ,DMSV s
where	k.MaKhoa=s.MaKH
GROUP by	k.MaKhoa,TenKhoa
having	SUM(case when Phai='0' then 1 else 0 end)>=2

--5.8
select	k.MaKhoa,TenKhoa,SVDatHocBong=SUM(case when HocBong between '100000' and '200000' then 1 else 0 end)	
from	DMKHOA k , DMSV s
where k.MaKhoa=s.MaKH
GROUP by	k.MaKhoa,TenKhoa
having	SUM(case when HocBong between '100000' and '200000' then 1 else 0 end)>=2

--5.9
select	s.MaSV,HoSV+' '+TenSV as HoTenSV,s.Phai,COUNT(MaMH) as MonHoc
from	DMSV s,KETQUA k
where s.MaSV=k.MaSV and Phai='0'
GROUP by	s.MaSV,HoSV+' '+TenSV,s.Phai
having	COUNT(MaMH)>=3

--5.10
select	s.MaSV,HoSV+' '+TenSV as hotensv,AVG(Diem) as DTB,MonRot=sum(case when Diem<5 then 1 else 0 end) 
from	DMSV s,KETQUA k
where	s.MaSV=k.MaSV	and LanThi=1
GROUP by	s.MaSV,HoSV+' '+TenSV
having	AVG(Diem)>=7 and sum(case when Diem<5 then 1 else 0 end)=0

--5.11
select	m.MaMH,TenMH,MonRot=SUM(case when Diem<5 then 1 else 0 end)
from	DMMH m,KETQUA k
where	m.MaMH=k.MaMH and LanThi=1
GROUP by	m.MaMH,TenMH
having	SUM(case when Diem<5 then 1 else 0 end)=0

--5.12
select	s.MaSV,HoSV+' '+TenSV as hotensv,MonRot=sum(case when Diem<5 then 1 else 0 end)  
from	KETQUA k ,DMSV s
where	s.MaSV=k.MaSV and LanThi=1
GROUP by	s.MaSV,HoSV+' '+TenSV
having COUNT(MaMH)>= 3	and sum(case when Diem<5 then 1 else 0 end)=0

-----------------------------------------------
--23/10/2017
--6.1
--cho biet sinh vien nao co hoc bong cao nhat
select *
from DMSV
where HocBong = 
	(
		select Max(HocBong)
		from DMSV
	)
--6.2
--Cho biết những sinh viên có điểm thi lần 1 môn cơ sở dữ liệu cao nhất
select *
from DMSV s,KETQUA k, DMMH h
where s.MaSV = k.MaSV and k.MaMH = h.MaMH and k.LanThi = 1 and h.TenMH = N'Cơ sở dữ liệu'
and k.Diem =(
			select Max(Diem)
			from KETQUA k inner join DMMH m on k.MaMH = m.MaMH
			where m.TenMH = N'Cơ sở dữ liệu' and k.LanThi = 1
			)
--6.3
select d.*, Year(getdate()) - year(NgaySinh) as Tuoi
from DMSV d inner join DMKHOA k on d.MaKH = k.MaKhoa
where Year(getdate()) - year(NgaySinh) = (
	select Max(Year(Getdate()) - Year(NgaySinh)) as TuoiLonNhat
	from DMSV
	where MaKH = (
		select MaKhoa
		from DMKHOA
		where TenKhoa = N'Anh văn'
	)
)and k.TenKhoa = N'Anh Văn'

--6.4Cho biet nhung sinh vien co cung noi sinh vs nhung sinh vien co ma so 'A01'
select *
from DMSV
where NoiSinh =(
	select NoiSinh
	from DMSV
	where MaSV = 'A01'
)

--6.5
--Cho biết sinh viên khoa anh văn học môn văn phạm có điểm thi lần 1 thấp nhất
select *
from DMSV s inner join DMKHOA d on s.MaKH = d.MaKhoa inner join KETQUA k on k.MaSV = s.MaSV
where k.LanThi = 1 and d.TenKhoa = N'Anh Văn'
and k.Diem = (
	select MIN(k.Diem)
	from KETQUA k inner join DMMH h on k.MaMH = h.MaMH
	where LanThi = 1 and h.TenMH = N'Văn phạm'
	)
--6.6
--Cho biết sinh viên thi môn CSDL lần 2 có điểm bằng điểm cao nhất của sinh viên thi môn
--cơ sở dữ liệu lần 1
select *
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV inner join DMMH q on q.MaMH = k.MaMH
where k.LanThi = 2 and q.TenMH = N'Cơ sở dữ liệu'
and Diem = (
	select MAX(Diem)
	from KETQUA k inner join DMMH d on k.MaMH = d.MaMH
	where LanThi = 1 and d.TenMH = N'Cơ sở dữ liệu'
	)
--6.7
select *
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV inner join DMMH q on q.MaMH = k.MaMH
where k.LanThi = 2 and q.TenMH = N'Cơ sở dữ liệu'
and Diem > (
	select MAX(Diem)
	from KETQUA k inner join DMMH d on k.MaMH = d.MaMH
	where LanThi = 1 and d.TenMH = N'Cơ sở dữ liệu'
	)
--6.8
--cho biết nhung sv co hoc bong lon hon tat ca hoc bong cua nhung sv khoa AV
select *
from DMSV
where HocBong > (
	select Max(HocBong)
	from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa
	where k.TenKhoa = N'Anh Văn'
)
--------------------------------------------------------
--7.1
--Cho biết những sinh viên có cùng nơi sinh vs Hải
select *
from DMSV
where NoiSinh in (
	select NoiSinh
	from DMSV
	where TenSV like N'Hải'
	)
and TenSV not like N'Hải'
--7.2
--Cho biết những sinh viên có hoc bổng lớn hơn tất cả hoc bổng của sv Khoa AV
select * 
from DMSV
where HocBong > All (
	select HocBong
	from DMSV s inner join DMKHOA k on s.MaKH = k.MaKHOA
	where k.TenKhoa = N'Anh Văn'
	)
--7.3
--Cho biet những sinh viên có hoc bổng lớn hơn bất kì hoc bổng của sv khoa AV
select * 
from DMSV
where HocBong > Any (
	select HocBong
	from DMSV s inner join DMKHOA k on s.MaKH = k.MaKHOA
	where k.TenKhoa = N'Anh Văn'
	)
--7.4

select *
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV inner join DMMH q on q.MaMH = k.MaMH
where k.LanThi = 2 and q.TenMH = N'Cơ sở dữ liệu'
and Diem > All(
	select Diem
	from KETQUA k inner join DMMH d on k.MaMH = d.MaMH
	where LanThi = 1 and d.TenMH = N'Cơ sở dữ liệu'
	)
--7.5
--Với mỗi sinh viên cho biết điểm thi cao nhất môn tương ứng
select *
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV inner join DMMH m on k.MaMH = m.MaMH
where k.Diem >= All (
	select Diem
	from KETQUA k1
	where s.MaSV = k1.MaSV
	) 
--7.6
--Cho biết môn hoc nào có nhiều sinh viên hoc nhất
select d.MaMH, d.TenMH, Count(distinct MaSV) as SoSV
from KETQUA k inner join DMMH d on k.MaMH = d.MaMH
group by d.MaMH, d.TenMH
having Count(distinct MaSV) >= All(
	select Count(distinct MaSV)
	from KETQUA
	group by MaMH)
--7.7
--Cho biết những khoa có đông sinh viên nam học nhất
select k.MaKhoa, k.TenKhoa, Count(MaSV) as SoSV
from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa
where Phai = 0
group by k.MaKhoa, k.TenKhoa
having Count(MaSV) >= ALL(
	select Count(MaSV)
	from DMSV
	where Phai = 0
	group by MaKH
	)
--7.8
--Cho biết khoa nào có đông sinh viên nhận hoc bổng nhất và khoa nào có ít sinh viên nhận
--học bổng nhất
select k.MaKhoa, k.TenKhoa, SoSV = Sum(case when HocBong > 0 then 1 else 0 end)
from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa
group by k.MaKhoa, k.TenKhoa
having Sum(case when HocBong > 0 then 1 else 0 end) >= all(
	select Sum(case when HocBong > 0 then 1 else 0 end)
	from DMSV
	group by MaKH
	) or Sum(case when HocBong > 0 then 1 else 0 end) <= all(
	select Sum(case when HocBong > 0 then 1 else 0 end)
	from DMSV
	group by MaKH
	)

--7.9
--Cho biết môn nào có nhiều sinh viên rớt lần một nhất
select m.MaMH, m.TenMH, SoSV = Sum(case when k.Diem < 5 then 1 else 0 end)
from KETQUA k inner join DMMH m on k.MaMH = m.MaMH
where LanThi = 1
group by m.MaMH, m.TenMH
having Sum(case when k.Diem < 5 then 1 else 0 end) >= All(
	select SoSV = Sum(case when Diem < 5 then 1 else 0 end)
	from KETQUA
	where LanThi = 1
	group by MaMH
	)
--7.10
--cho biết 3 sinh viên có hoc nhiều môn nhất
SELECT TOP 3 s.MaSV, HoSV, TenSV, COUNT(DISTINCT(MaMH)) as SoMon
FROM DMSV s, KETQUA k
WHERE s.MASV = k.MASV
GROUP BY s.MaSV, HoSV, TenSV
ORDER BY COUNT(DISTINCT(MaMH)) DESC
------------------------------------------
--30/10/2017
--8.1
--Cho biết sinh viên chưa thi môn CSDL
select *
from DMSV
where MaSV not in (select MaSV
					from KETQUA k inner join DMMH m on k.MaMH = m.MaMH
					where m.TenMH = N'Cơ sở dữ liệu')
					
--8.2
--Cho biết sinh viên nào không dự thi lần 1 mà có dự thi lần 2
select *
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV
where s.MaSV not in( select s.MaSV
from KETQUA k inner join DMSV s on k.MaSV = s.MaSV
where k.LanThi = 1)
and k.LanThi = 2

--8.3
--cho biết môn nào không có sinh viên khoa anh văn học
select distinct m.*
from DMMH m inner join KETQUA k on m.MaMH = k.MaMH
where m.MaMH not in ( select q.MaMH
						from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa inner join KETQUA q on s.MaSV = q.MaSV
						where TenKhoa = N'Anh Văn')
						
						
--8.4
--cho biết những sinh viên khoa anh văn chưa học môn văn phạm
select *
from DMSV
where MaSV not in (select s.MaSV
					from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa inner join KETQUA q on s.MaSV = q.MaSV
					where TenKhoa = N'Anh Văn' and MaMH in (select MaMH
															from DMMH
															where TenMH = N'Văn phạm'))
and MaKH = 'AV'

--8.5
--cho biết những môn không có sinh viên rớt ở lần 1
select d.*
from DMMH d inner join KETQUA k on d.MaMH = k.MaMH
where k.MaSV not in( select MaSV
						from DMMH m inner join KETQUA k on m.MaMH = k.MaMH
						where LanThi = 1 and k.Diem < 5)
and LanThi = 1

--8.6
--cho biết những khoa không có sinh viên nữ
select *
from DMKHOA 
where MaKhoa not in ( select k.MaKhoa
					   from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa
					   where s.Phai = 1)
--8.7
--Cho biết những sinh viên
--học khoa anh văn có hoc bổng
--hoặc chưa bao giờ rớt
select s.MaSV, s.HoSV, S.TenSV, s.MaKH
from DMSV s inner join DMKHOA k on s.MaKH = k.MaKhoa
where k.TenKhoa = N'Anh Văn' and s.HocBong > 0
or s.MaSV not in (select MaSV from KETQUA where Diem < 5)

--8.8
--cho biết những sinh viên: không có học bổng hoặc rớt môn học (sv thi lần 1
--bị rớt và không thi lần 2 và sinh viên thi lần 2 bị rớt)

select s.MaSV
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV
where (LanThi = 2 and Diem < 5) or s.MaSV in(
		select m.MaSV
		from (
			select s.MaSV, ThiLan2 = SUM(case LanThi when 2 then 1 else 0 end), ThiLan1 = SUM(case LanThi when 1 then 1 else 0 end)
			from DMSV s inner join KETQUA k on s.MaSV = k.MaSV
			group by s.MaSV
			having Sum(case LanThi when 2 then 1 else 0 end) = 0 and SUM(case LanThi when 1 then 1 else 0 end) > 0
			) as m
		)
-------------------------------------------------
--9.1
SELECT *
FROM DMMH K1
WHERE NOT EXISTS (SELECT * FROM DMSV S
WHERE NOT EXISTS (SELECT *
FROM KETQUA K2
WHERE K2.MaSV = S.MaSV
AND K2.MaMH = K1.MaMH))

--9.2
--Cho biết những sinh viên học môn giống với sinh viên có mã số A02

select distinct s.*
from DMSV s inner join KETQUA k on s.MaSV = k.MaSV
where k.MaMH in (select MaMH from KETQUA where MaSV = 'A02')
and s.MaSV <> 'A02'
								

--9.3
--Cho biết những sinh viên học môn đúng bằng với sinh viên có mã số A02

select *
from DMSV s
where s.MaSV <> 'A02'
and not exists( select *
					from KETQUA k1
					where k1.MaSV = 'A02' and not exists( select *
															from KETQUA k2
															where k2.MaSV = s.MaSV and k2.MaMH = k1.MaMH))

--10.1
--với mỗi môn học, cho biết có bao nhiêu sinh viên đã học môn đó
select m.MaMH, m.TenMH, Count(distinct MaSV) as SoSV
from KETQUA k right join DMMH m on k.MaMH = m.MaMH
group by m.MaMH, m.TenMH

--10.2
--với mỗi khoa cho biết có bao nhiêu sinh viên
select k.MaKhoa, k.TenKhoa, Count(s.MaSV) as SoSV
from DMKHOA k left join DMSV s on k.MaKhoa = s.MaKH
group by k.MaKhoa, k.TenKhoa

--10.3
--với mỗi sinh viên cho biết đã học bao nhiêu môn
select s.MaSV, s.TenSV, s.HoSV, Count(distinct k.MaMH) as SoMH
from DMSV s left join KETQUA k on s.MaSV = k.MaSV
group by s.MaSV, s.TenSV, s.HoSV

--11.1
create table SinhVien_KetQua
(
	MaSV char(10) primary key,
	HoSV nvarchar(20),
	TenSV nvarchar(20),
	SoMH int
)

insert into SinhVien_KetQua(MaSV, HoSV, TenSV, SoMH)
	select s.MaSV, s.HoSV, s.TenSV, COUNT(distinct k.MaMH)
	from KETQUA k inner join DMSV s on k.MaSV = s.MaSV
	group by s.MaSV, s.HoSV, s.TenSV

