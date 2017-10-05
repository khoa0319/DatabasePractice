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