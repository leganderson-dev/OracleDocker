SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [dbo].[DM_CUSTOMER]'
GO
IF OBJECT_ID(N'[dbo].[DM_CUSTOMER]', 'U') IS NULL
CREATE TABLE [dbo].[DM_CUSTOMER]
(
[customer_id] [varchar] (10) NOT NULL,
[customer_firstname] [varchar] (60) NULL,
[customer_lastname] [varchar] (60) NULL,
[customer_gender] [varchar] (1) NULL,
[customer_company_name] [varchar] (60) NULL,
[customer_street_address] [varchar] (60) NULL,
[customer_region] [varchar] (60) NULL,
[customer_country] [varchar] (60) NULL,
[customer_email] [varchar] (60) NULL,
[customer_telephone] [varchar] (60) NULL,
[customer_zipcode] [varchar] (60) NULL,
[credit_card_type_id] [varchar] (2) NULL,
[customer_credit_card_number] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_CUSTO__CD65CB85EBAB0573] on [dbo].[DM_CUSTOMER]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__DM_CUSTO__CD65CB85EBAB0573]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[DM_CUSTOMER]', 'U'))
ALTER TABLE [dbo].[DM_CUSTOMER] ADD CONSTRAINT [PK__DM_CUSTO__CD65CB85EBAB0573] PRIMARY KEY CLUSTERED ([customer_id])
GO
PRINT N'Creating [dbo].[DM_CUSTOMER_NOTES]'
GO
IF OBJECT_ID(N'[dbo].[DM_CUSTOMER_NOTES]', 'U') IS NULL
CREATE TABLE [dbo].[DM_CUSTOMER_NOTES]
(
[customer_id] [varchar] (10) NOT NULL,
[customer_firstname] [varchar] (60) NULL,
[customer_lastname] [varchar] (60) NULL,
[customer_notes_entry_date] [datetime] NOT NULL,
[customer_note] [varchar] (2000) NULL
)
GO
PRINT N'Creating index [cnInd1] on [dbo].[DM_CUSTOMER_NOTES]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'cnInd1' AND object_id = OBJECT_ID(N'[dbo].[DM_CUSTOMER_NOTES]'))
CREATE UNIQUE NONCLUSTERED INDEX [cnInd1] ON [dbo].[DM_CUSTOMER_NOTES] ([customer_id], [customer_notes_entry_date])
GO
PRINT N'Creating [dbo].[DM_CREDIT_CARD_TYPE]'
GO
IF OBJECT_ID(N'[dbo].[DM_CREDIT_CARD_TYPE]', 'U') IS NULL
CREATE TABLE [dbo].[DM_CREDIT_CARD_TYPE]
(
[credit_card_type_id] [varchar] (2) NOT NULL,
[credit_card_type_name] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_CREDI__F76530082B5BBF7D] on [dbo].[DM_CREDIT_CARD_TYPE]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__DM_CREDI__F76530082B5BBF7D]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[DM_CREDIT_CARD_TYPE]', 'U'))
ALTER TABLE [dbo].[DM_CREDIT_CARD_TYPE] ADD CONSTRAINT [PK__DM_CREDI__F76530082B5BBF7D] PRIMARY KEY CLUSTERED ([credit_card_type_id])
GO
PRINT N'Creating [dbo].[Blogs]'
GO
IF OBJECT_ID(N'[dbo].[Blogs]', 'U') IS NULL
CREATE TABLE [dbo].[Blogs]
(
[BlogsID] [int] NOT NULL IDENTITY(1, 1),
[AuthorID] [int] NULL,
[Title] [char] (142) NULL,
[PublishDate] [datetime] NULL,
[Article] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__Blogs__C03C1E467AEB09A9] on [dbo].[Blogs]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__Blogs__C03C1E467AEB09A9]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[Blogs]', 'U'))
ALTER TABLE [dbo].[Blogs] ADD CONSTRAINT [PK__Blogs__C03C1E467AEB09A9] PRIMARY KEY CLUSTERED ([BlogsID])
GO
PRINT N'Creating [dbo].[BlogComments]'
GO
IF OBJECT_ID(N'[dbo].[BlogComments]', 'U') IS NULL
CREATE TABLE [dbo].[BlogComments]
(
[BlogCommentsID] [int] NOT NULL IDENTITY(1, 1),
[BlogsID] [int] NOT NULL,
[CommentText] [nvarchar] (200) NULL,
[CommentDate] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK__BlogComments] on [dbo].[BlogComments]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__BlogComments]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogComments]', 'U'))
ALTER TABLE [dbo].[BlogComments] ADD CONSTRAINT [PK__BlogComments] PRIMARY KEY CLUSTERED ([BlogCommentsID])
GO
PRINT N'Creating [dbo].[CountryCodes]'
GO
IF OBJECT_ID(N'[dbo].[CountryCodes]', 'U') IS NULL
CREATE TABLE [dbo].[CountryCodes]
(
[CountryName] [nvarchar] (255) NULL,
[CountryCode] [nvarchar] (4) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Countries] on [dbo].[CountryCodes]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_Countries]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[CountryCodes]', 'U'))
ALTER TABLE [dbo].[CountryCodes] ADD CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED ([CountryCode])
GO
PRINT N'Creating [dbo].[Contacts]'
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NULL
CREATE TABLE [dbo].[Contacts]
(
[ContactsID] [int] NOT NULL IDENTITY(1, 1),
[ContactFullName] [nvarchar] (100) NOT NULL,
[PhoneWork] [nvarchar] (25) NULL,
[PhoneMobile] [nvarchar] (25) NULL,
[Address1] [nvarchar] (128) NULL,
[Address2] [nvarchar] (128) NULL,
[Address3] [nvarchar] (128) NULL,
[CountryCode] [nvarchar] (4) NULL CONSTRAINT [DF__Contacts__Countr__117F9D94] DEFAULT (N'US'),
[JoiningDate] [datetime] NULL CONSTRAINT [DF__Contacts__Joinin__1273C1CD] DEFAULT (getdate()),
[ModifiedDate] [datetime] NULL,
[Email] [nvarchar] (256) NULL,
[Photo] [image] NULL,
[LinkedIn] [nvarchar] (128) NULL
)
GO
PRINT N'Creating primary key [PK__Contacts__912F378B7C53D1A0] on [dbo].[Contacts]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__Contacts__912F378B7C53D1A0]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacts]', 'U'))
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [PK__Contacts__912F378B7C53D1A0] PRIMARY KEY CLUSTERED ([ContactsID])
GO
PRINT N'Creating [dbo].[Articles]'
GO
IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NULL
CREATE TABLE [dbo].[Articles]
(
[ArticlesID] [int] NOT NULL IDENTITY(1, 1),
[AuthorID] [int] NULL,
[Title] [char] (142) NULL,
[Description] [varchar] (max) NULL,
[Article] [varchar] (max) NULL,
[PublishDate] [datetime] NULL,
[ModifiedDate] [datetime] NULL,
[URL] [char] (200) NULL,
[Comments] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Article] on [dbo].[Articles]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_Article]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[Articles]', 'U'))
ALTER TABLE [dbo].[Articles] ADD CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED ([ArticlesID])
GO
PRINT N'Creating [dbo].[ArticleDescriptions]'
GO
IF OBJECT_ID(N'[dbo].[ArticleDescriptions]', 'U') IS NULL
CREATE TABLE [dbo].[ArticleDescriptions]
(
[ArticlesID] [int] NOT NULL IDENTITY(1, 1),
[ShortDescription] [nvarchar] (2000) NULL,
[Description] [text] NULL,
[ArticlesName] [varchar] (50) NULL,
[Picture] [image] NULL
)
GO
PRINT N'Creating primary key [PK_ArticleDescriptions] on [dbo].[ArticleDescriptions]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_ArticleDescriptions]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticleDescriptions]', 'U'))
ALTER TABLE [dbo].[ArticleDescriptions] ADD CONSTRAINT [PK_ArticleDescriptions] PRIMARY KEY CLUSTERED ([ArticlesID])
GO
PRINT N'Creating [dbo].[ArticlePrices]'
GO
IF OBJECT_ID(N'[dbo].[ArticlePrices]', 'U') IS NULL
CREATE TABLE [dbo].[ArticlePrices]
(
[ArticlePricesID] [int] NOT NULL IDENTITY(1, 1),
[ArticlesID] [int] NULL,
[Price] [money] NULL,
[ValidFrom] [datetime] NULL CONSTRAINT [DF__ArticlePr__Valid__1CF15040] DEFAULT (getdate()),
[ValidTo] [datetime] NULL,
[Active] [char] (1) NULL CONSTRAINT [DF__ArticlePr__Activ__1DE57479] DEFAULT ('N'),
[SalesPrice] [char] (1) NULL
)
GO
PRINT N'Creating primary key [PK_ArticlePrices] on [dbo].[ArticlePrices]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_ArticlePrices]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticlePrices]', 'U'))
ALTER TABLE [dbo].[ArticlePrices] ADD CONSTRAINT [PK_ArticlePrices] PRIMARY KEY CLUSTERED ([ArticlePricesID])
GO
PRINT N'Creating index [IX_ArticlePrices] on [dbo].[ArticlePrices]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_ArticlePrices' AND object_id = OBJECT_ID(N'[dbo].[ArticlePrices]'))
CREATE NONCLUSTERED INDEX [IX_ArticlePrices] ON [dbo].[ArticlePrices] ([ArticlesID])
GO
PRINT N'Creating index [IX_ArticlePrices_1] on [dbo].[ArticlePrices]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_ArticlePrices_1' AND object_id = OBJECT_ID(N'[dbo].[ArticlePrices]'))
CREATE NONCLUSTERED INDEX [IX_ArticlePrices_1] ON [dbo].[ArticlePrices] ([ValidFrom])
GO
PRINT N'Creating index [IX_ArticlePrices_2] on [dbo].[ArticlePrices]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_ArticlePrices_2' AND object_id = OBJECT_ID(N'[dbo].[ArticlePrices]'))
CREATE NONCLUSTERED INDEX [IX_ArticlePrices_2] ON [dbo].[ArticlePrices] ([ValidTo])
GO
PRINT N'Creating [dbo].[ArticleReferences]'
GO
IF OBJECT_ID(N'[dbo].[ArticleReferences]', 'U') IS NULL
CREATE TABLE [dbo].[ArticleReferences]
(
[ArticlesID] [int] NOT NULL IDENTITY(1, 1),
[Reference] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_ArticleReferences] on [dbo].[ArticleReferences]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_ArticleReferences]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticleReferences]', 'U'))
ALTER TABLE [dbo].[ArticleReferences] ADD CONSTRAINT [PK_ArticleReferences] PRIMARY KEY CLUSTERED ([ArticlesID])
GO
PRINT N'Creating [dbo].[calculateEstimateOfReadingTime]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[calculateEstimateOfReadingTime]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'-- This is a much more accurate function
CREATE FUNCTION [dbo].[calculateEstimateOfReadingTime] ( @value VARCHAR(MAX) )
RETURNS INT
    BEGIN
        DECLARE @ret AS INT = 1 ,
            @i AS INT = 1;
        WHILE @i <= LEN(@value) 
            BEGIN
                IF SUBSTRING(@value, @i, 1) = '' '' 
                    BEGIN
                        SET @ret = @ret + 1;
                    END
                SET @i = @i + 1;
            END  
        RETURN @ret / 250;
    END'
