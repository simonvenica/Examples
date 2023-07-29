#CREATE DATABASE main_database;

#USE main_database;

#drop table table_athenastienda;

#set SQL_SAFE_UPDATES = 0;



create table table_athenastienda (
	id INT default 0 primary key,
    shortcode varchar(50) default "",
    tipo varchar(50) default "" , 
    cant_likes INT default 0,
    cant_comentarios INT default 0,
    jesus INT default 0,
    maria INT default 0,
    jose INT default 0,
    sagrada_familia INT default 0,
    espiritu_santo INT default 0,
    rosario INT default 0,
    santos INT default 0,
    familia_personal INT default 0,
    popular INT default 0,
    viral INT default 0
);


#truncate table table_nicholelanthier;

ALTER TABLE table_nicholelanthier
MODIFY COLUMN id INT PRIMARY KEY;


ALTER TABLE table_nicholelanthier
ADD COLUMN popular INT default 0;

ALTER TABLE table_nicholelanthier
MODIFY COLUMN viral INT DEFAULT 0 AFTER popular;

select * from table_nicholelanthier limit 1000;

select * from table_nicholelanthier where viral = 1;


update table_nicholelanthier set viral = 0;
	

UPDATE table_nicholelanthier AS a
INNER JOIN (
	SELECT AVG(cant_likes) AS average
    FROM table_nicholelanthier
) AS b ON a.cant_likes > b.average*10
SET a.viral = 1;


UPDATE table_nicholelanthier AS a
INNER JOIN (
	SELECT AVG(cant_likes) AS average
    FROM table_nicholelanthier
) AS b ON a.cant_likes > b.average*3
SET a.popular = 1;

UPDATE table_nicholelanthier
SET familia_personal = 0 
WHERE shortcode in (
	"CjaoOTmu0N0",
	"CnMvFkor0eS",
	"CkyIZdzrshP",
	"CcqLUAkLiaP",
	"CYB9m6aLDxf"
);

    

SELECT
	AVG(cant_likes) as promedio_total,
    AVG(CASE WHEN jesus = 1 and popular = 0 THEN cant_likes END) AS prom_Jesus,
    AVG(CASE WHEN maria = 1 and popular = 0 THEN cant_likes END) AS prom_Maria,
    AVG(CASE WHEN jose = 1 and popular = 0 THEN cant_likes END) AS prom_jose,
    AVG(CASE WHEN sagrada_familia = 1 and popular = 0 THEN cant_likes END) AS prom_sagrada_familia,
    AVG(CASE WHEN espiritu_santo = 1 and popular = 0 THEN cant_likes END) AS prom_espiritu_santo,
    AVG(CASE WHEN rosario = 1 and popular = 0 THEN cant_likes END) AS rosario,
    AVG(CASE WHEN santos = 1 and popular = 0 THEN cant_likes END) AS santos,
    AVG(CASE WHEN familia_personal = 1 and popular = 0 THEN cant_likes END) AS familia_personal
FROM table_nicholelanthier;




SELECT
	(AVG(cant_comentarios)) as promedio_total,
    AVG(CASE WHEN jesus = 1 and popular = 0 THEN cant_comentarios END) AS prom_Jesus ,
    AVG(CASE WHEN maria = 1 and popular = 0 THEN cant_comentarios END) AS prom_Maria,
    AVG(CASE WHEN jose = 1 and popular = 0 THEN cant_comentarios END) AS prom_jose,
    AVG(CASE WHEN sagrada_familia = 1 and popular = 0 THEN cant_comentarios END) AS prom_sagrada_familia,
    AVG(CASE WHEN espiritu_santo = 1 and popular = 0 THEN cant_comentarios END) AS prom_espiritu_santo,
    AVG(CASE WHEN rosario = 1 and popular = 0 THEN cant_comentarios END) AS rosario,
    AVG(CASE WHEN santos = 1 and popular = 0 THEN cant_comentarios END) AS santos,
    AVG(CASE WHEN familia_personal = 1 and popular = 0 THEN cant_comentarios END) AS familia_personal
