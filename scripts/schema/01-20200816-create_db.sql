USE [master]
GO
IF DB_ID('nombookerdb') IS NULL 
BEGIN

	CREATE DATABASE [nombookerdb]

	ALTER DATABASE [nombookerdb] MODIFY FILE
	( NAME = N'nombookerdb', SIZE = 128MB, MAXSIZE = 256MB, FILEGROWTH = 1024KB )

	ALTER DATABASE [nombookerdb] MODIFY FILE
	( NAME = N'nombookerdb_log', SIZE = 64MB, MAXSIZE = 128MB, FILEGROWTH = 10% )
END
GO