use master
drop database QLThuVien
create database QLThuVien
go

use QLThuVien
go

-------------------------------------------------------------------------------------------------------------
----------------------------------------------------- Loại độc giả ------------------------------------------

create table TLoaiDocGia
(
	id int identity primary key,
	loaiDocGia nvarchar(50),
	ghiChu nvarchar(200)
)

create table TThanhVien
(
	id int identity Primary Key,
	name nvarchar(50),
	address nvarchar(50),
	Email nvarchar(50),
	Birthday date,
	NgayLap date default getdate(),
	ThoiGianHieuLuc date,
	
	loaiDocGia int not null,
	Diem int default 10,			--- Điểm hoạt động để xét thể loại độc giả
	status tinyint default 0,		--- Tình trạng có mượn sách chưa

	foreign key(loaiDocGia) references dbo.TLoaiDocGia(id)
)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------- Sách -----------------------------------------------
create table TTheLoai
(
	Id int identity primary key,
	ten nvarchar(50)
)
create table TTacGia
(
	id int identity primary key,
	tenTacGia nvarchar(50),
	thongTin nvarchar(200)
)
create table TSach
(
	id int identity primary key,
	idTheLoai int not null,
	idTacGia int not null,
	
	TenSach nvarchar(50),
	NhaXuatBan nvarchar(50),

	NgayNhap date default getdate(),	
	
	NamXuatBan int,
	GiaTri int default 0,	
	tiLeHong int default 0,
	SoLuong int default 0,

	foreign key (idTheLoai) references dbo.TTheLoai(id),
	foreign key (idTheLoai) references dbo.TTheLoai(id)
)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------- Mượn sách ------------------------------------------
create table TPhieuMuonSach
(
	id int identity primary key,
	idNguoiMuon int not null,

	tongSach int default 0,
	tienUng int default 0,
	ngayMuon date default getdate(),
	ngayTraTreNhat date,

	foreign key(idNguoiMuon) references dbo.TThanhVien(id)
)
create table TThongTinMuon
(
	id int identity primary key,
	idSach int not null,
	idPhieu int not null, 
	idNguoiMuon int not null,
	soLuong int not null default 1,	--- Số lượng mượn

	status int default 0, --- 0 : Chưa trả , 1 : đã trả

	foreign key(idSach) references dbo.TSach(id),
	foreign key(idPhieu) references dbo.TPhieuMuonSach(id)
)

----------------------------------------------------------------------------------------------------------
----------------------------------------------------- Quyên góp ------------------------------------------

create table TPhieuQuyenGop
(
	idThanhVien int not null,
	soSach int not null,
	soTien int not null,
	soDiemHoatDong int default 0,
	
	foreign key(idThanhVien) references dbo.TThanhVien(id)
)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------- Chức vụ --------------------------------------------
create table TChucVu
(
	id int primary key,
	ten nvarchar(50),
	status int
)

create table TQuanLy
(
	username nvarchar(50) primary key,
	tenHienThi nvarchar(50),
	pass nvarchar(50) not null,
	diaChi nvarchar (100),
	ngaySinh date,
	ChucVu int not null,
	status tinyint default 0,
	foreign key(chucVu) references dbo.TChucVu(id)
)
----------------------------------------------------------------------------------------------------------
----------------------------------------------------- Chức năng ------------------------------------------
create table TChucNang
(
	id int identity primary key,
	tenChucNang nvarchar(50),
	ghiChu nvarchar(500)
)
create table TPhanQuyen
(
	id int identity primary key,
	idChucVu int not null,
	foreign key (idChucVu) references dbo.TChucVu(id)
)
create table TChiTietPhanQuyen
(
	id int identity primary key,
	idChucNang int not null,
	idBanPQ int not null,
	status tinyint default 0,

	foreign key (idChucNang) references dbo.TChucNang(id),
	foreign key (idBanPQ) references dbo.TPhanQuyen(id)
)
---------------------------------------------------------------------------------------------------------
----------------------------------------------------- Thu  quy ------------------------------------------

create table TThuQuy
(
	tien int default 0
)
---------------------------------------------------------------------------------------------------------
----------------------------------------------------- Chat box ------------------------------------------
create table TChatBox
(
	id int identity primary key,
	thoiGian time,
	noiDung nvarchar(400),
)

create table TChatGroup
(
	id int identity primary key,

)
create table TinforChatBox