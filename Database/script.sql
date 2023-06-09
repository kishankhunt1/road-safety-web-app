USE [master]
GO
/****** Object:  Database [TTRoadSafety]    Script Date: 01-03-2023 23:22:15 ******/
CREATE DATABASE [TTRoadSafety]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TTRoadSafety', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\TTRoadSafety.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TTRoadSafety_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\TTRoadSafety_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TTRoadSafety] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TTRoadSafety].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TTRoadSafety] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TTRoadSafety] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TTRoadSafety] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TTRoadSafety] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TTRoadSafety] SET ARITHABORT OFF 
GO
ALTER DATABASE [TTRoadSafety] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TTRoadSafety] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TTRoadSafety] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TTRoadSafety] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TTRoadSafety] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TTRoadSafety] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TTRoadSafety] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TTRoadSafety] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TTRoadSafety] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TTRoadSafety] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TTRoadSafety] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TTRoadSafety] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TTRoadSafety] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TTRoadSafety] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TTRoadSafety] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TTRoadSafety] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TTRoadSafety] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TTRoadSafety] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TTRoadSafety] SET  MULTI_USER 
GO
ALTER DATABASE [TTRoadSafety] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TTRoadSafety] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TTRoadSafety] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TTRoadSafety] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TTRoadSafety] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TTRoadSafety] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TTRoadSafety] SET QUERY_STORE = OFF
GO
USE [TTRoadSafety]
GO
/****** Object:  Table [dbo].[OTH_Traffic]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTH_Traffic](
	[TrafficID] [int] IDENTITY(1,1) NOT NULL,
	[TrafficDate] [datetime] NOT NULL,
	[TrafficLocation] [text] NOT NULL,
	[TrafficVolume] [int] NOT NULL,
 CONSTRAINT [PK_OTH_Traffic] PRIMARY KEY CLUSTERED 
(
	[TrafficID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTH_Treatment]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTH_Treatment](
	[TreatmentID] [int] IDENTITY(1,1) NOT NULL,
	[TreatmentName] [nvarchar](50) NOT NULL,
	[DoctorName] [nvarchar](50) NULL,
	[NearestHospital] [text] NOT NULL,
	[AccidentID] [int] NOT NULL,
 CONSTRAINT [PK_OTH_Treatment] PRIMARY KEY CLUSTERED 
(
	[TreatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POB_Accident]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POB_Accident](
	[AccidentID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleImage] [nvarchar](500) NOT NULL,
	[NumberPlate] [nvarchar](20) NOT NULL,
	[VictimName] [nvarchar](50) NULL,
	[Latitude] [nvarchar](max) NOT NULL,
	[Longitude] [nvarchar](max) NOT NULL,
	[AccidentDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_POB_Accident] PRIMARY KEY CLUSTERED 
(
	[AccidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POB_Emergency]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POB_Emergency](
	[EmergencyID] [int] IDENTITY(1,1) NOT NULL,
	[EmergencyName] [nvarchar](50) NOT NULL,
	[EmergencyNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_POB_Emergency] PRIMARY KEY CLUSTERED 
(
	[EmergencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POB_Weather]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POB_Weather](
	[WeatherID] [int] IDENTITY(1,1) NOT NULL,
	[Temperature] [int] NOT NULL,
	[Humidity] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[WindSpeed] [float] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_POB_Weather] PRIMARY KEY CLUSTERED 
(
	[WeatherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[POB_Accident] ON 

INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (2, N'~/Upload/2020_chevrolet_corvette_stingray_z51_4k_8k-7680x4320.jpg', N'GJ03AS3456', N'Mohan', N'22.293226', N'70.799847', CAST(N'2023-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (3, N'~/Upload/2019_mercedes_amg_g63_by_lumma_design_4k_8k-7680x4320.jpg', N'GJ10BC1234', N'Jigar', N'22.295132', N'70.81461', CAST(N'2022-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (4, N'~/Upload/2022_mclaren_artura_4k_8k_hd_cars-7680x4320.jpg', N'MH03AB1235', N'Kalia', N'22.281194', N'70.803344', CAST(N'2022-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (5, N'~/Upload/abt_audi_q8_2019_4k_8k-7680x4320.jpg', N'GJ11AH4938', N'Rajesh', N'22.27488', N'70.79533', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (6, N'~/Upload/audi_aitrail_quattro_2019_4k_8k-7680x4320.jpg', N'gj10dd5143', N'darshit', N'22.203935', N'70.372238', CAST(N'2023-02-26T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (7, N'~/Upload/abt_audi_q8_2019_4k_8k-7680x4320.jpg', N'GJ10BC6969', N'Pratham123', N'22.305853', N'70.814824', CAST(N'2023-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (8, N'~/Upload/2022_mclaren_artura_4k_8k_hd_cars-7680x4320.jpg', N'GJ03AS3456', N'Pratham1234', N'22.297157', N'70.803258', CAST(N'2023-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (9, N'~/Upload/bmw_vision_m_next_2019_4k_8k-7680x4320.jpg', N'GJ03BR9621', N'Aditya Joshi', N'22.247614', N'70.82301', CAST(N'2023-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1007, N'~/Upload/ant-man-and-the-wasp-uhd-8k-wallpaper.jpg', N'GJ10BC6969', N'Aman', N'22.30625', N'70.85804', CAST(N'2023-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1008, N'~/Upload/2022_gmc_hummer_4k_8k_hd_cars-7680x4320.jpg', N'GJ10BC1234', N'Random', N'19.041349', N'72.982178', CAST(N'2022-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1009, N'~/Upload/avengers-infinity-war-2018-uhd-8k-wallpaper.jpg', N'GJ10AB2020', N'Harsh Tank', N'22.308711', N'70.781178', CAST(N'2023-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1010, N'~/Upload/2020_lamborghini_huracan_evo_rwd_4k_8k-7680x4320.jpg', N'GJ10BC5656', N'Kunj', N'23.034243', N'72.596283', CAST(N'2525-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1011, N'~/Upload/ford_mustang_gt_4k_8k-7680x4320.jpg', N'GJ10BC6969', N'Dangar', N'22.464539', N'70.069706', CAST(N'2022-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1012, N'~/Upload/Screenshot (183).png', N'GJ36BC5082', N'Somu', N'25.681137', N'71.422119', CAST(N'2023-10-31T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1014, N'~/Upload/2020_lamborghini_huracan_evo_rwd_4k_8k-7680x4320.jpg', N'GJ03AS3456', N'Pratham', N'22.301803', N'70.807743', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1015, N'~/Upload/avengers-infinity-war-groot-uhd-8k-wallpaper.jpg', N'GJ03BC0420', N'Kishan Khunt', N'31.933517', N'71.878052', CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[POB_Accident] ([AccidentID], [VehicleImage], [NumberPlate], [VictimName], [Latitude], [Longitude], [AccidentDateTime]) VALUES (1016, N'~/Upload/2020_ford_gt_liquid_carbon_4k_8k_2-7680x4320.jpg', N'UP90BC9090', N'Kesari Lal', N'26.70636', N'83.413696', CAST(N'2023-02-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[POB_Accident] OFF
GO
SET IDENTITY_INSERT [dbo].[POB_Emergency] ON 

INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (1, N'Police', N'100')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (2, N'Ambulance', N'108')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (3, N'Fire', N'101')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (4, N'Railway', N'139')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (5, N'Trauma Services', N'102')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (6, N'Highway Helpline', N'1033')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (7, N'Metro Rail Corp', N'1553')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (8, N'Road Disaster', N'1078')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (9, N'Accident SOS', N'1073')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (11, N'Poisons Info', N'154')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (12, N'Flood SOS', N'011')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (13, N'Tourist Helpline', N'1363')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (14, N'LPG Leak', N'1906')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (15, N'Children Emergency', N'1098')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (16, N'PO Emergency', N'1033')
INSERT [dbo].[POB_Emergency] ([EmergencyID], [EmergencyName], [EmergencyNumber]) VALUES (17, N'Senior Citizen Helpline', N'1456')
SET IDENTITY_INSERT [dbo].[POB_Emergency] OFF
GO
ALTER TABLE [dbo].[OTH_Traffic] ADD  CONSTRAINT [DF_OTH_Traffic_TrafficDate]  DEFAULT (getdate()) FOR [TrafficDate]
GO
ALTER TABLE [dbo].[POB_Accident] ADD  CONSTRAINT [DF_POB_Accident_AccidentDateTime]  DEFAULT (getdate()) FOR [AccidentDateTime]
GO
ALTER TABLE [dbo].[POB_Weather] ADD  CONSTRAINT [DF_POB_Weather_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[OTH_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_OTH_Treatment_OTH_Treatment] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[POB_Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[OTH_Treatment] CHECK CONSTRAINT [FK_OTH_Treatment_OTH_Treatment]
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Traffic_DeleteByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Traffic_DeleteByPK]
    @TrafficID   INT
  AS
  DELETE 
  FROM  [dbo].[OTH_Traffic]
  where  [dbo].[OTH_Traffic].[TrafficID] = @TrafficID
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Traffic_Insert]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Traffic_Insert]
    @TrafficLocation TEXT,
    @TrafficVolume   INT
  AS
  INSERT 
  INTO   [dbo].[OTH_Traffic]
  (
    [dbo].[OTH_Traffic].[TrafficLocation],
    [dbo].[OTH_Traffic].[TrafficVolume]
  )
  VALUES
  (
    @TrafficLocation,
  @TrafficVolume
  )
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Traffic_SelectAll]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_OTH_Traffic_SelectAll]
AS
SELECT
	  [dbo].[OTH_Traffic].[TrafficID],
      [dbo].[OTH_Traffic].[TrafficDate], 
      [dbo].[OTH_Traffic].[TrafficLocation],
	  [dbo].[OTH_Traffic].[TrafficVolume]
  FROM    [dbo].[OTH_Traffic]
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Traffic_SelectByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Traffic_SelectByPK]
    @TrafficID INT
  AS
  SELECT 
    [dbo].[OTH_Traffic].[TrafficID],
    [dbo].[OTH_Traffic].[TrafficDate],
    [dbo].[OTH_Traffic].[TrafficLocation],
    [dbo].[OTH_Traffic].[TrafficVolume]
  FROM  [dbo].[OTH_Traffic]
  WHERE  [dbo].[OTH_Traffic].[TrafficID] = @TrafficID
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Traffic_UpdateByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Traffic_UpdateByPK]
    @TrafficID			INT,
    @TrafficLocation	NVARCHAR(500),
    @TrafficVolume		INT
  AS
  UPDATE [dbo].[OTH_Traffic]
  SET
    [dbo].[OTH_Traffic].[TrafficLocation]=@TrafficLocation,
    [dbo].[OTH_Traffic].[TrafficVolume]=@TrafficVolume
WHERE  [dbo].[OTH_Traffic].[TrafficID]=@TrafficID
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Treatment_DeleteByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Treatment_DeleteByPK]
    @TreatementID   INT
  AS
  DELETE 
  FROM  [dbo].[OTH_Treatment]
  where  [dbo].[OTH_Treatment].[TreatmentID] = @TreatementID
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Treatment_Insert]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Treatment_Insert] 
    @TreatmentName   NVARCHAR(50),
    @DoctorName     NVARCHAR(50),
    @NearestHospital    TEXT,
    @AccidentID  INT
  AS
  INSERT 
  INTO   [dbo].[OTH_Treatment]
  (
    [dbo].[OTH_Treatment].[TreatmentName],
    [dbo].[OTH_Treatment].[DoctorName],
    [dbo].[OTH_Treatment].[NearestHospital],
    [dbo].[OTH_Treatment].[AccidentID]
  )
  VALUES
  (
    @TreatmentName,
    @DoctorName,
  @NearestHospital,
  @AccidentID
  )
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Treatment_SelectAll]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_OTH_Treatment_SelectAll]
AS
SELECT
	  [dbo].[OTH_Treatment].[TreatmentID],
      [dbo].[OTH_Treatment].[TreatmentName], 
      [dbo].[OTH_Treatment].[DoctorName],
	  [dbo].[OTH_Treatment].[NearestHospital],
	  [dbo].[OTH_Treatment].[NearestHospital],
	  [dbo].[POB_Accident].[AccidentID],
	  [dbo].[POB_Accident].[Longitude],
	  [dbo].[POB_Accident].[Latitude]
  FROM    [dbo].[OTH_Treatment]
  INNER JOIN [dbo].[POB_Accident]
  ON  [dbo].[POB_Accident].[AccidentID]=[dbo].[OTH_Treatment].[AccidentID]
GO
/****** Object:  StoredProcedure [dbo].[PR_OTH_Treatment_SelectByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OTH_Treatment_SelectByPK]
    @TreatmentID INT
  AS
  SELECT 
    [dbo].[OTH_Treatment].[TreatmentName],
    [dbo].[OTH_Treatment].[DoctorName],
    [dbo].[OTH_Treatment].[NearestHospital],
    [dbo].[OTH_Treatment].[AccidentID],
	[dbo].[POB_Accident].[Longitude],
	[dbo].[POB_Accident].[Latitude]
  FROM  [dbo].[OTH_Treatment]
  INNER JOIN [dbo].[POB_Accident]
  ON  [dbo].[POB_Accident].[AccidentID]=[dbo].[OTH_Treatment].[AccidentID]
  WHERE  [dbo].[OTH_Treatment].[TreatmentID] = @TreatmentID
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Accident_DeletebyPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Accident_DeletebyPK] 
@AccidentID INT
AS
DELETE
FROM [dbo].[POB_Accident]
WHERE [dbo].[POB_Accident].[AccidentID]= @AccidentID
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Accident_Insert]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Accident_Insert]
	@VictimName NVARCHAR(50),
	@NumberPlate NVARCHAR(20),
	@VehicleImage NVARCHAR(500),
	@Latitude NVARCHAR(max),
	@Longitude NVARCHAR(max),
	@AccidentDateTime DATETIME
AS

INSERT 
INTO [dbo].[POB_Accident]
(
	[dbo].[POB_Accident].[VictimName],
	[dbo].[POB_Accident].[NumberPlate],
	[dbo].[POB_Accident].[VehicleImage],
	[dbo].[POB_Accident].[Latitude],
	[dbo].[POB_Accident].[Longitude],
	[dbo].[POB_Accident].[AccidentDateTime]
)
VALUES
(
	@VictimName,
	@NumberPlate,
	@VehicleImage,
	@Latitude,
	@Longitude,
	@AccidentDateTime
)
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Accident_SelectAll]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_POB_Accident_SelectAll]
AS
SELECT
	  [dbo].[POB_Accident].[AccidentID],
      [dbo].[POB_Accident].[VehicleImage], 
      [dbo].[POB_Accident].[NumberPlate],
	  [dbo].[POB_Accident].[VictimName],
	  [dbo].[POB_Accident].[Latitude],
	  [dbo].[POB_Accident].[Longitude],
	  [dbo].[POB_Accident].[AccidentDateTime]
  FROM    [dbo].[POB_Accident]
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Accident_SelectByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Accident_SelectByPK]
    @AccidentID INT
  AS
  SELECT 
    [dbo].[POB_Accident].[AccidentID],
    [dbo].[POB_Accident].[VehicleImage], 
    [dbo].[POB_Accident].[NumberPlate], 
    [dbo].[POB_Accident].[VictimName], 
    [dbo].[POB_Accident].[Latitude],
    [dbo].[POB_Accident].[Longitude],
    [dbo].[POB_Accident].[AccidentDateTime]
  FROM  [dbo].[POB_Accident]
  WHERE  [dbo].[POB_Accident].[AccidentID] = @AccidentID
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Accident_UpdateByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Accident_UpdateByPK]
    @AccidentID		INT,
    @VehicleImage	NVARCHAR(500),
    @NumberPlate	NVARCHAR(20),
	@VictimName		NVARCHAR(50),
	@Latitude		NVARCHAR(MAX),
	@Longitude		NVARCHAR(MAX),
	@AccidentDateTime	datetime

    
  AS
  UPDATE [dbo].[POB_Accident]
  SET
    [dbo].[POB_Accident].[VehicleImage]=@VehicleImage,
    [dbo].[POB_Accident].[NumberPlate]=@NumberPlate,
    [dbo].[POB_Accident].[VictimName]=@VictimName,
    [dbo].[POB_Accident].[Latitude]=@Latitude,
    [dbo].[POB_Accident].[Longitude]=@Longitude
WHERE  [dbo].[POB_Accident].[AccidentID]=@AccidentID
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Emergency_DeleteByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Emergency_DeleteByPK]
    @EmergencyID   INT
  AS
  DELETE 
  FROM  [dbo].[POB_Emergency]
  where  [dbo].[POB_Emergency].[EmergencyID] = @EmergencyID
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Emergency_Insert]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Emergency_Insert]
@EmergencyName		nvarchar(50),
@EmergencyNumber	nvarchar(50)

AS

BEGIN

		INSERT
		INTO	[dbo].[POB_Emergency]
		(
			[dbo].[POB_Emergency].[EmergencyName],
			[dbo].[POB_Emergency].[EmergencyNumber]
		)
		VALUES
		(
			@EmergencyName,
			@EmergencyNumber
		)

END
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Emergency_SelectAll]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_POB_Emergency_SelectAll]
AS
SELECT
	  [dbo].[POB_Emergency].[EmergencyID],
      [dbo].[POB_Emergency].[EmergencyName], 
      [dbo].[POB_Emergency].[EmergencyNumber]
  FROM    [dbo].[POB_Emergency]
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Emergency_SelectByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_POB_Emergency_SelectByPK]
@EmergencyID int
AS
SELECT
	  [dbo].[POB_Emergency].[EmergencyID],
      [dbo].[POB_Emergency].[EmergencyName], 
      [dbo].[POB_Emergency].[EmergencyNumber]
  FROM    [dbo].[POB_Emergency]
  where [dbo].[POB_Emergency].[EmergencyID]=@EmergencyID
GO
/****** Object:  StoredProcedure [dbo].[PR_POB_Emergency_UpdateByPK]    Script Date: 01-03-2023 23:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_POB_Emergency_UpdateByPK]
    @EmergencyID    INT,
    @EmergencyName  NVARCHAR(50),
    @EmergencyNumber  NVARCHAR(50)
    
  AS
  UPDATE [dbo].[POB_Emergency]
  SET
    [dbo].[POB_Emergency].[EmergencyName]=@EmergencyName,
    [dbo].[POB_Emergency].[EmergencyNumber]=@EmergencyNumber
  WHERE  [dbo].[POB_Emergency].[EmergencyID]=@EmergencyID
GO
USE [master]
GO
ALTER DATABASE [TTRoadSafety] SET  READ_WRITE 
GO
