USE BDAll
SELECT userName AS 'User',
	CONVERT(varchar(5),DECRYPTBYPASSPHRASE('Password', userPassword)) AS 'Password'
FROM Users