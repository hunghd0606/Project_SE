CREATE DATABASE MyDBProject
go
USE MyDBProject
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[role] [nvarchar](50) NULL,
	[passwordEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[productId] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](250) NULL,
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Orders1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[code] [nvarchar](250) NULL,
	[name] [nvarchar](250) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](1000) NULL,
	[img] [nvarchar](250) NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK_Product1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 11/10/2022 5:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [role], [passwordEmail]) VALUES (1, N'admin', N'123456', N'Administrator', N'Ha Noi 2', N'vannbhe161210@fpt.edu.vn', N'0938906650', N'ADMIN', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [role], [passwordEmail]) VALUES (2, N'user', N'12345', N'Useradmin', N'Hoa Binh', N'user@gmail.com', N'0987233212', N'ADMIN', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [role], [passwordEmail]) VALUES (3, N'Cuong', N'123456', N'Vang Cuong', N'xóm Trung Thành Ha noi', N'CUONGVVHE130951@FPT.EDU.VN	
', N'0356068480', N'ADMIN', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [role], [passwordEmail]) VALUES (7, N'vannbhe161210', N'228239', N'LIT', N'Ha Noi', N'bavan228239@gmail.com', N'0938906650', N'USER', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [role], [passwordEmail]) VALUES (10, N'user2', N'123', N'user2', N'Ha Noi', N'user2@gmail.com', N'12', N'USER', N'123')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartId], [quantity], [productId]) VALUES (14, 1, 3)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [categoryName]) VALUES (1, N'Shirt')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (2, N'Trouser')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (3, N'Belt')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (4, N'Underwear')
INSERT [dbo].[Category] ([id], [categoryName]) VALUES (5, N'Jacket')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1, 1, N'DT No.1', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 30, 3)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (2, 1, N'Reloj ', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451351/item/vngoods_00_451351.jpg?width=1600&impolicy=quality_75', 25, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (3, 2, N'BELUSHI', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450328/item/vngoods_69_450328.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (4, 2, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450322/item/goods_03_450322.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (5, 2, N'Date Moon', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/452519/item/vngoods_62_452519.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (6, 3, N'BELUSHI', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450246/item/vngoods_64_450246.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (7, 3, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (8, 3, N'Date Moon', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (9, 4, N'DT No.1', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 30, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (10, 4, N'Reloj ', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 25, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (11, 5, N'BELUSHI', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (12, 5, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (13, 6, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (14, 6, N'DT No.1', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 30, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (15, 7, N'DT No.1', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 30, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (16, 7, N'Reloj ', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 25, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (17, 8, N'SKMEI shashow', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (18, 8, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (19, 8, N'Date Moon', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (20, 9, N'SOPEWOD', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 31, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (21, 10, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 3)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (22, 10, N'SKMEI shashow', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (24, 11, N'Date Moon', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (25, 12, N'MAFAM', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 40, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (26, 13, N'SKMEI shashow', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (27, 13, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (28, 13, N'DT No.1', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 30, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (29, 14, N'BEDATE', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 20, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (30, 14, N'Date Moon', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (31, 14, N'DT No.1', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 30, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (32, 14, N'SOPEWOD', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 31, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (33, 15, N'SKMEI shashow', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 98, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (34, 15, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (35, 16, N'SKMEI shashow', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 98, 18)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (36, 17, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (37, 18, N'Bomaxe', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 99, 22)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (38, 19, N'Áo Thun Cổ Tròn Ngắn Tay', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', 123, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (39, 20, N'Doraemon UT Áo Thun Ngắn Tay', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451351/item/vngoods_00_451351.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (40, 20, N'Áo Parka Ultra Light Down Siêu Nhẹ (3D Cut)', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/439806/item/vngoods_55_439806.jpg?width=1600&impolicy=quality_75', 90, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (41, 21, N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (42, 22, N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', 99, 5)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (43, 23, N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', 99, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (45, 25, N'Quần Jeans Siêu Co Giãn', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/452519/item/vngoods_62_452519.jpg?width=1600&impolicy=quality_75', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (46, 26, N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', 67, 4)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (47, 27, N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', 67, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (48, 28, N'Doraemon UT Áo Thun Ngắn Tay', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451351/item/vngoods_00_451351.jpg?width=1600&impolicy=quality_75', 77, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (49, 29, N'DRY-EX Áo Thun Cổ Tròn Ngắn Tay', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450328/item/vngoods_69_450328.jpg?width=1600&impolicy=quality_75', 40, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (1, 1, 140, N'vui lòng nhẹ tay, cảm ơn', CAST(N'2022-03-05' AS Date), 1, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (2, 1, 274, N'Vui Lòng Cẩn Thận, hàng dễ vỡ', CAST(N'2022-03-10' AS Date), 2, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (3, 1, 274, N'Vui Lòng Cẩn Thận, hàng dễ vỡ', CAST(N'2022-03-10' AS Date), 3, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (4, 1, 55, N'Can than', CAST(N'2022-03-10' AS Date), 4, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (5, 1, 296, N'Please care fully', CAST(N'2022-03-10' AS Date), 5, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (6, 2, 129, N'hay can than', CAST(N'2022-03-12' AS Date), 6, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (7, 2, 55, N'Can than', CAST(N'2022-03-12' AS Date), 7, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (8, 1, 274, N'can than', CAST(N'2022-03-13' AS Date), 8, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (9, 1, 62, N'Hay Nhe Tay', CAST(N'2022-03-13' AS Date), 9, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (10, 2, 395, N'Can than 1 chut', CAST(N'2022-03-14' AS Date), 10, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (11, 2, 77, N'hehe', CAST(N'2022-03-14' AS Date), 12, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (12, 2, 40, N'So beauty', CAST(N'2022-03-14' AS Date), 13, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (13, 3, 227, N'cẩn thận làm xước', CAST(N'2022-03-14' AS Date), 14, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (14, 3, 219, N'Vui lòng ship nhanh', CAST(N'2022-03-15' AS Date), 15, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (15, 1, 197, N'Hay Can than', CAST(N'2022-03-15' AS Date), 16, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (16, 1, 1764, N'hay can than', CAST(N'2022-03-15' AS Date), 17, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (17, 1, 99, N'please care fully', CAST(N'2022-03-15' AS Date), 18, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (18, 3, 2178, N'Ship can Than', CAST(N'2022-03-16' AS Date), 19, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (19, 1, 123, N'', CAST(N'2022-07-13' AS Date), 20, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (20, 1, 257, N'', CAST(N'2022-07-13' AS Date), 21, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (21, 1, 99, N'', CAST(N'2022-07-13' AS Date), 22, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (22, 1, 495, N'12', CAST(N'2022-07-14' AS Date), 23, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (23, 1, 99, N'1', CAST(N'2022-07-14' AS Date), 24, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (24, 7, 100, N'test
', CAST(N'2022-07-15' AS Date), 25, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (25, 10, 100, N'12', CAST(N'2022-07-16' AS Date), 26, 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (26, 10, 268, N'', CAST(N'2022-07-18' AS Date), 27, 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (27, 10, 67, N'', CAST(N'2022-07-18' AS Date), 28, 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (28, 1, 77, N'', CAST(N'2022-07-18' AS Date), 29, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id], [status]) VALUES (29, 1, 40, N'', CAST(N'2022-07-18' AS Date), 30, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (2, 1, N'SP002', N'Áo Thun Cổ Tròn Ngắn Tay', 0, 123, N'Thiết kế màu đặc trưng của MARNI. Đường cắt thoải mái.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (3, 1, N'SP003', N'Doraemon UT Áo Thun Ngắn Tay', 20, 77, N'Áo thun Đại sứ Bền vững của UNIQLO “Doraemon Sustainability Mode,” hiện đã mở bán!', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451351/item/vngoods_00_451351.jpg?width=1600&impolicy=quality_75', CAST(N'2022-03-29' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (4, 1, N'SP004', N'DRY-EX Áo Thun Cổ Tròn Ngắn Tay', 2, 40, N'Khô nhanh để giữ được độ mới lâu. Thiết kế thời trang từ tác phẩm nghệ thuật của Meguru Yamaguchi.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450328/item/vngoods_69_450328.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-21' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (5, 1, N'SP005', N'Áo Thun Dry-EX Cổ Tròn Ngắn Tay', 40, 30, N'Áo thun được thiết kế để tạo sự thoải mái mát mẻ. Hoàn hảo cho các hoạt động thể thao.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450322/item/goods_03_450322.jpg?width=1600&impolicy=quality_75', CAST(N'2022-05-20' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (6, 2, N'SP006', N'Quần Jeans Siêu Co Giãn', 54, 100, N'Quần jean skinny với độ co giãn đáng kinh ngạc. Tạo điểm nhấn với một vài chi tiết bụi bặm thực tế.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/452519/item/vngoods_62_452519.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (7, 2, N'SP007', N'EZY Quần Jeans Siêu Co Giãn', 19, 23, N'Cái nhìn về vải denim thật với cảm giác mềm mại của quần thể thao. Quần jean thoải mái để thư giãn ở nhà hoặc mặc đi chơi.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450246/item/vngoods_64_450246.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (8, 2, N'SP008', N'Quần Jeans Ống Rộng', 14, 20, N'Updated wide-leg silhouette with slightly tapered hems.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450245/item/vngoods_08_450245.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (9, 2, N'SP009', N'Quần Jeans Siêu Co Giãn', 16, 27, N'Quần jean skinny với độ co giãn đáng kinh ngạc. Các chi tiết thiết kế tạo nên một cái nhìn tinh xảo.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450242/item/vngoods_67_450242.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (10, 2, N'SP010', N'EZY Quần Jeans', 10, 20, N'The look of jeans meets the comfort of sweats.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/448479001/item/vngoods_63_448479001.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (11, 3, N'SP011', N'Thắt Lưng Da Thuộc Ý Bản Mỏng', 12, 24, N'Được làm bằng da sáp ngựa điên cao cấp của Ý. Bản thắt lưng hẹp cho một cái nhìn gọn gàng.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/446276/item/goods_09_446276.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (13, 3, N'SP012', N'Thắt Lưng', 14, 19, N'Thắt lưng dạng lưới làm bằng da dẻo dây đan vào nhau tạo nên nét riêng biệt.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/442224/item/goods_38_442224.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (17, 3, N'SP013', N'Thắt Lưng Da Da Bò Sáp Ngựa Điên Ý', 10, 14, N'Được làm từ loại da dày, chất lượng cao của Ý. Chiều rộng và lỗ khóa của thắt lưng đã được cập nhật.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/442220/item/goods_38_442220.jpg?width=1600&impolicy=quality_75', CAST(N'2022-03-13' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (20, 3, N'SP014', N'Thắt Lưng Da Thuộc Ý', 12, 31, N'Tận hưởng cảm giác sang trọng và kết cấu chất lượng cao của da cao cấp. Được thiết kế với sự chú ý tỉ mỉ đến từng chi tiết.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/435358/item/goods_09_435358.jpg?width=1600&impolicy=quality_75', CAST(N'2022-03-13' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (22, 3, N'SP015', N'Thắt Lưng Da Ý May Viền', 4, 221, N'Một chiếc thắt lưng cao cấp với đường may tỉ mỉ. Một sự bổ sung cho bất kỳ trang phục theo phong cách nào.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/433767/item/goods_38_433767.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (23, 4, N'SP016', N'AIRism Quần Lót Boxer Brief Kẻ Caro Cạp ThấpAIRism Quần AIRism Quần Lót Boxer Brief Kẻ Caro Cạp Thấp', 4, 221, N'Chất liệu AIRism thoáng mát, mịn màng. Cạp thấp giúp nằm ẩn dưới các lớp ngoài.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/449455/item/goods_63_449455.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (25, 4, N'SP017', N'AIRism Quần Lót Boxer Brief Vuông', 4, 321, N'Được làm từ chất liệu AIRism cho cảm giác luôn thoáng mát. Những chiếc quần lót này mang đến sự vừa vặn thoải mái không căng chặt.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/449454/item/goods_16_449454.jpg?width=1600&impolicy=quality_75', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (36, 4, N'SP018', N'AIRism Quần Lót Boxer Briefs Không Đường May', 5, 231, N'Thiết kế không đường may cho một sự vừa vặn hoàn hảo và thoải mái.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/448078/item/goods_03_448078.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (37, 4, N'SP019', N'Airism Quần Lót Boxer Briefs Cạp Trễ', 2, 27, N'Chất liệu AIRism thoáng mát thoải mái. Thiết kế cạp thấp ẩn tốt dưới các lớp trang phục ngoài.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/448082/item/goods_09_448082.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (38, 4, N'SP020', N'AIRism Quần Lót Boxer Briefs Vải Mắt Lưới', 3, 43, N'Quần áo mặc trong mềm mại, mượt mà, và vừa vặn thoải mái. Thiết kế phần chân dài hơn giúp bạn luôn thoáng mát và khô ráo.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/434432/item/goods_03_434432.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (39, 5, N'SP021', N'Áo Parka Bỏ Túi', 2, 163, N'Một chiếc áo parka đa năng với màu sắc đặc trưng của MARNI. Túi đựng có biểu tượng UNIQLO và bộ sưu tập MARNI.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/449645/item/vngoods_59_449645.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (40, 5, N'SP022', N'Áo Parka Blocktech', 1, 57, N'Parka này không thấm nước, chống gió và cực kỳ thoáng khí. Thiết kế đa năng phù hợp cho các môn thể thao hoặc trang phục bình thường.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/449039/item/vngoods_03_449039.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (41, 5, N'SP023', N'Áo Parka Cotton', 5, 101, N'Một lớp khoác bên ngoài nhẹ nhàng tiện lợi với thiết kế rộng rãi thoải mái.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/448971/item/vngoods_63_448971.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (42, 5, N'SP024', N'Áo Parka Chống UV Bỏ Túi', 2, 78, N'Cắt 3D để di chuyển dễ dàng. Thuận tiện bảo vệ khỏi ánh nắng mặt trời và mưa nhẹ.UPF40.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/446819/item/vngoods_09_446819.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (43, 5, N'SP025', N'Áo Parka Ultra Light Down Siêu Nhẹ (3D Cut)', 4, 90, N'Nhỏ gọn nhưng ấm áp. Thiết kế 3D thể thao giúp bạn dễ dàng di chuyển.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/439806/item/vngoods_55_439806.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-04' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (44, 1, N'2', N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', 0, 67, N'Thư giãn, đường cắt thoải mái. Một chiếc áo thun có cổ giả tạo phong cách riêng.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-06' AS Date))
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantity], [price], [description], [img], [createDate]) VALUES (61, 1, N'SP000001', N'cakeeeee', 1, 100, N'12', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-20' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1, N'Vang Cuong', N'0356068480', N'xóm Trung Thành')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (2, N'Vang Cuong', N'0356068420', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3, N'Vang Cuong', N'0356068420', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (4, N'Vang Cuong', N'12345', N'Hoa Binh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (5, N'Vang Cuong', N'123231', N'Hai Duong')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (6, N'Vang Cuong', N'0356068480', N'xóm Trung Thành')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (7, N'Vang Cuong', N'0356068480', N'Ha noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (8, N'Vang Cuong', N'0356068480', N'xóm Trung Thành')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (9, N'Vang Cuong', N'0123213123', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (10, N'Vang Cuong', N'01232132321', N'xã Mông Hóa  Huyện Kỳ Sơn')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (11, N'Vang Cuong', N'02132132', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (12, N'Vang Cuong', N'0826219183', N'Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (13, N'Vang Cuong', N'012312', N'Ha Giang')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (14, N'Vang Cuong', N'0356068480', N'Trung Thành ,Ky Son, Hoa Binh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (15, N'Vang Cuong', N'0356068480', N'Trần Duy Hưng Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (16, N'Vang Cuong', N'01232131', N'Hà nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (17, N'Vang Cuong', N'012323321', N'Hà Nội')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (18, N'Vang Cuong', N'0356068480', N'Hồ Chí Minh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (19, N'Vang Cuong', N'0356068480', N'xóm Trung Thành Ha Noi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (20, N'Vang Cuong', N'09', N'2')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (21, N'Vang Cuong', N'01', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (22, N'Vang Cuong', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (23, N'Vang Cuong', N'12', N'12')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (24, N'Vang Cuong', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (25, N'lit', N'098', N'12')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (26, N'cakeeeee', N'09', N'12')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (27, N'cakeeeee', N'12', N'12')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (28, N'cakeeeee', N'12', N'12')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (29, N'cakeeeee', N'12', N'12')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (30, N'Administrator', N'0938906650', N'Ha Noi ')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders1_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product1_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
