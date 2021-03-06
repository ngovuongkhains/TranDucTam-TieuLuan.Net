USE [master]
GO
/****** Object:  Database [QLSach]    Script Date: 10/01/2022 21:49:34 ******/
CREATE DATABASE [QLSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLSach.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLSach_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSach] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSach] SET RECOVERY FULL 
GO
ALTER DATABASE [QLSach] SET  MULTI_USER 
GO
ALTER DATABASE [QLSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSach] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLSach', N'ON'
GO
USE [QLSach]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaSach] [nvarchar](50) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SoDienThoai] [int] NULL,
	[SoLuongMua] [int] NULL,
	[Gia] [int] NULL,
 CONSTRAINT [PK_Hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[MaKhachHang] [nvarchar](50) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[SoDienThoai] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kho]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaSach] [nvarchar](50) NOT NULL,
	[LoaiSach] [nvarchar](50) NULL,
	[DonViTinh] [int] NULL,
	[TonKho] [int] NULL,
	[GiaTriTon] [int] NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [nvarchar](50) NOT NULL,
	[TenSach] [nvarchar](50) NULL,
	[NgayNhap] [date] NULL,
	[Gia] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[DanhGia] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaSach], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'1', N'2', N'1', N'Trần Đức Tâm', 123456789, 4, 800000)
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaSach], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'2', N'2', N'4', N'Trần Văn A', 159357123, 3, 750000)
INSERT [dbo].[Hoadon] ([MaHoaDon], [MaKhachHang], [MaSach], [TenKhachHang], [SoDienThoai], [SoLuongMua], [Gia]) VALUES (N'3', N'1', N'3', N'Nguyễn Văn B', 987654321, 2, 600000)
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'1', N'Trần Đức Tâm', N'Nam', 123456789, N'339 Tăng Bạt Hổ', N'tdtdhkhh@gmail.com')
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'2', N'Trần Văn A', N'Nam', 159753123, N'Phạm Thị Liên', N'tva@gmail.com')
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'3', N'Nguyễn Văn B', N'Nam', 987654321, N'Nguyễn Sinh Cung', N'nvb@gmail.com')
INSERT [dbo].[Khachhang] ([MaKhachHang], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [Email]) VALUES (N'4', N'Nguyễn Thị Nhật Ánh', N'Nữ', 357535753, N'Lê Duẫn', N'ntna@gmail.com')
INSERT [dbo].[Kho] ([MaSach], [LoaiSach], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'1', N'java', 15, 100, 34)
INSERT [dbo].[Kho] ([MaSach], [LoaiSach], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'2', N'sql', 20, 150, 245)
INSERT [dbo].[Kho] ([MaSach], [LoaiSach], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'3', N'c++', 25, 100, 545)
INSERT [dbo].[Kho] ([MaSach], [LoaiSach], [DonViTinh], [TonKho], [GiaTriTon]) VALUES (N'4', N'c#', 30, 200, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'1', N'SQL Essentials', CAST(N'2000-02-21' AS Date), 200000, N'Còn hàng', N'5')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'2', N'Java Core', CAST(N'2011-04-21' AS Date), 175000, N'Còn hàng', N'5')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'3', N'Java Basic', CAST(N'2011-04-21' AS Date), 200000, N'Còn hàng', N'5')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [NgayNhap], [Gia], [TrangThai], [DanhGia]) VALUES (N'4', N'Be a pro java', CAST(N'2011-04-21' AS Date), 250000, N'Hết hàng', N'5')
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Khachhang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Khachhang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Khachhang]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Sach]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Sach]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSach]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteSach]
@MaSach nvarchar(50)
as
Delete from Sach
where MaSach = @MaSach

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSach]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllSach]
as
select*from Sach

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSach]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertSach]
@MaSach nvarchar(50),
@TenSach nvarchar(50),        
@NgayNhap date,
@Gia int,
@TrangThai nvarchar(50),
@DanhGia nvarchar(50)
as
insert into Sach(MaSach,TenSach,NgayNhap,Gia,TrangThai,DanhGia)
values(@MaSach,@TenSach,@NgayNhap,@Gia,@TrangThai,@DanhGia)

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSach]    Script Date: 10/01/2022 21:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateSach]
@MaSach nvarchar(50),
@TenSach nvarchar(50),        
@NgayNhap date,
@Gia int,
@TrangThai nvarchar(50),
@DanhGia nvarchar(50)
as
Update Sach
set TenSach =@TenSach,
NgayNhap = @ngayNhap,
Gia = @Gia,
TrangThai = @TrangThai,
DanhGia = @DanhGia
where MaSach = @MaSach


GO
USE [master]
GO
ALTER DATABASE [QLSach] SET  READ_WRITE 
GO
