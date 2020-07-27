USE [master]
GO
/****** Object:  Database [QL_MUABAN_TBDT]    Script Date: 27/07/2019 12:42:05 ******/
CREATE DATABASE [QL_MUABAN_TBDT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_MUABAN_TBDT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_MUABAN_TBDT.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_MUABAN_TBDT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_MUABAN_TBDT_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_MUABAN_TBDT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET  MULTI_USER 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_MUABAN_TBDT]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatDanhMuc]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatDanhMuc]
(
	@MaDM int,
	@TenDM nvarchar(250)
)
as
begin
	update DanhMuc
	set TenDM=@TenDM where MaDM=@MaDM
end




GO
/****** Object:  StoredProcedure [dbo].[CapNhatLoaiSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatLoaiSanPham]
(
	@MaLoai int,
	@MaDM int,
	@TenLoaiSP nvarchar(250)
)
as
begin
	update LoaiSP
	set MaDM = @MaDM,TenLoaiSP=@TenLoaiSP where MaLoai=@MaLoai
end




GO
/****** Object:  StoredProcedure [dbo].[CapNhatSP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatSP]
(
	@MaSP nchar(20),
	@MaThuongHieu int,
	@MaLoai int,
	@TenSP nvarchar(300),
	@Hinh nvarchar(700),
	@GiaBan int,
	@NhaSanXuat nvarchar(250),
	@XuatXu nvarchar(250),
	@DungTich nvarchar(250),
	@ChatLieu nvarchar(250),
	@DoiTuong nvarchar(250),
	@Description nvarchar(Max)

)
as
begin
update SanPham
set MaThuongHieu = @MaThuongHieu,MaLoai=@MaLoai,Hinh=@Hinh,GiaBan=@GiaBan,NhaSanXuat=@NhaSanXuat,XuatXu=@XuatXu,DungTich=@DungTich,ChatLieu=@ChatLieu,DoiTuong=@DoiTuong,TenSP=@TenSP,Description=@Description where MaSP=@MaSP
end




GO
/****** Object:  StoredProcedure [dbo].[CapNhatThuongHieu]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatThuongHieu]
(
	@MaThuongHieu int,
	@TenThuongHieu nvarchar(250)
)
as
begin
	update ThuongHieu
	set TenThuongHieu=@TenThuongHieu where MaThuongHieu=@MaThuongHieu
end




GO
/****** Object:  StoredProcedure [dbo].[CategoryDM]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryDM]
as
begin
select DanhMuc.MaDM,DanhMuc.TenDM,LoaiSP.MaLoai,LoaiSP.TenLoaiSP  from DanhMuc,LoaiSP where DanhMuc.MaDM = LoaiSP.MaDM
end




GO
/****** Object:  StoredProcedure [dbo].[CategoryLoaiSP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryLoaiSP]
as
begin
select LoaiSP.MaLoai,LoaiSP.TenLoaiSP,SanPham.MaSP,SanPham.TenSP,ThuongHieu.MaThuongHieu,ThuongHieu.TenThuongHieu  from LoaiSP,SanPham,ThuongHieu where LoaiSP.MaLoai = SanPham.MaLoai and SanPham.MaThuongHieu = ThuongHieu.MaThuongHieu
end




GO
/****** Object:  StoredProcedure [dbo].[ChangeStatus_KhachHang]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChangeStatus_KhachHang]
(
	@MaKH int,
	@Status bit
)
as
begin
update KhachHang
set Status = @Status where MaKH = @MaKH
end




GO
/****** Object:  StoredProcedure [dbo].[ChangeTinhTrangGiao]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChangeTinhTrangGiao]
(
	@MaDH int,
	@TinhTrangGiaoHang bit,
		@DaThanhToan bit
)
as
begin
update DonHang
set TinhTrangGiaoHang = @TinhTrangGiaoHang,DaThanhToan = @DaThanhToan where MaDH = @MaDH
end




GO
/****** Object:  StoredProcedure [dbo].[ChiTietSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChiTietSanPham]
(
	@MaSP nchar(20)
)
as
begin
	select * from SanPham where MaSP=@MaSP
end




GO
/****** Object:  StoredProcedure [dbo].[LayChiTietHoaDon]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LayChiTietHoaDon]
(
	@MaDH int
)
as
begin
	select   CTDonHang.MaDH,TenSP,SoLuong,DonGia  from CTDonHang,SanPham where SanPham.MaSP = CTDonHang.MaSP and CTDonHang.MaDH = @MaDH
end




GO
/****** Object:  StoredProcedure [dbo].[LayHoaDon]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayHoaDon]
as
begin
	select DISTINCT DonHang.MaDH,KhachHang.HoTen,NgayGiao,NgayDat,DaThanhToan,TinhTrangGiaoHang    from KhachHang,CTDonHang,DonHang where KhachHang.MaKH = DonHang.MaKH and CTDonHang.MaDH = CTDonHang.MaDH
end




GO
/****** Object:  StoredProcedure [dbo].[LayLoaiSanPhamTheoDM]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------- Loai San Pham------------------------------------------------------------------------------------------------------------
create proc [dbo].[LayLoaiSanPhamTheoDM]
(
	@MaDM int
)
as
begin
	select * from LoaiSP where MaDM = @MaDM
end




GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoLoaiSP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LaySanPhamTheoLoaiSP]
(
	@MaLoai int,
	@MaThuongHieu int
) 
as
begin
select * from SanPham where MaLoai = @MaLoai or MaThuongHieu = @MaThuongHieu
end




GO
/****** Object:  StoredProcedure [dbo].[ThemDanhMuc]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------- Danh Muc --------------------------------------------------------------------
create proc [dbo].[ThemDanhMuc]
(
	@TenDM nvarchar(250)
)
as
begin
	Insert into DanhMuc(TenDM) values(@TenDM)
end




GO
/****** Object:  StoredProcedure [dbo].[ThemLoaiSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemLoaiSanPham]
(
	@MaDM int,
	@TenLoaiSP nvarchar(250)
)
as
begin
	insert into LoaiSP(MaDM,TenLoaiSP) values(@MaDM,@TenLoaiSP)
end




GO
/****** Object:  StoredProcedure [dbo].[ThemSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemSanPham]
(
	@MaSP nchar(20),
	@MaThuongHieu int,
	@MaLoai int,
	@Hinh nvarchar(700),
	@GiaBan int,
	@NhaSanXuat nvarchar(250),
	@XuatXu nvarchar(250),
	@DungTich nvarchar(250),
	@ChatLieu nvarchar(250),
	@DoiTuong nvarchar(250),
	@TenSP nvarchar(300),
	@CreatedDate date,
	@Description nvarchar(max)
)
as
begin
	insert into SanPham(MaSP,MaThuongHieu,MaLoai,TenSP,Hinh,GiaBan,NhaSanXuat,XuatXu,DungTich,ChatLieu,DoiTuong,CreatedDate,Description) values(@MaSP,@MaThuongHieu,@MaLoai,@TenSP,@Hinh,@GiaBan,@NhaSanXuat,@XuatXu,@DungTich,@ChatLieu,@DoiTuong,@CreatedDate,@Description)	
end




GO
/****** Object:  StoredProcedure [dbo].[ThemThuongHieu]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------- Thuong Hieu ---------------------------------------------------
create proc [dbo].[ThemThuongHieu]
(
	@TenThuongHieu nvarchar(250)
)
as
begin
	Insert into ThuongHieu(TenThuongHieu) values(@TenThuongHieu)
end




GO
/****** Object:  StoredProcedure [dbo].[TimKiemSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TimKiemSanPham]
(
	@MaSP char(20),
	@TenSP nvarchar(300)
)
as
begin
	select * from SanPham where MaSP = @MaSP or TenSP like @TenSP + '%'
end




GO
/****** Object:  StoredProcedure [dbo].[XoaDanhMuc]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaDanhMuc]
(
	@MaDM int
)
as
begin
	delete from DanhMuc where MaDM=@MaDM
end




GO
/****** Object:  StoredProcedure [dbo].[XoaHoaDon]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaHoaDon]
(
	@MaDH int
)
as
begin
delete from DonHang where MaDH=@MaDH
end




GO
/****** Object:  StoredProcedure [dbo].[XoaLoaiSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaLoaiSanPham]
(
	@MaLoai int
)
as
begin
	delete from LoaiSP where MaLoai=@MaLoai
end




GO
/****** Object:  StoredProcedure [dbo].[XoaSanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaSanPham]
(
	@MaSP nchar(20)
)
as
begin
delete from SanPham where MaSP = @MaSP
end




GO
/****** Object:  StoredProcedure [dbo].[XoaThuongHieu]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaThuongHieu]
(
	@MaThuongHieu int
)
as
begin
	delete from ThuongHieu where MaThuongHieu=@MaThuongHieu
end




GO
/****** Object:  Table [dbo].[CT_PHIEU_NHAP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_PHIEU_NHAP](
	[MAPN] [varchar](100) NOT NULL,
	[MASP] [nchar](20) NOT NULL,
	[SL_NHAP] [int] NULL,
	[GIANHAP] [money] NULL,
 CONSTRAINT [PK_CT_PHIEU_NHAP] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[MaDH] [int] NOT NULL,
	[MaSP] [nchar](20) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](24, 0) NULL,
 CONSTRAINT [PK_CTDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayGiao] [date] NULL,
	[NgayDat] [date] NOT NULL,
	[DaThanhToan] [bit] NOT NULL,
	[TinhTrangGiaoHang] [bit] NOT NULL,
	[TONGTIEN] [money] NULL,
 CONSTRAINT [PK__DonHang__27258661FE3F4F63] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](250) NULL,
	[MatKhau] [varchar](250) NULL,
	[HoTen] [nvarchar](250) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](30) NULL,
	[DienThoai] [nchar](15) NULL,
	[Email] [varchar](250) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[NGAYTAO] [datetime] NULL,
 CONSTRAINT [PK__KhachHan__2725CF1E976E20B9] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NULL,
	[TenLoaiSP] [nvarchar](250) NULL,
 CONSTRAINT [PK__LoaiSP__730A5759B9991D12] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MANCC] [varchar](100) NOT NULL,
	[TENNCC] [nvarchar](500) NULL,
	[DIACHI] [nvarchar](500) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MANCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIENS]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIENS](
	[USERNAME] [varchar](100) NOT NULL,
	[PASS] [varchar](100) NULL,
	[TENNHANVIEN] [nvarchar](200) NULL,
	[EMAIL] [varchar](200) NULL,
	[HOATDONG] [bit] NULL,
 CONSTRAINT [PK_NHANVIENS] PRIMARY KEY CLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHOMQUYENS]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHOMQUYENS](
	[MANHOM] [varchar](100) NOT NULL,
	[TENNHOM] [nvarchar](500) NULL,
	[GHICHU] [nvarchar](500) NULL,
 CONSTRAINT [PK_NHOMQUYENS] PRIMARY KEY CLUSTERED 
(
	[MANHOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHANNHANVIEN_VAONHOMQUYEN]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANNHANVIEN_VAONHOMQUYEN](
	[USERNAME] [varchar](100) NOT NULL,
	[MANHOM] [varchar](100) NOT NULL,
	[GHICHU] [nvarchar](500) NULL,
 CONSTRAINT [PK_PHANNHANVIEN_VAONHOMQUYEN] PRIMARY KEY CLUSTERED 
(
	[USERNAME] ASC,
	[MANHOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHANQUYEN]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANQUYEN](
	[MANHOM] [varchar](100) NOT NULL,
	[MAQUYEN] [varchar](100) NOT NULL,
	[COQUYEN] [bit] NULL,
 CONSTRAINT [PK_PHANQUYEN] PRIMARY KEY CLUSTERED 
(
	[MANHOM] ASC,
	[MAQUYEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEU_NHAP]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEU_NHAP](
	[MAPN] [varchar](100) NOT NULL,
	[NGAYNHAP] [date] NULL,
	[TONGTIEN] [money] NULL,
	[NHACC] [varchar](100) NULL,
 CONSTRAINT [PK_PHIEU_NHAP] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUYENS]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUYENS](
	[MAQUYEN] [varchar](100) NOT NULL,
	[TENQUYEN] [nvarchar](500) NULL,
	[GHICHU] [nvarchar](max) NULL,
 CONSTRAINT [PK_QUYENS] PRIMARY KEY CLUSTERED 
(
	[MAQUYEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 27/07/2019 12:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](20) NOT NULL,
	[MaLoai] [int] NULL,
	[TenSP] [nvarchar](300) NULL,
	[Hinh] [nvarchar](700) NULL,
	[GiaBan] [int] NULL,
	[CreatedDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[SL_TON] [int] NULL,
	[ISDELETE] [bit] NULL,
 CONSTRAINT [PK__SanPham__2725081CCF802F76] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP18                ', 2, 2.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP26                ', 2, 20000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP3                 ', 1000, 4.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP33                ', 2, 10.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP34                ', 2, 2500.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP5                 ', 2, 10000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN01', N'SP6                 ', 1, 5000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN100', N'SP1                 ', 2, 100.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN100', N'SP15                ', 3, 100.0000)
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1121, N'SP12                ', 1, CAST(127000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1121, N'SP13                ', 1, CAST(68000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1121, N'SP21                ', 1, CAST(449000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1122, N'SP1                 ', 1, CAST(359000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1122, N'SP10                ', 4, CAST(250000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1123, N'SP12                ', 2, CAST(127000 AS Decimal(24, 0)))
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (2, N'Bỉm tã & vệ sinh')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (7, N'Đồ chơi TOYCITY')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (4, N'Mẹ bầu & Sau sinh')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (14, N'Nestle NAN Optipro 2')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (8, N'Phiếu & Quà tặng')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (3, N'Sơ sinh & Trẻ nhỏ')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (1, N'Sữa & Thực phẩm')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (5, N'Thời trang bé gái')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (6, N'Thời trang bé trai')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (24, N'Viet DD')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (26, N'Viet DD123')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [TONGTIEN]) VALUES (1121, 58, NULL, CAST(0x00000000 AS Date), 1, 0, 644000.0000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [TONGTIEN]) VALUES (1122, 58, NULL, CAST(0x00000000 AS Date), 1, 0, 1359000.0000)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [TONGTIEN]) VALUES (1123, 58, NULL, CAST(0x00000000 AS Date), 1, 0, 254000.0000)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status], [NGAYTAO]) VALUES (57, N'user01', N'123', N'Nguyen Quoc Viet', NULL, N'nam                           ', N'0398768860     ', NULL, NULL, 1, CAST(0x0000AA8C00EDEA5A AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status], [NGAYTAO]) VALUES (58, N'user02', N'123', N'Nguoi Vo Danh', NULL, N'nữ                            ', N'0398768870     ', NULL, NULL, 1, CAST(0x0000AA8C00EDECA5 AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (1, 1, N'Sữa bột cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (2, 1, N'Sữa nước các loại')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (3, 1, N'Bột ăn dặm')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (4, 1, N'Bánh & Kẹo cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (5, 1, N'Cháo & mì cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (6, 1, N'Dinh dưỡng đóng lọ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (7, 1, N'Thực phẩm chế biến')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (8, 1, N'Dinh dưỡng cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (9, 2, N'Thế giới Bỉm Tã')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (10, 2, N'Tắm & Gội toàn thân')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (11, 2, N'Nước rửa bình sữa')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (12, 2, N'Dưỡng da & Phấn thơm')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (13, 2, N'Giặt xả quần áo')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (14, 2, N'Thế giới khăn ướt')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (15, 2, N'Khăn khô & Khăn giấy')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (16, 2, N'Nước hoa & quà tặng')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (17, 3, N'Thời trang sơ sinh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (18, 3, N'Đồ chơi sơ sinh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (19, 3, N'Đồ dùng bé bú')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (20, 3, N'Đồ dùng bé ngủ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (21, 3, N'Các loại xe & Đai, Địu')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (22, 3, N'Dụng cụ vệ sinh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (23, 3, N'Sức khỏe & An toàn')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (24, 3, N'Dụng cụ bé ăn')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (25, 4, N'Sữa cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (26, 4, N'Thực phẩm cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (27, 4, N'Mỹ phẩm cho mẹ')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (28, 4, N'Mẹ chăm bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (29, 4, N'Tắm & Gọi các loại')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (30, 4, N'Máy hút sữa')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (31, 4, N'Đầm bầu & Đồ lót')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (32, 4, N'Vệ sinh & Condom')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (33, 5, N'Đầm & Chân váy')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (34, 5, N'Bộ, Quần & Áo')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (35, 5, N'Đồ chơi cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (36, 5, N'Đồ ngủ & Đồ lót')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (37, 5, N'Quần Jean & Kaki')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (38, 5, N'Phụ kiện thời trang')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (39, 5, N'Ba lô & Túi xách')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (40, 5, N'Giày dép & Sandal')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (41, 6, N'Sơ mi bé trai')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (42, 6, N'Bộ, Quần & Áo 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (43, 6, N'Đồ chơi cho bé 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (44, 6, N'Đồ ngủ & Đồ lót 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (45, 6, N'Quần Jean & Kaki 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (46, 6, N'Phụ kiện thời trang 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (47, 6, N'Giày dép & Sandal 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (48, 6, N'Ba lô & Túi xách 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (49, 7, N'Đồ chơi sơ sinh 1')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (50, 7, N'Đồ chơi bé gái')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (51, 7, N'Đồ chơi bé trai')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (52, 7, N'Đồ chơi cát & Nước')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (53, 7, N'Bóng, Banh & Nhá banh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (54, 7, N'Xe lắc & Chòi chân')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (55, 7, N'Scooter & Vận Động')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (56, 7, N'Xe đạp & Xe 3 bánh')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (57, 8, N'Tổ chức tiệc')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (58, 8, N'Gói quà')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (59, 8, N'Phiếu quà tặng')
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP]) VALUES (60, 2, N'fe')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC01', N'nha cung cap viet saclo', N'ha noi')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC02', N'nhà cung cấp lapmasterhh', N'hcm')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC03', N'nhà cung cấp tri tue viet', N'hcm')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC04', N'tét', N'hihi')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC05', N'tét', N'ss')
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'admin', N'123', N'Giam Doc', N'giamdoc@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'user1', N'123', N'Ten User 1', N'user1@gmail.com', 1)
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'Nhóm người dùng thường', N'Những nhân viên được tạo sẽ mặt định có những quyền trong nhóm này')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'PHONG_BANHANG', N'Phòng bán hàng', N'Phòng ban chứ những viên bán hàng')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'PHONG_KHO', N'Phòng Ban Kho', N'Nhóm chứa những nhân viên quản lý kho')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'Phòng Quản Trị Quyền Của Nhóm Và Phân Nhân Viên Vào Nhóm', N'Phòng ban chứa những nhân viên có nhiệm vụ phần quyền cho nhóm vào phân nhân viên vào nhóm')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'NHOM_NGUOI_DUNG_THUONG', N'Giám đốc mặc định có chứa quyền của người dùng thường')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'PHONG_BANHANG', N'Giám đốc ở trong phòng này')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'PHONG_KHO', N'Giám đốc ở trong phòng này')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'PHONG_QUAN_TRI_QUYEN', N'Giám đốc nhé')
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_DANG_XUAT', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_NHAP', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_PHAN_NHANVIEN_VAO_NHOM_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_PHAN_QUYEN_CHO_NHOM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_BAN_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_BAO_HANH', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_DANH_MUC', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_KHACH_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_LOAI_SAN_PHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_NHA_CUNG_CAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_NHAN_VIEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_NHOM_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_PHIEU_NHAP_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_QL_SANPHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_THONG_TIN_UNG_DUNG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_XEM_THONG_TIN_CANHAN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'MH_XUAT', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_DANG_XUAT', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_NHAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_PHAN_NHANVIEN_VAO_NHOM_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_PHAN_QUYEN_CHO_NHOM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_BAN_HANG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_BAO_HANH', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_DANH_MUC', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_KHACH_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_LOAI_SAN_PHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_NHA_CUNG_CAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_NHAN_VIEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_NHOM_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_PHIEU_NHAP_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_SANPHAM', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_THONG_TIN_UNG_DUNG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_XEM_THONG_TIN_CANHAN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_XUAT', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_DANG_XUAT', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_NHAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_PHAN_NHANVIEN_VAO_NHOM_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_PHAN_QUYEN_CHO_NHOM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_BAN_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_BAO_HANH', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_DANH_MUC', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_KHACH_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_LOAI_SAN_PHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_NHA_CUNG_CAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_NHAN_VIEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_NHOM_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_PHIEU_NHAP_HANG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_QUYEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_QL_SANPHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_THONG_TIN_UNG_DUNG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_XEM_THONG_TIN_CANHAN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_KHO', N'MH_XUAT', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_DANG_XUAT', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_NHAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_PHAN_NHANVIEN_VAO_NHOM_QUYEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_PHAN_QUYEN_CHO_NHOM', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_BAN_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_BAO_HANH', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_DANH_MUC', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_KHACH_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_LOAI_SAN_PHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_NHA_CUNG_CAP', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_NHAN_VIEN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_NHOM_QUYEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_PHIEU_NHAP_HANG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_QUYEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_QL_SANPHAM', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_THONG_TIN_UNG_DUNG', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_XEM_THONG_TIN_CANHAN', 0)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'MH_XUAT', 0)
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN01', CAST(0xE43F0B00 AS Date), 74024.0000, N'NCC01')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN02', CAST(0xE43F0B00 AS Date), NULL, N'NCC02')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN03', CAST(0xE43F0B00 AS Date), 0.0000, N'NCC01')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN05', CAST(0xE43F0B00 AS Date), 0.0000, N'NCC01')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN06', CAST(0xE43F0B00 AS Date), 0.0000, N'NCC01')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN100', CAST(0xEB3F0B00 AS Date), 500.0000, N'NCC01')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_DANG_XUAT', N'Chức năng đăng xuất', N'Chức năng đăng xuất, khi nhân viên đăng nhập vào hệ thống')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_NHAP', N'Màn hình nhập trên ứng dụng', N'Chức năng nhập trên ứng dụng')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_PHAN_NHANVIEN_VAO_NHOM_QUYEN', N'Quản lý phân nhân viên vào nhóm quyền', N'Người có nhiệm vụ phân những nhân vào vào các nhóm, các phòng ban')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_PHAN_QUYEN_CHO_NHOM', N'Quản lý phân quyền cho nhóm', N'Người có nhiệm vụ phân quyền cho các nhóm, các phòng ban')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_BAN_HANG', N'Quản lý bán hàng', N'Nhân viên đứng quày bán hàng, In hóa đơn cho khách')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_BAO_HANH', N'Quản lý bảo hành', N'Thêm, xóa, sửa trên bảng bảo hành')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_DANH_MUC', N'Quản lý danh mục', N'Thêm, xóa, sửa trên bảng danh mục')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_KHACH_HANG', N'Quản lý khách hàng', N'Thêm, xóa, sửa trên bảng khách hàng')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_LOAI_SAN_PHAM', N'Quản lý loại sản phẩm', N'Thêm, xóa, sửa trên bảng loại sản phẩm')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_NHA_CUNG_CAP', N'Quản lý nhà cung cấp', N'Thêm, xóa, sửa trên bảng nhà cung cấp')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_NHAN_VIEN', N'Quản lý nhân viên', N'Thêm, xóa, sửa trên bảng nhân viên')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_NHOM_QUYEN', N'Quản lý các nhóm quyền trên ứng dụng', N'Thêm, xóa, sửa trên bảng nhóm quyền')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_PHIEU_NHAP_HANG', N'Quản lý phiếu nhập hàng', N'Thêm, xóa, sửa trên form quản lý phiếu nhập hàng')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_QUYEN', N'Quản lý các quyền trên ứng dụng', N'Thêm, xóa, sửa trên bảng quyền')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_QL_SANPHAM', N'Quản lý Sản Phẩm', N'Thêm, xóa, sửa trên bảng sản phẩm')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_THONG_TIN_UNG_DUNG', N'Màn hình thông tin ứng dụng', N'Chức năng xem thông tin của ứng dụng')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_XEM_THONG_TIN_CANHAN', N'Màn hình xem thông tin cá nhân', N'Chức năng xem thông tin cá nhân khi nhân viên đăng nhập vào hệ thống')
INSERT [dbo].[QUYENS] ([MAQUYEN], [TENQUYEN], [GHICHU]) VALUES (N'MH_XUAT', N'Màn hình xuất trên ứng dụng', N'Chức năng xuất trên ứng dụng')
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'245                 ', 15, N'324234', N'imgNotFound.jpg', 234, CAST(0xF23F0B00 AS Date), N'', 234234, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'3245v3              ', 1, N'erg', N'sp2019_7_26_8_30_53.jpg', 44, CAST(0xF13F0B00 AS Date), N'', 434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'3rerer              ', 1, N'sdfsdf', N'sp2019_7_26_8_28_19.jpg', 343, CAST(0xF13F0B00 AS Date), N'dfs d', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'43434df             ', 1, N'adasdq23', N'sp2019_7_26_8_22_49.jpg', 343423, CAST(0xF13F0B00 AS Date), N'', 343, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'45ewe               ', 1, N'sdfwr', N'sp2019_7_26_8_24_24.jpg', 4334, CAST(0xF13F0B00 AS Date), N'', 343, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'4efr4r34            ', 1, N'sadfsdf', N'sp2019_7_26_8_58_7.jpg', 24234, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'4t4w3tfw3           ', 1, N'3434', N'sp2019_7_26_9_10_43.jpg', 434, CAST(0xF13F0B00 AS Date), N'sdf ', 34, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'5254                ', 15, N'324r', N'sp2019_7_26_9_36_2.jpg', 34, CAST(0xF13F0B00 AS Date), N'-]=

', 343434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'542354rwerf         ', 1, N'sdfwr434', N'sp2019_7_26_9_21_28.jpg', 343, CAST(0xF13F0B00 AS Date), N'rqewrer rr3 ', 343, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'544235345           ', 3, N'w454w5', N'sp2019_7_26_9_13_47.jpg', 5434, CAST(0xF13F0B00 AS Date), N'swtrww4', 34, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'adfasdf             ', 1, N'sdfsdf', N'sp2019_7_26_9_11_7.jpg', 34, CAST(0xF13F0B00 AS Date), N'', 343, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asdf                ', 1, N'3434', N'sp2019_7_26_8_58_19.jpg', 234234, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asdfsadf            ', 1, N'sdf', N'sp2019_7_26_9_7_40.jpg', 34, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asdfsf34            ', 1, N'sdfas', N'imgNotFound.jpg', 334, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asdfsr34r34         ', 1, N'3434', N'sp2019_7_26_9_26_39.jpg', 343, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asfd                ', 1, N'safsdf', N'', 343, CAST(0xF03F0B00 AS Date), N'fsadsw4r5 er ', 234, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asff                ', 1, N'sf3434', N'imgNotFound.jpg', 434, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'asfsadf             ', 1, N'334sfsf34', N'imgNotFound.jpg', 34, CAST(0xF13F0B00 AS Date), N'', 3434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'fasf334             ', 1, N'3434', N'imgNotFound.jpg', 34, CAST(0xF13F0B00 AS Date), N'', 33434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'fsadfsdfsf          ', 1, N's3rrw ', N'sp2019_7_26_8_17_44.jpg', 434, CAST(0xF13F0B00 AS Date), N'', 343, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'fsdfs               ', 41, N'sfsfd', N'sp2019_7_25_22_47_35.jpg', 4, CAST(0xF03F0B00 AS Date), N'dfsdf', 5435, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'fsdfsdf             ', 1, N'sdfsdf', N'sp2019_7_26_8_19_22.jpg', 342, CAST(0xF13F0B00 AS Date), N'', 223, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'sadf                ', 2, N'sadf', N'sp2019_7_25_22_50_2.jpg', 324, CAST(0xF03F0B00 AS Date), N'afdadf', 343, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'sadfwrw54           ', 7, N'sfsdfsdf', N'sp2019_7_25_22_50_24.jpg', 234, CAST(0xF03F0B00 AS Date), N'zfdf 
ewtr', 24234, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'sdf                 ', 7, N'sdfsdf', N'', 3434, CAST(0xF03F0B00 AS Date), N'dfsdfsdf s sfd s d', 454, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'sdfsdf              ', 2, N'42 sdf', N'', 245245, CAST(0xF03F0B00 AS Date), N'eafdaf', 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'sfsdfer43           ', 1, N'srtfrt', N'sp2019_7_26_8_29_46.jpg', 33, CAST(0xF13F0B00 AS Date), N'', 434, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SO1                 ', 2, N'asdf', N'', 34, CAST(0xF03F0B00 AS Date), N'vdfg dgg sf', 344, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP01                ', 1, N'Dell system vostro 3450', N'sp2019_7_27_12_38_25.jpg', 10000000, CAST(0xF23F0B00 AS Date), N'Laptop tầm trung', 6, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP02                ', 1, N'66', N'imgNotFound.jpg', 343, CAST(0xF23F0B00 AS Date), N'', 34, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'sp022               ', 1, N'666', N'sp2019_7_27_11_47_32.jpg', 434, CAST(0xF23F0B00 AS Date), N'', 324, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP03                ', 1, N'Oppo Neo 7', N'sp2019_7_27_12_39_10.jpg', 3000000, CAST(0xF23F0B00 AS Date), N'Điện thoại tầm trung', 10, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP04                ', 1, N'Laptop MSI', N'sp2019_7_27_12_39_48.jpg', 20000000, CAST(0xF23F0B00 AS Date), N'Laptop cao cấp', 12, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP05                ', 1, N'Laptop Dell trolim456', N'sp2019_7_27_12_40_56.jpg', 15000000, CAST(0xF23F0B00 AS Date), N'Laptop tầm trung', 3, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP1                 ', 1, N'Nestle NAN Optipro 2', N'h1.png', 359000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP10                ', 2, N'Thức uống lúa mạch uống liền Nestle Milo', N'h10.png', 250000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP11                ', 3, N'Bột ăn dặm Ridielac Gold 4 Vị Mặn', N'h11.png', 58000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP12                ', 3, N'Bột sữa DD HiPP bổ sung Praebiotik', N'h12.png', 127000, CAST(0x66400B00 AS Date), NULL, 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP13                ', 4, N'Bánh Ăn Dặm Gerber vị Chuối', N'h13.png', 68000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP14                ', 4, N' Bánh Ăn Dặm Gerber vị Táo Dâu', N'h14.png', 68000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP15                ', 5, N'Cháo tươi Baby bò đậu hà lan cà rốt', N'h15.png', 24000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP16                ', 5, N'Cháo tươi Baby Tôm Rau Ngót Nhật', N'h16.png', 24000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP17                ', 6, N'Yến Thiên Việt', N'h17.png', 295000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP18                ', 6, N'Yến Babi Bird ', N'h18.png', 65000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP19                ', 7, N'Bột cá hồi US Food', N'h19.png', 130000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP20                ', 8, N'Ensure Gold HMB Hương Vani', N'h20.png', 729000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP21                ', 8, N'Friso Mum Gold hương Cam', N'h21.png', 449000, CAST(0x66400B00 AS Date), NULL, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP22                ', 9, N'Tã dán Nhật cao cấp Genki', N'h22.png', 375000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP23                ', 9, N'Tã quần Nhật cao cấp Genki', N'h23.png', 255000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP24                ', 10, N'Tắm gội hạnh nhân cho sơ sinh và trẻ nhỏ Cadum', N'h24.png', 245000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP25                ', 11, N'Nước rửa bình sữa & rau quả D-nee', N'h25.png', 75000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP26                ', 12, N'Phấn rôm sơ sinh ngừa hăm Cadum', N'h26.png', 148000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP27                ', 12, N'Dầu Massage và dưỡng ẩm Johnson Baby', N'h27.png', 85000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP28                ', 13, N'Nước giặt Enfant xanh dương', N'h28.png', 179000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP29                ', 14, N'Khăn ướt chiết xuất tự nhiên Aga-ae', N'h29.png', 43000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP3                 ', 1, N'Meiji Infant Formula', N'h3.png|h33.png|h4.png', 529000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP30                ', 17, N'Mũ Bảo Vệ Đầu Cho Bé Mumguard Hình Bọ Cánh Cam', N'h30.png', 249000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP31                ', 17, N'Bộ thun bé trai ngắn CF', N'h31.png', 159000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP32                ', 18, N' Xe bus âm nhạc', N'h32.png', 185000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP33                ', 18, N' Lật đật con gà vàng', N'h33.png', 85000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP34                ', 19, N'Bình sữa cổ rộng nhựa PPSU Pigeon', N'h34.png', 335000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP35                ', 20, N'Nôi Mềm 2 Tầng 3 Sao', N'h35.png', 2090000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP36                ', 21, N'Xe tập đi Tobby bập bênh, có nhạc', N'h36.png', 845000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP37                ', 22, N'Khăn vải khô đa năng Mama', N'h37.png', 52000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP38                ', 23, N'Nhiệt kế hồng ngoại đo trán', N'h38.png', 850000, CAST(0x38400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP39                ', 24, N'Ghế gỗ cao cấp cho bé ', N'h39.png', 1150000, CAST(0x3A400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP4                 ', 1, N'Meiji Growing up Formula', N'', 459000, CAST(0xF03F0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 4545, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP40                ', 33, N'Đầm vải bé gái CF', N'h40.png', 149000, CAST(0x4C400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP41                ', 41, N'Áo vải bé trai tay dài CF', N'', 189000, CAST(0xF03F0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 54, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP42                ', 34, N'Bộ thun bé gái ngắn CF', N'h42.png', 139000, CAST(0x53400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP43                ', 42, N'Bộ thun bé trai ngắn CF', N'h43.png', 149000, CAST(0x51400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP5                 ', 1, N'Frisolac Gold số 2 Sunrise', N'h5.png|h7.png|h4.png', 469000, CAST(0x52400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP6                 ', 2, N'Pediasure dạng lỏng hương vani ', N'h6.png|h33.png|h37.png', 215000, CAST(0x54400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP7                 ', 2, N'Ensure Gold Vigor', N'h7.png|h4.png|h3.png', 259000, CAST(0x55400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP8                 ', 2, N'Abbott Grow Gold hương vani', N'h8.png', 58000, CAST(0x56400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP9                 ', 2, N'Sữa uống dinh dưỡng Optimum Gold', N'h9.png', 49000, CAST(0x57400B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'ttfdsgfg            ', 1, N'dfgs', N'sp2019_7_26_8_32_7.jpg', 3434, CAST(0xF13F0B00 AS Date), N'', 343, 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TenDM]    Script Date: 27/07/2019 12:42:05 ******/
ALTER TABLE [dbo].[DanhMuc] ADD  CONSTRAINT [Uni_TenDM] UNIQUE NONCLUSTERED 
(
	[TenDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_DienThoai]    Script Date: 27/07/2019 12:42:05 ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Uni_DienThoai] UNIQUE NONCLUSTERED 
