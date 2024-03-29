USE [master]
GO
/****** Object:  Database [TVS_DB]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE DATABASE [TVS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TVS_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TVS_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TVS_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TVS_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TVS_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TVS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TVS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TVS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TVS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TVS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TVS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TVS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TVS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TVS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TVS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TVS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TVS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TVS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TVS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TVS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TVS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TVS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TVS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TVS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TVS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TVS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TVS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TVS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TVS_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TVS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [TVS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TVS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TVS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TVS_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TVS_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TVS_DB', N'ON'
GO
ALTER DATABASE [TVS_DB] SET QUERY_STORE = OFF
GO
USE [TVS_DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Aliases]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Aliases](
	[Id] [uniqueidentifier] NOT NULL,
	[AliasUrl] [nvarchar](256) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[RedirectUrl] [nvarchar](256) NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Piranha_Aliases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_BlockFields]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_BlockFields](
	[Id] [uniqueidentifier] NOT NULL,
	[BlockId] [uniqueidentifier] NOT NULL,
	[CLRType] [nvarchar](256) NOT NULL,
	[FieldId] [nvarchar](64) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Piranha_BlockFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Blocks]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Blocks](
	[Id] [uniqueidentifier] NOT NULL,
	[CLRType] [nvarchar](256) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[IsReusable] [bit] NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Piranha_Blocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Categories]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[Slug] [nvarchar](64) NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Piranha_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Login]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Login](
	[Id] [uniqueidentifier] NULL,
	[SiteId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NULL,
	[UserPassWord] [nvarchar](256) NULL,
	[UserPhone] [nvarchar](256) NULL,
	[UserMail] [nvarchar](256) NULL,
	[UserFacebook] [nvarchar](256) NULL,
	[UserCare] [nvarchar](256) NULL,
	[Created] [datetime] NULL,
	[LastModified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Media]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Media](
	[Id] [uniqueidentifier] NOT NULL,
	[ContentType] [nvarchar](256) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Filename] [nvarchar](128) NOT NULL,
	[FolderId] [uniqueidentifier] NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[PublicUrl] [nvarchar](max) NULL,
	[Size] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
	[Height] [int] NULL,
	[Width] [int] NULL,
	[AltText] [nvarchar](128) NULL,
	[Description] [nvarchar](512) NULL,
	[Properties] [nvarchar](max) NULL,
	[Title] [nvarchar](128) NULL,
 CONSTRAINT [PK_Piranha_Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_MediaFolders]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_MediaFolders](
	[Id] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Description] [nvarchar](512) NULL,
 CONSTRAINT [PK_Piranha_MediaFolders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_MediaVersions]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_MediaVersions](
	[Id] [uniqueidentifier] NOT NULL,
	[Height] [int] NULL,
	[MediaId] [uniqueidentifier] NOT NULL,
	[Size] [bigint] NOT NULL,
	[Width] [int] NOT NULL,
	[FileExtension] [nvarchar](8) NULL,
 CONSTRAINT [PK_Piranha_MediaVersions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PageBlocks]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PageBlocks](
	[Id] [uniqueidentifier] NOT NULL,
	[BlockId] [uniqueidentifier] NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Piranha_PageBlocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PageComments]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PageComments](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[Author] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[Url] [nvarchar](256) NULL,
	[IsApproved] [bit] NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_PageComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PageFields]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PageFields](
	[Id] [uniqueidentifier] NOT NULL,
	[CLRType] [nvarchar](256) NOT NULL,
	[FieldId] [nvarchar](64) NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
	[RegionId] [nvarchar](64) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Piranha_PageFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PagePermissions]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PagePermissions](
	[PageId] [uniqueidentifier] NOT NULL,
	[Permission] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Piranha_PagePermissions] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC,
	[Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PageRevisions]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PageRevisions](
	[Id] [uniqueidentifier] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[PageId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_PageRevisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Pages]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Pages](
	[Id] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[MetaDescription] [nvarchar](256) NULL,
	[MetaKeywords] [nvarchar](128) NULL,
	[NavigationTitle] [nvarchar](128) NULL,
	[PageTypeId] [nvarchar](64) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Published] [datetime2](7) NULL,
	[RedirectType] [int] NOT NULL,
	[RedirectUrl] [nvarchar](256) NULL,
	[Route] [nvarchar](256) NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[Slug] [nvarchar](128) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[ContentType] [nvarchar](255) NOT NULL,
	[OriginalPageId] [uniqueidentifier] NULL,
	[CloseCommentsAfterDays] [int] NOT NULL,
	[EnableComments] [bit] NOT NULL,
	[Excerpt] [nvarchar](max) NULL,
	[PrimaryImageId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Piranha_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PageTypes]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PageTypes](
	[Id] [nvarchar](64) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[CLRType] [nvarchar](256) NULL,
 CONSTRAINT [PK_Piranha_PageTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Params]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Params](
	[Id] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Key] [nvarchar](64) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Piranha_Params] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostBlocks]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostBlocks](
	[Id] [uniqueidentifier] NOT NULL,
	[BlockId] [uniqueidentifier] NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Piranha_PostBlocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostComments]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostComments](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[Author] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[Url] [nvarchar](256) NULL,
	[IsApproved] [bit] NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_PostComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostFields]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostFields](
	[Id] [uniqueidentifier] NOT NULL,
	[CLRType] [nvarchar](256) NOT NULL,
	[FieldId] [nvarchar](64) NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[RegionId] [nvarchar](64) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Piranha_PostFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostPermissions]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostPermissions](
	[PostId] [uniqueidentifier] NOT NULL,
	[Permission] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Piranha_PostPermissions] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostRevisions]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostRevisions](
	[Id] [uniqueidentifier] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_PostRevisions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Posts]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Posts](
	[Id] [uniqueidentifier] NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[MetaDescription] [nvarchar](256) NULL,
	[MetaKeywords] [nvarchar](128) NULL,
	[PostTypeId] [nvarchar](64) NOT NULL,
	[Published] [datetime2](7) NULL,
	[RedirectType] [int] NOT NULL,
	[RedirectUrl] [nvarchar](256) NULL,
	[Route] [nvarchar](256) NULL,
	[Slug] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[CloseCommentsAfterDays] [int] NOT NULL,
	[EnableComments] [bit] NOT NULL,
	[Excerpt] [nvarchar](max) NULL,
	[PrimaryImageId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Piranha_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostTags]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostTags](
	[PostId] [uniqueidentifier] NOT NULL,
	[TagId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_PostTypes]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_PostTypes](
	[Id] [nvarchar](64) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[CLRType] [nvarchar](256) NULL,
 CONSTRAINT [PK_Piranha_PostTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_RoleClaims]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Roles]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_Piranha_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_SiteFields]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_SiteFields](
	[Id] [uniqueidentifier] NOT NULL,
	[CLRType] [nvarchar](256) NOT NULL,
	[FieldId] [nvarchar](64) NOT NULL,
	[RegionId] [nvarchar](64) NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Piranha_SiteFields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Sites]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Sites](
	[Id] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Hostnames] [nvarchar](256) NULL,
	[InternalId] [nvarchar](64) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[SiteTypeId] [nvarchar](64) NULL,
	[ContentLastModified] [datetime2](7) NULL,
	[Culture] [nvarchar](6) NULL,
 CONSTRAINT [PK_Piranha_Sites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_SiteTypes]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_SiteTypes](
	[Id] [nvarchar](64) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[CLRType] [nvarchar](256) NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Piranha_SiteTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Tags]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Tags](
	[Id] [uniqueidentifier] NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[LastModified] [datetime2](7) NOT NULL,
	[Slug] [nvarchar](64) NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Piranha_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_UserClaims]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_UserLogins]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_UserRoles]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_UserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Piranha_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_Users]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_Users](
	[Id] [uniqueidentifier] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_Piranha_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Piranha_UserTokens]    Script Date: 7/2/2020 6:26:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Piranha_UserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Piranha_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Aliases_SiteId_AliasUrl]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Aliases_SiteId_AliasUrl] ON [dbo].[Piranha_Aliases]
(
	[SiteId] ASC,
	[AliasUrl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_BlockFields_BlockId_FieldId_SortOrder]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_BlockFields_BlockId_FieldId_SortOrder] ON [dbo].[Piranha_BlockFields]
(
	[BlockId] ASC,
	[FieldId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Categories_BlogId_Slug]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Categories_BlogId_Slug] ON [dbo].[Piranha_Categories]
(
	[BlogId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_Media_FolderId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_Media_FolderId] ON [dbo].[Piranha_Media]
(
	[FolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_MediaVersions_MediaId_Width_Height]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_MediaVersions_MediaId_Width_Height] ON [dbo].[Piranha_MediaVersions]
(
	[MediaId] ASC,
	[Width] ASC,
	[Height] ASC
)
WHERE ([Height] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PageBlocks_BlockId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PageBlocks_BlockId] ON [dbo].[Piranha_PageBlocks]
(
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PageBlocks_PageId_SortOrder]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_PageBlocks_PageId_SortOrder] ON [dbo].[Piranha_PageBlocks]
(
	[PageId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PageComments_PageId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PageComments_PageId] ON [dbo].[Piranha_PageComments]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_PageFields_PageId_RegionId_FieldId_SortOrder]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PageFields_PageId_RegionId_FieldId_SortOrder] ON [dbo].[Piranha_PageFields]
(
	[PageId] ASC,
	[RegionId] ASC,
	[FieldId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PageRevisions_PageId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PageRevisions_PageId] ON [dbo].[Piranha_PageRevisions]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Pages_PageTypeId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_Pages_PageTypeId] ON [dbo].[Piranha_Pages]
(
	[PageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_Pages_ParentId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_Pages_ParentId] ON [dbo].[Piranha_Pages]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Pages_SiteId_Slug]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Pages_SiteId_Slug] ON [dbo].[Piranha_Pages]
(
	[SiteId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Params_Key]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Params_Key] ON [dbo].[Piranha_Params]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PostBlocks_BlockId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PostBlocks_BlockId] ON [dbo].[Piranha_PostBlocks]
(
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PostBlocks_PostId_SortOrder]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_PostBlocks_PostId_SortOrder] ON [dbo].[Piranha_PostBlocks]
(
	[PostId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PostComments_PostId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PostComments_PostId] ON [dbo].[Piranha_PostComments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_PostFields_PostId_RegionId_FieldId_SortOrder]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PostFields_PostId_RegionId_FieldId_SortOrder] ON [dbo].[Piranha_PostFields]
(
	[PostId] ASC,
	[RegionId] ASC,
	[FieldId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PostRevisions_PostId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PostRevisions_PostId] ON [dbo].[Piranha_PostRevisions]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Posts_BlogId_Slug]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Posts_BlogId_Slug] ON [dbo].[Piranha_Posts]
(
	[BlogId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_Posts_CategoryId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_Posts_CategoryId] ON [dbo].[Piranha_Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Posts_PostTypeId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_Posts_PostTypeId] ON [dbo].[Piranha_Posts]
(
	[PostTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_PostTags_TagId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_PostTags_TagId] ON [dbo].[Piranha_PostTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_RoleClaims_RoleId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_RoleClaims_RoleId] ON [dbo].[Piranha_RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Piranha_Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_SiteFields_SiteId_RegionId_FieldId_SortOrder]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_SiteFields_SiteId_RegionId_FieldId_SortOrder] ON [dbo].[Piranha_SiteFields]
(
	[SiteId] ASC,
	[RegionId] ASC,
	[FieldId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Sites_InternalId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Sites_InternalId] ON [dbo].[Piranha_Sites]
(
	[InternalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Piranha_Tags_BlogId_Slug]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Piranha_Tags_BlogId_Slug] ON [dbo].[Piranha_Tags]
(
	[BlogId] ASC,
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_UserClaims_UserId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_UserClaims_UserId] ON [dbo].[Piranha_UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_UserLogins_UserId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_UserLogins_UserId] ON [dbo].[Piranha_UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Piranha_UserRoles_RoleId]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Piranha_UserRoles_RoleId] ON [dbo].[Piranha_UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Piranha_Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/2/2020 6:26:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Piranha_Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Piranha_Pages] ADD  DEFAULT (N'Page') FOR [ContentType]
GO
ALTER TABLE [dbo].[Piranha_Pages] ADD  DEFAULT ((0)) FOR [CloseCommentsAfterDays]
GO
ALTER TABLE [dbo].[Piranha_Pages] ADD  DEFAULT (CONVERT([bit],(0))) FOR [EnableComments]
GO
ALTER TABLE [dbo].[Piranha_Posts] ADD  DEFAULT ((0)) FOR [CloseCommentsAfterDays]
GO
ALTER TABLE [dbo].[Piranha_Posts] ADD  DEFAULT (CONVERT([bit],(0))) FOR [EnableComments]
GO
ALTER TABLE [dbo].[Piranha_Aliases]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Aliases_Piranha_Sites_SiteId] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Piranha_Sites] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Aliases] CHECK CONSTRAINT [FK_Piranha_Aliases_Piranha_Sites_SiteId]
GO
ALTER TABLE [dbo].[Piranha_BlockFields]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_BlockFields_Piranha_Blocks_BlockId] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Piranha_Blocks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_BlockFields] CHECK CONSTRAINT [FK_Piranha_BlockFields_Piranha_Blocks_BlockId]
GO
ALTER TABLE [dbo].[Piranha_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Categories_Piranha_Pages_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Categories] CHECK CONSTRAINT [FK_Piranha_Categories_Piranha_Pages_BlogId]
GO
ALTER TABLE [dbo].[Piranha_Media]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Media_Piranha_MediaFolders_FolderId] FOREIGN KEY([FolderId])
REFERENCES [dbo].[Piranha_MediaFolders] ([Id])
GO
ALTER TABLE [dbo].[Piranha_Media] CHECK CONSTRAINT [FK_Piranha_Media_Piranha_MediaFolders_FolderId]
GO
ALTER TABLE [dbo].[Piranha_MediaVersions]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_MediaVersions_Piranha_Media_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Piranha_Media] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_MediaVersions] CHECK CONSTRAINT [FK_Piranha_MediaVersions_Piranha_Media_MediaId]
GO
ALTER TABLE [dbo].[Piranha_PageBlocks]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PageBlocks_Piranha_Blocks_BlockId] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Piranha_Blocks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PageBlocks] CHECK CONSTRAINT [FK_Piranha_PageBlocks_Piranha_Blocks_BlockId]
GO
ALTER TABLE [dbo].[Piranha_PageBlocks]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PageBlocks_Piranha_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PageBlocks] CHECK CONSTRAINT [FK_Piranha_PageBlocks_Piranha_Pages_PageId]
GO
ALTER TABLE [dbo].[Piranha_PageComments]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PageComments_Piranha_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PageComments] CHECK CONSTRAINT [FK_Piranha_PageComments_Piranha_Pages_PageId]
GO
ALTER TABLE [dbo].[Piranha_PageFields]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PageFields_Piranha_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PageFields] CHECK CONSTRAINT [FK_Piranha_PageFields_Piranha_Pages_PageId]
GO
ALTER TABLE [dbo].[Piranha_PagePermissions]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PagePermissions_Piranha_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PagePermissions] CHECK CONSTRAINT [FK_Piranha_PagePermissions_Piranha_Pages_PageId]
GO
ALTER TABLE [dbo].[Piranha_PageRevisions]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PageRevisions_Piranha_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PageRevisions] CHECK CONSTRAINT [FK_Piranha_PageRevisions_Piranha_Pages_PageId]
GO
ALTER TABLE [dbo].[Piranha_Pages]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Pages_Piranha_Pages_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
GO
ALTER TABLE [dbo].[Piranha_Pages] CHECK CONSTRAINT [FK_Piranha_Pages_Piranha_Pages_ParentId]
GO
ALTER TABLE [dbo].[Piranha_Pages]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Pages_Piranha_PageTypes_PageTypeId] FOREIGN KEY([PageTypeId])
REFERENCES [dbo].[Piranha_PageTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Pages] CHECK CONSTRAINT [FK_Piranha_Pages_Piranha_PageTypes_PageTypeId]
GO
ALTER TABLE [dbo].[Piranha_Pages]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Pages_Piranha_Sites_SiteId] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Piranha_Sites] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Pages] CHECK CONSTRAINT [FK_Piranha_Pages_Piranha_Sites_SiteId]
GO
ALTER TABLE [dbo].[Piranha_PostBlocks]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostBlocks_Piranha_Blocks_BlockId] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Piranha_Blocks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostBlocks] CHECK CONSTRAINT [FK_Piranha_PostBlocks_Piranha_Blocks_BlockId]
GO
ALTER TABLE [dbo].[Piranha_PostBlocks]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostBlocks_Piranha_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Piranha_Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostBlocks] CHECK CONSTRAINT [FK_Piranha_PostBlocks_Piranha_Posts_PostId]
GO
ALTER TABLE [dbo].[Piranha_PostComments]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostComments_Piranha_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Piranha_Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostComments] CHECK CONSTRAINT [FK_Piranha_PostComments_Piranha_Posts_PostId]
GO
ALTER TABLE [dbo].[Piranha_PostFields]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostFields_Piranha_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Piranha_Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostFields] CHECK CONSTRAINT [FK_Piranha_PostFields_Piranha_Posts_PostId]
GO
ALTER TABLE [dbo].[Piranha_PostPermissions]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostPermissions_Piranha_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Piranha_Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostPermissions] CHECK CONSTRAINT [FK_Piranha_PostPermissions_Piranha_Posts_PostId]
GO
ALTER TABLE [dbo].[Piranha_PostRevisions]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostRevisions_Piranha_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Piranha_Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostRevisions] CHECK CONSTRAINT [FK_Piranha_PostRevisions_Piranha_Posts_PostId]
GO
ALTER TABLE [dbo].[Piranha_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Posts_Piranha_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Piranha_Categories] ([Id])
GO
ALTER TABLE [dbo].[Piranha_Posts] CHECK CONSTRAINT [FK_Piranha_Posts_Piranha_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Piranha_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Posts_Piranha_Pages_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Posts] CHECK CONSTRAINT [FK_Piranha_Posts_Piranha_Pages_BlogId]
GO
ALTER TABLE [dbo].[Piranha_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Posts_Piranha_PostTypes_PostTypeId] FOREIGN KEY([PostTypeId])
REFERENCES [dbo].[Piranha_PostTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Posts] CHECK CONSTRAINT [FK_Piranha_Posts_Piranha_PostTypes_PostTypeId]
GO
ALTER TABLE [dbo].[Piranha_PostTags]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostTags_Piranha_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Piranha_Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_PostTags] CHECK CONSTRAINT [FK_Piranha_PostTags_Piranha_Posts_PostId]
GO
ALTER TABLE [dbo].[Piranha_PostTags]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_PostTags_Piranha_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Piranha_Tags] ([Id])
GO
ALTER TABLE [dbo].[Piranha_PostTags] CHECK CONSTRAINT [FK_Piranha_PostTags_Piranha_Tags_TagId]
GO
ALTER TABLE [dbo].[Piranha_RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_RoleClaims_Piranha_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Piranha_Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_RoleClaims] CHECK CONSTRAINT [FK_Piranha_RoleClaims_Piranha_Roles_RoleId]
GO
ALTER TABLE [dbo].[Piranha_SiteFields]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_SiteFields_Piranha_Sites_SiteId] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Piranha_Sites] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_SiteFields] CHECK CONSTRAINT [FK_Piranha_SiteFields_Piranha_Sites_SiteId]
GO
ALTER TABLE [dbo].[Piranha_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_Tags_Piranha_Pages_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Piranha_Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_Tags] CHECK CONSTRAINT [FK_Piranha_Tags_Piranha_Pages_BlogId]
GO
ALTER TABLE [dbo].[Piranha_UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_UserClaims_Piranha_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Piranha_Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_UserClaims] CHECK CONSTRAINT [FK_Piranha_UserClaims_Piranha_Users_UserId]
GO
ALTER TABLE [dbo].[Piranha_UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_UserLogins_Piranha_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Piranha_Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_UserLogins] CHECK CONSTRAINT [FK_Piranha_UserLogins_Piranha_Users_UserId]
GO
ALTER TABLE [dbo].[Piranha_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_UserRoles_Piranha_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Piranha_Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_UserRoles] CHECK CONSTRAINT [FK_Piranha_UserRoles_Piranha_Roles_RoleId]
GO
ALTER TABLE [dbo].[Piranha_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_UserRoles_Piranha_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Piranha_Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_UserRoles] CHECK CONSTRAINT [FK_Piranha_UserRoles_Piranha_Users_UserId]
GO
ALTER TABLE [dbo].[Piranha_UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_Piranha_UserTokens_Piranha_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Piranha_Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Piranha_UserTokens] CHECK CONSTRAINT [FK_Piranha_UserTokens_Piranha_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [TVS_DB] SET  READ_WRITE 
GO
