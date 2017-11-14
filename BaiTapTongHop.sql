--Bài tập tổng hợp

create database QUANLYVATTU
use QUANLYVATTU
-----------------------------
create table NCC
(
	MaNCC char(5) primary key,
	Ten nvarchar(40),
	Heso int,
	ThPho nvarchar(20)
)

create table DUAN
(
	MaDA char(5) primary key,
	Ten varchar(40),
	ThPho nvarchar(20)
)
create table VATTU
(
	MaVT char(5) primary key,
	Ten varchar(40),
	Mau varchar(15),
	TrLuong float,
	ThPho varchar(20)
)
create table CC
(
	MaNCC char(5) foreign key references NCC(MaNCC),
	MaVT char(5) foreign key references VATTU(MaVT),
	MaDA char(5) foreign key references DUAN(MaDA),
	SLuong int,
	primary key(MaNCC, MaVT, MaDA)
)

insert into NCC
values('S1', 'Son', 20, 'TpHCM')
insert into NCC
values('S2', 'Tran', 10, 'Ha Noi')
insert into NCC
values('S3', 'Bach', 30, 'Ha Noi')
insert into NCC
values('S4', 'Lap', 20, 'TpHCM')
insert into NCC
values('S5', 'Anh', 30, 'Da Nang')
------------------------------------
insert into DUAN
values('J1', 'May phan loai', 'Ha Noi')
insert into DUAN
values('J2', 'Man hinh', 'Viet Tri')
insert into DUAN
values('J3', 'OCR', 'Da Nang')
insert into DUAN
values('J4', 'Bang dieu khien', 'Da Nang')
insert into DUAN
values('J5', 'RAID', 'TpHCM')
insert into DUAN
values('J6', 'EDS', 'Hai Phong')
insert into DUAN
values('J7', 'Bang tu', 'TpHCM')
-----------------------------------------
insert into VATTU
values('P1', 'Dai oc', 'Do', 12.0, 'TpHCM')
insert into VATTU
values('P2', 'Bu long', 'Xanh la', 17.0, 'Ha Noi')
insert into VATTU
values('P3', 'Dinh vit', 'Xanh duong', 17.0, 'Hai Phong')
insert into VATTU
values('P4', 'Dinh vit', 'Do', 14.0, 'TpHCM')
insert into VATTU
values('P5', 'Cam', 'Xanh duong', 12.0, 'Ha Noi')
insert into VATTU
values('P6', 'Banh rang', 'Do', 19.0, 'TpHCM')
--------------------------------------------------
insert into CC
values('S1', 'P1', 'J1', 200)
insert into CC
values('S1', 'P1', 'J4', 700)
insert into CC
values('S2', 'P3', 'J1', 400)
insert into CC
values('S2', 'P3', 'J2', 200)
insert into CC
values('S2', 'P3', 'J3', 200)
insert into CC
values('S2', 'P3', 'J4', 500)
insert into CC
values('S2', 'P3', 'J5', 600)
insert into CC
values('S2', 'P3', 'J6', 400)
insert into CC
values('S2', 'P3', 'J7', 800)
insert into CC
values('S2', 'P5', 'J2', 100)
insert into CC
values('S3', 'P3', 'J1', 200)
insert into CC
values('S3', 'P4', 'J2', 500)
insert into CC
values('S4', 'P6', 'J3', 300)
insert into CC
values('S4', 'P6', 'J7', 300)
insert into CC
values('S5', 'P2', 'J2', 200)
insert into CC
values('S5', 'P2', 'J4', 100)
insert into CC
values('S5', 'P5', 'J5', 500)
insert into CC
values('S5', 'P5', 'J7', 100)
insert into CC
values('S5', 'P6', 'J2', 200)
insert into CC
values('S5', 'P1', 'J4', 100)
insert into CC
values('S5', 'P3', 'J4', 200)
insert into CC
values('S5', 'P4', 'J4', 800)
insert into CC
values('S5', 'P5', 'J4', 400)
insert into CC
values('S5', 'P6', 'J4', 500)
---------------------------------------
--queries

--1 
--Cho biết quy cách màu và thành phố của các vật tư không được trữ tại Hà Nội 
--có trọng lượng lớn hơn 10
select Mau, ThPho
from VATTU
where ThPho <> 'Ha Noi' and TrLuong > 10

--2
--Cho biết thông tin chi tiết của tất cả các dự án
select *
from DUAN

--3
--Cho biết thông tin chi tiết tất cả các dự án ở TPHCM
select *
from DUAN
where ThPho = 'TpHCM'

--4
--Cho biết tên nhà cung cấp vật tư cho dự án J1
select n.Ten
from NCC n inner join CC c on n.MaNCC = c.MaNCC inner join VATTU v on v.MaVT = c.MaVT
where c.MaDA = 'J1'

--5
--Cho biết tên nhà cung cấp, tên vật tư và tên dự án 
--mà số lượng vật tư được cung cấp cho dự án bởi nhà cung cấp lớn hơn 300 và nhỏ hơn 750
select *
from NCC n inner join CC c on n.MaNCC = c.MaNCC inner join VATTU v on v.MaVT = c.MaVT
where c.SLuong between 300 and 750

--6
--Cho biết thông tin chi tiết của các vật tư được cung cấp bởi các nhà cung cấp ở TPHCM
select v.*, n.*
from NCC n inner join CC c on n.MaNCC = c.MaNCC inner join VATTU v on v.MaVT = c.MaVT
where n.ThPho = 'TpHCM'

--7
--Cho biết mã số các vật tư được cung cấp cho dự án tại TPHCM bởi các nhà cung cấp ở TPHCM
select *
from DUAN d inner join CC c on d.MaDA = c.MaDA inner join VATTU v on v.MaVT = c.MaVT inner join NCC n on n.MaNCC = c.MaNCC
where d.ThPho = 'TpHCM' and n.ThPho = 'TpHCM'
--8
--Liệt kê các cặp tên thành phố 
--mà nhà cung cấp ở thành phố thứ nhất cung cấp vật tư được trữ tại thành phố thứ 2
select distinct n.ThPho, v.ThPho
from NCC n inner join CC c on n.MaNCC = c.MaNCC inner join VATTU v on v.MaVT = c.MaVT
where n.ThPho <> v.ThPho

--9
--Liệt kê các cặp tên thành phố 
--mà nhà cung cấp ở thành phố thứ 1 cung cấp vật tư cho dự án tại thành phố thứ 2
select *
from NCC n inner join CC c on n.MaNCC = c.MaNCC inner join
where 