(
	[DienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TaiKhoan]    Script Date: 27/07/2019 12:42:05 ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Uni_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TenLoaiSP]    Script Date: 27/07/2019 12:42:05 ******/
ALTER TABLE [dbo].[LoaiSP] ADD  CONSTRAINT [Uni_TenLoaiSP] UNIQUE NONCLUSTERED 
(
	[TenLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_NgayDat]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_DaThanhToan]  DEFAULT ((0)) FOR [DaThanhToan]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_TinhTrangGiaoHang]  DEFAULT ((0)) FOR [TinhTrangGiaoHang]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SLTON]  DEFAULT ((0)) FOR [SL_TON]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [ISDELETE]
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PHIEUNHAP] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PHIEU_NHAP] ([MAPN])
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP] CHECK CONSTRAINT [FK_CTPN_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_SANPHAM] FOREIGN KEY([MASP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CT_PHIEU_NHAP] CHECK CONSTRAINT [FK_CTPN_SANPHAM]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DH] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DH]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_SP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_SP]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DH_KH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DH_KH]
GO
ALTER TABLE [dbo].[LoaiSP]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSP_DM] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[LoaiSP] CHECK CONSTRAINT [FK_LoaiSP_DM]
GO
ALTER TABLE [dbo].[PHANNHANVIEN_VAONHOMQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANNV_NHANVIEN] FOREIGN KEY([USERNAME])
REFERENCES [dbo].[NHANVIENS] ([USERNAME])
GO
ALTER TABLE [dbo].[PHANNHANVIEN_VAONHOMQUYEN] CHECK CONSTRAINT [FK_PHANNV_NHANVIEN]
GO
ALTER TABLE [dbo].[PHANNHANVIEN_VAONHOMQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANNV_NHOMQUYENS] FOREIGN KEY([MANHOM])
REFERENCES [dbo].[NHOMQUYENS] ([MANHOM])
GO
ALTER TABLE [dbo].[PHANNHANVIEN_VAONHOMQUYEN] CHECK CONSTRAINT [FK_PHANNV_NHOMQUYENS]
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANQUYEN_NHOMQUYEN] FOREIGN KEY([MANHOM])
REFERENCES [dbo].[NHOMQUYENS] ([MANHOM])
GO
ALTER TABLE [dbo].[PHANQUYEN] CHECK CONSTRAINT [FK_PHANQUYEN_NHOMQUYEN]
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANQUYEN_QUYENS] FOREIGN KEY([MAQUYEN])
REFERENCES [dbo].[QUYENS] ([MAQUYEN])
GO
ALTER TABLE [dbo].[PHANQUYEN] CHECK CONSTRAINT [FK_PHANQUYEN_QUYENS]
GO
ALTER TABLE [dbo].[PHIEU_NHAP]  WITH CHECK ADD  CONSTRAINT [FK_PHIEU_NHAP_NHACC] FOREIGN KEY([NHACC])
REFERENCES [dbo].[NHACUNGCAP] ([MANCC])
GO
ALTER TABLE [dbo].[PHIEU_NHAP] CHECK CONSTRAINT [FK_PHIEU_NHAP_NHACC]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SP_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SP_LoaiSP]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [CHK_DonGia] CHECK  ((len([DonGia])>(3)))
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [CHK_DonGia]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [CHK_SoLuong] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [CHK_SoLuong]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [CHK_NgayDat_NgayGiao] CHECK  ((datediff(day,[NgayDat],[NgayGiao])>=(0)))
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [CHK_NgayDat_NgayGiao]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CHK_DienThoai] CHECK  ((len([DienThoai])>=(8) AND len([DienThoai])<=(12)))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CHK_DienThoai]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CHK_GioiTinh] CHECK  (([GioiTinh]='Nam' OR [GioiTinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CHK_GioiTinh]
GO
USE [master]
GO
ALTER DATABASE [QL_MUABAN_TBDT] SET  READ_WRITE 
GO
