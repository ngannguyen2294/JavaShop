USE [master]
GO
/****** Object:  Database [JavaShop]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE DATABASE [JavaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGANNV\MSSQL\DATA\JavaShop.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JavaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGANNV\MSSQL\DATA\JavaShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JavaShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JavaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JavaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JavaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JavaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JavaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JavaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [JavaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JavaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JavaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JavaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JavaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JavaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JavaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JavaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JavaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JavaShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JavaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JavaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JavaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JavaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JavaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JavaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JavaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JavaShop] SET RECOVERY FULL 
GO
ALTER DATABASE [JavaShop] SET  MULTI_USER 
GO
ALTER DATABASE [JavaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JavaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JavaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JavaShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JavaShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JavaShop', N'ON'
GO
USE [JavaShop]
GO
/****** Object:  Table [dbo].[AdminLog]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminLog](
	[AL_ID] [int] IDENTITY(1,1) NOT NULL,
	[AL_DateStamp] [datetime] NULL,
	[AL_LoginID] [int] NULL DEFAULT ((0)),
	[AL_Type] [nvarchar](1) NULL,
	[AL_Description] [nvarchar](255) NULL,
	[AL_Query] [nvarchar](max) NULL,
	[AL_RelatedID] [nvarchar](255) NULL,
	[AL_IP] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AffiliateLog]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffiliateLog](
	[AFLG_ID] [int] IDENTITY(1,1) NOT NULL,
	[AFLG_AffiliateID] [int] NULL,
	[AFLG_referer] [nvarchar](255) NULL,
	[AFLG_IP] [nvarchar](30) NULL,
	[AFLG_RequestedItem] [nvarchar](255) NULL,
	[AFLG_DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AFLG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AffiliatePayments]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffiliatePayments](
	[AFP_ID] [int] IDENTITY(1,1) NOT NULL,
	[AFP_DateTime] [datetime] NULL,
	[AFP_AffiliateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AFP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ATTRIB_ID] [int] IDENTITY(1,1) NOT NULL,
	[ATTRIB_Type] [nvarchar](50) NULL,
	[ATTRIB_Name1] [nvarchar](40) NULL,
	[ATTRIB_Name2] [nvarchar](40) NULL,
	[ATTRIB_Name3] [nvarchar](40) NULL,
	[ATTRIB_Name4] [nvarchar](40) NULL,
	[ATTRIB_Name5] [nvarchar](40) NULL,
	[ATTRIB_Live] [nvarchar](1) NULL,
	[ATTRIB_FastEntry] [nvarchar](1) NULL,
	[ATTRIB_ShowFrontend] [nvarchar](1) NULL,
	[ATTRIB_ShowSearch] [nvarchar](1) NULL,
	[ATTRIB_OrderByValue] [int] NULL DEFAULT ((0)),
	[ATTRIB_Compare] [nvarchar](1) NULL,
	[ATTRIB_Special] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ATTRIB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttributeValues]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValues](
	[ATTRIBV_ProductID] [int] NULL DEFAULT ((0)),
	[ATTRIBV_AttributeID] [int] NULL DEFAULT ((0)),
	[ATTRIBV_Value1] [nvarchar](255) NULL,
	[ATTRIBV_Value2] [nvarchar](255) NULL,
	[ATTRIBV_Value3] [nvarchar](255) NULL,
	[ATTRIBV_Value4] [nvarchar](255) NULL,
	[ATTRIBV_Value5] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CAT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CAT_Live] [nvarchar](1) NULL,
	[CAT_Name1] [nvarchar](75) NULL,
	[CAT_Name2] [nvarchar](75) NULL,
	[CAT_Name3] [nvarchar](75) NULL,
	[CAT_Name4] [nvarchar](75) NULL,
	[CAT_Name5] [nvarchar](75) NULL,
	[CAT_Desc1] [nvarchar](max) NULL,
	[CAT_Desc2] [nvarchar](max) NULL,
	[CAT_Desc3] [nvarchar](max) NULL,
	[CAT_Desc4] [nvarchar](max) NULL,
	[CAT_Desc5] [nvarchar](max) NULL,
	[CAT_ProductDisplayType] [nvarchar](1) NULL,
	[CAT_SubCatDisplayType] [nvarchar](50) NULL,
	[CAT_OrderByValue] [float] NULL DEFAULT ((0)),
	[CAT_OrderProductsBy] [nvarchar](50) NULL,
	[CAT_CustomerGroupID] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryHierachy]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryHierachy](
	[CH_ParentID] [int] NULL DEFAULT ((0)),
	[CH_ChildID] [int] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[CFG_Name] [nvarchar](50) NOT NULL,
	[CFG_Value] [nvarchar](255) NULL,
	[CFG_DataType] [nvarchar](1) NULL,
	[CFG_DisplayType] [nvarchar](1) NULL,
	[CFG_DisplayInfo] [nvarchar](255) NULL,
	[CFG_Description] [nvarchar](255) NULL,
	[CFG_VersionAdded] [real] NULL DEFAULT ((0)),
	[CFG_DefaultValue] [nvarchar](255) NULL,
	[CFG_ConfigCategoryID] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[CFG_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConfigCategories]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigCategories](
	[CFGC_ID] [int] NOT NULL DEFAULT ((0)),
	[CFGC_ParentID] [int] NULL DEFAULT ((0)),
	[CFGC_Category] [nvarchar](50) NULL,
	[CFGC_OrderByValue] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[CFGC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CP_ID] [int] IDENTITY(1,1) NOT NULL,
	[CP_CouponCode] [nvarchar](25) NULL,
	[CP_Reusable] [nvarchar](1) NULL,
	[CP_Used] [nvarchar](1) NULL,
	[CP_CreatedTime] [datetime] NULL,
	[CP_StartDate] [datetime] NULL,
	[CP_EndDate] [datetime] NULL,
	[CP_DiscountValue] [real] NULL DEFAULT ((0)),
	[CP_DiscountType] [nvarchar](1) NULL,
	[CP_Enabled] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditCards]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCards](
	[CR_ID] [int] IDENTITY(1,1) NOT NULL,
	[CR_Name] [nvarchar](20) NULL,
	[CR_Accepted] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[CUR_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUR_Symbol] [nvarchar](10) NULL,
	[CUR_ISOCode] [nvarchar](3) NULL,
	[CUR_Name1] [nvarchar](50) NULL,
	[CUR_Name2] [nvarchar](50) NULL,
	[CUR_Name3] [nvarchar](50) NULL,
	[CUR_Name4] [nvarchar](50) NULL,
	[CUR_Name5] [nvarchar](50) NULL,
	[CUR_ExchangeRate] [real] NULL DEFAULT ((0)),
	[CUR_HasDecimals] [nvarchar](1) NULL,
	[CUR_Live] [nvarchar](1) NULL,
	[CUR_Format] [nvarchar](20) NULL,
	[CUR_IsoFormat] [nvarchar](20) NULL,
	[CUR_DecimalPoint] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerGroupPrices]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroupPrices](
	[CGP_ID] [int] IDENTITY(1,1) NOT NULL,
	[CGP_CustomerGroupID] [int] NULL,
	[CGP_VersionID] [int] NULL,
	[CGP_Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[CGP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerGroups]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroups](
	[CG_ID] [int] IDENTITY(1,1) NOT NULL,
	[CG_Name1] [nvarchar](50) NULL,
	[CG_Name2] [nvarchar](50) NULL,
	[CG_Name3] [nvarchar](50) NULL,
	[CG_Name4] [nvarchar](50) NULL,
	[CG_Name5] [nvarchar](50) NULL,
	[CG_Discount] [int] NULL DEFAULT ((0)),
	[CG_Live] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_EmailAddress] [nvarchar](100) NULL,
	[C_Telephone] [nvarchar](50) NULL,
	[C_Password] [nvarchar](50) NULL,
	[C_CustomerDiscount] [real] NULL DEFAULT ((0)),
	[C_CardholderName] [nvarchar](50) NULL,
	[C_CardholderCompany] [nvarchar](100) NULL,
	[C_CardholderEUVATNum] [nvarchar](15) NULL,
	[C_Card_Number] [nvarchar](20) NULL,
	[C_Card_Type] [nvarchar](30) NULL,
	[C_Card_StartDate] [nvarchar](10) NULL,
	[C_Card_Expiry] [nvarchar](10) NULL,
	[C_Card_IssueNumber] [nvarchar](10) NULL,
	[C_Card_SecurityNumber] [nvarchar](5) NULL,
	[C_CardholderStreetAddress] [nvarchar](100) NULL,
	[C_CardholderTownCity] [nvarchar](50) NULL,
	[C_CardholderCounty] [nvarchar](50) NULL,
	[C_CardholderPostCode] [nvarchar](20) NULL,
	[C_CardholderCountry] [int] NULL DEFAULT ((0)),
	[C_ShippingName] [nvarchar](50) NULL,
	[C_ShippingCompany] [nvarchar](100) NULL,
	[C_ShippingStreetAddress] [nvarchar](100) NULL,
	[C_ShippingTownCity] [nvarchar](50) NULL,
	[C_ShippingCounty] [nvarchar](50) NULL,
	[C_ShippingPostCode] [nvarchar](20) NULL,
	[C_ShippingCountry] [int] NULL DEFAULT ((0)),
	[C_AffiliateID] [int] NULL DEFAULT ((0)),
	[C_Approved] [nvarchar](1) NULL,
	[C_CustomerGroupiD] [int] NULL DEFAULT ((0)),
	[C_IsAffiliate] [nvarchar](1) NULL DEFAULT (N'n'),
	[C_AffiliateCommission] [real] NULL DEFAULT ((0)),
	[C_LanguageID] [int] NULL DEFAULT ((0)),
	[C_ML_SignupDateTime] [datetime] NULL DEFAULT ('1900/1/1'),
	[C_ML_SignupIP] [nvarchar](20) NULL,
	[C_ML_ConfirmationDateTime] [datetime] NULL DEFAULT ('1900/1/1'),
	[C_ML_ConfirmationIP] [nvarchar](20) NULL,
	[C_ML_RandomKey] [nvarchar](20) NULL,
	[C_ML_Format] [nvarchar](1) NULL DEFAULT (N'n'),
	[C_ML_SendMail] [nvarchar](1) NULL DEFAULT (N'n'),
PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Destination]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[D_ID] [int] IDENTITY(1,1) NOT NULL,
	[D_Destination1] [nvarchar](50) NULL,
	[D_Destination2] [nvarchar](50) NULL,
	[D_Destination3] [nvarchar](50) NULL,
	[D_Destination4] [nvarchar](50) NULL,
	[D_Destination5] [nvarchar](50) NULL,
	[D_ShippingZoneID] [int] NULL DEFAULT ((0)),
	[D_Tax] [float] NULL DEFAULT ((0)),
	[D_ISOCode] [nvarchar](2) NULL,
	[D_Live] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceRows]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceRows](
	[IR_ID] [int] IDENTITY(1,1) NOT NULL,
	[IR_OrderNumberID] [int] NULL DEFAULT ((0)),
	[IR_VersionCode] [nvarchar](50) NULL,
	[IR_VersionName] [nvarchar](255) NULL,
	[IR_Quantity] [int] NULL DEFAULT ((0)),
	[IR_PricePerItem] [float] NULL DEFAULT ((0)),
	[IR_TaxPerItem] [float] NULL DEFAULT ((0)),
	[IR_OptionsText] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LANG_ID] [int] NULL DEFAULT ((0)),
	[LANG_BackName] [nvarchar](50) NULL,
	[LANG_FrontName] [nvarchar](50) NULL,
	[LANG_SkinLocation] [nvarchar](50) NULL,
	[LANG_LiveFront] [nvarchar](1) NULL,
	[LANG_LiveBack] [nvarchar](50) NULL,
	[LANG_EmailFrom] [nvarchar](255) NULL,
	[LANG_EmailTo] [nvarchar](255) NULL,
	[LANG_EmailToContact] [nvarchar](255) NULL,
	[LANG_DateFormat] [nvarchar](50) NULL,
	[LANG_DateAndTimeFormat] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageStrings1]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageStrings1](
	[LS_ID] [int] NOT NULL DEFAULT ((0)),
	[LS_FrontBack] [nvarchar](1) NULL,
	[LS_Name] [nvarchar](255) NULL,
	[LS_Value] [nvarchar](max) NULL,
	[LS_Description] [nvarchar](255) NULL,
	[LS_VersionAdded] [real] NULL DEFAULT ((0)),
	[LS_DefaultValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageStrings2]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageStrings2](
	[LS_ID] [int] NOT NULL,
	[LS_FrontBack] [nvarchar](1) NULL,
	[LS_Name] [nvarchar](255) NULL,
	[LS_Value] [nvarchar](max) NULL,
	[LS_Description] [nvarchar](255) NULL,
	[LS_VersionAdded] [real] NULL,
	[LS_DefaultValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageStrings3]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageStrings3](
	[LS_ID] [int] NOT NULL,
	[LS_FrontBack] [nvarchar](1) NULL,
	[LS_Name] [nvarchar](255) NULL,
	[LS_Value] [nvarchar](max) NULL,
	[LS_Description] [nvarchar](255) NULL,
	[LS_VersionAdded] [real] NULL,
	[LS_DefaultValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageStrings4]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageStrings4](
	[LS_ID] [int] NOT NULL,
	[LS_FrontBack] [nvarchar](1) NULL,
	[LS_Name] [nvarchar](255) NULL,
	[LS_Value] [nvarchar](max) NULL,
	[LS_Description] [nvarchar](255) NULL,
	[LS_VersionAdded] [real] NULL,
	[LS_DefaultValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageStrings5]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageStrings5](
	[LS_ID] [int] NOT NULL,
	[LS_FrontBack] [nvarchar](1) NULL,
	[LS_Name] [nvarchar](255) NULL,
	[LS_Value] [nvarchar](max) NULL,
	[LS_Description] [nvarchar](255) NULL,
	[LS_VersionAdded] [real] NULL,
	[LS_DefaultValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logins]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[LOGIN_ID] [int] IDENTITY(1,1) NOT NULL,
	[LOGIN_Username] [nvarchar](50) NULL,
	[LOGIN_Password] [nvarchar](80) NULL,
	[LOGIN_Live] [nvarchar](1) NULL,
	[LOGIN_Orders] [nvarchar](1) NULL,
	[LOGIN_Products] [nvarchar](50) NULL,
	[LOGIN_Config] [nvarchar](1) NULL,
	[LOGIN_Protected] [nvarchar](50) NULL,
	[LOGIN_LanguageID] [nvarchar](50) NULL,
	[LOGIN_RandomHash] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LOGIN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[N_ID] [int] IDENTITY(1,1) NOT NULL,
	[N_Headline] [nvarchar](255) NULL,
	[N_Content] [nvarchar](max) NULL,
	[N_LanguageID] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[N_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OptionGroups]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionGroups](
	[OPTG_ID] [int] IDENTITY(1,1) NOT NULL,
	[OPTG_BackendName] [nvarchar](50) NULL,
	[OPTG_Name1] [nvarchar](50) NULL,
	[OPTG_Name2] [nvarchar](50) NULL,
	[OPTG_Name3] [nvarchar](50) NULL,
	[OPTG_Name4] [nvarchar](50) NULL,
	[OPTG_Name5] [nvarchar](50) NULL,
	[OPTG_Desc1] [nvarchar](255) NULL,
	[OPTG_Desc2] [nvarchar](255) NULL,
	[OPTG_Desc3] [nvarchar](255) NULL,
	[OPTG_Desc4] [nvarchar](255) NULL,
	[OPTG_Desc5] [nvarchar](255) NULL,
	[OPTG_OptionDisplayType] [nvarchar](1) NULL,
	[OPTG_DefOrderByValue] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[OPTG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Options]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[OPT_ID] [int] IDENTITY(1,1) NOT NULL,
	[OPT_OptionGroupID] [int] NULL DEFAULT ((0)),
	[OPT_Name1] [nvarchar](50) NULL,
	[OPT_Name2] [nvarchar](50) NULL,
	[OPT_Name3] [nvarchar](50) NULL,
	[OPT_Name4] [nvarchar](50) NULL,
	[OPT_Name5] [nvarchar](50) NULL,
	[OPT_CheckBoxValue] [nvarchar](1) NULL,
	[OPT_DefPriceChange] [float] NULL DEFAULT ((0)),
	[OPT_DefWeightChange] [float] NULL DEFAULT ((0)),
	[OPT_DefOrderByValue] [real] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[OPT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[O_ID] [int] IDENTITY(1,1) NOT NULL,
	[O_CustomerID] [int] NULL DEFAULT ((0)),
	[O_Details] [nvarchar](max) NULL,
	[O_ShippingPrice] [float] NULL DEFAULT ((0)),
	[O_ShippingTax] [float] NULL DEFAULT ((0)),
	[O_DiscountPercentage] [float] NULL DEFAULT ((0)),
	[O_AffiliatePercentage] [float] NULL DEFAULT ((0)),
	[O_TotalPrice] [float] NULL DEFAULT ((0)),
	[O_Date] [datetime] NULL,
	[O_PurchaseOrderNo] [nvarchar](50) NULL,
	[O_SecurityID] [int] NULL DEFAULT ((0)),
	[O_Sent] [nvarchar](1) NULL,
	[O_Invoiced] [nvarchar](1) NULL,
	[O_Shipped] [nvarchar](1) NULL,
	[O_Paid] [nvarchar](1) NULL,
	[O_Status] [nvarchar](max) NULL,
	[O_LastModified] [datetime] NULL,
	[O_WishListID] [int] NULL DEFAULT ((0)),
	[O_CouponCode] [nvarchar](25) NULL,
	[O_CouponDiscountTotal] [real] NULL DEFAULT ((0)),
	[O_PricesIncTax] [nvarchar](1) NULL,
	[O_TaxDue] [int] NULL DEFAULT ((0)),
	[O_PaymentGateWay] [nvarchar](20) NULL,
	[O_ReferenceCode] [nvarchar](100) NULL,
	[O_LanguageID] [int] NULL DEFAULT ((0)),
	[O_CurrencyID] [int] NULL DEFAULT ((0)),
	[O_TotalPriceGateway] [float] NULL DEFAULT ((0)),
	[O_CurrencyIDGateway] [int] NULL DEFAULT ((0)),
	[O_AffiliatePaymentID] [int] NULL DEFAULT ((0)),
	[O_AffiliateTotalPrice] [float] NULL DEFAULT ((0)),
	[O_SendOrderUpdateEmail] [nvarchar](1) NULL,
	[O_OrderHandlingCharge] [float] NULL DEFAULT ((0)),
	[O_OrderHandlingChargeTax] [float] NULL DEFAULT ((0)),
	[O_CurrencyRate] [float] NULL DEFAULT ((0)),
	[O_ShippingMethod] [nvarchar](100) NULL,
	[O_ShippingMethodDesc] [nvarchar](255) NULL,
	[O_BillingAddress] [nvarchar](255) NULL,
	[O_ShippingAddress] [nvarchar](255) NULL,
	[O_PromotionDiscountTotal] [real] NULL DEFAULT ((0)),
	[O_PromotionDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PAGE_ID] [nvarchar](10) NOT NULL,
	[PAGE_Title1] [nvarchar](255) NULL,
	[PAGE_Text1] [nvarchar](max) NULL,
	[PAGE_MetaDescription1] [nvarchar](255) NULL,
	[PAGE_MetaKeywords1] [nvarchar](255) NULL,
	[PAGE_Title2] [nvarchar](255) NULL,
	[PAGE_Text2] [nvarchar](max) NULL,
	[PAGE_MetaDescription2] [nvarchar](255) NULL,
	[PAGE_MetaKeywords2] [nvarchar](255) NULL,
	[PAGE_Title3] [nvarchar](255) NULL,
	[PAGE_Text3] [nvarchar](max) NULL,
	[PAGE_MetaDescription3] [nvarchar](255) NULL,
	[PAGE_MetaKeywords3] [nvarchar](255) NULL,
	[PAGE_Title4] [nvarchar](255) NULL,
	[PAGE_Text4] [nvarchar](max) NULL,
	[PAGE_MetaDescription4] [nvarchar](255) NULL,
	[PAGE_MetaKeywords4] [nvarchar](255) NULL,
	[PAGE_Title5] [nvarchar](255) NULL,
	[PAGE_Text5] [nvarchar](max) NULL,
	[PAGE_MetaDescription5] [nvarchar](255) NULL,
	[PAGE_MetaKeywords5] [nvarchar](255) NULL,
	[PAGE_Live] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[PAGE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategoryLink]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryLink](
	[PCAT_ProductID] [int] NULL DEFAULT ((0)),
	[PCAT_CategoryID] [int] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOptionGroupLink]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptionGroupLink](
	[P_OPTG_ProductID] [int] NULL DEFAULT ((0)),
	[P_OPTG_OptionGroupID] [int] NULL DEFAULT ((0)),
	[P_OPTG_OrderByValue] [int] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOptionLink]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptionLink](
	[P_OPT_OptionID] [int] NULL DEFAULT ((0)),
	[P_OPT_ProductID] [int] NULL DEFAULT ((0)),
	[P_OPT_OrderByValue] [int] NULL DEFAULT ((0)),
	[P_OPT_PriceChange] [float] NULL DEFAULT ((0)),
	[P_OPT_WeightChange] [float] NULL DEFAULT ((0)),
	[P_OPT_Selected] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[P_Live] [nvarchar](1) NULL,
	[P_Name1] [nvarchar](75) NULL,
	[P_Name2] [nvarchar](75) NULL,
	[P_Name3] [nvarchar](75) NULL,
	[P_Name4] [nvarchar](75) NULL,
	[P_Name5] [nvarchar](75) NULL,
	[P_Desc1] [nvarchar](max) NULL,
	[P_Desc2] [nvarchar](max) NULL,
	[P_Desc3] [nvarchar](max) NULL,
	[P_Desc4] [nvarchar](max) NULL,
	[P_Desc5] [nvarchar](max) NULL,
	[P_StrapLine1] [nvarchar](50) NULL,
	[P_StrapLine2] [nvarchar](50) NULL,
	[P_StrapLine3] [nvarchar](50) NULL,
	[P_StrapLine4] [nvarchar](50) NULL,
	[P_StrapLine5] [nvarchar](50) NULL,
	[P_SpecTable1] [nvarchar](max) NULL,
	[P_SpecTable2] [nvarchar](max) NULL,
	[P_SpecTable3] [nvarchar](max) NULL,
	[P_SpecTable4] [nvarchar](max) NULL,
	[P_SpecTable5] [nvarchar](max) NULL,
	[P_Hyperlink1] [nvarchar](75) NULL,
	[P_Hyperlink2] [nvarchar](75) NULL,
	[P_Hyperlink3] [nvarchar](75) NULL,
	[P_Hyperlink4] [nvarchar](75) NULL,
	[P_Hyperlink5] [nvarchar](75) NULL,
	[P_Featured] [int] NULL DEFAULT ((0)),
	[P_OrderByValue] [float] NULL DEFAULT ((0)),
	[P_OrderVersionsBy] [nvarchar](50) NULL,
	[P_VersionDisplayType] [nvarchar](1) NULL,
	[P_Reviews] [nvarchar](1) NULL,
	[P_SupplierID] [int] NULL DEFAULT ((0)),
	[P_Type] [nvarchar](1) NULL,
	[P_CustomerGroupID] [int] NULL DEFAULT ((0)),
	[P_AverageRating] [float] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductStats]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStats](
	[PS_ID] [int] IDENTITY(1,1) NOT NULL,
	[PS_ProductID] [int] NULL,
	[PS_Date] [datetime] NULL,
	[PS_IP] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PROM_ID] [int] IDENTITY(1,1) NOT NULL,
	[PROM_Name1] [nvarchar](255) NULL,
	[PROM_Name2] [nvarchar](255) NULL,
	[PROM_Name3] [nvarchar](255) NULL,
	[PROM_Name4] [nvarchar](255) NULL,
	[PROM_Name5] [nvarchar](255) NULL,
	[PROM_StartDate] [datetime] NULL,
	[PROM_EndDate] [datetime] NULL,
	[PROM_Type1] [nvarchar](1) NULL,
	[PROM_VersionID1] [int] NULL DEFAULT ((0)),
	[PROM_Value1] [float] NULL DEFAULT ((0)),
	[PROM_Type2] [nvarchar](1) NULL,
	[PROM_VersionID2] [int] NULL DEFAULT ((0)),
	[PROM_Value2] [float] NULL DEFAULT ((0)),
	[PROM_Live] [nvarchar](1) NULL,
	[PROM_OrderByValue] [int] NULL DEFAULT ((0)),
	[PROM_MaxQuantity] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[PROM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuantityDiscounts]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityDiscounts](
	[QD_ID] [int] IDENTITY(1,1) NOT NULL,
	[QD_VersionID] [int] NULL DEFAULT ((0)),
	[QD_Quantity] [int] NULL DEFAULT ((0)),
	[QD_Price] [float] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[QD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelatedProducts]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelatedProducts](
	[RP_ID] [int] IDENTITY(1,1) NOT NULL,
	[RP_ParentID] [int] NULL DEFAULT ((0)),
	[RP_ChildID] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[RP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[REV_ID] [int] IDENTITY(1,1) NOT NULL,
	[REV_ProductID] [int] NULL DEFAULT ((0)),
	[REV_VersionID] [int] NULL DEFAULT ((0)),
	[REV_LanguageID] [int] NULL DEFAULT ((0)),
	[REV_CustomerID] [int] NULL DEFAULT ((0)),
	[REV_Title] [nvarchar](60) NULL,
	[REV_Text] [nvarchar](max) NULL,
	[REV_Rating] [int] NULL DEFAULT ((0)),
	[REV_Name] [nvarchar](30) NULL,
	[REV_Email] [nvarchar](75) NULL,
	[REV_Location] [nvarchar](30) NULL,
	[REV_Live] [nvarchar](1) NULL,
	[REV_DateCreated] [datetime] NULL,
	[REV_DateLastUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[REV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaveBasket]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaveBasket](
	[BSKT_ID] [int] IDENTITY(1,1) NOT NULL,
	[BSKT_CustomerID] [int] NULL DEFAULT ((0)),
	[BSKT_Name] [nvarchar](50) NULL,
	[BSKT_Items] [nvarchar](255) NULL,
	[BSKT_Quantity] [nvarchar](255) NULL,
	[BSKT_OptionGroups] [nvarchar](255) NULL,
	[BSKT_Options] [nvarchar](255) NULL,
	[BSKT_DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BSKT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SavedExports]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedExports](
	[Export_ID] [int] IDENTITY(1,1) NOT NULL,
	[Export_Name] [nvarchar](50) NULL,
	[Export_Date] [datetime] NULL,
	[Export_Details] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Export_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SESS_ID] [int] IDENTITY(1,1) NOT NULL,
	[SESS_Code] [nvarchar](20) NOT NULL,
	[SESS_IP] [nvarchar](16) NOT NULL,
	[SESS_DateCreated] [datetime] NOT NULL,
	[SESS_DateLastUpdated] [datetime] NULL,
	[SESS_Expiry] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SESS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionValues]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionValues](
	[SESSV_ID] [int] IDENTITY(1,1) NOT NULL,
	[SESSV_SessionID] [int] NULL DEFAULT ((0)),
	[SESSV_Name] [nvarchar](255) NOT NULL,
	[SESSV_Value] [nvarchar](255) NOT NULL,
	[SESSV_Expiry] [int] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethods](
	[SM_ID] [int] IDENTITY(1,1) NOT NULL,
	[SM_Name1] [nvarchar](100) NULL,
	[SM_Name2] [nvarchar](100) NULL,
	[SM_Name3] [nvarchar](100) NULL,
	[SM_Name4] [nvarchar](100) NULL,
	[SM_Name5] [nvarchar](100) NULL,
	[SM_Description1] [nvarchar](255) NULL,
	[SM_Description2] [nvarchar](255) NULL,
	[SM_Description3] [nvarchar](255) NULL,
	[SM_Description4] [nvarchar](255) NULL,
	[SM_Description5] [nvarchar](255) NULL,
	[SM_Live] [nvarchar](1) NULL,
	[SM_OrderByValue] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingRates]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingRates](
	[S_ID] [int] IDENTITY(1,1) NOT NULL,
	[S_ShippingMethodID] [int] NULL DEFAULT ((0)),
	[S_ShippingZoneID] [int] NULL DEFAULT ((0)),
	[S_ShippingRate] [real] NOT NULL DEFAULT ((0)),
	[S_Boundary] [real] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingZones]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingZones](
	[SZ_ID] [int] IDENTITY(1,1) NOT NULL,
	[SZ_Name1] [nvarchar](255) NULL,
	[SZ_Name2] [nvarchar](255) NULL,
	[SZ_Name3] [nvarchar](255) NULL,
	[SZ_Name4] [nvarchar](255) NULL,
	[SZ_Name5] [nvarchar](255) NULL,
	[SZ_OrderByValue] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SZ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SUP_ID] [int] IDENTITY(1,1) NOT NULL,
	[SUP_Name] [nvarchar](50) NULL,
	[SUP_Live] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[SUP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxRates]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxRates](
	[T_ID] [int] IDENTITY(1,1) NOT NULL,
	[T_Taxrate] [real] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UPS]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPS](
	[UPS_ID] [int] IDENTITY(1,1) NOT NULL,
	[UPS_Code] [nvarchar](2) NULL,
	[UPS_Region] [nvarchar](2) NULL,
	[UPS_Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UPS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VersionOptionLink]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionOptionLink](
	[V_OPT_VersionID] [int] NULL DEFAULT ((0)),
	[V_OPT_OptionID] [int] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Versions]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Versions](
	[V_ID] [int] IDENTITY(1,1) NOT NULL,
	[V_Name1] [nvarchar](75) NULL,
	[V_Name2] [nvarchar](75) NULL,
	[V_Name3] [nvarchar](75) NULL,
	[V_Name4] [nvarchar](75) NULL,
	[V_Name5] [nvarchar](75) NULL,
	[V_CodeNumber] [nvarchar](25) NULL,
	[V_ProductID] [int] NULL DEFAULT ((0)),
	[V_Price] [float] NULL DEFAULT ((0)),
	[V_Tax] [float] NULL DEFAULT ((0)),
	[V_Weight] [float] NULL DEFAULT ((0)),
	[V_DeliveryTime] [int] NULL DEFAULT ((0)),
	[V_Quantity] [int] NULL DEFAULT ((0)),
	[V_QuantityWarnLevel] [int] NULL DEFAULT ((0)),
	[V_Desc1] [nvarchar](max) NULL,
	[V_Desc2] [nvarchar](max) NULL,
	[V_Desc3] [nvarchar](max) NULL,
	[V_Desc4] [nvarchar](max) NULL,
	[V_Desc5] [nvarchar](max) NULL,
	[V_Live] [nvarchar](1) NULL,
	[V_DownLoadInfo] [nvarchar](255) NULL,
	[V_DownloadType] [nvarchar](50) NULL,
	[V_OrderByValue] [int] NULL DEFAULT ((0)),
	[V_RRP] [float] NULL DEFAULT ((0)),
	[V_Type] [nvarchar](1) NULL,
	[V_CustomerGroupID] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VersionSalesStats]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionSalesStats](
	[VSS_ID] [int] IDENTITY(1,1) NOT NULL,
	[VSS_VersionID] [int] NULL DEFAULT ((0)),
	[VSS_Quantity] [int] NULL DEFAULT ((0)),
	[VSS_Date] [datetime] NULL,
	[VSS_IP] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[VSS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WishList]    Script Date: 12-Mar-17 10:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[WL_ID] [int] IDENTITY(1,1) NOT NULL,
	[WL_CustomerID] [int] NULL,
	[WL_OwnerName] [nvarchar](50) NULL,
	[WL_Name] [nvarchar](255) NULL,
	[WL_PublicPassword] [nvarchar](10) NULL,
	[WL_Message] [nvarchar](max) NULL,
	[WL_Items] [nvarchar](255) NULL,
	[WL_Quantity] [nvarchar](255) NULL,
	[WL_OptionGroups] [nvarchar](255) NULL,
	[WL_Options] [nvarchar](50) NULL,
	[WL_OrigItems] [nvarchar](255) NULL,
	[WL_OrigQuantity] [nvarchar](50) NULL,
	[WL_OrigOptionGroups] [nvarchar](50) NULL,
	[WL_OrigOptions] [nvarchar](50) NULL,
	[WL_DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [AL_LoginID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [AL_LoginID] ON [dbo].[AdminLog]
(
	[AL_LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AFLG_AffiliateID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [AFLG_AffiliateID] ON [dbo].[AffiliateLog]
(
	[AFLG_AffiliateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AFLOG_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [AFLOG_ID] ON [dbo].[AffiliateLog]
(
	[AFLG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AFP_AffiliateID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [AFP_AffiliateID] ON [dbo].[AffiliatePayments]
(
	[AFP_AffiliateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [AFP_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [AFP_ID] ON [dbo].[AffiliatePayments]
(
	[AFP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PROP_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PROP_ID] ON [dbo].[Attributes]
(
	[ATTRIB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PROPV_PropertyID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PROPV_PropertyID] ON [dbo].[AttributeValues]
(
	[ATTRIBV_AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [V_CustomerGroupID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [V_CustomerGroupID] ON [dbo].[Categories]
(
	[CAT_CustomerGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CH_ParentCategoryID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CH_ParentCategoryID] ON [dbo].[CategoryHierachy]
(
	[CH_ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CFG_ConfigCategoryID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CFG_ConfigCategoryID] ON [dbo].[Config]
(
	[CFG_ConfigCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CFGG_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CFGG_ID] ON [dbo].[ConfigCategories]
(
	[CFGC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CP_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CP_ID] ON [dbo].[Coupons]
(
	[CP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [C_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [C_ID] ON [dbo].[CreditCards]
(
	[CR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CUR_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CUR_ID] ON [dbo].[Currencies]
(
	[CUR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CUR_IsoCode]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CUR_IsoCode] ON [dbo].[Currencies]
(
	[CUR_ISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CGP_CustomerGroupID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CGP_CustomerGroupID] ON [dbo].[CustomerGroupPrices]
(
	[CGP_CustomerGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CGP_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CGP_ID] ON [dbo].[CustomerGroupPrices]
(
	[CGP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CGP_VersionID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CGP_VersionID] ON [dbo].[CustomerGroupPrices]
(
	[CGP_VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CG_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CG_ID] ON [dbo].[CustomerGroups]
(
	[CG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [C_CustomerGroupiD]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [C_CustomerGroupiD] ON [dbo].[Customers]
(
	[C_CustomerGroupiD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [C_LanguageID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [C_LanguageID] ON [dbo].[Customers]
(
	[C_LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CD_AffiliateID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CD_AffiliateID] ON [dbo].[Customers]
(
	[C_AffiliateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CD_CardholderEUVATNum]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CD_CardholderEUVATNum] ON [dbo].[Customers]
(
	[C_CardholderEUVATNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CD_CardholderPostCode]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CD_CardholderPostCode] ON [dbo].[Customers]
(
	[C_CardholderPostCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CD_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CD_ID] ON [dbo].[Customers]
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [D_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [D_ID] ON [dbo].[Destination]
(
	[D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [D_ISOCode]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [D_ISOCode] ON [dbo].[Destination]
(
	[D_ISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OI_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OI_ID] ON [dbo].[InvoiceRows]
(
	[IR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [OI_VersionCode]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OI_VersionCode] ON [dbo].[InvoiceRows]
(
	[IR_VersionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OI_VersionID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OI_VersionID] ON [dbo].[InvoiceRows]
(
	[IR_OrderNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LANG_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LANG_ID] ON [dbo].[Languages]
(
	[LANG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LS_ID] ON [dbo].[LanguageStrings1]
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LS_ID] ON [dbo].[LanguageStrings2]
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LS_ID] ON [dbo].[LanguageStrings3]
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LS_ID] ON [dbo].[LanguageStrings4]
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LS_ID] ON [dbo].[LanguageStrings5]
(
	[LS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [LOGIN_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [LOGIN_ID] ON [dbo].[Logins]
(
	[LOGIN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OPT_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OPT_ID] ON [dbo].[OptionGroups]
(
	[OPTG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [OPTG_BackendID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OPTG_BackendID] ON [dbo].[OptionGroups]
(
	[OPTG_BackendName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OPT_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OPT_ID] ON [dbo].[Options]
(
	[OPT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OPT_OptionGroupID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OPT_OptionGroupID] ON [dbo].[Options]
(
	[OPT_OptionGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CN_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CN_ID] ON [dbo].[Orders]
(
	[O_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ON_AffiliatePaid]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [ON_AffiliatePaid] ON [dbo].[Orders]
(
	[O_AffiliatePaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ON_CardholderID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [ON_CardholderID] ON [dbo].[Orders]
(
	[O_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ON_CouponCode]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [ON_CouponCode] ON [dbo].[Orders]
(
	[O_CouponCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ON_CurrencyDefaultID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [ON_CurrencyDefaultID] ON [dbo].[Orders]
(
	[O_CurrencyIDGateway] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ON_LanguageID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [ON_LanguageID] ON [dbo].[Orders]
(
	[O_LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ON_ReferenceCode]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [ON_ReferenceCode] ON [dbo].[Orders]
(
	[O_ReferenceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PAGE_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PAGE_ID] ON [dbo].[Pages]
(
	[PAGE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PC_CategoryID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PC_CategoryID] ON [dbo].[ProductCategoryLink]
(
	[PCAT_CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PC_ProductID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PC_ProductID] ON [dbo].[ProductCategoryLink]
(
	[PCAT_ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [P_OPTG_OptionGroupID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [P_OPTG_OptionGroupID] ON [dbo].[ProductOptionGroupLink]
(
	[P_OPTG_OptionGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [P_OPTG_ProductID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [P_OPTG_ProductID] ON [dbo].[ProductOptionGroupLink]
(
	[P_OPTG_ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OPT_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OPT_ID] ON [dbo].[ProductOptionLink]
(
	[P_OPT_OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [OPT_OptionGroupID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [OPT_OptionGroupID] ON [dbo].[ProductOptionLink]
(
	[P_OPT_ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [P_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [P_ID] ON [dbo].[Products]
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [P_SupplierID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [P_SupplierID] ON [dbo].[Products]
(
	[P_SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [V_CustomerGroupID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [V_CustomerGroupID] ON [dbo].[Products]
(
	[P_CustomerGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PS_ID] ON [dbo].[ProductStats]
(
	[PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PROM_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PROM_ID] ON [dbo].[Promotions]
(
	[PROM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [QD_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [QD_ID] ON [dbo].[QuantityDiscounts]
(
	[QD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [QD_VersionID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [QD_VersionID] ON [dbo].[QuantityDiscounts]
(
	[QD_VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RP_ChildID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [RP_ChildID] ON [dbo].[RelatedProducts]
(
	[RP_ChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RP_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [RP_ID] ON [dbo].[RelatedProducts]
(
	[RP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RP_ParentID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [RP_ParentID] ON [dbo].[RelatedProducts]
(
	[RP_ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REV_CustomerID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [REV_CustomerID] ON [dbo].[Reviews]
(
	[REV_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REV_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [REV_ID] ON [dbo].[Reviews]
(
	[REV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REV_LanguageID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [REV_LanguageID] ON [dbo].[Reviews]
(
	[REV_LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REV_ProductID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [REV_ProductID] ON [dbo].[Reviews]
(
	[REV_ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REV_VersionID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [REV_VersionID] ON [dbo].[Reviews]
(
	[REV_VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [BSKT_CustomerID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [BSKT_CustomerID] ON [dbo].[SaveBasket]
(
	[BSKT_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [BSKT_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [BSKT_ID] ON [dbo].[SaveBasket]
(
	[BSKT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Export_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [Export_ID] ON [dbo].[SavedExports]
(
	[Export_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SESS_Code]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [SESS_Code] ON [dbo].[Sessions]
(
	[SESS_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SESS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [SESS_ID] ON [dbo].[Sessions]
(
	[SESS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SESSV_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [SESSV_ID] ON [dbo].[SessionValues]
(
	[SESSV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SESSV_SessionID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [SESSV_SessionID] ON [dbo].[SessionValues]
(
	[SESSV_SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SM_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [SM_ID] ON [dbo].[ShippingMethods]
(
	[SM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [S_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [S_ID] ON [dbo].[ShippingRates]
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SUP_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [SUP_ID] ON [dbo].[Suppliers]
(
	[SUP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [T_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [T_ID] ON [dbo].[TaxRates]
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UPS_CodeID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [UPS_CodeID] ON [dbo].[UPS]
(
	[UPS_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UPS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [UPS_ID] ON [dbo].[UPS]
(
	[UPS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [V_OPT_OptionID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [V_OPT_OptionID] ON [dbo].[VersionOptionLink]
(
	[V_OPT_VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CodeNumber]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [CodeNumber] ON [dbo].[Versions]
(
	[V_CodeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [V_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [V_ID] ON [dbo].[Versions]
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [V_ProductID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [V_ProductID] ON [dbo].[Versions]
(
	[V_ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PS_ID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [PS_ID] ON [dbo].[VersionSalesStats]
(
	[VSS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WL_CustomerID]    Script Date: 12-Mar-17 10:22:08 PM ******/