GO
PRINT N'Creating [dbo].[v_Articles]'
GO
IF OBJECT_ID(N'[dbo].[v_Articles]', 'V') IS NULL
EXEC sp_executesql N'/* This view gets called from the ST web app to show the articles */
CREATE VIEW [dbo].[v_Articles]
AS
    SELECT  TOP 250 a.[Title] ,
            a.[PublishDate] ,
            a.[Description] ,
            a.[URL] ,
            a.[Comments], 
			dbo.calculateEstimateOfReadingTime(a.Article) AS readingTime,
            c.[ContactFullName] ,
			c.[Photo],
			cc.CountryCode,
			cc.CountryName
    FROM    Articles a
		        LEFT JOIN Contacts c ON a.AuthorID = c.ContactsID
			LEFT JOIN dbo.CountryCodes cc ON c.CountryCode = cc.Countrycode'
GO
PRINT N'Creating [dbo].[ufnGetBlogInformation]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufnGetBlogInformation]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'CREATE FUNCTION [dbo].[ufnGetBlogInformation] (@Contact INT)
RETURNS @retBlogInformation TABLE (-- Columns returned by the function
                                   [AuthorID] INT NOT NULL,
                                   [Title] [nvarchar](50) NULL)
AS 

BEGIN
    INSERT  INTO @retBlogInformation
            SELECT  AuthorID, Title
            FROM    dbo.Blogs
            WHERE   AuthorID=@Contact

    RETURN
