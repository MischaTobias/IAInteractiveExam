USE [master]
GO
/****** Object:  Database [IAExam]    Script Date: 11/13/2022 11:17:52 PM ******/
CREATE DATABASE [IAExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IAExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IAExam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IAExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IAExam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IAExam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IAExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IAExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IAExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IAExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IAExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IAExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [IAExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IAExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IAExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IAExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IAExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IAExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IAExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IAExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IAExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IAExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IAExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IAExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IAExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IAExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IAExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IAExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IAExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IAExam] SET RECOVERY FULL 
GO
ALTER DATABASE [IAExam] SET  MULTI_USER 
GO
ALTER DATABASE [IAExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IAExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IAExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IAExam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IAExam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IAExam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IAExam', N'ON'
GO
ALTER DATABASE [IAExam] SET QUERY_STORE = OFF
GO
USE [IAExam]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grimoires]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grimoires](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[CloverLeaves] [tinyint] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MagicAffinities]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MagicAffinities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentApplication]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentApplication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[ApplicationStatus] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGrimoire]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGrimoire](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[GrimoireID] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/13/2022 11:17:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[ID] [nvarchar](10) NULL,
	[Age] [tinyint] NULL,
	[MagicAffinity] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApplicationStatus] ON 
GO
INSERT [dbo].[ApplicationStatus] ([ID], [Name]) VALUES (1, N'En Proceso')
GO
INSERT [dbo].[ApplicationStatus] ([ID], [Name]) VALUES (2, N'Aceptada')
GO
INSERT [dbo].[ApplicationStatus] ([ID], [Name]) VALUES (3, N'Rechazada')
GO
SET IDENTITY_INSERT [dbo].[ApplicationStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Grimoires] ON 
GO
INSERT [dbo].[Grimoires] ([ID], [Name], [CloverLeaves], [Status]) VALUES (1, N'Sinceridad', 1, 1)
GO
INSERT [dbo].[Grimoires] ([ID], [Name], [CloverLeaves], [Status]) VALUES (2, N'Esperanza', 2, 1)
GO
INSERT [dbo].[Grimoires] ([ID], [Name], [CloverLeaves], [Status]) VALUES (3, N'Amor', 3, 1)
GO
INSERT [dbo].[Grimoires] ([ID], [Name], [CloverLeaves], [Status]) VALUES (4, N'Buena Fortuna', 4, 1)
GO
INSERT [dbo].[Grimoires] ([ID], [Name], [CloverLeaves], [Status]) VALUES (5, N'Desesperación', 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Grimoires] OFF
GO
SET IDENTITY_INSERT [dbo].[MagicAffinities] ON 
GO
INSERT [dbo].[MagicAffinities] ([ID], [Name], [Status]) VALUES (1, N'Oscuridad', NULL)
GO
INSERT [dbo].[MagicAffinities] ([ID], [Name], [Status]) VALUES (2, N'Luz', NULL)
GO
INSERT [dbo].[MagicAffinities] ([ID], [Name], [Status]) VALUES (3, N'Fuego', NULL)
GO
INSERT [dbo].[MagicAffinities] ([ID], [Name], [Status]) VALUES (4, N'Agua', NULL)
GO
INSERT [dbo].[MagicAffinities] ([ID], [Name], [Status]) VALUES (5, N'Viento', NULL)
GO
INSERT [dbo].[MagicAffinities] ([ID], [Name], [Status]) VALUES (6, N'Tierra', NULL)
GO
SET IDENTITY_INSERT [dbo].[MagicAffinities] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([ID], [Name]) VALUES (1, N'Activo')
GO
INSERT [dbo].[Status] ([ID], [Name]) VALUES (2, N'Inactivo')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[Grimoires]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[MagicAffinities]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[StudentApplication]  WITH CHECK ADD FOREIGN KEY([ApplicationStatus])
REFERENCES [dbo].[ApplicationStatus] ([ID])
GO
ALTER TABLE [dbo].[StudentApplication]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[StudentApplication]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[StudentGrimoire]  WITH CHECK ADD FOREIGN KEY([GrimoireID])
REFERENCES [dbo].[Grimoires] ([ID])
GO
ALTER TABLE [dbo].[StudentGrimoire]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[StudentGrimoire]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([MagicAffinity])
REFERENCES [dbo].[MagicAffinities] ([ID])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[AssignGrimoire]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[AssignGrimoire]
@StudentID int,
@GrimoireID int
as 
begin
	insert into StudentGrimoire (StudentID, GrimoireID, Status)
	values (@StudentID, @GrimoireID, 1)

	select ID as 'StudentGrimoireID', StudentID as 'StudentID', GrimoireID as 'GrimoireID' 
	from StudentGrimoire where ID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[CreateApplication]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[CreateApplication]
