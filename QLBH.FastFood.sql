USE [QLFastFood]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 8/24/2022 4:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[GiaTien] [money] NOT NULL CONSTRAINT [DF_ChiTietDonHang_GiaTien]  DEFAULT ((0)),
	[SoLuong] [int] NOT NULL CONSTRAINT [DF_ChiTietDonHang_SoLuong]  DEFAULT ((1)),
	[GiamGia] [real] NOT NULL CONSTRAINT [DF_ChiTietDonHang_GiamGia]  DEFAULT ((0)),
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 8/24/2022 4:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDatHang] [datetime] NULL,
	[NgayGiaoHang] [datetime] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 8/24/2022 4:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [nvarchar](11) NULL,
	[Email] [varchar](50) NULL,
	[MatKhau] [varchar](20) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 8/24/2022 4:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 8/24/2022 4:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](40) NOT NULL,
	[MaLoaiSP] [int] NULL,
	[MoTa] [nvarchar](100) NULL,
	[GiaSP] [decimal](18, 2) NULL,
	[SoLuong] [int] NULL,
	[HoatDong] [bit] NULL,
	[AnhUrl] [varchar](max) NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (1, 2, 20000.0000, 2, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (1, 3, 20000.0000, 1, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (2, 1, 30000.0000, 1, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (3, 4, 80000.0000, 1, 0.2)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (3, 11, 20000.0000, 2, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (5, 7, 21000.0000, 2, 0.3)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (5, 8, 28000.0000, 1, 0.3)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (5, 10, 15000.0000, 2, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (6, 5, 45000.0000, 2, 0.5)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (7, 8, 20000.0000, 1, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (7, 9, 25000.0000, 1, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (8, 6, 48000.0000, 2, 0.4)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (8, 11, 20000.0000, 2, 0)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [GiaTien], [SoLuong], [GiamGia]) VALUES (9, 1, 30000.0000, 2, 0)
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (1, 2, CAST(N'2022-02-03 00:00:00.000' AS DateTime), CAST(N'2022-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (2, 3, CAST(N'2022-02-22 00:00:00.000' AS DateTime), CAST(N'2022-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (3, 2, CAST(N'2022-02-12 00:00:00.000' AS DateTime), CAST(N'2022-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (4, 4, CAST(N'2022-03-15 00:00:00.000' AS DateTime), CAST(N'2022-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (5, 5, CAST(N'2022-04-23 00:00:00.000' AS DateTime), CAST(N'2022-04-23 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (6, 6, CAST(N'2022-03-24 00:00:00.000' AS DateTime), CAST(N'2022-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (7, 7, CAST(N'2022-01-04 00:00:00.000' AS DateTime), CAST(N'2022-01-04 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (8, 3, CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-14 00:00:00.000' AS DateTime))
INSERT [dbo].[DonHang] ([MaDonHang], [MaKH], [NgayDatHang], [NgayGiaoHang]) VALUES (9, 2, CAST(N'2022-04-14 00:00:00.000' AS DateTime), CAST(N'2022-04-14 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (1, NULL, NULL, NULL, N'Admin.Manager@gmail.com', N'123456', 2)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (2, N'Nguyễn Văn A', N'45 Nguyễn Văn Linh, Quận 7, Tp.HCM', N'054889992', N'maiNguyen@gmail.com', N'123', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (3, N'Đoàn Cẩm Ly', N'56/456 Nguyễn Oanh, Gò Vấp, Tp.HCM', N'094534242', N'trinhKim.vt@gmail.com', N'123', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (4, N'Mai Kim Hoa', N'201/323 Phạm Văn Đồng, Bình Thạnh, Tp.Hcm', N'095332445', N'toilaai.blink@gmail.com', N'156', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (5, N'Nguyễn Tú', N'456 Hoàng Sa, Tân bình, Tp.HCM', N'089461616', N'dayladau@gmail.com', N'489', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (6, N'Trịnh Thị Lài', N'88 Đặng Văn Ngữ, Phú Nhuận, Tp.HCM', N'091351212', N'trytry222@gmail.com', N'456', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (7, N'Cam Chịu', N'12/156 Nguyễn Văn Nghi, Gò Vấp, Tp.HCM', N'056346431', N'lalalala111@gmail.com', N'4566', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [DiaChi], [SDT], [Email], [MatKhau], [Quyen]) VALUES (8, NULL, NULL, NULL, N'lycayda@gmail.com', N'456', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (1, N'Bánh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (2, N'Nước uống')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (3, N'Ăn vặt')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (4, N'Gà rán')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (5, N'Pizza')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (6, N'Mì')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (1, N'Mì trộn', 6, NULL, CAST(30000.00 AS Decimal(18, 2)), 10, 1, N'hero-header.png', N'1 Phần')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (2, N'Hamburger', 1, NULL, CAST(20000.00 AS Decimal(18, 2)), 40, 1, N'burger.png', N'1 Phần')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (3, N'Sandwich', 1, NULL, CAST(20000.00 AS Decimal(18, 2)), 35, 1, N'crispy-sandwitch.png', N'1 Phần')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (4, N'Pizza hải sản', 5, NULL, CAST(100000.00 AS Decimal(18, 2)), 25, 1, N'search-pizza.png', N'1 Phần')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (5, N'Pizza gà', 5, NULL, CAST(90000.00 AS Decimal(18, 2)), 10, 1, N'search-pizza.png', N'1 Phần')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (6, N'Pizza phô mai', 5, NULL, CAST(80000.00 AS Decimal(18, 2)), 16, 1, N'search-pizza.png', N'1 Phần')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (7, N'Cánh gà rán', 4, NULL, CAST(30000.00 AS Decimal(18, 2)), 50, 1, N'ga.jpg', N'gam')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (8, N'Đùi gà rán', 4, NULL, CAST(40000.00 AS Decimal(18, 2)), 100, 1, N'ga.jpg', N'gam')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (9, N'Khoai tây chiên', 3, NULL, CAST(25000.00 AS Decimal(18, 2)), 100, 1, N'khoaitay.jpg', N'gam')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (10, N'Coca cola', 2, NULL, CAST(15000.00 AS Decimal(18, 2)), 100, 1, N'drink.jpg', N'Lon')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoaiSP], [MoTa], [GiaSP], [SoLuong], [HoatDong], [AnhUrl], [DonVi]) VALUES (11, N'Trà sữa', 2, NULL, CAST(20000.00 AS Decimal(18, 2)), 50000, 1, NULL, N'Ly')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
