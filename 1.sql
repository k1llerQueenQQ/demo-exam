CREATE DATABASE BDAll
GO
USE BDAll
GO
CREATE TABLE users(userName VARCHAR(10), userPassword VARCHAR(256));
DECLARE @i INT = 1;
DECLARE @userName NVARCHAR(10) = '';
DECLARE @bdName NVARCHAR(10) = '';
DECLARE @randomPassword NVARCHAR(10) ='';
WHILE @i <11
BEGIN
	SET @userName = 'User' + CAST(@i AS nvarchar(2));
	SET @bdName = 'BD' + CAST (@i AS nvarchar(2));
	SET @randomPassword =LEFT(CONVERT(NVARCHAR(100),NEWID()),5);
	EXEC('CREATE DATABASE ' + @bdName); INSERT INTO users(userName, userPassword) values(@userName,@randomPassword); 
	EXEC('CREATE LOGIN ' + @userName + ' WITH PASSWORD = ''' + @randomPassword + ''', CHECK_POLICY = OFF ;
	USE '+ @BDName + ';
	CREATE USER '+ @userName +' FOR LOGIN '+ @userName + ';
	GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO ' +@userName +';
	USE master;
	DENY CREATE ANY DATABASE TO '+ @userName +';')
	SET @i +=1
END