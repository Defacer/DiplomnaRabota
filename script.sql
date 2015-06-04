USE [master]
GO
/****** Object:  Database [ChartDB]    Script Date: 6/4/2015 1:01:50 AM ******/
CREATE DATABASE [ChartDB]
 CONTAINMENT = NONE

GO
ALTER DATABASE [ChartDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChartDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChartDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChartDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChartDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChartDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChartDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChartDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ChartDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ChartDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChartDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChartDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChartDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChartDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChartDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChartDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChartDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChartDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChartDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChartDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChartDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChartDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChartDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChartDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ChartDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChartDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChartDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChartDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChartDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChartDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChartDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ChartDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/4/2015 1:01:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StationMonitoringInfoes]    Script Date: 6/4/2015 1:01:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StationMonitoringInfoes](
	[StationMonitoringInfoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CPUValue] [int] NOT NULL,
	[MemoryValue] [int] NOT NULL,
 CONSTRAINT [PK_dbo.StationMonitoringInfoes] PRIMARY KEY CLUSTERED 
(
	[StationMonitoringInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201506031503031_AutomaticMigration', N'RealTimeChart.Migrations.Configuration', 0x1F8B0800000000000400CD57CB6EE33614DD17E83F085CB540C6CC63D306D20C327632303A4E8228993D2D5DDB44295225A9C0FEB62EFA49FD855EEAFDF0BBB31804082CEAF2F0DCD7B9D4BF7FFFE37F5A27C27B076DB89201B91A5D120F64A4622E9701C9ECE2C36FE4D3C79F7FF2EFE364ED7DABEC6E9C1DEE9426202B6BD35B4A4DB482849951C223AD8C5AD851A412CA6245AF2F2F7FA757571410822096E7F92F99B43C81FC011FC74A4690DA8C89998A4198721DDF8439AAF7C81230298B20202FC0C42BEE1DAF98B6A3C29E78778233E4128258108F49A92CB3C8F4F6CD4068B592CB30C505DCB94901ED164C18283DB86DCC8F75E6F2DA39439B8D15549419AB921301AF6ECAE8D0FEF6B3624CEAE861FCEE31CE76E3BCCE6388112A90674A72AB3466792A178A78FD936FC742BB5DDBE33DDA8A72E1756C2FEA72C1AA727F17DE381336D31048C8AC66E2C27BCEE682477FC0E655FD09329099106DFAE800BEEB2CE0D2B3562968BB7981C53EA7A613E2D12E18EDA3D55887808A584CA5BDB926DE23D2647301751DB5E216E23EF8021234B3103F336B4163194C63C83331A0D423E0FE57A761E12203E2CDD8FA2BC8A55D05047F12EF81AF21AE564A066F9263D3E226AB333874C8F8F9ED1B13191C726B3FCA0C12A5372703F9B4A9C961A5A21258C6317AE5215F344B576E11D6764B95627B97856A4AD7BB940BD010ECBEFCA27C34940A0DD95EE0DB1DA92937AA450BD9AAE48DEED0377FC6D214B15B7A57AE78612176E30FE1E91A90141834325BA4A0665B9F84FEB125F4DEE2D1C8F4816B6327CCB23973691CC7C9C0AC93A01DC1AF8EDA9B837E973729A9B6BBDF05C4F19AD4876D42FC805E27D8947900A0E6BA4B210738F9706282E9632564AC4496C893046BDF398552B4418B95E3111A1968A334ABC72375A4A00DD67931C4F3692F19FD22A0832AE8097ABFC6F6F567DFA43EBDEED35E3FFA656F1CBE940C9AA530211E06EA9DC7AE51C28DB1908C9CC128FC4B8C05477F1B8319937C01C6168390E0ADE0BA77ABF9716E18D498589C73CDF881473B77C93838BC4F1C91ED692EDF998E50AF7E49D8FAD736D239133B67FBFFE7F56198D3A6F570669C318E8F9FC6459305249EE3C36BE1C3565330678FEEA104F8B4FDF5E24FC0F06503E1BE6524448E43035AD9382E5556300A6D4695C9206996C518CC3B6DF98245165F47604C7E2FCC531990FB640EF1543E6536CDEC9D3190CC45E79EE9D3FDE7E7F7932E67FF29754FE67BB8803439BA004FF273C6455CF37ED8526D3B205C5D956D89ACF05E8C70CB4D8DF4A8E4914065F8269082744DFD0A492A10CC3CC990BDC339DCF00AFA15962CDA544ABE1BE47022BA61F7279C2D354B4C89D1EC775FE4D47D927FFC0F68C335B3C40F0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[StationMonitoringInfoes] ON 

INSERT [dbo].[StationMonitoringInfoes] ([StationMonitoringInfoID], [Name], [CPUValue], [MemoryValue]) VALUES (1, N'VM 0', 99, 38)
INSERT [dbo].[StationMonitoringInfoes] ([StationMonitoringInfoID], [Name], [CPUValue], [MemoryValue]) VALUES (2, N'VM 1', 48, 8)
INSERT [dbo].[StationMonitoringInfoes] ([StationMonitoringInfoID], [Name], [CPUValue], [MemoryValue]) VALUES (3, N'VM 2', 61, 31)
INSERT [dbo].[StationMonitoringInfoes] ([StationMonitoringInfoID], [Name], [CPUValue], [MemoryValue]) VALUES (4, N'VM 3', 39, 44)
INSERT [dbo].[StationMonitoringInfoes] ([StationMonitoringInfoID], [Name], [CPUValue], [MemoryValue]) VALUES (5, N'VM 4', 0, 0)
SET IDENTITY_INSERT [dbo].[StationMonitoringInfoes] OFF
USE [master]
GO
ALTER DATABASE [ChartDB] SET  READ_WRITE 
GO
