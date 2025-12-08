use BDAll;

update Users
set userPassword = ENCRYPTBYPASSPHRASE('TEST',userPassword);