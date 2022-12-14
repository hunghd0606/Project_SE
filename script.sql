USE [master]
GO
/****** Object:  Database [ShoppingOnlineText]    Script Date: 27/11/2022 11:49:41 CH ******/
CREATE DATABASE [ShoppingOnlineText]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingOnlineText', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShoppingOnlineText.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingOnlineText_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShoppingOnlineText_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoppingOnlineText] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingOnlineText].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingOnlineText] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingOnlineText] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingOnlineText] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingOnlineText] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingOnlineText] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingOnlineText] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingOnlineText] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingOnlineText] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingOnlineText] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingOnlineText] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingOnlineText] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingOnlineText] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingOnlineText', N'ON'
GO
ALTER DATABASE [ShoppingOnlineText] SET QUERY_STORE = OFF
GO
USE [ShoppingOnlineText]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 27/11/2022 11:49:41 CH ******/
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
	[status_id] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[productId] [int] NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/11/2022 11:49:41 CH ******/
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
/****** Object:  Table [dbo].[discoutP]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discoutP](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[percentP] [tinyint] NULL,
	[quantity] [tinyint] NULL,
 CONSTRAINT [PK_discoutP] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_order_id] [int] NULL,
	[product_Id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ship_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](250) NULL,
	[created_Sale_date] [date] NULL,
	[created_Order_date] [date] NULL,
	[statusO_id] [int] NULL,
	[isDiscount] [bit] NULL,
	[orderDetail_id] [int] NULL,
 CONSTRAINT [PK_Orders1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[code] [nvarchar](250) NULL,
	[name] [nvarchar](250) NULL,
	[quantitySale] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](1000) NULL,
	[img] [nvarchar](250) NULL,
	[createDate] [date] NULL,
	[discount_id] [int] NULL,
	[account_id] [int] NULL,
	[isExit] [bit] NULL,
 CONSTRAINT [PK_Product1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusA]    Script Date: 27/11/2022 11:49:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusA](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[status_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_statusA] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (1, N'admin', N'123', N'Administrator', N'Ha Noi ', N'vietldhe153395@fpt.edu.vn', N'0938906650', 2, 1)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (2, N'user', N'123', N'Hung', N'Nam Định', N'hung@gmail.com', N'0914878523', 2, 2)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (3, N'Hoang', N'123', N'Hoang', N'Ha Nam', N'hoang@gmail.com', N'09412345678', 2, 2)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (7, N'Hung', N'123', N'Hoang Hung', N'Bac Giang', N'kingeric0606@gmail.com', N'0941895026', 2, 3)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (10, N'user1', N'123', N'Duc Hung', N'Ha Noi', N'kingeric0606@gmail.com', N'0941895026', 2, 3)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (11, N'user2', N'123', N'Hoang Duc Hung', N'Nam Dinh', N'user2@gmail.com', N'0896548965', 2, 3)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (12, N'Tien123', N'123', N'Tien', N'Ha Noi', N'tien@gmail.com', N'012345566', 2, 2)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (13, N'Tuan123', N'123', N'Tuan', N'Nam Dinh', N'tuan@gmail.com', N'123333333', 2, 2)
INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone], [status_id], [role_id]) VALUES (14, N'Thien', N'123', N'Thien', N'Thanh Hoa', N'thien@gmai.com', N'122222222', 2, 3)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartId], [quantity], [productId], [account_id]) VALUES (15, 10, 20, 7)
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
SET IDENTITY_INSERT [dbo].[discoutP] ON 

INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (1, 10, 10)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (2, 20, 10)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (3, 0, 0)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (4, 10, 101)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (5, 90, 101)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (6, 90, 2)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (7, 10, 1)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (8, 90, 21)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (9, 10, 11)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (10, 90, 22)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (11, 90, 12)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (12, 0, 42)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (13, 0, 10)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (14, 90, 13)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (15, 10, 12)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (16, 90, 10)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (17, 90, 1)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (18, 70, 1)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (19, 10, 0)
INSERT [dbo].[discoutP] ([discount_id], [percentP], [quantity]) VALUES (20, 0, 1)
SET IDENTITY_INSERT [dbo].[discoutP] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [account_order_id], [product_Id], [quantity]) VALUES (51, 7, 36, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [ship_id], [totalPrice], [note], [created_Sale_date], [created_Order_date], [statusO_id], [isDiscount], [orderDetail_id]) VALUES (31, 11, 231, N'de vo', CAST(N'2022-10-10' AS Date), CAST(N'2022-10-15' AS Date), 4, 0, 51)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (2, 1, N'SP002', N'Áo Thun Cổ Tròn Ngắn Tay1', 11, 15, 100, N'Thiết kế màu đặc trưng của MARNI. Đường cắt thoải mái.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451483/item/vngoods_57_451483.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 20, 2, 0)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (5, 1, N'SP005', N'Áo Thun Dry-EX Cổ Tròn Ngắn Tay', 0, 40, 30, N'Áo thun được thiết kế để tạo sự thoải mái mát mẻ. Hoàn hảo cho các hoạt động thể thao.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450322/item/goods_03_450322.jpg?width=1600&impolicy=quality_75', CAST(N'2022-05-20' AS Date), 13, 2, 0)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (6, 2, N'SP006', N'Quần Jeans Siêu Co Giãn', 0, 54, 100, N'Quần jean skinny với độ co giãn đáng kinh ngạc. Tạo điểm nhấn với một vài chi tiết bụi bặm thực tế.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/452519/item/vngoods_62_452519.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (7, 2, N'SP007', N'EZY Quần Jeans Siêu Co Giãn', 0, 19, 23, N'Cái nhìn về vải denim thật với cảm giác mềm mại của quần thể thao. Quần jean thoải mái để thư giãn ở nhà hoặc mặc đi chơi.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450246/item/vngoods_64_450246.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (8, 2, N'SP008', N'Quần Jeans Ống Rộng', 0, 14, 20, N'Updated wide-leg silhouette with slightly tapered hems.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450245/item/vngoods_08_450245.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (9, 2, N'SP009', N'Quần Jeans Siêu Co Giãn', 0, 16, 27, N'Quần jean skinny với độ co giãn đáng kinh ngạc. Các chi tiết thiết kế tạo nên một cái nhìn tinh xảo.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450242/item/vngoods_67_450242.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (10, 2, N'SP010', N'EZY Quần Jeans', 0, 10, 20, N'The look of jeans meets the comfort of sweats.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqQVASOERXYpSchhRgxR2nmaRLIjjfxlefrw&usqp=CAU', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (11, 3, N'SP011', N'Thắt Lưng Da Thuộc Ý Bản Mỏng', 0, 12, 24, N'Được làm bằng da sáp ngựa điên cao cấp của Ý. Bản thắt lưng hẹp cho một cái nhìn gọn gàng.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/446276/item/goods_09_446276.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (13, 3, N'SP012', N'Thắt Lưng', 0, 14, 19, N'Thắt lưng dạng lưới làm bằng da dẻo dây đan vào nhau tạo nên nét riêng biệt.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/442224/item/goods_38_442224.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-26' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (17, 3, N'SP013', N'Thắt Lưng Da Da Bò Sáp Ngựa Điên Ý', 0, 10, 14, N'Được làm từ loại da dày, chất lượng cao của Ý. Chiều rộng và lỗ khóa của thắt lưng đã được cập nhật.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/442220/item/goods_38_442220.jpg?width=1600&impolicy=quality_75', CAST(N'2022-03-13' AS Date), 3, 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (20, 3, N'SP014', N'Thắt Lưng Da Thuộc Ý', 0, 12, 31, N'Tận hưởng cảm giác sang trọng và kết cấu chất lượng cao của da cao cấp. Được thiết kế với sự chú ý tỉ mỉ đến từng chi tiết.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/435358/item/goods_09_435358.jpg?width=1600&impolicy=quality_75', CAST(N'2022-03-13' AS Date), 19, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (22, 3, N'SP015', N'Thắt Lưng Da Ý May Viền', 0, 4, 221, N'Một chiếc thắt lưng cao cấp với đường may tỉ mỉ. Một sự bổ sung cho bất kỳ trang phục theo phong cách nào.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/433767/item/goods_38_433767.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-01' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (23, 4, N'SP016', N'AIRism Quần Lót Boxer Brief Kẻ Caro Cạp ThấpAIRism Quần AIRism Quần Lót Boxer Brief Kẻ Caro Cạp Thấp', 0, 4, 221, N'Chất liệu AIRism thoáng mát, mịn màng. Cạp thấp giúp nằm ẩn dưới các lớp ngoài.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/449455/item/goods_63_449455.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-01' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (36, 4, N'SP018', N'AIRism Quần Lót Boxer Briefs Không Đường May', 1, 5, 231, N'Thiết kế không đường may cho một sự vừa vặn hoàn hảo và thoải mái.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/448078/item/goods_03_448078.jpg?width=1600&impolicy=quality_75', CAST(N'2022-04-01' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (37, 4, N'SP019', N'Airism Quần Lót Boxer Briefs Cạp Trễ', 0, 2, 27, N'Chất liệu AIRism thoáng mát thoải mái. Thiết kế cạp thấp ẩn tốt dưới các lớp trang phục ngoài.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/448082/item/goods_09_448082.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (38, 4, N'SP020', N'AIRism Quần Lót Boxer Briefs Vải Mắt Lưới', 0, 3, 43, N'Quần áo mặc trong mềm mại, mượt mà, và vừa vặn thoải mái. Thiết kế phần chân dài hơn giúp bạn luôn thoáng mát và khô ráo.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/434432/item/goods_03_434432.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (39, 5, N'SP021', N'Áo Parka Bỏ Túi', 0, 2, 163, N'Một chiếc áo parka đa năng với màu sắc đặc trưng của MARNI. Túi đựng có biểu tượng UNIQLO và bộ sưu tập MARNI.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/449645/item/vngoods_59_449645.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (40, 5, N'SP022', N'Áo Parka Blocktech', 0, 1, 57, N'Parka này không thấm nước, chống gió và cực kỳ thoáng khí. Thiết kế đa năng phù hợp cho các môn thể thao hoặc trang phục bình thường.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/449039/item/vngoods_03_449039.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (41, 5, N'SP023', N'Áo Parka Cotton', 0, 5, 101, N'Một lớp khoác bên ngoài nhẹ nhàng tiện lợi với thiết kế rộng rãi thoải mái.', N'https://ae01.alicdn.com/kf/Sdbfb4424b54746588040e849c3a5af7et/2022-New-Winter-Jacket-Women-Parkas-Short-Korean-Loose-Thick-Warm-Casual-Overcoat-Jacket-Female-Cotton.jpg', CAST(N'2022-07-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (42, 5, N'SP024', N'Áo Parka Chống UV Bỏ Túi', 0, 2, 78, N'Cắt 3D để di chuyển dễ dàng. Thuận tiện bảo vệ khỏi ánh nắng mặt trời và mưa nhẹ.UPF40.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/446819/item/vngoods_09_446819.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (43, 5, N'SP025', N'Áo Parka Ultra Light Down Siêu Nhẹ (3D Cut)', 0, 4, 90, N'Nhỏ gọn nhưng ấm áp. Thiết kế 3D thể thao giúp bạn dễ dàng di chuyển.', N'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/439704/sub/goods_439704_sub21.jpg?width=1600&impolicy=quality_75', CAST(N'2022-02-04' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (44, 1, N'SP026', N'AIRism Cotton Áo Thun Cổ Giả Dáng Rộng', 0, 0, 67, N'Thư giãn, đường cắt thoải mái. Một chiếc áo thun có cổ giả tạo phong cách riêng.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-06' AS Date), 3, 3, 1)
INSERT [dbo].[Product] ([id], [categoryId], [code], [name], [quantitySale], [quantity], [price], [description], [img], [createDate], [discount_id], [account_id], [isExit]) VALUES (61, 1, N'SP027', N'cakeeeee', 0, 0, 100, N'Thư giãn, đường cắt thoải mái. Một chiếc áo thun có cổ giả tạo phong cách riêng.', N'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455933/item/vngoods_74_455933.jpg?width=1600&impolicy=quality_75', CAST(N'2022-07-20' AS Date), 3, 3, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'user_ng_ban')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'user_ng_mua')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'user_ship')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (5, N'_active_account')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (6, N'_active_order')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[statusA] ON 

INSERT [dbo].[statusA] ([status_id], [role_id], [status_name]) VALUES (1, 5, N'Lock')
INSERT [dbo].[statusA] ([status_id], [role_id], [status_name]) VALUES (2, 5, N'Active ')
INSERT [dbo].[statusA] ([status_id], [role_id], [status_name]) VALUES (3, 6, N'Delivery in progress')
INSERT [dbo].[statusA] ([status_id], [role_id], [status_name]) VALUES (4, 6, N'Delivered')
INSERT [dbo].[statusA] ([status_id], [role_id], [status_name]) VALUES (5, 6, N'Cancel order')
SET IDENTITY_INSERT [dbo].[statusA] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders1_created_date]  DEFAULT (getdate()) FOR [created_Order_date]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product1_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_statusA] FOREIGN KEY([status_id])
REFERENCES [dbo].[statusA] ([status_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_statusA]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Account] FOREIGN KEY([account_order_id])
REFERENCES [dbo].[Account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_Id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([ship_id])
REFERENCES [dbo].[Account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderDetail] FOREIGN KEY([orderDetail_id])
REFERENCES [dbo].[OrderDetail] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_statusA] FOREIGN KEY([statusO_id])
REFERENCES [dbo].[statusA] ([status_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_statusA]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_discoutP] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discoutP] ([discount_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_discoutP]
GO
ALTER TABLE [dbo].[statusA]  WITH CHECK ADD  CONSTRAINT [FK_statusA_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[statusA] CHECK CONSTRAINT [FK_statusA_Role]
GO
USE [master]
GO
ALTER DATABASE [ShoppingOnlineText] SET  READ_WRITE 
GO
