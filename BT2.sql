create database CONGTY
use CONGTY
GO;

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
GO;

create table PHONGBAN
(
	TENPHG varchar(20),
	MAPH int primary key,
	TRPHG char(9) foreign key references NHANVIEN(MANV),
	NG_NHANCHUC date
)
GO;

create table DIADIEM_PHG
(
	MAPHG int references PHONGBAN(MAPH),
	DIADIEM varchar(15),
	primary key (MAPHG, DIADIEM)
)

GO;

create table THANNHAN
(
	MA_NVIEN char(9) references NHANVIEN(MANV),
	TENTN varchar(10),
	PHAI varchar(3) check (PHAI in ('Nam', 'Nu')),
	NGSINH date,
	QUANHE varchar(20),
	primary key (MA_NVIEN, TENTN)
)
GO;

create table DEAN
(
	TENDA varchar(20),
	MADA int primary key,
	DDIEM_DA varchar(20),
	PHONG int references PHONGBAN(MAPH)
)

GO;

create table PHANCONG
(
	MA_NVIEN char(9) references NHANVIEN(MANV),
	SODA int references DEAN(MADA),
	THOIGIAN float,
	primary key (MA_NVIEN, SODA)
)

GO;
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
GO;

insert into PHONGBAN
values ('Nghien cuu', 5, '333445555', '05-22-1978')
insert into PHONGBAN
values ('Dieu hanh', 4, '987987987', '01-01-1985')
insert into PHONGBAN
values ('Quan ly', 1, '888665555', '06-19-1971')
GO;

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
GO;

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
GO;

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
GO;

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
GO;

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

GO;
----------------------------------------------
--1
-- danh sách đề án có
--những người tham gia họ Đinh / có người trưởng phòng chủ trì đề án họ Đinh
select *
from DEAN
where MADA in ( select p.SODA
				from NHANVIEN n inner join PHANCONG p on n.MANV = p.MA_NVIEN
				where n.HONV = 'Dinh')
or MADA in (select SODA from PHANCONG c inner join PHONGBAN p on p.TRPHG = c.MA_NVIEN
			where p.TRPHG in (select MANV from NHANVIEN where HONV = 'Dinh'))

-- 2
--cho biết những nhân viên có cùng tên với người thân
select *
from NHANVIEN n inner join THANNHAN t on n.MANV = t.MA_NVIEN
where n.TEN = t.TENTN

--3 Cho biết những nhân viên không có người thân nào
select *
from NHANVIEN n
where not exists( select * from THANNHAN t where n.MANV = t.MA_NVIEN)

--4 Cho biết những nhân viên có 2 thân nhân trở lên
select *
from NHANVIEN
where MANV in ( select n.MANV
				from NHANVIEN n inner join THANNHAN t on n.MANV = t.MA_NVIEN
				group by n.MANV
				having COUNT(t.MA_NVIEN) >= 2)

--5 Cho biết những trưởng phòng có tối thiểu 1 thân nhân
select *
from NHANVIEN
where MANV in ( select p.TRPHG
				from PHONGBAN p inner join THANNHAN t on p.TRPHG = t.MA_NVIEN
				group by p.TRPHG
				having COUNT(t.MA_NVIEN) >= 1)

--6 những trưởng phòng có mức lương ít hơn (ít nhất một) nhân viên của mình
select * 
from NHANVIEN n inner join PHONGBAN p on n.MANV = p.TRPHG
where (select COUNT(*) from NHANVIEN n1 where n1.LUONG > n.LUONG and n1.PHG = n.PHG) > 0

--7 cho biết tên phòng, số lượng nhân viên, tỗng lương của từng phòng
select p.TENPHG, COUNT(n.MANV) as SoLuongNV, Sum(n.luong)
from PHONGBAN p inner join NHANVIEN n on p.MAPH =n.PHG
group by p.TENPHG

--8 cho biết mã nhân viên nào có nhiều thân nhân nhất
select MA_NVIEN, Count(MA_NVIEN) as SoThanNhan
from THANNHAN
group by MA_NVIEN
having COUNT(MA_NVIEN) >= all (select COUNT(*)
								from THANNHAN
								group by MA_NVIEN)

--9 với mỗi nhân viên, cho biết họ tên nhân viên và số thân nhân của nhân viên
select n.HONV, n.TEN, COUNT(t.MA_NVIEN) as SoThanNhan
from NHANVIEN n left outer join THANNHAN t on n.MANV = t.MA_NVIEN
group by n.TEN, n.HONV

--10 Cho biết lương trung bình của tất cả nhân viên nữ
select AVG(Luong) as LuongTB
from NHANVIEN
where PHAI = 'nu'

--11 cho biết tên các nhân viên và tên các phòng ban họ quản lý nếu có
select n.TEN, p.TENPHG
from NHANVIEN n left outer join PHONGBAN p on n.MANV = p.TRPHG

--12 Cho biết họ tên nhân viên và tên các đề án nhân viên đó tham gia
select n.HONV + '' + n.TEN as HoTenNV, d.TENDA
from NHANVIEN n inner join PHANCONG p on n.MANV = p.MA_NVIEN inner join DEAN d on p.SODA = d.MADA

--13
--Cho biết họ tên trưởng phòng của phòng có đông nhân viên nhất
select HONV, TEN
from NHANVIEN
where MANV in ( select p.TRPHG
				from PHONGBAN p inner join NHANVIEN n on p.MAPH = n.PHG
				group by p.TRPHG
				having COUNT(p.TRPHG) >= all (select COUNT(p.TRPHG)
												from PHONGBAN p inner join NHANVIEN n on p.MAPH = n.PHG
												group by p.TRPHG))

--14 ứng với mỗi phòng cho biết họ, tên nhân viên có mức lương cao nhất
select TEN, HONV, LUONG, PHG
from NHANVIEN n1
where exists ( select n2.PHG from NHANVIEN n2 
			   where n1.PHG = n2.PHG
			   group by PHG
			   having MAX(n2.LUONG) <= n1.LUONG)

--15 cho biết nhân viên tham gia tất cả các đề án
select n.MANV
from NHANVIEN n inner join PHANCONG p on n.MANV = p.MA_NVIEN
group by n.MANV
having COUNT(p.SODA) = (select COUNT(*) from DEAN)

--16 cho biết nhân viên làm việc cho tất cả các đề án mà phòng số 5 chủ trì
select distinct p1.MA_NVIEN
from PHANCONG p1
where not exists ( select * from DEAN d
					where d.PHONG = 5
					and not exists (select * from PHANCONG p2
									where p1.MA_NVIEN = p2.MA_NVIEN and d.MADA = p2.SODA))

--17 cho biết những nhân viên tham gia tất cả đề án mà có nhân viên '987654321' tham gia

select distinct p.MA_NVIEN
from PHANCONG p
where p.MA_NVIEN <> '987654321'
and not exists ( select *
				 from DEAN d
				 where d.MADA in (select SODA from PHANCONG where MA_NVIEN = '987654321')
				 and not exists ( select *
								  from PHANCONG p2
								  where p2.MA_NVIEN = p.MA_NVIEN and d.MADA = p2.SODA))
