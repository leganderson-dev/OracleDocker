SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[prcAddBlog]
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
--V5
GO
EXEC sp_addextendedproperty N'MS_Description', N'Procedure to add a new blog post to Simple Talk', 'SCHEMA', N'dbo', 'PROCEDURE', N'prcAddBlog', NULL, NULL
GO
