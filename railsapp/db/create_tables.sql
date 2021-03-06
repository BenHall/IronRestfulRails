USE [IronRubyOnRails]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 03/18/2010 23:52:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([PostID], [Title]) VALUES (1, N'Post 1')
INSERT [dbo].[Posts] ([PostID], [Title]) VALUES (2, N'Post 2')
INSERT [dbo].[Posts] ([PostID], [Title]) VALUES (3, N'Post 3')
SET IDENTITY_INSERT [dbo].[Posts] OFF
