USE MASTER;
GO
ALTER DATABASE BDAll SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
RESTORE DATABASE BDAll FROM DISK = 'C:\Users\eodm2\Documents\backup\BdAll.bak' 
WITH MOVE 'BdAll' TO 'C:\Users\eodm2\Documents\backup\BsAll.mdf', 
MOVE 'BdAll_log' TO 'C:\Users\eodm2\Documents\backup\BsAll_log.ldf', REPLACE;
GO