END'
GO
PRINT N'Creating [dbo].[prcAddBlog]'
GO
IF OBJECT_ID(N'[dbo].[prcAddBlog]', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[prcAddBlog]
    @Author VARCHAR(30),
    @Title VARCHAR(142) = NULL,
    @Article VARCHAR(MAX) = NULL
    WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON
    INSERT  INTO dbo.Blogs (AuthorID, Title, Article, PublishDate)
    VALUES  (@Author, @Title, @Article, GETDATE())
        
        
END;
--V5'
GO
PRINT N'Creating [dbo].[prcAddContact]'
GO
IF OBJECT_ID(N'[dbo].[prcAddContact]', 'P') IS NULL
EXEC sp_executesql N'/* 
Sample execution: 
EXEC [prcAddContact] ''david'', ''12345'', ''23456'', ''152 Riverside Place'', ''Cambridge'', '''', ''feedback@red-gate.com'', NULL
*/

CREATE PROCEDURE [dbo].[prcAddContact]   @ContactFullName VARCHAR(30),
										 @PhoneWork VARCHAR(30) = NULL,
										 @PhoneMobile VARCHAR(30) = NULL,
										 @Address1 VARCHAR(30) = NULL,
										 @Address2 VARCHAR(30) = NULL,
										 @Address3 VARCHAR(30) = NULL,
										 @Email VARCHAR(30) = NULL,
										 @JoiningDate DATETIME = NULL

WITH EXECUTE AS CALLER
AS
BEGIN
SET NOCOUNT ON
INSERT INTO dbo.Contacts
        ( ContactFullName ,
          PhoneWork ,
          PhoneMobile ,
          Address1 ,
          Address2 ,
          Address3 ,
          JoiningDate ,
          ModifiedDate ,
          Email
        )
VALUES  ( @ContactFullName , -- ContactFullName - nvarchar(100)
         @PhoneWork , -- PhoneWork - nvarchar(25)
         @PhoneMobile , -- PhoneMobile - nvarchar(25)
         @Address1 , -- Address1 - nvarchar(128)
         @Address2 , -- Address2 - nvarchar(128)
         @Address3 , -- Address3 - nvarchar(128)
          @JoiningDate , -- JoiningDate - datetime, e.g. ''2012-01-17 11:42:45'' 
          GETDATE() , -- ModifiedDate - datetime
          @Email  -- Email - nvarchar(256)
        )
        
        
        END;'
GO
PRINT N'Creating [dbo].[prcGetContacts]'
GO
IF OBJECT_ID(N'[dbo].[prcGetContacts]', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[prcGetContacts]
AS
SET NOCOUNT ON
    SELECT  *
    FROM    Contacts

	-- v7'
GO
PRINT N'Creating [dbo].[RSSFeeds]'
GO
IF OBJECT_ID(N'[dbo].[RSSFeeds]', 'U') IS NULL
CREATE TABLE [dbo].[RSSFeeds]
(
[RSSFeedID] [int] NOT NULL IDENTITY(1, 1),
[FeedName] [varchar] (max) NULL,
[Checked] [bit] NULL,
[FeedBurner] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK__RSSFeeds__DF1690F2C1F77AC5] on [dbo].[RSSFeeds]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__RSSFeeds__DF1690F2C1F77AC5]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[RSSFeeds]', 'U'))
ALTER TABLE [dbo].[RSSFeeds] ADD CONSTRAINT [PK__RSSFeeds__DF1690F2C1F77AC5] PRIMARY KEY CLUSTERED ([RSSFeedID])
GO
PRINT N'Creating [dbo].[prcGetRSSFeeds]'
GO
IF OBJECT_ID(N'[dbo].[prcGetRSSFeeds]', 'P') IS NULL
EXEC sp_executesql N'CREATE PROCEDURE [dbo].[prcGetRSSFeeds]
AS
SET NOCOUNT ON
    SELECT  RSSFeedID,
            FeedName,
            Checked
    FROM    dbo.RSSFeeds

	-- v4'
GO
PRINT N'Creating [dbo].[ArticlesPriceList]'
GO
IF OBJECT_ID(N'[dbo].[ArticlesPriceList]', 'V') IS NULL
EXEC sp_executesql N'-- Create indexed view
CREATE VIEW [dbo].[ArticlesPriceList]
AS
SELECT     a.ArticlesID, a.Description AS Articles, ap.Price
FROM       dbo.Articles AS a LEFT JOIN
           dbo.ArticlePrices AS ap ON a.ArticlesID = ap.ArticlePricesID'
GO
PRINT N'Creating [dbo].[v_Blogs]'
GO
IF OBJECT_ID(N'[dbo].[v_Blogs]', 'V') IS NULL
EXEC sp_executesql N'CREATE VIEW [dbo].[v_Blogs]
AS
SELECT  c.ContactFullName, Title, Article, PublishDate
FROM    Blogs
        INNER JOIN dbo.Contacts c ON c.ContactsID = dbo.Blogs.AuthorID'
GO
PRINT N'Creating [dbo].[oldproc]'
GO
IF OBJECT_ID(N'[dbo].[oldproc]', 'P') IS NULL
EXEC sp_executesql N'--SET QUOTED_IDENTIFIER ON|OFF
--SET ANSI_NULLS ON|OFF
--GO
CREATE PROCEDURE [dbo].[oldproc]
    @parameter_name AS INT
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| ''user_name''
AS
BEGIN
    SELECT * FROM dbo.DM_CUSTOMER AS DC
END'
GO
PRINT N'Creating [dbo].[ArticlePurchases]'
GO
IF OBJECT_ID(N'[dbo].[ArticlePurchases]', 'U') IS NULL
CREATE TABLE [dbo].[ArticlePurchases]
(
[ArticlePurchasesID] [int] NOT NULL IDENTITY(1, 1),
[ArticlePricesID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__ArticlePu__Quant__22AA2996] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) NULL,
[PurchaseDate] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ArticlePurchases] on [dbo].[ArticlePurchases]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK_ArticlePurchases]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticlePurchases]', 'U'))
ALTER TABLE [dbo].[ArticlePurchases] ADD CONSTRAINT [PK_ArticlePurchases] PRIMARY KEY CLUSTERED ([ArticlePurchasesID])
GO
PRINT N'Creating [dbo].[PersonData]'
GO
IF OBJECT_ID(N'[dbo].[PersonData]', 'U') IS NULL
CREATE TABLE [dbo].[PersonData]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[NAME] [nvarchar] (200) NOT NULL,
[Email1] [nvarchar] (200) NULL,
[Email2] [nvarchar] (200) NULL,
[Phone1] [nvarchar] (100) NULL,
[Phone2] [nvarchar] (100) NULL,
[Street1] [nvarchar] (200) NULL,
[City1] [nvarchar] (200) NULL,
[StateProvince1] [nvarchar] (50) NULL,
[PostalCode1] [nvarchar] (50) NULL,
[Street2] [nvarchar] (200) NULL,
[City2] [nvarchar] (200) NULL,
[StateProvince2] [nvarchar] (50) NULL,
[PostalCode2] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__PersonDa__3214EC27CA5DC9C3] on [dbo].[PersonData]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__PersonDa__3214EC27CA5DC9C3]', 'PK') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonData]', 'U'))
ALTER TABLE [dbo].[PersonData] ADD CONSTRAINT [PK__PersonDa__3214EC27CA5DC9C3] PRIMARY KEY CLUSTERED ([ID])
GO
PRINT N'Creating [dbo].[ntsh]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ntsh]') AND (type = 'IF' OR type = 'FN' OR type = 'TF' OR type = 'FT' OR type = 'FS'))
EXEC sp_executesql N'/* This "nothing to see here" function does nothing but slow down v_Articles */
CREATE FUNCTION [dbo].[ntsh] (@x INT, @n INT)
RETURNS INT
WITH SCHEMABINDING AS
BEGIN
  DECLARE @retval AS INT;

	DECLARE @i INT = 0
-- Set i to 100 or greater to slow v_Articles to >100ms
	WHILE @i < @n
		BEGIN
			SET @i = @i + 1;
		END
	SET @retval = @x;

  RETURN @retval ;
END;'
GO
PRINT N'Creating [dbo].[prcProcedureWithDynamicSQL]'
GO
IF OBJECT_ID(N'[dbo].[prcProcedureWithDynamicSQL]', 'P') IS NULL
EXEC sp_executesql N'/* This is a procedure that simply contains dynamic SQL just to demonstrate that dependencies aren''t picked up. 
Use SQL Search to find these. */
CREATE PROCEDURE [dbo].[prcProcedureWithDynamicSQL]
AS 
SET NOCOUNT ON
    BEGIN

        EXECUTE  (''SELECT count(*) FROM Contacts WHERE ContactFullName LIKE ''''D%'''''')
    END'
GO
PRINT N'Adding foreign keys to [dbo].[ArticleDescriptions]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ArticleDescriptions]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticleDescriptions]', 'U'))
ALTER TABLE [dbo].[ArticleDescriptions] ADD CONSTRAINT [FK_ArticleDescriptions] FOREIGN KEY ([ArticlesID]) REFERENCES [dbo].[Articles] ([ArticlesID])
GO
PRINT N'Adding foreign keys to [dbo].[ArticlePrices]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ArticlePrices]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticlePrices]', 'U'))
ALTER TABLE [dbo].[ArticlePrices] ADD CONSTRAINT [FK_ArticlePrices] FOREIGN KEY ([ArticlesID]) REFERENCES [dbo].[Articles] ([ArticlesID])
GO
PRINT N'Adding foreign keys to [dbo].[ArticleReferences]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articles]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[ArticleReferences]', 'U'))
ALTER TABLE [dbo].[ArticleReferences] ADD CONSTRAINT [FK_Articles] FOREIGN KEY ([ArticlesID]) REFERENCES [dbo].[Articles] ([ArticlesID])
GO
PRINT N'Adding foreign keys to [dbo].[Articles]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Author]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Articles]', 'U'))
ALTER TABLE [dbo].[Articles] ADD CONSTRAINT [FK_Author] FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Contacts] ([ContactsID])
GO
PRINT N'Adding foreign keys to [dbo].[BlogComments]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BlogComments]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[BlogComments]', 'U'))
ALTER TABLE [dbo].[BlogComments] ADD CONSTRAINT [FK__BlogComments] FOREIGN KEY ([BlogsID]) REFERENCES [dbo].[Blogs] ([BlogsID])
GO
PRINT N'Adding foreign keys to [dbo].[Blogs]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BlogAuthor]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Blogs]', 'U'))
ALTER TABLE [dbo].[Blogs] ADD CONSTRAINT [FK_BlogAuthor] FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Contacts] ([ContactsID])
GO
PRINT N'Adding foreign keys to [dbo].[Contacts]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Contacts__Countr__145C0A3F]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[Contacts]', 'U'))
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [FK__Contacts__Countr__145C0A3F] FOREIGN KEY ([CountryCode]) REFERENCES [dbo].[CountryCodes] ([CountryCode])
GO
PRINT N'Adding foreign keys to [dbo].[DM_CUSTOMER]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[CU_FK]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[DM_CUSTOMER]', 'U'))
ALTER TABLE [dbo].[DM_CUSTOMER] ADD CONSTRAINT [CU_FK] FOREIGN KEY ([credit_card_type_id]) REFERENCES [dbo].[DM_CREDIT_CARD_TYPE] ([credit_card_type_id])
GO
PRINT N'Adding foreign keys to [dbo].[DM_CUSTOMER_NOTES]'
GO
IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[CN_FK]','F') AND parent_object_id = OBJECT_ID(N'[dbo].[DM_CUSTOMER_NOTES]', 'U'))
ALTER TABLE [dbo].[DM_CUSTOMER_NOTES] ADD CONSTRAINT [CN_FK] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[DM_CUSTOMER] ([customer_id])
GO

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO

PRINT(N'Add 249 rows to [dbo].[CountryCodes]')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UNITED ARAB EMIRATES', N'AE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'AFGHANISTAN', N'AF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ANTIGUA AND BARBUDA', N'AG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ANGUILLA', N'AI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ALBANIA', N'AL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ARMENIA', N'AM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ANGOLA', N'AO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ANTARCTICA', N'AQ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ARGENTINA', N'AR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'AMERICAN SAMOA', N'AS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'AUSTRIA', N'AT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'AUSTRALIA', N'AU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ARUBA', N'AW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ÅLAND ISLANDS', N'AX')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'AZERBAIJAN', N'AZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BOSNIA AND HERZEGOVINA', N'BA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BARBADOS', N'BB')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BANGLADESH', N'BD')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BELGIUM', N'BE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BURKINA FASO', N'BF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BULGARIA', N'BG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BAHRAIN', N'BH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BURUNDI', N'BI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BENIN', N'BJ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT BARTHÉLEMY', N'BL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BERMUDA', N'BM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BRUNEI DARUSSALAM', N'BN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BOLIVIA', N'BO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BONAIRE', N'BQ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BRAZIL', N'BR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BAHAMAS', N'BS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BHUTAN', N'BT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BOUVET ISLAND', N'BV')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BOTSWANA', N'BW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BELARUS', N'BY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BELIZE', N'BZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CANADA', N'CA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'COCOS (KEELING) ISLANDS', N'CC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CONGO', N'CD')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CENTRAL AFRICAN REPUBLIC', N'CF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CONGO', N'CG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SWITZERLAND', N'CH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CÔTE D''IVOIRE', N'CI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'COOK ISLANDS', N'CK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CHILE', N'CL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CAMEROON', N'CM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CHINA', N'CN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'COLOMBIA', N'CO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'COSTA RICA', N'CR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CUBA', N'CU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CAPE VERDE', N'CV')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CURAÇAO', N'CW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CHRISTMAS ISLAND', N'CX')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CYPRUS', N'CY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CZECH REPUBLIC', N'CZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ANDORRA', N'DA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GERMANY', N'DE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'DJIBOUTI', N'DJ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'DENMARK', N'DK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'DOMINICA', N'DM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'DOMINICAN REPUBLIC', N'DO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ALGERIA', N'DZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ECUADOR', N'EC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ESTONIA', N'EE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'EGYPT', N'EG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'WESTERN SAHARA', N'EH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ERITREA', N'ER')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SPAIN', N'ES')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ETHIOPIA', N'ET')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FINLAND', N'FI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FIJI', N'FJ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FALKLAND ISLANDS (MALVINAS)', N'FK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MICRONESIA', N'FM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FAROE ISLANDS', N'FO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FRANCE', N'FR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GABON', N'GA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UNITED KINGDOM', N'GB')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GRENADA', N'GD')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GEORGIA', N'GE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FRENCH GUIANA', N'GF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUERNSEY', N'GG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GHANA', N'GH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GIBRALTAR', N'GI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GREENLAND', N'GL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GAMBIA', N'GM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUINEA', N'GN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUADELOUPE', N'GP')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'EQUATORIAL GUINEA', N'GQ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GREECE', N'GR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', N'GS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUATEMALA', N'GT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUAM', N'GU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUINEA-BISSAU', N'GW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'GUYANA', N'GY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'HONG KONG', N'HK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'HEARD ISLAND AND MCDONALD ISLANDS', N'HM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'HONDURAS', N'HN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CROATIA', N'HR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'HAITI', N'HT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'HUNGARY', N'HU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'INDONESIA', N'ID')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'IRELAND', N'IE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ISRAEL', N'IL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ISLE OF MAN', N'IM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'INDIA', N'IN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'BRITISH INDIAN OCEAN TERRITORY', N'IO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'IRAQ', N'IQ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'IRAN', N'IR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ICELAND', N'IS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ITALY', N'IT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'JERSEY', N'JE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'JAMAICA', N'JM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'JORDAN', N'JO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'JAPAN', N'JP')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KENYA', N'KE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KYRGYZSTAN', N'KG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CAMBODIA', N'KH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KIRIBATI', N'KI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'COMOROS', N'KM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT KITTS AND NEVIS', N'KN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KOREA', N'KP')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KOREA', N'KR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KUWAIT', N'KW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CAYMAN ISLANDS', N'KY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'KAZAKHSTAN', N'KZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LAO PEOPLE''S DEMOCRATIC REPUBLIC', N'LA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LEBANON', N'LB')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT LUCIA', N'LC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LIECHTENSTEIN', N'LI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SRI LANKA', N'LK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LIBERIA', N'LR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LESOTHO', N'LS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LITHUANIA', N'LT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LUXEMBOURG', N'LU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LATVIA', N'LV')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'LIBYA', N'LY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MOROCCO', N'MA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MONACO', N'MC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MOLDOVA', N'MD')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MONTENEGRO', N'ME')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT MARTIN (FRENCH PART)', N'MF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MADAGASCAR', N'MG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MARSHALL ISLANDS', N'MH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MACEDONIA', N'MK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MALI', N'ML')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MYANMAR', N'MM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MONGOLIA', N'MN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MACAO', N'MO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NORTHERN MARIANA ISLANDS', N'MP')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MARTINIQUE', N'MQ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MAURITANIA', N'MR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MONTSERRAT', N'MS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MALTA', N'MT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MAURITIUS', N'MU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MALDIVES', N'MV')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MALAWI', N'MW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MEXICO', N'MX')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MALAYSIA', N'MY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MOZAMBIQUE', N'MZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NAMIBIA', N'NA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NEW CALEDONIA', N'NC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NIGER', N'NE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NORFOLK ISLAND', N'NF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NIGERIA', N'NG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NICARAGUA', N'NI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NETHERLANDS', N'NL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NORWAY', N'NO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NEPAL', N'NP')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NAURU', N'NR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NIUE', N'NU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'NEW ZEALAND', N'NZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'OMAN', N'OM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PANAMA', N'PA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PERU', N'PE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FRENCH POLYNESIA', N'PF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PAPUA NEW GUINEA', N'PG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PHILIPPINES', N'PH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PAKISTAN', N'PK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'POLAND', N'PL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT PIERRE AND MIQUELON', N'PM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PITCAIRN', N'PN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PUERTO RICO', N'PR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PALESTINIAN TERRITORY', N'PS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PORTUGAL', N'PT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PALAU', N'PW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'PARAGUAY', N'PY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'QATAR', N'QA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'RÉUNION', N'RE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ROMANIA', N'RO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SERBIA', N'RS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'RUSSIAN FEDERATION', N'RU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'RWANDA', N'RW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAUDI ARABIA', N'SA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SOLOMON ISLANDS', N'SB')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SEYCHELLES', N'SC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SUDAN', N'SD')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SWEDEN', N'SE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SINGAPORE', N'SG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT HELENA', N'SH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SLOVENIA', N'SI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SVALBARD AND JAN MAYEN', N'SJ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SLOVAKIA', N'SK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SIERRA LEONE', N'SL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAN MARINO', N'SM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SENEGAL', N'SN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SOMALIA', N'SO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SURINAME', N'SR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SOUTH SUDAN', N'SS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAO TOME AND PRINCIPE', N'ST')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'EL SALVADOR', N'SV')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SINT MAARTEN (DUTCH PART)', N'SX')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SYRIAN ARAB REPUBLIC', N'SY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SWAZILAND', N'SZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TURKS AND CAICOS ISLANDS', N'TC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'CHAD', N'TD')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'FRENCH SOUTHERN TERRITORIES', N'TF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TOGO', N'TG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'THAILAND', N'TH')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TAJIKISTAN', N'TJ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TOKELAU', N'TK')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TIMOR-LESTE', N'TL')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TURKMENISTAN', N'TM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TUNISIA', N'TN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TONGA', N'TO')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TURKEY', N'TR')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TRINIDAD AND TOBAGO', N'TT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TUVALU', N'TV')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TAIWAN', N'TW')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'TANZANIA', N'TZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UKRAINE', N'UA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UGANDA', N'UG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UNITED STATES MINOR OUTLYING ISLANDS', N'UM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UNITED STATES', N'US')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'URUGUAY', N'UY')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'UZBEKISTAN', N'UZ')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'HOLY SEE (VATICAN CITY STATE)', N'VA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAINT VINCENT AND THE GRENADINES', N'VC')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'VENEZUELA', N'VE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'VIRGIN ISLANDS', N'VG')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'VIRGIN ISLANDS', N'VI')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'VIET NAM', N'VN')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'VANUATU', N'VU')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'WALLIS AND FUTUNA', N'WF')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SAMOA', N'WS')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'YEMEN', N'YE')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'MAYOTTE', N'YT')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'SOUTH AFRICA', N'ZA')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ZAMBIA', N'ZM')
INSERT INTO [dbo].[CountryCodes] ([CountryName], [CountryCode]) VALUES (N'ZIMBABWE', N'ZW')

PRINT(N'Add 4 rows to [dbo].[RSSFeeds]')
SET IDENTITY_INSERT [dbo].[RSSFeeds] ON
INSERT INTO [dbo].[RSSFeeds] ([RSSFeedID], [FeedName], [Checked], [FeedBurner]) VALUES (1, 'SQL', 1, 0)
INSERT INTO [dbo].[RSSFeeds] ([RSSFeedID], [FeedName], [Checked], [FeedBurner]) VALUES (2, '.NET', 1, 1)
INSERT INTO [dbo].[RSSFeeds] ([RSSFeedID], [FeedName], [Checked], [FeedBurner]) VALUES (3, 'SysAdmin', 1, 0)
INSERT INTO [dbo].[RSSFeeds] ([RSSFeedID], [FeedName], [Checked], [FeedBurner]) VALUES (4, 'Opinion', 1, 1)
SET IDENTITY_INSERT [dbo].[RSSFeeds] OFF

