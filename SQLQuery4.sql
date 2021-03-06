USE [OnlineShop]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Roles] [char](500) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[UserGroup] ([ID], [Name], [Roles]) VALUES (N'ADMIN', N'ADMIN 1', N'PRODUCT_VIEW, ORDERDETAIL_VIEW,ORDER_VIEW                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[UserGroup] ([ID], [Name], [Roles]) VALUES (N'MEMBER', N'Thành viên', NULL)
INSERT [dbo].[UserGroup] ([ID], [Name], [Roles]) VALUES (N'MOD', N'Moderator', N'USER_VIEW,    GROUPUSER_VIEW  ,ORDER_VIEW,  ORDERDETAIL_VIEW   , USER_VIEW , PRODUCTCAT_VIEW, PRODUCTCAT_EDIT, PRODUCTCAT_ADD   , PRODUCT_VIEW ,  PRODUCT_EDIT                                                                                                                                                                                                                                                                                                                                                      ')
/****** Object:  Table [dbo].[User]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'pbhung', N'202cb962ac59075b964b07152d234b70', N'MOD', N'Phan Bá ưng', N'Vĩnh Hải', N'ngocdan@gmail.com', N'0905471767', NULL, NULL, NULL, NULL, CAST(0x0000AA2A00E286AB AS DateTime), N'pbhung', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'admin', N'202cb962ac59075b964b07152d234b70', N'ADMIN', N'Quan tri 1', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4F2007CAE3B AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'admin2', N'202cb962ac59075b964b07152d234b70', N'MEMBER', N'admin 2', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4F2007CBD3A AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'admin3', N'202cb962ac59075b964b07152d234b70', N'MEMBER', N'admin 3', NULL, NULL, NULL, NULL, NULL, CAST(0x0000A4F2007CCB99 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'pndan', N'e10adc3949ba59abbe56e057f20f883e', N'MEMBER', N'Phan Ngọc Đan', N'Vĩnh Hải', N'pndan@gmail.com', N'65464654', 601, NULL, CAST(0x0000AA1900DF98DB AS DateTime), NULL, CAST(0x0000AA1A01500918 AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'dtmy', N'827ccb0eea8a706c4c34a16891f84e7b', N'MEMBER', N'123', N'1212', N'1212', N'1212', NULL, NULL, CAST(0x0000AA1A00A9073A AS DateTime), NULL, CAST(0x0000AA1A0145A1DC AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[Tag]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'thoi-su', N'thời sự')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'tin-tuc', N'tin tức')
/****** Object:  Table [dbo].[SystemStatus]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemStatus](
	[ID] [int] NOT NULL,
	[StatusId] [int] NULL,
	[StatusName] [nvarchar](50) NULL,
	[GroupName] [char](10) NULL,
 CONSTRAINT [PK_SystemStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[Name] [varchar](50) NOT NULL,
	[Type] [varchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SystemConfig] ([Name], [Type], [Value], [Status]) VALUES (N'HOME_DESCRIPTIONS', N'1', N'Mua bán tổng hợp, hàng độc, hàng hiếm, cho thuê căn hộ Nha Trang', 1)
INSERT [dbo].[SystemConfig] ([Name], [Type], [Value], [Status]) VALUES (N'HOME_KEYWORDS', N'1', N'Mua bán tổng hợp, hàng độc, hàng hiếm, cho thuê căn hộ giá rẻ Nha trang, view biển, gần trung tâm thành phố Nha Trang', 1)
INSERT [dbo].[SystemConfig] ([Name], [Type], [Value], [Status]) VALUES (N'HOME_TITLE', N'1', N'mua bán hàng độc lạ, hàng hiếm, thuê căn hộ Nha Trang, view biển', 1)
/****** Object:  Table [dbo].[Slide]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/assets/client/images/slide-2-image.jpg', 1, N'/', NULL, CAST(0x0000A500013F14E4 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/assets/client/images/slide-1-image.jpg', 2, N'/', NULL, CAST(0x0000A500013F2880 AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CONTENT_ADD', N'CONTENT_ADD')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CONTENT_DELETE', N'CONTENT_DELETE')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CONTENT_EDIT', N'CONTENT_EDIT')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CONTENT_VIEW', N'CONTENT_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'GROUPUSER_EDIT', N'GROUPUSER_EDIT')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'GROUPUSER_VIEW', N'GROUPUSER_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ORDER_VIEW', N'ORDER_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ORDERDETAIL_VIEW', N'ORDERDETAIL_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCT_ADD', N'PRODUCT_ADD')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCT_DELETE', N'PRODUCT_DELETE')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCT_EDIT', N'PRODUCT_EDIT')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCT_VIEW', N'PRODUCT_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCTCAT_ADD', N'CATPRODUCT_ADD')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCTCAT_DELETE', N'CATPRODUCT_DELETE')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCTCAT_EDIT', N'CATPRODUCT_EDIT')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'PRODUCTCAT_VIEW', N'CATPRODUCT_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ROLE_VIEW', N'ROLE_VIEW')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'USER_ADD', N'USER_ADD')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'USER_DELETE', N'USER_DELETE')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'USER_EDIT', N'USER_EDIT')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'USER_VIEW', N'USER_VIEW')
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Service] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Service]) VALUES (1, N'Đồng hồ', N'dong-ho', NULL, 0, NULL, CAST(0x0000A5000139507A AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Service]) VALUES (2, N'Điện thoại', N'dien-thoai', NULL, 1, NULL, CAST(0x0000A500013EC03F AS DateTime), N'admin', CAST(0x0000AA110147C352 AS DateTime), NULL, NULL, NULL, 1, 0, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Service]) VALUES (3, N'Máy tính để bàn', N'may-tinh-de-ban', NULL, 1, NULL, CAST(0x0000A500013EC03F AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Service]) VALUES (6, N'Phần mềm', N'phan-mem', NULL, 1, NULL, CAST(0x0000A500013EC03F AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Service]) VALUES (13, N'Thực phẩm', N'thuc-pham', 2, 1, N'thuc pham', CAST(0x0000A500013EC03F AS DateTime), NULL, CAST(0x0000AA11008687AE AS DateTime), NULL, NULL, NULL, 1, 0, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Service]) VALUES (14, N'Thuê khách sạn, căn hộ giá rẻ', N'khach-san-can-ho-gia-re', NULL, NULL, N'Thuê khách sạn, căn hộ, condotel, giá rẻ , nha trang', CAST(0x0000A500013EC03F AS DateTime), NULL, CAST(0x0000AA1F00ADC556 AS DateTime), NULL, N'Thuê khách sạn, căn hộ, condotel, giá rẻ , nha trang', N'Thuê khách sạn, căn hộ, condotel, giá rẻ , nha trang                                                                                                                                                                                                      ', 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MoreImages] [xml] NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CategoryID] [bigint] NULL,
	[Code] [varchar](10) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [ntext] NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludedVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (1, NULL, N'Điện thoại Sony', 2, N'A01', N'tivi-sony-21', N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://i1.wp.com/thanhtrangmobile.com/wp-content/uploads/2018/11/s%E1%BB%ADa-%C4%91i%E1%BB%87n-tho%E1%BA%A1i-iphone.jpg?fit=800%2C420&ssl=1', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (2, NULL, N'Bộ loa 2.0 Microlab', 3, N'A02', N'bo-loa-20-microlab', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'https://www.theandroidsoul.com/wp-content/uploads/2012/11/nexus-43-420x250.jpg', CAST(435000 AS Decimal(18, 0)), CAST(235000 AS Decimal(18, 0)), 0, 12, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(0x0000A50001419D71 AS DateTime), N'admin', CAST(0x0000AA11015C975E AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (3, NULL, N'Máy ảnh Nikon', 3, N'A03', N'may-anh-nikon', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', N'http://genknews.genkcdn.vn/thumb_w/660/2018/2/1/fujifilmxa5feat-1517456943367924465657.jpg', CAST(2535000 AS Decimal(18, 0)), CAST(2350000 AS Decimal(18, 0)), 0, 12, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt bibendum est, non interdum nulla sodales ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed varius mollis sodales. Curabitur ac ligula dolor', 12, CAST(0x0000A5000141EDCB AS DateTime), N'admin', CAST(0x0000AA1201037DC2 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (8, N'<Images><Image>https://live.staticflickr.com/7924/46846337554_1ed569ced2_b.jpg</Image><Image>https://live.staticflickr.com/7883/40604193283_37162367a0_b.jpg</Image><Image>https://live.staticflickr.com/7806/47517242282_c88803e908_b.jpg</Image><Image>https://live.staticflickr.com/7818/40604193383_0605fc7a22_b.jpg</Image><Image>https://live.staticflickr.com/7897/40604193773_71fe631953_b.jpg</Image><Image>https://live.staticflickr.com/7869/40604193893_f6a2b9e5c0_b.jpg</Image></Images>', N'Hệ thống căn hộ Mường Thanh Viễn Triều, phòng đẹp, view biển, gần trung tâm thành phố', 14, N'A08', N'can-ho-muong-thanh-vien-trieu-gia-re', N'<h2><strong>Tất cả c&aacute;c căn hộ rộng r&atilde;i v&agrave; sang trọng đều c&oacute; c&aacute;c tiện &iacute;ch:</strong></h2>

<h2><span style="color:#800080">&nbsp; * Gắn m&aacute;y điều ho&agrave; </span></h2>

<h2><span style="color:#800080">&nbsp; * C&oacute; Wi-Fi miễn ph&iacute; </span></h2>

<h2><span style="color:#800080">&nbsp; * Tầm nh&igrave;n tuyệt đẹp ra đại dương </span></h2>

<h2><span style="color:#800080">&nbsp; * Căn hộ như ở nh&agrave;</span></h2>

<h2><span style="color:#006400">&nbsp; * Gần trung t&acirc;m th&agrave;nh phố</span></h2>
', N'http://file4.batdongsan.com.vn/2016/08/25/RigI3kCz/20160825103754-eb76.jpg', CAST(78000000 AS Decimal(18, 0)), NULL, NULL, 21, N'<h3><span style="color:#008000"><strong>Trải nghiệm dịch vụ đẳng cấp thế giới ở Mia Resort Nha Trang</strong></span></h3>

<p>&nbsp;</p>

<div id="property_description_content">
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#FF0000"> Mia Resort Nha Trang 5 sao n&agrave;y cung cấp c&aacute;c buổi tập yoga miễn ph&iacute; tr&ecirc;n b&atilde;i biển v&agrave;o Chủ Nhật v&agrave; dịch vụ xe điện đưa đ&oacute;n xung quanh chỗ nghỉ. Resort cũng c&oacute; hồ bơi ngo&agrave;i trời v&agrave; c&aacute;c liệu ph&aacute;p m&aacute;t-xa thư gi&atilde;n. Qu&yacute; kh&aacute;ch c&oacute; thể tham gia c&aacute;c lớp học nấu ăn, c&aacute;c chuyến lặn với ống thở, tour du lịch trong ng&agrave;y cũng như c&aacute;c buổi tập yoga tr&ecirc;n b&atilde;i biển từ 07:30 - 09:00 v&agrave;o Chủ Nhật h&agrave;ng tuần.</span></p>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tất cả c&aacute;c biệt thự rộng r&atilde;i v&agrave; sang trọng gắn m&aacute;y điều ho&agrave; tại đ&acirc;y đều c&oacute; Wi-Fi miễn ph&iacute;, tầm nh&igrave;n tuyệt đẹp ra đại dương, v&otilde;ng v&agrave; khu vực ti&ecirc;́p khách thoải m&aacute;i. Một số biệt thự c&oacute; hồ bơi ri&ecirc;ng. C&aacute;c biệt thự c&ograve;n c&oacute; v&ograve;i sen trong nh&agrave; v&agrave; ngo&agrave;i trời cũng như bồn tắm.</p>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chỉ c&aacute;ch B&atilde;i Đ&ocirc;ng 3 ph&uacute;t đi bộ, Mia Resort Nha Trang nằm trong b&aacute;n k&iacute;nh chưa đến 5 km từ s&acirc;n golf tuyệt đẹp tại Diamond Bay do Andy Dye thiết kế. Từ resort, qu&yacute; kh&aacute;ch l&aacute;i xe 25 ph&uacute;t l&agrave; tới s&acirc;n bay Cam Ranh, ga t&agrave;u Nha Trang, Ch&ugrave;a Long Sơn v&agrave; C&ocirc;ng vi&ecirc;n giải tr&iacute; Vinpearl.</p>
</div>
', NULL, CAST(0x0000A50001434CF1 AS DateTime), NULL, CAST(0x0000AA2500F8D08D AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (9, N'<Images><Image>https://tpc.googlesyndication.com/daca_images/simgad/12389773720651880534</Image></Images>', N'Máy tính bộ Acer Aspire XC-885', 2, N'A09', N'may-tinh-bo-acer', N'Máy tính bộ Acer Aspire XC-885', N'http://files.vforum.vn/2015/T09/img/vforum.vn-215378-zen-aio-s-1-900x420.jpg', CAST(32453254 AS Decimal(18, 0)), NULL, NULL, 23, NULL, 36, CAST(0x0000A50001434CF1 AS DateTime), NULL, CAST(0x0000AA11015BEAD9 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10, NULL, N'bộ máy tính chơi PUBG', 3, N'A10', N'pub-g', N'bộ máy tính chơi PUBG,live stream giá rẻ', N'http://files.vforum.vn/2015/T09/img/vforum.vn-215378-zen-aio-s-1-900x420.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000AA11015CBA4D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (13, NULL, N'Máy lạnh', 3, N'A13', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://www.theandroidsoul.com/wp-content/uploads/2018/12/Sony-foldable-phone-420x250.png', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA1A009ADAA3 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (14, NULL, N'Tivi LG', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://images-na.ssl-images-amazon.com/images/I/915fzh10-KL._SX425_.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (15, NULL, N'Android', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAeh29w0oR6LvEpFprNomoOLwiZ-jWsa6IRQKbYhiXG_STZk13', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A393013FCC4E AS DateTime), N'admin', CAST(0x0000AA1A009B4252 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (16, NULL, N'Iphone', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'http://www.it-reborn.com/wp-content/uploads/2016/11/31531-0286a723_945_556-420x250.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (18, NULL, N'Sámung', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://product.hstatic.net/1000069891/product/extreme2_group-1605x1605px_medium.png', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (19, NULL, N'kekekekke', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://media.vietteltelecom.vn/upload/13627/20161215/a661947573e2c2730a86e5ddd51f4ff1.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (20, NULL, N'nòi ', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKVmbzY5LeaN3e15OEjR0hGIfszOXJdXSuFg3bi9vsZXhfxDbh', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (21, NULL, N'máy giặt', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://dienmaycholon.vn/public/picture/product/product12670/product_12670_1.png', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (22, NULL, N'Tivi Sony 21 inch', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkRFnyTehOdpuu3ziLFbFHNs4IPm7sgC1THnbMWpGWfRmsnpTs', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (23, NULL, N'Điện thoại', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://cellphones.com.vn/media/wysiwyg/accessories/speaker/loa-di-dong-sony-srs-xb10-3.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (24, NULL, N'máy cưa', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'http://thietbiplaza.com/netviet/filesupload/thietbiplaza_Product/Stihl%20ms192t.JPG', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (25, NULL, N'Máy sấy', 3, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://cdn.mediamart.vn/Product/bo-phat-wifi-di-dong-tu-sim-4g-tplink-m7300-GlCKib.png', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (26, NULL, N'Máy rửa chén', 1, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://lagihitech.vn/wp-content/uploads/2017/09/SSD-Samsung-T5-2TB-MU-PA2T0BAM-300x300.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (27, NULL, N'Phần mềm', 1, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://upload.wikimedia.org/wikipedia/vi/thumb/f/fd/Android_UI.jpg/1200px-Android_UI.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA1A009B5D93 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (28, NULL, N'Đặc sản', 2, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://monngonmoingay.net.vn/wp-content/uploads/2018/04/nguyen-lieu-480x360-1-420x250.jpg', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA1A009B0DD9 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (29, NULL, N'Gresssee', 2, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'https://marketingai.admicro.vn/wp-content/uploads/2017/01/mobile.png', NULL, NULL, NULL, 0, N'oạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA0E0107C216 AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [MoreImages], [Name], [CategoryID], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (31, NULL, N'la là', 2, N'A01', N'tivi-sony-21', N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', N'http://sohanews.sohacdn.com/thumb_w/660/2017/iphone-x-dai-loan-loai-1-1505363532-1510806684769-139-0-859-1160-crop-1510806689941.jpg', NULL, NULL, NULL, 0, N'Loạt tivi Plasma sẵn sàng HDTV 42 inch mới nhất, model 42PX4RV, có hệ số tương phản lên tới 10.000:1 và độ sáng đạt 1.500 cd/m2. Đồng thời trong dịp này hãng cũng tung ra loạt tivi LCD, serie LP1 mới thuộc cỡ trung, kích thước 32-42 inch.', NULL, CAST(0x0000A500013FCC4E AS DateTime), N'admin', CAST(0x0000AA1A009ABDA4 AS DateTime), NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Adult] [int] NULL,
	[Children] [int] NULL,
	[Notes] [ntext] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [FromDate], [ToDate], [Adult], [Children], [Notes], [Status]) VALUES (8, 37, NULL, NULL, CAST(0x0000AA2501166718 AS DateTime), CAST(0x0000AA2600000000 AS DateTime), NULL, NULL, NULL, 0)
/****** Object:  Table [dbo].[Order]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (37, CAST(0x0000AA250116F2E0 AS DateTime), 2, N'Phan Bá ưng', N'0905471767', NULL, N'ngocdan@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[MenuType]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MenuType] ON
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
/****** Object:  Table [dbo].[Menu]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menu] ON
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/home/index', 10, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Đặc sản', N'/san-pham/dac-san-3', 11, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ - Hướng dẫn thanh toán', N'/lien-he', 21, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 90, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng ký', N'/dang-ky', 91, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'Tổng hợp', N'/san-pham/tong-hop-1', 12, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (9, N'Thuê căn hộ giá rẻ Nha Trang', N'/dat-phong/can-ho-view-bien-nha-trang-8', 13, N'_self', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
/****** Object:  Table [dbo].[Language]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Language](
	[ID] [varchar](2) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'en', N'Tiếng Anh', 0)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
/****** Object:  Table [dbo].[Footer]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'footer', N'<div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Customer Service</a></li>
						<li><a href="#">Advanced Search</a></li>
						<li><a href="delivery.html">Orders and Returns</a></li>
						<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
						<ul>
						<li><a href="about.html">About Us</a></li>
						<li><a href="contact.html">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html">Site Map</a></li>
						<li><a href="#">Search Terms</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul>
							<li><a href="contact.html">Sign In</a></li>
							<li><a href="index.html">View Cart</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Track My Order</a></li>
							<li><a href="contact.html">Help</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
						<ul>
							<li><span>+91-123-456789</span></li>
							<li><span>+00-123-000000</span></li>
						</ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="images/dribbble.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>			
        </div>
        <div class="copy_right">
				<p>Company Name © All rights Reseverd | Design by  <a href="http://w3layouts.com">W3Layouts</a> </p>
		   </div>', 1)
/****** Object:  Table [dbo].[Feedback]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (1, N'43454', N'5345', N'53453', N'354', N'
       345                 ', CAST(0x0000A5120164185A AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (2, N'4234', N'4234', N'634', N'423', N'243    ', CAST(0x0000A512016470D4 AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (3, N'r2', N'4234', N'43243', N'423', N'423
                        ', CAST(0x0000A5120164A168 AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (4, N'', N'', N'', N'', N'
                        ', CAST(0x0000AA1901440CFD AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
/****** Object:  Table [dbo].[ContentTag]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'thoi-su')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'tin-tuc')
/****** Object:  Table [dbo].[Content]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (1, N'tin tức demo', N'tin-tuc-demo', N'424', N'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 1, N'42342342', 12, CAST(0x0000A51900845FCD AS DateTime), N'toanbn', NULL, NULL, N'313', N'13                                                                                                                                                                                                                                                        ', 1, NULL, 0, N'tin tức,thời sự', NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
/****** Object:  Table [dbo].[Contact]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON
INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<p>Mọi chi tiết xin liên hệ:</p><p>Trần Nhật Hưng </p> <p>Điện thoại: 09123456789</p>', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (1, N'Tin thế giới', N'tin-the-gioi', NULL, 1, NULL, CAST(0x0000A4F50080E837 AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (2, N'Tin trong nước', N'tin-trong-nuoc', NULL, 2, NULL, CAST(0x0000A4F50080F756 AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (3, N'34234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'vi')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[About]    Script Date: 04/15/2019 19:56:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_User_GroupID]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
/****** Object:  Default [DF_User_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Slide_DisplayOrder]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Slide_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_ProductCategory_DisplayOrder]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_ProductCategory_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_ProductCategory_Status]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_ProductCategory_ShowOnHome]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
/****** Object:  Default [DF_Product_Price]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_Product_Quantity]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF_Product_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Product_Status]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Product_ViewCount]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
/****** Object:  Default [DF_OrderDetail_Quantity]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
/****** Object:  Default [DF_Order_Status]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Language_IsDefault]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Feedback_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Content_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Content_Status]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Content_ViewCount]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
/****** Object:  Default [DF_Category_DisplayOrder]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_Category_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_Category_Status]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Category_ShowOnHome]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
/****** Object:  Default [DF_About_CreatedDate]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  Default [DF_About_Status]    Script Date: 04/15/2019 19:56:39 ******/
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
