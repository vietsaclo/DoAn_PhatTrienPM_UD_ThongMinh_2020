USE [master]
GO
/****** Object:  Database [QL_MUABAN_TBDT]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatDanhMuc]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatLoaiSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatSP]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatThuongHieu]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoryDM]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoryLoaiSP]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ChangeStatus_KhachHang]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ChangeTinhTrangGiao]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[LayChiTietHoaDon]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[LayHoaDon]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[LayLoaiSanPhamTheoDM]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoLoaiSP]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ThemDanhMuc]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ThemLoaiSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ThemSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ThemThuongHieu]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[TimKiemSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[XoaDanhMuc]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[XoaHoaDon]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[XoaLoaiSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[XoaSanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  StoredProcedure [dbo].[XoaThuongHieu]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[CT_PHIEU_NHAP]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/08/2020 08:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](250) NULL,
	[ISDELETE] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/08/2020 08:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayGiao] [date] NULL,
	[NgayDat] [date] NOT NULL,
	[DaThanhToan] [bit] NOT NULL,
	[TinhTrangGiaoHang] [bit] NOT NULL,
	[TONGTIEN] [money] NULL,
	[NVLAP] [varchar](100) NULL,
 CONSTRAINT [PK__DonHang__27258661FE3F4F63] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 12/08/2020 08:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NULL,
	[TenLoaiSP] [nvarchar](250) NULL,
	[ISDELETE] [bit] NULL,
 CONSTRAINT [PK__LoaiSP__730A5759B9991D12] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[NHANVIENS]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[NHOMQUYENS]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[PHANNHANVIEN_VAONHOMQUYEN]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[PHANQUYEN]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[PHIEU_NHAP]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[QUYENS]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/08/2020 08:47:09 ******/
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
/****** Object:  View [dbo].[V_CTHOADON_IN]    Script Date: 12/08/2020 08:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CTHOADON_IN] AS SELECT C.MaSP, S.TenSP, C.SoLuong, C.DonGia FROM SanPham S, CTDonHang C WHERE S.MaSP = C.MaSP AND MaDH = 1170
GO
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN000000000000000003', N'SP000001            ', 1, 24000000.0000)
INSERT [dbo].[CT_PHIEU_NHAP] ([MAPN], [MASP], [SL_NHAP], [GIANHAP]) VALUES (N'PN000000000000000004', N'SP000001            ', 10, 24000000.0000)
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1169, N'SP000001            ', 1, CAST(24000000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1169, N'SP000002            ', 1, CAST(12500000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1170, N'SP000001            ', 2, CAST(24000000 AS Decimal(24, 0)))
INSERT [dbo].[CTDonHang] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1170, N'SP000002            ', 1, CAST(12500000 AS Decimal(24, 0)))
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [ISDELETE]) VALUES (33, N'Laptop', 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [ISDELETE]) VALUES (34, N'Điện Thoại Di Động', 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [ISDELETE]) VALUES (35, N'Máy Tính Bảng', 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [ISDELETE]) VALUES (36, N'Sạc Dự Phòng', 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [ISDELETE]) VALUES (37, N'Tai Nghe', 0)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [TONGTIEN], [NVLAP]) VALUES (1169, 65, NULL, CAST(0x01400B00 AS Date), 1, 0, 36500000.0000, NULL)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [TONGTIEN], [NVLAP]) VALUES (1170, 64, NULL, CAST(0x01400B00 AS Date), 1, 0, 60500000.0000, NULL)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status], [NGAYTAO]) VALUES (63, N'lanhnguyen', N'123456', N'Nguyễn Thị Lành', CAST(0x6DB83700 AS Date), N'nữ                            ', N'0398768860     ', N'lanhnguyen@gmail.com', N'Thành Phố Hồ Chính Minh', 1, CAST(0x0000AAA600F7548B AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status], [NGAYTAO]) VALUES (64, N'vanmuoi', N'123456', N'Nguyễn Văn Mười', CAST(0x6DB83700 AS Date), N'nam                           ', N'0398768870     ', N'muoi@gmaidl.com', N'Hải Phòng', 1, CAST(0x0000AAA600F7A39E AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [DiaChi], [Status], [NGAYTAO]) VALUES (65, N'dotuuyen', N'123456', N'Đỗ Thị Tú Bà', CAST(0x6DB83700 AS Date), N'nữ                            ', N'0398768880     ', N'dotuuyen@gmail.com', N'Thành Phố Hồ Chí Minh', 0, CAST(0x0000AAA600F7ECC6 AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (62, 33, N'Loai sp 11', 1)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (63, 33, N'Loai sp 1', 1)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (64, 33, N'Laptop Macbook', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (65, 33, N'Laptop Asus', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (66, 33, N'Laptop HP', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (67, 33, N'Laptop Lenovo', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (68, 33, N'Laptop Acer', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (69, 33, N'Laptop Dell', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (70, 33, N'Laptop Huawei', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (71, 34, N'Điện Thoại IPhone', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (72, 34, N'Điện Thoại Samsung', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (73, 34, N'Điện Thoại Oppo', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (74, 34, N'Điện Thoại Xiaomi', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (75, 34, N'Điện Thoại Vivo', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (76, 34, N'Điện Thoại RealMe', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (77, 34, N'Điện Thoại VSMart', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (78, 35, N'Máy Tính Bảng Ipad', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (79, 35, N'Máy Tính Bảng Sumsung', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (80, 35, N'Máy Tính Bảng Huawei', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (81, 35, N'Máy Tính Bảng Lenovo', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (82, 35, N'Máy Tính Bảng Masstel', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (83, 35, N'Máy Tính Bảng Mobell', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (84, 36, N'Sạn Dự Phòng Anker', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (85, 36, N'Sạc Dự Phòng Energizer', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (86, 36, N'Sạc Dự Phòng Aukey', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (87, 36, N'Sạc Dự Phòng Xmobile', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (88, 36, N'Sạc Dự Phòng Xiaomi', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (89, 36, N'Sạc Dự Phòng E.valu', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (90, 36, N'Sạc Dự Phòng E.Sever', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (91, 37, N'Tai Nghe Apple', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (92, 37, N'Tai Nghe Harman/Kardon', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (93, 37, N'Tai Nghe Sony', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (94, 37, N'Tai Nghe JBL', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (95, 37, N'Tai Nghe Anker', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (96, 37, N'Tai Nghe SamSung', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [MaDM], [TenLoaiSP], [ISDELETE]) VALUES (97, 37, N'Tai Nghe LQ', 0)
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC01', N'nha cung cap viet saclo', N'Hà Nội')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC02', N'nhà cung cấp lapmasterhh', N'Thành Phố Hồ Chí Minh')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC03', N'nhà cung cấp tri tue viet', N'Thành Phố Hồ Chí Minh')
INSERT [dbo].[NHACUNGCAP] ([MANCC], [TENNCC], [DIACHI]) VALUES (N'NCC05', N'Nhà Cung cấp aloha', N'Thành Phố Hồ Chí Minh')
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'admin', N'123', N'Giam Doc', N'giamdoc@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'buivutruong', N'123456', N'Bùi Vũ Trường', N'buivutruong@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'lyxanhthanh', N'123456', N'Lý Xuân Thành', N'lyxuanthanh@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'nguyenquocviet', N'123456', N'Nguyễn Quốc Việt', N'nguyenquocviet@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'tranbaolong', N'123456', N'Trần Bảo Long', N'tranbaolong@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'trangiatuan', N'123456', N'Nguyễn Trần Gia Tuấn', N'giatuan@gmail.com', 1)
INSERT [dbo].[NHANVIENS] ([USERNAME], [PASS], [TENNHANVIEN], [EMAIL], [HOATDONG]) VALUES (N'user1', N'123', N'Ten User 1', N'user1@gmail.com', 1)
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'NHOM_FULL_QUYEN', N'Nhóm full quyền', N'Ai trong nhóm này có đầy đủ quyền')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'NHOM_NGUOI_DUNG_THUONG', N'Nhóm người dùng thường', N'Những nhân viên được tạo sẽ mặt định có những quyền trong nhóm này')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'PHONG_BANHANG', N'Phòng bán hàng', N'Phòng ban chứ những viên bán hàng')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'PHONG_KHO', N'Phòng Ban Kho', N'Nhóm chứa những nhân viên quản lý kho')
INSERT [dbo].[NHOMQUYENS] ([MANHOM], [TENNHOM], [GHICHU]) VALUES (N'PHONG_QUAN_TRI_QUYEN', N'Phòng Quản Trị Quyền Của Nhóm Và Phân Nhân Viên Vào Nhóm', N'Phòng ban chứa những nhân viên có nhiệm vụ phần quyền cho nhóm vào phân nhân viên vào nhóm')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'NHOM_FULL_QUYEN', N'')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'NHOM_NGUOI_DUNG_THUONG', N'Giám đốc mặc định có chứa quyền của người dùng thường')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'PHONG_BANHANG', N'Giám đốc ở trong phòng này')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'PHONG_KHO', N'Giám đốc ở trong phòng này')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'admin', N'PHONG_QUAN_TRI_QUYEN', N'Giám đốc nhé')
INSERT [dbo].[PHANNHANVIEN_VAONHOMQUYEN] ([USERNAME], [MANHOM], [GHICHU]) VALUES (N'nguyenquocviet', N'NHOM_FULL_QUYEN', N'Ê')
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_DANG_XUAT', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_NHAP', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_PHAN_NHANVIEN_VAO_NHOM_QUYEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_PHAN_QUYEN_CHO_NHOM', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_BAN_HANG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_BAO_HANH', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_DANH_MUC', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_KHACH_HANG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_LOAI_SAN_PHAM', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_NHA_CUNG_CAP', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_NHAN_VIEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_NHOM_QUYEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_PHIEU_NHAP_HANG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_QUYEN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_QL_SANPHAM', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_THONG_TIN_UNG_DUNG', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_XEM_THONG_TIN_CANHAN', 1)
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'NHOM_FULL_QUYEN', N'MH_XUAT', 1)
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
INSERT [dbo].[PHANQUYEN] ([MANHOM], [MAQUYEN], [COQUYEN]) VALUES (N'PHONG_BANHANG', N'MH_QL_KHACH_HANG', 1)
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
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN000000000000000001', CAST(0x63410B00 AS Date), 207500000.0000, N'NCC01')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN000000000000000002', CAST(0x69410B00 AS Date), 456000000.0000, N'NCC01')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN000000000000000003', CAST(0xFD3F0B00 AS Date), 24000000.0000, N'NCC02')
INSERT [dbo].[PHIEU_NHAP] ([MAPN], [NGAYNHAP], [TONGTIEN], [NHACC]) VALUES (N'PN000000000000000004', CAST(0x01400B00 AS Date), 240000000.0000, N'NCC01')
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
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000001            ', 64, N'Laptop Apple MacBook Air 2017 i5 1.8GHz/8GB/128GB (MQD32SA/A)', N'sp2020_7_30_15_55_59.jpg', 24000000, CAST(0x63410B00 AS Date), N'Đặc điểm nổi bật của Apple MacBook Air 2017 i5 1.8GHz/8GB/128GB (MQD32SA/A)MacBook Air 2017 i5 128GB là mẫu laptop văn phòng, có thiết kế siêu mỏng và nhẹ, vỏ nhôm nguyên khối sang trọng. Máy có hiệu năng ổn định, thời lượng pin cực lâu 12 giờ, phù hợp cho hầu hết các nhu cầu làm việc và giải trí. ', 8, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000002            ', 64, N'Laptop Apple MacBook Air 2020 i5 1.1GHz/8GB/256GB (Z0YL)', N'sp2020_7_30_15_57_41.jpg', 12500000, CAST(0x63410B00 AS Date), N'Đặc điểm nổi bật của Apple MacBook Air 2020 i5 1.1GHz/8GB/256GB (Z0YL)MacBook Air 2020 là phiên bản có nhiều nâng cấp vượt trội về cấu hình và thiết kế bàn phím, hứa hẹn đem tới trải nghiệm mượt mà, thoải mái hơn tới người dùng. Chiếc máy vẫn là lựa chọn số 1 dành cho các anh em văn phòng muốn sở hữu chiếc laptop mỏng nhẹ, mượt mà và pin lâu.', 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000003            ', 64, N'Laptop Apple MacBook Air 2020 i3 1.1GHz/8GB/256GB (MWTL2SA/A)', N'sp2020_7_30_16_2_25.jpg', 0, CAST(0x63410B00 AS Date), N'MacBook Air 2020 i3 mới với thiết kế sang trọng, hiệu năng khá, bàn phím Magic lần đầu tiên xuất hiện trên dòng Macbook Air. Với nhiều tính năng hiện đại, đây là chiếc MacBook Air rất đáng sở hữu với mức giá gần như rẻ nhất từ trước đến nay. ', 0, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000004            ', 71, N'Điện thoại iPhone 11 128GB', N'sp2020_7_30_16_6_29.jpg', 0, CAST(0x63410B00 AS Date), N'Được xem là phiên bản iPhone "giá rẻ" trong bộ 3 iPhone mới ra mắt nhưng iPhone 11 128GB vẫn sở hữu cho mình rất nhiều ưu điểm mà hiếm có một chiếc smartphone nào khác sở hữu.', 0, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000005            ', 71, N'Điện thoại iPhone Xs Max 256GB', N'sp2020_7_30_16_8_46.jpg', 0, CAST(0x63410B00 AS Date), N'Sau 1 năm mong chờ, chiếc smartphone cao cấp nhất của Apple đã chính thức ra mắt mang tên iPhone Xs Max 256 GB. Máy các trang bị các tính năng cao cấp nhất từ chip A12 Bionic, dàn loa đa chiều cho tới camera kép tích hợp trí tuệ nhân tạo.', 0, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000006            ', 71, N'Điện thoại iPhone SE 64GB (2020)', N'sp2020_7_30_16_10_1.jpg', 0, CAST(0x63410B00 AS Date), N'iPhone SE 2020 đã bất ngờ ra mắt với thiết kế 4.7 inch nhỏ gọn, chip A13 Bionic mạnh mẽ như trên iPhone 11 và đặc biệt sở hữu mức giá tốt chưa từng có.', 0, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000007            ', 79, N'Máy tính bảng Samsung Galaxy Tab with S Pen (P205)', N'sp2020_7_30_16_11_56.jpg', 0, CAST(0x63410B00 AS Date), N'Samsung Galaxy Tab A Plus 8.0 inch (2019) là một chiếc máy tính bảng có thiết kế đẹp, trọng lượng nhẹ giúp bạn có thể dễ dàng mang theo trong những buổi sáng cafe hay những chuyến đi chơi xa.', 0, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000008            ', 78, N'Máy tính bảng iPad 10.2 inch Wifi 32GB (2019)', N'sp2020_7_30_16_12_56.jpg', 0, CAST(0x63410B00 AS Date), N'Thiết kế sang trọng, màn hình đẹp và một cấu hình đủ dùng cho hầu hết nhu cầu là những ưu điểm mà chiếc máy tính bảng iPad 10.2 inch Wifi 32GB (2019) này sở hữu.', 0, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000009            ', 71, N'safsdf', N'sp2019_8_4_8_39_26.jpg', 0, CAST(0xFA3F0B00 AS Date), N'dfdf', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000010            ', 64, N'ddd', N'sp2019_8_10_15_20_2.jpg', 0, CAST(0x00400B00 AS Date), N'dd', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000011            ', 64, N'afsdf', N'sp2019_8_11_13_35_55.jpg', 0, CAST(0x01400B00 AS Date), N'sdfsdf', 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Hinh], [GiaBan], [CreatedDate], [Description], [SL_TON], [ISDELETE]) VALUES (N'SP000012            ', 64, N'i;li;', N'sp2019_8_11_13_44_1.jpg', 0, CAST(0x01400B00 AS Date), N'kl;kl;', 0, 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TenDM]    Script Date: 12/08/2020 08:47:09 ******/
ALTER TABLE [dbo].[DanhMuc] ADD  CONSTRAINT [Uni_TenDM] UNIQUE NONCLUSTERED 
(
	[TenDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_DienThoai]    Script Date: 12/08/2020 08:47:09 ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Uni_DienThoai] UNIQUE NONCLUSTERED 
(
	[DienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TaiKhoan]    Script Date: 12/08/2020 08:47:09 ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [Uni_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Uni_TenLoaiSP]    Script Date: 12/08/2020 08:47:09 ******/
ALTER TABLE [dbo].[LoaiSP] ADD  CONSTRAINT [Uni_TenLoaiSP] UNIQUE NONCLUSTERED 
(
	[TenLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DanhMuc] ADD  DEFAULT ((0)) FOR [ISDELETE]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_NgayDat]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_DaThanhToan]  DEFAULT ((0)) FOR [DaThanhToan]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_TinhTrangGiaoHang]  DEFAULT ((0)) FOR [TinhTrangGiaoHang]
GO
ALTER TABLE [dbo].[LoaiSP] ADD  DEFAULT ((0)) FOR [ISDELETE]
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
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_NHANVIEN] FOREIGN KEY([NVLAP])
REFERENCES [dbo].[NHANVIENS] ([USERNAME])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DONHANG_NHANVIEN]
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