@Name nvarchar(20),
@LastName nvarchar(20),
@ID nvarchar(10),
@Age tinyint,
@MagicAffinity tinyint
as 
begin
	insert into Students (Name, LastName, ID, Age, MagicAffinity, Status)
	values (@Name, @LastName, @ID, @Age, @MagicAffinity, 1)

	declare @studentID int;

	select @studentID = @@IDENTITY;

	insert into StudentApplication (StudentID, ApplicationStatus, Status)
	values (@studentID, 1, 1)

	select @@IDENTITY as 'ApplicationID', @studentID as 'StudentID', ApplicationStatus as 'ApplicationStatus' from StudentApplication
	where ID = @@IDENTITY
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteApplication]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[DeleteApplication]
@ApplicationID int
as 
begin
	update StudentApplication
	set Status = 2
	where ID = @ApplicationID

	select @ApplicationID as 'ApplicationID', a.StudentID as 'StudentID', b.Name as 'Status' from StudentApplication a
	inner join Status b on a.Status = b.ID
	where a.ID = @ApplicationID
end

GO
/****** Object:  StoredProcedure [dbo].[GetApplications]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetApplications]
as 
begin
	select a.ID as 'ApplicationID', a.StudentID as 'StudentDbID', d.Name as 'ApplicationStatus',
		b.Name as 'StudentName', b.LastName as 'StudentLastName', b.ID as 'StudentID', b.Age as 'StudentAge',
		c.Name as 'StudentMagicAffinity'
	from StudentApplication a
	inner join Students b on a.StudentID = b.StudentID
	inner join MagicAffinities c on b.MagicAffinity = c.ID
	inner join ApplicationStatus d on a.ApplicationStatus = d.ID
	where a.Status = 1
end
GO
/****** Object:  StoredProcedure [dbo].[GetGrimoireAssignations]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetGrimoireAssignations]
as 
begin
	select a.ID as 'GrimoireAssignationID',
		b.StudentID as 'StudentDbID', b.Name as 'StudentName', b.LastName as 'StudentLastName', b.ID as 'StudentID', b.Age as 'StudentAge',
		c.Name as 'StudentMagicAffinity',
		d.ID as 'GrimoireID', d.Name as 'GrimoireName', d.CloverLeaves as 'GrimoireCloverLeaves'
	from StudentGrimoire a
	inner join Students b on a.StudentID = b.StudentID
	inner join MagicAffinities c on b.MagicAffinity = c.ID
	inner join Grimoires d on a.GrimoireID = d.ID
	where a.Status = 1
end
GO
/****** Object:  StoredProcedure [dbo].[GetGrimoires]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetGrimoires]
as 
begin
	select ID as 'GrimoireID', Name as 'GrimoireName', CloverLeaves as 'GrimoireCloverLeaves'
	from Grimoires
	where Status = 1
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplication]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[UpdateApplication]
@ID int,
@StudentID int,
@ApplicationStatus int
as 
begin
	update StudentApplication
	set StudentID = @StudentID, ApplicationStatus = @ApplicationStatus
	where ID = @ID

	select a.ID as 'ApplicationID', a.StudentID as 'StudentID', b.Name as 'ApplicationStatus' from StudentApplication a
	inner join ApplicationStatus b on a.ApplicationStatus = b.ID
	where a.ID = @ID;
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationStatus]    Script Date: 11/13/2022 11:17:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[UpdateApplicationStatus]
@ID int,
@ApplicationStatus int
as 
begin
	update StudentApplication
	set ApplicationStatus = @ApplicationStatus
	where ID = @ID

	select ID as 'ApplicationID', ApplicationStatus as 'ApplicationStatus', StudentID as 'StudentID' from StudentApplication
	where ID = @ID;
end
GO
USE [master]
GO
ALTER DATABASE [IAExam] SET  READ_WRITE 
GO
