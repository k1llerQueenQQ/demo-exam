USE BDAll
UPDATE Users
SET userPassword =ENCRYPTBYPASSPHRASE('Password',userPassword);