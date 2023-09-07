#SET GLOBAL local_infile=1;

#drop table mails;
CREATE TABLE mails(
	nombre VARCHAR(100),
    documento VARCHAR(100),
    email VARCHAR(100),
	telefono VARCHAR(100),
    mail_valido VARCHAR(100));
    
load data local INFILE 'C:\\Users\\Simon\\Desktop\\programacion\\verify mails\\INKABET_Analizado_SQL.csv' 
INTO TABLE mails
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


select mail_valido,count(*) from mails where locate("gmail",email) group by mail_valido;
select mail_valido,count(*) from mails where locate("live",email) group by mail_valido;
select mail_valido,count(*) from mails where locate("outlook",email) group by mail_valido;
select mail_valido,count(*) from mails where locate("msn",email) group by mail_valido;

select * from mails where locate("live",email);

select count(*) from mails where locate("gmail",email); #1849
select count(*) from mails where locate("hotmail",email); #4771
select count(*) from mails where locate("yahoo",email);



#drop table INKABET;
create table INKABET (
	nombre VARCHAR(100),
    documento VARCHAR(100),
    email VARCHAR(100),
	telefono VARCHAR(100));

load data local INFILE 'C:\\Users\\Simon\\Desktop\\programacion\\verify mails\\INKABET.csv' 
INTO TABLE INKABET
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


select count(*) from INKABET;

select count(*) from INKABET where locate("hotmail",email); #559388
select count(*) from INKABET where locate("gmail",email); #214631
select count(*) from INKABET where locate("yahoo",email); #25203
select count(*) from INKABET where locate("outlook",email); #23497
select count(*) from INKABET where locate("live",email); #4787
select count(*) from INKABET where locate("msn",email); #925
select count(*) from INKABET where not locate("gmail",email) and not locate("hotmail",email) and not locate("yahoo",email) and not locate("outlook",email) and not locate("live",email); #25585


select * from INKABET where not locate("gmail",email) and not locate("hotmail",email) and not locate("yahoo",email) and not locate("outlook",email) and not locate("live",email); #hay muchos con errores





#truncate table mails_prueba;
CREATE TABLE temp(
	nombre VARCHAR(100),
    documento VARCHAR(100),
    email VARCHAR(100),
	telefono VARCHAR(100),
    mail_valido VARCHAR(100));

load data local INFILE 'C:\\Users\\Simon\\Desktop\\programacion\\verify mails\\analizados\\INKABET2_Analizado.csv' 
INTO TABLE temp
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;



select * 
from mails_prueba 
limit 1000000
into outfile 'C:\\Users\\Simon\\Desktop\\programacion\\verify mails\\analizados\\INKABET_Analizado.csv'
fields terminated by '	';


SELECT *
FROM mails_prueba
where mail_valido = "valido"
limit 10000000;

