USE [nombookerdb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItemCustomRequest](
	[OrderItemId] [uniqueidentifier] NOT NULL,
	[IngredientId] [uniqueidentifier] NOT NULL,
	[QuantityAdjustment] [float] NOT NULL,
 CONSTRAINT [PK_OrderItemCustomRequest] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItemCustomRequest]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemCustomRequest_Ingredient_IngredientId] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO

ALTER TABLE [dbo].[OrderItemCustomRequest] CHECK CONSTRAINT [FK_OrderItemCustomRequest_Ingredient_IngredientId]
GO

ALTER TABLE [dbo].[OrderItemCustomRequest]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemCustomRequest_OrderItemCustomRequest_OrderItemId] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItem] ([OrderItemId])
GO

ALTER TABLE [dbo].[OrderItemCustomRequest] CHECK CONSTRAINT [FK_OrderItemCustomRequest_OrderItemCustomRequest_OrderItemId]
GO


