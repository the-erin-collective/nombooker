USE [nombookerdb]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