CREATE NONCLUSTERED INDEX [WL_CustomerID] ON [dbo].[WishList]
(
	[WL_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AffiliateLog] ADD  DEFAULT ((0)) FOR [AFLG_AffiliateID]
GO
ALTER TABLE [dbo].[AffiliatePayments] ADD  DEFAULT ((0)) FOR [AFP_AffiliateID]
GO
ALTER TABLE [dbo].[CustomerGroupPrices] ADD  DEFAULT ((0)) FOR [CGP_CustomerGroupID]
GO
ALTER TABLE [dbo].[CustomerGroupPrices] ADD  DEFAULT ((0)) FOR [CGP_VersionID]
GO
ALTER TABLE [dbo].[CustomerGroupPrices] ADD  DEFAULT ((0)) FOR [CGP_Price]
GO
ALTER TABLE [dbo].[LanguageStrings2] ADD  DEFAULT ((0)) FOR [LS_ID]
GO
ALTER TABLE [dbo].[LanguageStrings2] ADD  DEFAULT ((0)) FOR [LS_VersionAdded]
GO
ALTER TABLE [dbo].[ProductStats] ADD  DEFAULT ((0)) FOR [PS_ProductID]
GO
ALTER TABLE [dbo].[WishList] ADD  DEFAULT ((0)) FOR [WL_CustomerID]
GO
USE [master]
GO
ALTER DATABASE [JavaShop] SET  READ_WRITE 
GO
