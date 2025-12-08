CREATE DATABASE BDAll;
GO
USE BDAll;
GO
CREATE TABLE Users(userName VARCHAR(10),userPassword VARCHAR(256));
DECLARE @i INT =1;
DECLARE @userName NVARCHAR(10) = '';
DECLARE @bdName NVARCHAR(10) = '';
DECLARE @randomPassword NVARCHAR(5) = '';
WHILE @i < 11
BEGIN
SET @userName = 'User' + CAST(@i AS NVARCHAR(2));
SET @bdName = 'BD' + CAST(@i AS NVARCHAR(2));
SET @randomPassword = LEFT(CONVERT(NVARCHAR(100),NEWID()),5);
EXEC('CREATE DATABASE ' + @bdName +';') INSERT INTO Users (userName,userPassword) VALUES (@userName, @randomPassword);
EXEC('CREATE LOGIN ' + @userName + ' WITH PASSWORD = ''' + @randomPassword + ''', CHECK_POLICY = OFF ;
USE ' +@bdName + ';
CREATE USER ' + @userName + ' FOR LOGIN ' + @userName + ';
GRANT UPDATE, SELECT, UPDATE, DELETE ON SCHEMA ::dbo TO ' + @userName +';
USE master;
DENY CREATE ANY DATABASE TO ' + @userName + ';');
SET @i +=1;
END