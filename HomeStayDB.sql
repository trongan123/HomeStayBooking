USE [master]
GO
/****** Object:  Database [HomeStayDB]    Script Date: 7/21/2022 9:42:12 AM ******/
CREATE DATABASE [HomeStayDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeStayDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HomeStayDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomeStayDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HomeStayDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomeStayDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeStayDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeStayDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeStayDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeStayDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeStayDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeStayDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeStayDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HomeStayDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeStayDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeStayDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeStayDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeStayDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeStayDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeStayDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeStayDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeStayDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeStayDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeStayDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeStayDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeStayDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeStayDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeStayDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeStayDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeStayDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomeStayDB] SET  MULTI_USER 
GO
ALTER DATABASE [HomeStayDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeStayDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeStayDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeStayDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HomeStayDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HomeStayDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[IDACC] [varchar](5) NOT NULL,
	[Mail] [varchar](80) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[FullName] [nvarchar](80) NOT NULL,
	[Phone] [varchar](13) NOT NULL,
	[ST] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDACC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[IDBill] [varchar](5) NOT NULL,
	[IDACC] [varchar](5) NOT NULL,
	[IDAdmin] [varchar](5) NULL,
	[Phone] [varchar](13) NOT NULL,
	[StartDay] [datetime] NOT NULL,
	[EndDay] [datetime] NOT NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingRoomDetail]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingRoomDetail](
	[IDBookingRoomDetail] [varchar](5) NOT NULL,
	[IDBill] [varchar](5) NOT NULL,
	[IDRoom] [varchar](5) NOT NULL,
	[Price] [money] NOT NULL,
	[ST] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBookingRoomDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingSeviceDetail]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingSeviceDetail](
	[IDBookingSeviceDetail] [varchar](5) NOT NULL,
	[IDBill] [varchar](5) NULL,
	[IDSevice] [varchar](5) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[ST] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBookingSeviceDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTransportDetail]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingTransportDetail](
	[IDBookingTransportDetail] [varchar](5) NOT NULL,
	[IDBill] [varchar](5) NOT NULL,
	[IDTransport] [varchar](5) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[ST] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBookingTransportDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[IDComment] [varchar](5) NOT NULL,
	[Rate] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[IDACC] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[IDRoom] [varchar](5) NOT NULL,
	[NumberRoom] [varchar](5) NOT NULL,
	[IDRoomType] [varchar](5) NOT NULL,
	[STRoom] [int] NOT NULL,
	[Image] [varchar](300) NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomType](
	[IDRoomType] [varchar](5) NOT NULL,
	[NameRoomType] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRoomType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[IDservice] [varchar](5) NOT NULL,
	[NameService] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDservice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transport](
	[IDTransport] [varchar](5) NOT NULL,
	[IDTypeTransport] [varchar](5) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTransport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeTransport]    Script Date: 7/21/2022 9:42:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeTransport](
	[IDTypeTransport] [varchar](5) NOT NULL,
	[NameTranspors] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTypeTransport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Account] FOREIGN KEY([IDACC])
REFERENCES [dbo].[Account] ([IDACC])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Account]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([IDBill])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Bill]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Room] FOREIGN KEY([IDRoom])
REFERENCES [dbo].[Room] ([IDRoom])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Room]
GO
ALTER TABLE [dbo].[BookingSeviceDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingSeviceDetail_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([IDBill])
GO
ALTER TABLE [dbo].[BookingSeviceDetail] CHECK CONSTRAINT [FK_BookingSeviceDetail_Bill]
GO
ALTER TABLE [dbo].[BookingSeviceDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingSeviceDetail_Service] FOREIGN KEY([IDSevice])
REFERENCES [dbo].[Service] ([IDservice])
GO
ALTER TABLE [dbo].[BookingSeviceDetail] CHECK CONSTRAINT [FK_BookingSeviceDetail_Service]
GO
ALTER TABLE [dbo].[BookingTransportDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingTransportDetail_Bill] FOREIGN KEY([IDBill])
REFERENCES [dbo].[Bill] ([IDBill])
GO
ALTER TABLE [dbo].[BookingTransportDetail] CHECK CONSTRAINT [FK_BookingTransportDetail_Bill]
GO
ALTER TABLE [dbo].[BookingTransportDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingTransportDetail_Transport] FOREIGN KEY([IDTransport])
REFERENCES [dbo].[Transport] ([IDTransport])
GO
ALTER TABLE [dbo].[BookingTransportDetail] CHECK CONSTRAINT [FK_BookingTransportDetail_Transport]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([IDACC])
REFERENCES [dbo].[Account] ([IDACC])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([IDRoomType])
REFERENCES [dbo].[RoomType] ([IDRoomType])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[Transport]  WITH CHECK ADD  CONSTRAINT [FK_Transport_TypeTransport] FOREIGN KEY([IDTypeTransport])
REFERENCES [dbo].[TypeTransport] ([IDTypeTransport])
GO
ALTER TABLE [dbo].[Transport] CHECK CONSTRAINT [FK_Transport_TypeTransport]
GO
USE [master]
GO
ALTER DATABASE [HomeStayDB] SET  READ_WRITE 
GO
