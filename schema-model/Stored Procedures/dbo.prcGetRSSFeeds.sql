SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[prcGetRSSFeeds]
AS
SET NOCOUNT ON
    SELECT  RSSFeedID,
            FeedName,
            Checked
    FROM    dbo.RSSFeeds

	-- v4
GO
