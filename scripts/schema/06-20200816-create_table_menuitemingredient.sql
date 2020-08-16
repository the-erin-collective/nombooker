USE [nombookerdb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MenuItemIngredient](
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[IngredientId] [uniqueidentifier] NOT NULL,
	[IsExtra] [bit] NULL,
	[ExtraPrice] [float] NULL,
	[IsOptional] [bit] NULL,
	[OptionDiscount] [float] NULL,
 CONSTRAINT [PK_MenuItemIngredient] PRIMARY KEY CLUSTERED 
(
	[MenuItemId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MenuItemIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemIngredient_Ingredient_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO

ALTER TABLE [dbo].[MenuItemIngredient] CHECK CONSTRAINT [FK_MenuItemIngredient_Ingredient_IngredientId]
GO

ALTER TABLE [dbo].[MenuItemIngredient]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemIngredient_MenuItem_MenuItemId] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItem] ([Id])
GO

ALTER TABLE [dbo].[MenuItemIngredient] CHECK CONSTRAINT [FK_MenuItemIngredient_MenuItem_MenuItemId]
GO


