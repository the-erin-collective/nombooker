USE [master]
GO
IF DB_ID('nombookerdb') IS NULL 
BEGIN

	CREATE DATABASE [nombookerdb]

	ALTER DATABASE [nombookerdb] MODIFY FILE
	( NAME = N'nombookerdb', SIZE = 512MB, MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )

	ALTER DATABASE [nombookerdb] MODIFY FILE
	( NAME = N'nombookerdb_log', SIZE = 256MB, MAXSIZE = UNLIMITED, FILEGROWTH = 10% )
END
GO

USE [nombookerdb]
GO

CREATE TABLE [dbo].[Restaurant](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[BannerImage] [image] NULL,
	[LogoImage] [image] NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ingredient](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[VeganFriendly] [bit] NULL,
	[VegetarianFriendly] [bit] NULL,
	[PossibleAllergen] [bit] NULL,
	[Spicy] [bit] NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[ItemCategory](
	[Id] [smallint] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MenuItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[RestaurantId] [uniqueidentifier] NOT NULL,
	[Category] [smallint] NULL,
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

CREATE TABLE [dbo].[ReservationStatus](
	[Id] [smallint] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReservationStatu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Reservation](
	[Id] [uniqueidentifier] NOT NULL,
	[StartDateTime] [datetimeoffset](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReservationStatusId] [smallint] NOT NULL,
	[NumberOfGuests] [smallint] NOT NULL,
	[PreferredTable] [nvarchar](50) NULL,
	[EndDateTime] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_ReservationStatus_ReservationStatusId] FOREIGN KEY([ReservationStatusId])
REFERENCES [dbo].[ReservationStatus] ([Id])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_ReservationStatus_ReservationStatusId]
GO

CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[ReservationId] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Reservation_ReservationId] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([Id])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Reservation_ReservationId]
GO

CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [uniqueidentifier] NOT NULL,
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_MenuItem] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[MenuItem] ([Id])
GO

ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_MenuItem]
GO

ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO

ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
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

