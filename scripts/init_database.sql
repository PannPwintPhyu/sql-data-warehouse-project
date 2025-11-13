/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'PPP_DWH' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'PPP_DWH' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'PPP_DWH' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'PPP_DWH')
BEGIN
    ALTER DATABASE PPP_DWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PPP_DWH;
END;
GO

-- Create the 'PPP_DWH' database
CREATE DATABASE PPP_DWH;
GO

USE PPP_DWH;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