FROM table_nicholelanthier;
    
    
    
    
SELECT 
	COUNT(CASE WHEN jesus = 1 then jesus END) as jesus,
	COUNT(CASE WHEN maria = 1 then maria END) as maria,
	COUNT(CASE WHEN jose = 1 then jose END) as jose,
	COUNT(CASE WHEN sagrada_familia = 1 then sagrada_familia END) as sagrada_familia,
	COUNT(CASE WHEN espiritu_santo = 1 then espiritu_santo END) as espiritu_santo,
	COUNT(CASE WHEN rosario = 1 then rosario END) as rosario,
	COUNT(CASE WHEN santos = 1 then santos END) as santos,
	COUNT(CASE WHEN familia_personal = 1 then familia_personal END) as familia_personal
FROM table_nicholelanthier;    


SELECT 
	COUNT(CASE WHEN jesus = 1 and popular = 1 then jesus END) as jesus,
	COUNT(CASE WHEN maria = 1 and popular = 1 then maria END) as maria,
	COUNT(CASE WHEN jose = 1 and popular = 1 then jose END) as jose,
	COUNT(CASE WHEN sagrada_familia = 1 and popular = 1 then sagrada_familia END) as sagrada_familia,
	COUNT(CASE WHEN espiritu_santo = 1 and popular = 1 then espiritu_santo END) as espiritu_santo,
	COUNT(CASE WHEN rosario = 1 and popular = 1 then rosario END) as rosario,
	COUNT(CASE WHEN santos = 1 and popular = 1 then santos END) as santos,
	COUNT(CASE WHEN familia_personal = 1 and popular = 1 then familia_personal END) as familia_personal
FROM table_nicholelanthier;



SELECT 
	COUNT(CASE WHEN jesus = 1 and viral = 1 then jesus END) as jesus,
	COUNT(CASE WHEN maria = 1 and viral = 1 then maria END) as maria,
	COUNT(CASE WHEN jose = 1 and viral = 1 then jose END) as jose,
	COUNT(CASE WHEN sagrada_familia = 1 and viral = 1 then sagrada_familia END) as sagrada_familia,
	COUNT(CASE WHEN espiritu_santo = 1 and viral = 1 then espiritu_santo END) as espiritu_santo,
	COUNT(CASE WHEN rosario = 1 and viral = 1 then rosario END) as rosario,
	COUNT(CASE WHEN santos = 1 and viral = 1 then santos END) as santos,
	COUNT(CASE WHEN familia_personal = 1 and viral = 1 then familia_personal END) as familia_personal
FROM table_nicholelanthier;



SELECT COUNT(*) FROM table_nicholelanthier;
SELECT COUNT(*) FROM table_nicholelanthier WHERE popular = 1;
SELECT COUNT(*) FROM table_nicholelanthier WHERE viral = 1;

SELECT COUNT(*) FROM table_nicholelanthier WHERE popular = 1 AND tipo = "foto";
SELECT COUNT(*) FROM table_nicholelanthier WHERE tipo = "foto";

SELECT COUNT(*) FROM table_nicholelanthier WHERE popular = 1 AND tipo = "video";
SELECT COUNT(*) FROM table_nicholelanthier WHERE tipo = "video";

SELECT AVG(cant_likes) FROM table_nicholelanthier WHERE tipo = "video";
SELECT AVG(cant_likes) FROM table_nicholelanthier WHERE tipo = "foto";

SELECT AVG(cant_comentarios) FROM table_nicholelanthier WHERE tipo = "video";
SELECT AVG(cant_comentarios) FROM table_nicholelanthier WHERE tipo = "foto";

SELECT * FROM table_nicholelanthier WHERE popular = 0 AND espiritu_santo = 1;

SELECT * FROM table_nicholelanthier;




