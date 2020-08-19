USE [nombookerdb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MenuItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[RestaurantId] [uniqueidentifier] NOT NULL,
	[Category] [smallint] NULL,
	[VeganFriendly] [bit] NULL,
	[VegetarianFriendly] [bit] NULL,
	[PossibleAllergens] [nvarchar](255) NULL,
	[Spicy] [bit] NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_ItemCategory_CategoryId] FOREIGN KEY([Category])
REFERENCES [dbo].[ItemCategory] ([Id])
GO

ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_ItemCategory_CategoryId]
GO

ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_MenuItem_RestaurantId] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurant] ([Id])
GO

ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_MenuItem_RestaurantId]
GO


