SELECT
  *
FROM
  datos.to_puma_periodico;CREATE TABLE tabla_periodico_llamados_10(
  fecha VARCHAR(20),
  nombre VARCHAR(120),
  apellido VARCHAR(120),
  sexo VARCHAR(1),
  dni VARCHAR(20),
  mail VARCHAR(120),
  domicilio VARCHAR(120),
  motivo_llamado VARCHAR(120),
  id_archivo VARCHAR(20),
  fijo1 VARCHAR(20),
  fijo2 VARCHAR(20),
  celular VARCHAR(20),
  compania VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/llamados 24-6 normalizado.csv' INTO TABLE tabla_periodico_llamados_10 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;INSERT INTO datos.to_puma_periodico(
  nombre, apellido, sexo, doc_ok, mail1_normalizado,
  domicilio, id_archivo, fijo1_ok,
  fijo2_ok, celular_ok, celular_compania
)
SELECT
  nombre,
  apellido,
  sexo,
  dni,
  mail,
  domicilio,
  id_archivo,
  fijo1,
  fijo2,
  celular,
  compania
FROM
  tabla_periodico_llamados_10;######################################################################################################
CREATE TABLE base_caba(
  party_id VARCHAR(20),
  mail VARCHAR(120),
  nombre VARCHAR(120),
  sexo VARCHAR(1),
  apellido VARCHAR(120),
  birthday VARCHAR(40),
  comuna VARCHAR(40),
  address__state_id VARCHAR(40),
  codigo_postal VARCHAR(20),
  domicilio VARCHAR(120),
  address_street_2 VARCHAR(120),
  address_type VARCHAR(20),
  afinidadvarchar VARCHAR (60),
  properson_origen1 VARCHAR(60),
  pro_person_origen2 VARCHAR(60),
  idsumate VARCHAR(20),
  fijo1 VARCHAR(20),
  fijo2 VARCHAR(20),
  celular VARCHAR(20),
  compania VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/Base Caba normalizado.csv' INTO TABLE base_caba CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;INSERT INTO datos.to_puma_8(
  id_archivo, mail1_normalizado, nombre,
  sexo, apellido, comuna, cod_postal,
  domicilio, fijo1_ok, fijo2_ok, celular_ok,
  celular_compania
)
SELECT
  20701,
  mail,
  nombre,
  sexo,
  apellido,
  comuna,
  codigo_postal,
  domicilio,
  fijo1,
  fijo2,
  celular,
  compania
FROM
  base_caba;SELECT
  *
FROM
  datos.to_puma_8
WHERE
  id_archivo = 20701;CREATE TABLE base_tlm_caba(
  estado VARCHAR(40),
  origen VARCHAR(40),
  nombre VARCHAR(120),
  apellido VARCHAR(120),
  sexo VARCHAR(1),
  mail VARCHAR(120),
  fijo1 VARCHAR(120),
  fijo2 VARCHAR(120),
  celular VARCHAR(120),
  compania VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/Base TLM CABA Jun 2015 normalizado.csv' INTO TABLE base_tlm_caba CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;INSERT INTO datos.to_puma_8(
  id_archivo, nombre, apellido, sexo,
  mail1_normalizado, fijo1_ok, fijo2_ok,
  celular_ok, celular_compania
)
SELECT
  20601,
  nombre,
  apellido,
  sexo,
  mail,
  fijo1,
  fijo2,
  celular,
  compania
FROM
  base_tlm_caba;######################################################################################################
SELECT
  count(*)
FROM
  datos.to_puma_7
WHERE
  id_archivo = "";SELECT
  *
FROM
  datos.to_puma_7
WHERE
  id > 50000;SELECT
  id_archivo,
  Count(*)
FROM
  python.todo_junto_7
GROUP BY
  id_archivo;SELECT
  *
FROM
  python.todo_junto_7
WHERE
  id_archivo = "\n";DELETE FROM
  datos.to_puma_7
WHERE
  id_archivo = ""
  OR id_archivo IS NULL;INSERT INTO datos.to_puma_7 (
  id_archivo, documento, sexo, nombre,
  apellido, anio_nac, mes_nac, dia_nac,
  fijo1, fijo2, celular, mail1, mail2,
  facebook, twitter, google_plus, des_mail,
  barrio, comuna, domicilio, cod_postal,
  id, id_puma_doc, id_puma_mail, id_puma_celular,
  doc_ok, mail1_normalizado, mail2_normalizado,
  fijo1_ok, fijo2_ok, celular_ok, celular_compania
)
SELECT
  id_archivo,
  documento,
  sexo,
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  fijo1,
  fijo2,
  celular,
  mail1,
  mail2,
  facebook,
  twitter,
  google_plus,
  des_mail,
  barrio,
  comuna,
  domicilio,
  cod_postal,
  id,
  id_puma_doc,
  id_puma_mail,
  id_puma_celular,
  doc_ok,
  mail1_normalizado,
  mail2_normalizado,
  fijo1_ok,
  fijo2_ok,
  celular_ok,
  celular_compania
FROM
  python.todo_junto_7;SELECT
  *
FROM
  datos.to_puma_8;######################################################################################################
CREATE TABLE temp_simon.temp_export_final_caba(
  referencia VARCHAR(20),
  id VARCHAR(20),
  nombre VARCHAR(120),
  sexo VARCHAR(1),
  apellido VARCHAR(120),
  mail VARCHAR(120),
  domicilio VARCHAR(120),
  dni VARCHAR(20),
  fijo1 VARCHAR(12),
  fijo2 VARCHAR(12),
  celular VARCHAR(12),
  compania VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/export_final_CABA normalizado.csv' INTO TABLE temp_export_final_caba CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;SELECT
  *
FROM
  temp_export_final_caba;CREATE TABLE datos.`to_puma_8` (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT '',
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT '',
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT '',
  `fijo2` VARCHAR(50) DEFAULT '',
  `celular` VARCHAR(50) DEFAULT '',
  `mail1` VARCHAR(100) DEFAULT '',
  `mail2` VARCHAR(100) DEFAULT '',
  `facebook` VARCHAR(80) DEFAULT '',
  `twitter` VARCHAR(80) DEFAULT '',
  `google_plus` VARCHAR(80) DEFAULT '',
  `des_mail` TINYINT(4) DEFAULT '0',
  `barrio` VARCHAR(50) DEFAULT '',
  `comuna` TINYINT(4) DEFAULT '0',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(10) DEFAULT '',
  `id` INT(11) NOT NULL auto_increment PRIMARY KEY,
  `id_puma_doc` INT(9) DEFAULT '0',
  `id_puma_mail` INT(9) DEFAULT '0',
  `id_puma_celular` INT(9) DEFAULT '0',
  `doc_ok` INT(11) DEFAULT '0',
  `mail1_normalizado` VARCHAR(100) DEFAULT '',
  `mail2_normalizado` VARCHAR(100) DEFAULT '',
  `fijo1_ok` VARCHAR(10) DEFAULT '',
  `fijo2_ok` VARCHAR(10) DEFAULT '',
  `celular_ok` VARCHAR(10) DEFAULT '',
  `celular_compania` VARCHAR(10) DEFAULT ''
);INSERT INTO datos.to_puma_8(
  id_archivo, nombre, sexo, apellido,
  mail1_normalizado, domicilio, doc_ok,
  fijo1_ok, fijo2_ok, celular_ok, celular_compania
)
SELECT
  20501,
  nombre,
  sexo,
  apellido,
  mail,
  domicilio,
  dni,
  fijo1,
  fijo2,
  celular,
  compania
FROM
  temp_export_final_caba;SELECT
  *
FROM
  datos.to_puma_8
LIMIT
  10000;SELECT
  Count(*)
FROM
  datos.to_puma_8
WHERE
  doc_ok <> ""
  AND sexo <> "";######################################################################################################
SELECT
  *
FROM
  python.todo_junto_7
WHERE
  celular_compania IS NOT NULL
  AND celular_compania <> ""
LIMIT
  2000;DELETE FROM
  python.todo_junto_7
WHERE
  celular_compania IS NOT NULL
  AND celular_compania <> "";ALTER TABLE
  python.todo_junto_7
DROP
  COLUMN celular_compania;ALTER TABLE
  python.todo_junto_7
ADD
  COLUMN documento VARCHAR(200);SELECT
  Count(*)
FROM
  python.todo_junto_7
WHERE
  id_archivo IS NULL
  OR id_archivo = ""
LIMIT
  1000;ALTER TABLE
  python.todo_junto_7 CHANGE celular_ok celular_compania VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE fijo2_ok celular_ok VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE fijo1_ok fijo2_ok VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE mail2_normalizado fijo1_ok VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE mail1_normalizado mail2_normalizado VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE doc_ok mail1_normalizado VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE id_puma_celular doc_ok VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE id_puma_mail id_puma_celular VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE id id_puma_mail VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE cod_postal id VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE domicilio cod_postal VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE comuna domicilio VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE barrio comuna VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE des_mail barrio VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE google_plus des_mail VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE twitter google_plus VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE facebook twitter VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE mail2 facebook VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE mail1 mail2 VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE celular mail1 VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE fijo2 celular VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE fijo1 fijo2 VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE dia_nac fijo1 VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE mes_nac dia_nac VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE anio_nac mes_nac VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE apellido anio_nac VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE nombre apellido VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE sexo nombre VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE documento sexo VARCHAR(200);ALTER TABLE
  python.todo_junto_7 CHANGE documento id_archivo VARCHAR(200);######################################################################################################
DROP
  TABLE datos.to_puma_periodico;CREATE TABLE datos.to_puma_periodico (
  id_archivo INT(11) DEFAULT '0',
  documento VARCHAR(25) DEFAULT '',
  sexo VARCHAR(1) DEFAULT '',
  nombre VARCHAR(100) DEFAULT '',
  apellido VARCHAR(100) DEFAULT '',
  anio_nac VARCHAR(10) DEFAULT '',
  mes_nac INT(11) DEFAULT '0',
  dia_nac INT(11) DEFAULT '0',
  fijo1 VARCHAR(50) DEFAULT '',
  fijo2 VARCHAR(50) DEFAULT '',
  celular VARCHAR(50) DEFAULT '',
  mail1 VARCHAR(100) DEFAULT '',
  mail2 VARCHAR(100) DEFAULT '',
  facebook VARCHAR(80) DEFAULT '',
  twitter VARCHAR(80) DEFAULT '',
  google_plus VARCHAR(80) DEFAULT '',
  des_mail TINYINT DEFAULT '0',
  barrio VARCHAR(50) DEFAULT '',
  comuna TINYINT DEFAULT 0,
  domicilio VARCHAR(200) DEFAULT '',
  cod_postal VARCHAR(10) DEFAULT '',
  id INT(11) NOT NULL auto_increment,
  id_puma_doc INT(9) DEFAULT 0,
  id_puma_mail INT(9) DEFAULT 0,
  id_puma_celular INT(9) DEFAULT 0,
  doc_ok VARCHAR(11) DEFAULT '',
  mail1_normalizado VARCHAR(100) DEFAULT '',
  mail2_normalizado VARCHAR(100) DEFAULT '',
  fijo1_ok VARCHAR(10) DEFAULT '',
  fijo2_ok VARCHAR(10) DEFAULT '',
  celular_ok VARCHAR(10) DEFAULT '',
  celular_compania VARCHAR(10) DEFAULT '',
  fecha VARCHAR(20),
  motivo_llamado VARCHAR(30),
  sf TINYINT(4) DEFAULT 0,
  PRIMARY KEY (id),
  KEY id_puma_doc (id_puma_doc)
) engine = myisam DEFAULT charset = latin1;SELECT
  id_archivo,
  Count(*)
FROM
  datos.to_puma_periodico
GROUP BY
  id_archivo;SELECT
  *
FROM
  datos.to_puma_periodico
WHERE
  nombre = ""
  OR doc_ok = "";######################################################################################################
CREATE TABLE datos.`to_puma_7` (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT '',
  `id` INT(11) NOT NULL auto_increment,
  `en_puma` VARCHAR(1) DEFAULT NULL,
  `id_puma` VARCHAR(15) DEFAULT NULL,
  `documento_num` INT(10) DEFAULT '0',
  `email_puma` VARCHAR(80) DEFAULT NULL,
  `fijo1_ok` VARCHAR(25) DEFAULT NULL,
  `doc_ok` VARCHAR(20) DEFAULT NULL,
  `mail1_normalizado` VARCHAR(120) DEFAULT NULL,
  `fijo2_ok` VARCHAR(25) DEFAULT NULL,
  `celular_ok` VARCHAR(25) DEFAULT NULL,
  `compania` VARCHAR(44) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_puma` (`id_puma`)
);######################################################################################################
DROP
  TABLE actualizar_mails_to_puma_6;CREATE TABLE actualizar_mails_to_puma_6(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/mails to puma 6 salida.csv' INTO TABLE actualizar_mails_to_puma_6 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  actualizar_mails_to_puma_6
ADD
  INDEX id(id);UPDATE
  actualizar_mails_to_puma_6
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_6
SET
  mail1_normalizado = NULL;UPDATE
  datos.to_puma_6 a
  INNER JOIN actualizar_mails_to_puma_6 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  b.validez = "valid";######################################################################################################
DROP
  TABLE actualizar_mails_to_puma_5;CREATE TABLE actualizar_mails_to_puma_5(
  id VARCHAR(20),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mails to puma 5 salida.csv' INTO TABLE actualizar_mails_to_puma_5 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  actualizar_mails_to_puma_5
ADD
  INDEX id(id);UPDATE
  actualizar_mails_to_puma_5
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_5
SET
  mail1_normalizado = NULL;UPDATE
  datos.to_puma_5 a
  INNER JOIN actualizar_mails_to_puma_5 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail;SELECT
  *
FROM
  actualizar_mails_to_puma_5;######################################################################################################
DROP
  TABLE tabla_actualizar_mail_to_puma_3;CREATE TABLE tabla_actualizar_mail_to_puma_3(
  id VARCHAR(20),
  mail1 VARCHAR(120),
  mail2 VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mails to puma 3 salida.csv' INTO TABLE tabla_actualizar_mail_to_puma_3 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_3
ADD
  INDEX id(id);UPDATE
  datos.to_puma_3
SET
  mail1_normalizado = NULL;UPDATE
  datos.to_puma_3
SET
  mail2_normalizado = NULL;UPDATE
  datos.to_puma_3 a
  INNER JOIN tabla_actualizar_mail_to_puma_3 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail1,
  a.mail2_normalizado = b.mail2;######################################################################################################
DROP
  TABLE actualizar_mail1_to_puma_2;CREATE TABLE actualizar_mail1_to_puma_2(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/mail1 to puma 2 salida.csv' INTO TABLE actualizar_mail1_to_puma_2 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;UPDATE
  datos.to_puma_2
SET
  mail1_normalizado = NULL;ALTER TABLE
  actualizar_mail1_to_puma_2
ADD
  INDEX id(id);UPDATE
  actualizar_mail1_to_puma_2
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_mail1_to_puma_2
SET
  validez = REPLACE(validez, "\n", "");UPDATE
  actualizar_mail1_to_puma_2
SET
  mail = REPLACE(mail, "\n", "");UPDATE
  datos.to_puma_2 a
  INNER JOIN actualizar_mail1_to_puma_2 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  b.validez = "valid";SELECT
  *
FROM
  datos.to_puma_2
WHERE
  mail1 <> "";######################################################################################################
DROP
  TABLE actualizar_mail1_to_puma;CREATE TABLE actualizar_mail1_to_puma(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/mail1 to puma salida.csv' INTO TABLE actualizar_mail1_to_puma CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;UPDATE
  actualizar_mail1_to_puma
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_mail1_to_puma
SET
  validez = REPLACE(validez, "\n", "");ALTER TABLE
  actualizar_mail1_to_puma
ADD
  INDEX id(id);DROP
  TABLE actualizar_mail2_to_puma;CREATE TABLE actualizar_mail2_to_puma(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/mail2 to puma salida.csv' INTO TABLE actualizar_mail2_to_puma CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;UPDATE
  actualizar_mail2_to_puma
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_mail1_to_puma
SET
  validez = REPLACE(validez, "\n", "");ALTER TABLE
  actualizar_mail2_to_puma
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma
DROP
  COLUMN mail1_normalizado;ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail1_normalizado VARCHAR (120);ALTER TABLE
  datos.to_puma
DROP
  COLUMN mail2_normalizado;ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail2_normalizado VARCHAR (120);UPDATE
  datos.to_puma a
  INNER JOIN actualizar_mail1_to_puma b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  validez = "valid";UPDATE
  datos.to_puma a
  INNER JOIN actualizar_mail2_to_puma b ON a.id = b.id
SET
  a.mail2_normalizado = b.mail
WHERE
  validez = "valid";######################################################################################################
SELECT
  id,
  documento
FROM
  datos.to_puma_4
LIMIT
  9999999999;DROP
  TABLE temp_documentos_puma_4;CREATE TABLE temp_documentos_puma_4 (
  id VARCHAR(40),
  dni VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/documentos to puma 4 salida.csv' INTO TABLE temp_documentos_puma_4 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  temp_documentos_puma_4
ADD
  INDEX id(id);UPDATE
  temp_documentos_puma_4
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_4
SET
  doc_ok = NULL;UPDATE
  datos.to_puma_4 a
  INNER JOIN temp_documentos_puma_4 b ON a.id = b.id
SET
  a.doc_ok = b.dni;SELECT
  *
FROM
  temp_documentos_puma_4;SELECT
  *
FROM
  datos.to_puma_4;######################################################################################################
SELECT
  id,
  fijo1,
  fijo2,
  celular
FROM
  datos.to_puma_4
LIMIT
  9999999;DROP
  TABLE temp_telefonos_puma_4;CREATE TABLE temp_telefonos_puma_4(
  id VARCHAR(20),
  fijo1 VARCHAR(40),
  fijo2 VARCHAR(40),
  celular VARCHAR(40),
  compania VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/telefonos final to puma 4.csv' INTO TABLE temp_telefonos_puma_4 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  temp_telefonos_puma_4
ADD
  INDEX id(id);UPDATE
  datos.to_puma_4
SET
  fijo1_ok = NULL;UPDATE
  datos.to_puma_4
SET
  fijo2_ok = NULL;UPDATE
  datos.to_puma_4
SET
  celular_ok = NULL;UPDATE
  datos.to_puma_4
SET
  compania = NULL;UPDATE
  temp_telefonos_puma_4
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_4 a
  INNER JOIN temp_telefonos_puma_4 b ON a.id = b.id
SET
  a.fijo1_ok = b.fijo1,
  a.fijo2_ok = b.fijo2,
  a.celular_ok = b.celular,
  a.compania = b.compania;SELECT
  *
FROM
  datos.to_puma_4;######################################################################################################
DROP
  TABLE temp_mail_puma_4;CREATE TABLE temp_mail_puma_4(
  id VARCHAR(20),
  mail VARCHAR(80),
  validez VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mails to puma 4 salida.csv' INTO TABLE temp_mail_puma_4 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 0 LINES;ALTER TABLE
  temp_mail_puma_4
ADD
  INDEX id(id);ALTER TABLE
  temp_mail_puma_4
ADD
  INDEX mail(mail);ALTER TABLE
  datos.to_puma_4
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_4
ADD
  INDEX mail1(mail1);UPDATE
  datos.to_puma_4
SET
  mail1_normalizado = NULL;UPDATE
  datos.to_puma_4 a
  INNER JOIN temp_mail_puma_4 b ON a.mail1 = b.mail
SET
  a.mail1_normalizado = b.mail
WHERE
  b.validez = "valid";SELECT
  *
FROM
  datos.to_puma_4;######################################################################################################
DELETE FROM
  datos.to_puma_6
WHERE
  id_archivo = "16500";CREATE TABLE baja_mails(
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mails bajas.csv' INTO TABLE baja_mails CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  baja_mails
ADD
  COLUMN flag TINYINT(1) DEFAULT 0;ALTER TABLE
  baja_mails
ADD
  COLUMN id_puma VARCHAR(20);ALTER TABLE
  baja_mails
ADD
  INDEX mail(mail);UPDATE
  baja_mails
SET
  mail = REPLACE(mail, "\n", "");UPDATE
  baja_mails a
  INNER JOIN puma.pumasf b ON a.mail = b.mail1
SET
  a.id_puma = b.id_puma,
  a.flag = 1;UPDATE
  baja_mails a
  INNER JOIN puma.pumasf b ON a.mail = b.mail2
SET
  a.id_puma = b.id_puma,
  a.flag = 1;UPDATE
  baja_mails a
  INNER JOIN puma.pumasf b ON a.mail = b.mail3
SET
  a.id_puma = b.id_puma,
  a.flag = 1;SELECT
  *
FROM
  baja_mails
WHERE
  flag = 1;DROP
  TABLE actualizar_to_puma_6_accion_social;CREATE TABLE actualizar_to_puma_6_accion_social(
  id VARCHAR(40),
  mail1 VARCHAR(120),
  validez VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/mails salida actualizar.csv' INTO TABLE actualizar_to_puma_6_accion_social CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  actualizar_to_puma_6_accion_social
ADD
  INDEX id(id);UPDATE
  actualizar_to_puma_6_accion_social
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_to_puma_6_accion_social
SET
  validez = REPLACE(validez, "\n", "");UPDATE
  datos.to_puma_6 a
  INNER JOIN actualizar_to_puma_6_accion_social b ON a.id = b.id
SET
  a.mail_norm = b.mail1
WHERE
  b.validez = "valid";######################################################################################################
SELECT
  id,
  mail1
FROM
  datos.to_puma_2
WHERE
  mail1 IS NOT NULL
  AND mail1 <> ""
LIMIT
  9999999;DROP
  TABLE actualizar_mail1_to_puma_2;CREATE TABLE actualizar_mail1_to_puma_2(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/mail1 to puma 2 salida.csv' INTO TABLE actualizar_mail1_to_puma_2 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  actualizar_mail1_to_puma_2
ADD
  INDEX id(id);UPDATE
  actualizar_mail1_to_puma_2
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_mail1_to_puma_2
SET
  validez = REPLACE(validez, "\n", "");UPDATE
  actualizar_mail1_to_puma_2
SET
  mail = REPLACE(mail, "\n", "");UPDATE
  datos.to_puma_2 a
  INNER JOIN actualizar_mail1_to_puma_2 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  b.validez = "valid";######################################################################################################
SELECT
  id,
  mail1,
  mail2
FROM
  datos.to_puma
WHERE
  (
    mail1 <> ""
    AND mail1 IS NOT NULL
  )
  OR (
    mail2 <> ""
    AND mail2 IS NOT NULL
  )
LIMIT
  9999999;DROP
  TABLE actualizar_mail1_to_puma;CREATE TABLE actualizar_mail1_to_puma(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/mail1 to puma salida.csv' INTO TABLE actualizar_mail1_to_puma CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;UPDATE
  actualizar_mail1_to_puma
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_mail1_to_puma
SET
  validez = REPLACE(validez, "\n", "");ALTER TABLE
  actualizar_mail1_to_puma
ADD
  INDEX id(id);DROP
  TABLE actualizar_mail2_to_puma;CREATE TABLE actualizar_mail2_to_puma(
  id VARCHAR(20),
  mail VARCHAR(120),
  validez VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/mail2 to puma salida.csv' INTO TABLE actualizar_mail2_to_puma CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;UPDATE
  actualizar_mail2_to_puma
SET
  id = REPLACE(id, "\n", "");UPDATE
  actualizar_mail1_to_puma
SET
  validez = REPLACE(validez, "\n", "");ALTER TABLE
  actualizar_mail2_to_puma
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma
DROP
  COLUMN mail1_normalizado;ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail1_normalizado VARCHAR (120);ALTER TABLE
  datos.to_puma
DROP
  COLUMN mail2_normalizado;ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail2_normalizado VARCHAR (120);UPDATE
  datos.to_puma a
  INNER JOIN actualizar_mail1_to_puma b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  validez = "valid";UPDATE
  datos.to_puma a
  INNER JOIN actualizar_mail2_to_puma b ON a.id = b.id
SET
  a.mail2_normalizado = b.mail
WHERE
  validez = "valid";SELECT
  Count(*)
FROM
  actualizar_mail2_to_puma
WHERE
  validez = "valid";SELECT
  Count(*)
FROM
  actualizar_mail1_to_puma
WHERE
  validez = "valid";SELECT
  *
FROM
  datos.to_puma
WHERE
  mail1_normalizado IS NOT NULL;SELECT
  Count(*)
FROM
  datos.to_puma_6
WHERE
  id = "16500";######################################################################################################
SELECT
  count(mail1)
FROM
  datos.to_puma_6
WHERE
  mail1 IS NOT NULL
  AND mail1 <> "";DROP
  TABLE actualizar_to_puma_6;CREATE TABLE actualizar_to_puma_6(
  id VARCHAR(40),
  mail1 VARCHAR(120),
  documento VARCHAR(40),
  validez VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/mails verificados.csv' INTO TABLE actualizar_to_puma_6 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;UPDATE
  actualizar_to_puma_6
SET
  validez = REPLACE(validez, "\n", "");UPDATE
  actualizar_to_puma_6
SET
  id = REPLACE(id, "\n", "");ALTER TABLE
  actualizar_to_puma_6
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_6
ADD
  INDEX id(id);UPDATE
  datos.to_puma_6
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_6 a
  INNER JOIN actualizar_to_puma_6 b ON a.id = b.id
SET
  a.mail_norm = b.mail1
WHERE
  b.validez = "valid"
  AND b.id <> 16500;UPDATE
  datos.to_puma_6 a
  INNER JOIN actualizar_to_puma_6 b ON a.id = b.id
SET
  a.doc_ok = b.documento;######################################################################################################
DROP
  TABLE datos.to_puma_6;CREATE TABLE datos.`to_puma_6` (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT '',
  `id` INT(11) NOT NULL auto_increment PRIMARY KEY,
  `en_puma` VARCHAR(1) DEFAULT NULL,
  `id_puma` VARCHAR(15) DEFAULT NULL,
  `documento_num` INT(10) DEFAULT '0',
  `email_puma` VARCHAR(80) DEFAULT NULL,
  `fijo1_ok` VARCHAR(25) DEFAULT NULL,
  `doc_ok` VARCHAR(20) DEFAULT NULL,
  `mail_norm` VARCHAR(120) DEFAULT NULL,
  `fijo2_ok` VARCHAR(25) DEFAULT NULL,
  `celular_ok` VARCHAR(25) DEFAULT NULL,
  `compania` VARCHAR(44) DEFAULT NULL
);INSERT INTO datos.to_puma_6(
  apellido, nombre, sexo, mail1, documento,
  id_archivo
)
SELECT
  apellido,
  nombre,
  sexo,
  email,
  documento,
  "16500"
FROM
  tabla_accion_social;INSERT INTO datos.to_puma_6(
  nombre, apellido, documento, fijo1,
  celular, mail1, sexo, id_archivo
)
SELECT
  nombre,
  apellido,
  dni,
  telefono,
  celular,
  email,
  sexo,
  "16501"
FROM
  tabla_congreso;INSERT INTO datos.to_puma_6(
  nombre, apellido, mail1, domicilio,
  barrio, cod_postal, celular, fijo1,
  documento, sexo, id_archivo
)
SELECT
  nombre,
  apellido,
  mail,
  calle,
  barrio,
  cpo,
  celular,
  telefono,
  documento,
  sexo,
  "16502"
FROM
  tabla_creditos;INSERT INTO datos.to_puma_6(
  mail1, documento, sexo, id_archivo
)
SELECT
  mail,
  dni,
  sexo,
  "16503"
FROM
  tabla_datos_mails_vecinos;INSERT INTO datos.to_puma_6(
  nombre, apellido, documento, sexo,
  barrio, domicilio, cod_postal, mail1,
  fijo1, fijo2, celular, compania, id_archivo
)
SELECT
  nombre,
  apellido,
  dni,
  sexo,
  barrio,
  direccion,
  cpo,
  email,
  telefono1,
  telefono2,
  celular1,
  compania,
  "16504"
FROM
  tabla_final;INSERT INTO datos.to_puma_6(
  apellido, nombre, mail1, barrio, fijo1,
  celular, domicilio, documento, sexo,
  id_archivo
)
SELECT
  apellido,
  nombre,
  email,
  barrio,
  telefono,
  celular,
  direccion,
  dni,
  sexo,
  "16505"
FROM
  tabla_militantes;INSERT INTO datos.to_puma_6(
  nombre, apellido, documento, domicilio,
  barrio, comuna, fijo1, celular, mail1,
  id_archivo
)
SELECT
  nombre,
  apellido,
  documento,
  Concat(calle, piso, departamento),
  barrio,
  comuna,
  telefono,
  celular,
  mail,
  "16506"
FROM
  tabla_redes_sociales;INSERT INTO datos.to_puma_6(
  nombre, apellido, documento, sexo,
  domicilio, barrio, comuna, fijo1,
  celular, mail1, id_archivo
)
SELECT
  nombre,
  apellido,
  documento,
  sexo,
  Concat(calle, altura, piso, dpto),
  barrio,
  comuna,
  telefono,
  celular,
  mail,
  "16507"
FROM
  tabla_reuniones;SELECT
  id,
  mail1,
  documento
FROM
  datos.to_puma_6
LIMIT
  9999999999999;######################################################################################################
SELECT
  doc_ok,
  fijo1_ok,
  fijo2_ok,
  celular_ok,
  mail_norm
FROM
  datos.to_puma_5
LIMIT
  99999999999;SELECT
  mail2
FROM
  datos.to_puma_5
WHERE
  mail2 <> ""
  AND mail2 IS NOT NULL;SELECT
  *
FROM
  datos.to_puma_5;DROP
  TABLE actualizar_to_puma_5;CREATE TABLE actualizar_to_puma_5(
  id VARCHAR(20),
  documento VARCHAR(20),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/to puma 5.csv' INTO TABLE actualizar_to_puma_5 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;CREATE TABLE actualizar_to_puma_5_telefono(
  id VARCHAR(20),
  fijo1 VARCHAR(80),
  fijo2 VARCHAR(80),
  celular VARCHAR(80),
  compania VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/Telefonos Final.csv' INTO TABLE actualizar_to_puma_5_telefono CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  actualizar_to_puma_5
ADD
  INDEX id(id);ALTER TABLE
  actualizar_to_puma_5_telefono
ADD
  INDEX id(id);UPDATE
  actualizar_to_puma_5
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_5 a
  INNER JOIN actualizar_to_puma_5 b ON a.id = b.id
SET
  a.doc_ok = b.documento,
  a.mail_norm = b.mail;UPDATE
  actualizar_to_puma_5_telefono
SET
  id = REPLACE(id, "\n", "");UPDATE
  datos.to_puma_5 a
  INNER JOIN actualizar_to_puma_5_telefono b ON a.id = b.id
SET
  a.fijo1_ok = b.fijo1,
  a.fijo2_ok = b.fijo2,
  a.celular_ok = b.celular,
  a.compania = b.compania;######################################################################################################
CREATE TABLE direcciones_perdidas(
  dni VARCHAR(40),
  sexo VARCHAR(1)
);load data local INFILE 'C:/Users/Administrador/direccion perdida.csv' INTO TABLE direcciones_perdidas CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  direcciones_perdidas
ADD
  INDEX id(dni, sexo);ALTER TABLE
  direcciones_perdidas
ADD
  COLUMN direccion VARCHAR(120);UPDATE
  direcciones_perdidas a
  INNER JOIN padron.v1 b ON a.dni = b.matricula
  AND a.sexo = b.sexo
SET
  a.direccion = b.domic;UPDATE
  direcciones_perdidas
SET
  sexo = REPLACE(sexo, "\n", "");UPDATE
  direcciones_perdidas
SET
  dni = REPLACE(dni, "\n", "");SELECT
  *
FROM
  direcciones_perdidas
LIMIT
  99999999;UPDATE
  datos.to_puma_2 a
  INNER JOIN puma.padron_nombresfemenino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  datos.to_puma_2 a
  INNER JOIN puma.padron_nombresmasculino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  datos.to_puma_2 a
  INNER JOIN puma.padron_nombresfemenino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  datos.to_puma_2 a
  INNER JOIN puma.padron_nombresmasculino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;######################################################################################################
CREATE TABLE temp_actualizar_dni_puma_5(
  id VARCHAR(20),
  dni VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/dnis salida to puma 5.csv' INTO TABLE temp_actualizar_dni_puma_5 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;CREATE TABLE temp_actualizar_mail_puma_5(
  id VARCHAR(20),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mails verificados to puma 5.csv' INTO TABLE temp_actualizar_mail_puma_5 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;CREATE TABLE temp_actualizar_telefonos_puma_5(
  id VARCHAR(20),
  fijo1 VARCHAR(20),
  fijo2 VARCHAR(20),
  celular VARCHAR(20),
  compania VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/Telefonos Final to puma 5.csv' INTO TABLE temp_actualizar_telefonos_puma_5 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN dni_norm VARCHAR(20);ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN mail_norm VARCHAR(120);ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN fijo1_norm VARCHAR(25);ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN fijo2_norm VARCHAR(25);ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN celular_norm VARCHAR(25);ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN compania VARCHAR(44);ALTER TABLE
  datos.to_puma_5
ADD
  INDEX id(id);ALTER TABLE
  temp_actualizar_dni_puma_5
ADD
  INDEX id(id);ALTER TABLE
  temp_actualizar_mail_puma_5
ADD
  INDEX id(id);ALTER TABLE
  temp_actualizar_telefonos_puma_5
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_5
ADD
  INDEX id(id);ALTER TABLE
  temp_actualizar_dni_puma_5
ADD
  INDEX id(id);ALTER TABLE
  temp_actualizar_mail_puma_5
ADD
  INDEX id(id);ALTER TABLE
  temp_actualizar_telefonos_puma_5
ADD
  INDEX id(id);UPDATE
  temp_actualizar_dni_puma_5
SET
  id = REPLACE(id, '\n', '');UPDATE
  temp_actualizar_mail_puma_5
SET
  id = REPLACE(id, '\n', '');UPDATE
  temp_actualizar_telefonos_puma_5
SET
  id = REPLACE(id, '\n', '');UPDATE
  datos.to_puma_5 a
  INNER JOIN temp_actualizar_dni_puma_5 b ON a.id = b.id
SET
  a.dni_norm = REPLACE(b.dni, '\n', '');UPDATE
  datos.to_puma_5 a
  INNER JOIN temp_actualizar_mail_puma_5 b ON a.id = b.id
SET
  a.mail_norm = REPLACE(b.mail, '\n', '');UPDATE
  datos.to_puma_5 a
  INNER JOIN temp_actualizar_telefonos_puma_5 b ON a.id = b.id
SET
  a.fijo1_norm = REPLACE(b.fijo1, '\n', ''),
  a.fijo2_norm = REPLACE(b.fijo2, '\n', ''),
  a.celular_norm = REPLACE(b.celular, '\n', ''),
  a.compania = REPLACE(b.compania, '\n', '');INSERT INTO datos.tabla_vecinos
SELECT
  *
FROM
  temp_tabla_vecinos_to_puma;CREATE TABLE datos.tabla_vecinos (
  `nombre` VARCHAR(80) DEFAULT NULL,
  `apellido` VARCHAR(80) DEFAULT NULL,
  `mail` VARCHAR(120) DEFAULT NULL,
  `telefono` VARCHAR(20) DEFAULT NULL,
  `dni` VARCHAR(20) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT NULL,
  `celular` VARCHAR(20) DEFAULT NULL,
  `id_archivo` VARCHAR(20) DEFAULT NULL
) engine = myisam DEFAULT charset = latin1;RENAME TABLE datos.tabla_vecinos TO datos.inscriptos_reuniones_face;######################################################################################################
DROP
  TABLE datos.inscriptos_newsletter;CREATE TABLE datos.inscriptos_newsletter(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  email VARCHAR(80),
  dni VARCHAR(20),
  opcion VARCHAR(80),
  todo TINYINT(1) DEFAULT 0,
  ciudad_verde TINYINT(1) DEFAULT 0,
  cultura TINYINT(1) DEFAULT 0,
  deporte TINYINT(1) DEFAULT 0,
  desarrollo_social TINYINT(1) DEFAULT 0,
  educacion TINYINT(1) DEFAULT 0,
  juventud TINYINT(1) DEFAULT 0,
  modernizacion TINYINT(1) DEFAULT 0,
  movilidad TINYINT(1) DEFAULT 0,
  obras_y_participacion TINYINT(0) DEFAULT 0,
  salud TINYINT(1) DEFAULT 0,
  seguridad TINYINT(1) DEFAULT 0,
  sin_categoria TINYINT(1) DEFAULT 0
);UPDATE
  datos.inscriptos_newsletter
SET
  ciudad_verde = 1
WHERE
  Locate("verde", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  cultura = 1
WHERE
  Locate("cultura", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  deporte = 1
WHERE
  Locate("deporte", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  desarrollo_social = 1
WHERE
  Locate("social", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  educacion = 1
WHERE
  Locate("educacion", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  juventud = 1
WHERE
  Locate("juventud", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  modernizacion = 1
WHERE
  Locate("modernizacion", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  movilidad = 1
WHERE
  Locate("movilidad", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  obras_y_participacion = 1
WHERE
  Locate("obras", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  salud = 1
WHERE
  Locate("salud", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  seguridad = 1
WHERE
  Locate("seguridad", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  sin_categoria = 1
WHERE
  Locate("categoria", opcion);UPDATE
  datos.inscriptos_newsletter
SET
  todo = 1,
  ciudad_verde = 1,
  cultura = 1,
  deporte = 1,
  desarrollo_social = 1,
  educacion = 1,
  juventud = 1,
  modernizacion = 1,
  movilidad = 1,
  obras_y_participacion = 1,
  salud = 1,
  seguridad = 1,
  sin_categoria = 1
WHERE
  Locate("todo", opcion);CREATE TABLE temp_newsletter_1(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  email VARCHAR(80),
  dni VARCHAR(25),
  opcion VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/Contactos Newsletter.csv' INTO TABLE temp_newsletter_1 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;INSERT INTO datos.inscriptos_newsletter(
  nombre, apellido, email, dni, opcion
)
SELECT
  nombre,
  apellido,
  email,
  dni,
  opcion
FROM
  temp_newsletter_1;SELECT
  *
FROM
  datos.inscriptos_newsletter;######################################################################################################
CREATE TABLE temp_tabla_vecinos_to_puma(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  mail VARCHAR(120),
  telefono VARCHAR(20),
  dni VARCHAR(20),
  sexo VARCHAR(1),
  celular VARCHAR(20),
  id_archivo VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/vecinos a puma.csv' INTO TABLE temp_tabla_vecinos_to_puma CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;INSERT INTO datos.to_puma_5(
  nombre, apellido, mail1, fijo1, documento,
  sexo, celular, id_archivo
)
SELECT
  nombre,
  apellido,
  mail,
  telefono,
  dni,
  sexo,
  celular,
  id_archivo
FROM
  temp_tabla_vecinos_to_puma;######################################################################################################
CREATE DATABASE python;DROP
  TABLE python.villa_pueyrredon_1_abril;SELECT
  *
FROM
  python.villa_pueyrredon_1_abril;SELECT
  Count(*),
  id,
  reunion_id
FROM
  puma.reuniones_concurrentes
GROUP BY
  reunion_id;SELECT
  *
FROM
  puma.reuniones_concurrentes
WHERE
  reunion_id > 700;SELECT
  id_puma,
  reunion_id
FROM
  puma.reuniones_concurrentes
WHERE
  reunion_id = 662;SELECT
  *
FROM
  temporal.campanias;SELECT
  *
FROM
  puma.telefonos_cio_interesados
GROUP BY
  codigo_campana;######################################################################################################
CREATE TABLE tabla_no_llame(
  telefono VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/no llame final.csv' INTO TABLE tabla_no_llame CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;DELETE FROM
  puma.enri_concurrentes_reuniones
WHERE
  id_reunion IS NULL;UPDATE
  tabla_no_llame
SET
  telefono = REPLACE(telefono, '\n', '');ALTER TABLE
  tabla_no_llame
ADD
  INDEX telefono(telefono);ALTER TABLE
  puma.registro_nollame
ADD
  INDEX telefono(telefono);SELECT
  *
FROM
  puma.registro_nollame
WHERE
  Locate("+", telefono);SELECT
  *
FROM
  tabla_no_llame;SELECT
  telefono,
  Count(*) AS cuenta
FROM
  puma.registro_nollame
GROUP BY
  telefono
HAVING
  cuenta > 1;INSERT INTO puma.registro_nollame (
  select
    a.telefono,
    "",
    "",
    "",
    "",
    10
  FROM
    tabla_no_llame a
    LEFT JOIN puma.registro_nollame b ON a.telefono = b.telefono
  WHERE
    b.telefono IS NULL
);ALTER TABLE
  puma.telefonos_cio
ADD
  COLUMN no_llame INT(1) DEFAULT 0;UPDATE
  puma.telefonos_cio a
  INNER JOIN puma.registro_nollame b ON a.telefono = b.telefono
SET
  no_llame = 1;SELECT
  *
FROM
  puma.reuniones_concurrentes
GROUP BY
  id_reunion;######################################################################################################
DROP
  TABLE tabla_actualizar_mail_topuma1;CREATE TABLE tabla_actualizar_mail_topuma1(
  id VARCHAR(20),
  mail VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mails normalizados puma 1.csv' INTO TABLE tabla_actualizar_mail_topuma1 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_topuma1
ADD
  INDEX id(id);UPDATE
  datos.to_puma
SET
  mail1_normalizado = NULL;UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_topuma1 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail;UPDATE
  tabla_actualizar_mail_topuma1
SET
  id = REPLACE(id, '\n', '');SELECT
  *
FROM
  tabla_actualizar_mail_topuma1;######################################################################################################
CREATE TABLE datos.`to_puma_5` (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT ''
);DROP
  TABLE tabla_afil_caba_os_uta_2015;CREATE TABLE tabla_afil_caba_os_uta_2015(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  documento VARCHAR(40),
  domicilio VARCHAR(80),
  piso VARCHAR(10),
  cpo VARCHAR(40),
  provincia VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/Afil_CABA_OS_UTA_2015-03-26.csv' INTO TABLE tabla_afil_caba_os_uta_2015 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  tabla_afil_caba_os_uta_2015
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  tabla_afil_caba_os_uta_2015
ADD
  INDEX nombre(nombre);SELECT
  *
FROM
  tabla_afil_caba_os_uta_2015;UPDATE
  tabla_afil_caba_os_uta_2015
SET
  nombre = REPLACE(nombre, '\n', '');UPDATE
  tabla_afil_caba_os_uta_2015 a
  INNER JOIN puma.padron_nombresfemenino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  tabla_afil_caba_os_uta_2015 a
  INNER JOIN puma.padron_nombresmasculino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  tabla_afil_caba_os_uta_2015 a
  INNER JOIN puma.padron_nombresfemenino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  tabla_afil_caba_os_uta_2015 a
  INNER JOIN puma.padron_nombresmasculino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;SELECT
  Count(*)
FROM
  tabla_afil_caba_os_uta_2015
WHERE
  sexo IS NOT NULL;DROP
  TABLE bd1;CREATE TABLE bd1(
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  calle VARCHAR(80),
  numero VARCHAR(10),
  piso VARCHAR(10),
  dpto VARCHAR(10),
  localidad VARCHAR(80),
  cpo VARCHAR(20),
  fecha_nac VARCHAR(30),
  dni VARCHAR(30)
);load data local INFILE 'C:/Users/Administrador/bd1.csv' INTO TABLE bd1 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  bd1
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  bd1
ADD
  INDEX nombre(nombre);SELECT
  *
FROM
  bd1;UPDATE
  bd1
SET
  nombre = REPLACE(nombre, '\n', '');UPDATE
  datos.to_puma_5 a
  INNER JOIN puma.padron_nombresfemenino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  datos.to_puma_5 a
  INNER JOIN puma.padron_nombresmasculino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  datos.to_puma_5 a
  INNER JOIN puma.padron_nombresfemenino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  datos.to_puma_5 a
  INNER JOIN puma.padron_nombresmasculino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;SELECT
  Count(*)
FROM
  bd1
WHERE
  sexo IS NOT NULL;INSERT INTO datos.to_puma_5(
  nombre, apellido, documento, domicilio,
  cod_postal
)
SELECT
  nombre,
  apellido,
  documento,
  Concat(domicilio, ' ', piso),
  cpo
FROM
  tabla_afil_caba_os_uta_2015;SELECT
  *
FROM
  datos.to_puma_5;INSERT INTO datos.to_puma_5(
  apellido, nombre, domicilio, cod_postal,
  anio_nac, mes_nac, dia_nac, documento
)
SELECT
  apellido,
  nombre,
  Concat(
    calle, ' ', numero, ' ', piso, ' ', dpto
  ),
  cpo,
  Year(fecha_nac),
  Month(fecha_nac),
  Day(fecha_nac),
  dni
FROM
  bd1;UPDATE
  datos.to_puma_5
SET
  domicilio = REPLACE(domicilio, "  ", "");SELECT
  id_archivo,
  Count(*)
FROM
  datos.to_puma_5
GROUP BY
  id_archivo;UPDATE
  datos.to_puma_5
SET
  id_archivo = 16201
WHERE
  id_archivo = 0;SELECT
  Count(*)
FROM
  tabla_afil_caba_os_uta_2015;ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN id INT auto_increment PRIMARY KEY;ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN en_puma VARCHAR(1);ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN id_puma VARCHAR(15);ALTER TABLE
  datos.to_puma_5
ADD
  INDEX documento_num(documento_num);UPDATE
  datos.to_puma_5
SET
  en_puma = 0;SELECT
  Count(*)
FROM
  datos.to_puma_5
WHERE
  documento IS NOT NULL
  OR documento <> "";SELECT
  documento
FROM
  datos.to_puma_5
WHERE
  documento IS NOT NULL
  AND documento <> ""
LIMIT
  5000;UPDATE
  datos.to_puma_5 a
  INNER JOIN temporal.pumasf b ON a.documento_num = b.documento
  AND a.sexo = b.sexo
SET
  a.en_puma = 1,
  a.id_puma = b.id_puma;UPDATE
  datos.to_puma_5
SET
  documento = REPLACE(documento_num, "\n", "");SELECT
  *
FROM
  datos.to_puma_5
WHERE
  id_puma IS NOT NULL;ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN documento_num INT(10) DEFAULT 0;UPDATE
  datos.to_puma_5
SET
  documento_num = documento;SELECT
  sexo
FROM
  datos.to_puma_5
LIMIT
  10000;SELECT
  *
FROM
  datos.to_puma_5
WHERE
  nombre = "maria dolores";CREATE TABLE tabla_uta_2(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  documento VARCHAR(20),
  domicilio VARCHAR(80),
  piso VARCHAR(10),
  cpo VARCHAR(10)
);load data local INFILE 'C:/Users/Administrador/uta2.csv' INTO TABLE tabla_uta_2 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;INSERT INTO datos.to_puma_5(
  nombre, apellido, documento, domicilio,
  cod_postal
)
SELECT
  nombre,
  apellido,
  documento,
  Concat(domicilio, ' ', piso),
  cpo
FROM
  tabla_uta_2;SELECT
  id_archivo,
  Count(*)
FROM
  datos.to_puma_5
WHERE
  en_puma = 1
GROUP BY
  id_archivo;SELECT
  documento
FROM
  datos.to_puma_5
WHERE
  documento > 0
LIMIT
  15000;ALTER TABLE
  datos.to_puma_5
ADD
  COLUMN email_puma VARCHAR(80);SELECT
  id,
  mail1,
  mail2
FROM
  datos.to_puma
WHERE
  (
    mail1 <> ""
    AND mail1 IS NOT NULL
  )
  OR (
    mail2 <> ""
    AND mail2 IS NOT NULL
  )
LIMIT
  99999999999;######################################################################################################
DROP
  TABLE temp_telefonos_puma_4;CREATE TABLE temp_telefonos_puma_4(
  id VARCHAR(20),
  fijo1 VARCHAR(40),
  fijo2 VARCHAR(40),
  celular VARCHAR(40),
  compania VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/Telefonos Final.csv' INTO TABLE temp_telefonos_puma_4 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  temp_telefonos_puma_4
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_4
ADD
  COLUMN fijo1_norm VARCHAR(40);ALTER TABLE
  datos.to_puma_4
ADD
  COLUMN fijo2_norm VARCHAR(40);ALTER TABLE
  datos.to_puma_4
ADD
  COLUMN celular_norm VARCHAR(40);ALTER TABLE
  datos.to_puma_4
ADD
  COLUMN compania VARCHAR(40);UPDATE
  datos.to_puma_4 a
  INNER JOIN temp_telefonos_puma_4 b ON a.id = b.id
SET
  a.fijo1_norm = b.fijo1,
  a.fijo2_norm = b.fijo2,
  a.celular_norm = b.celular,
  a.compania = b.compania;SELECT
  id
FROM
  temp_simon.temp_telefonos_puma_4;SELECT
  id
FROM
  datos.to_puma_4;SELECT
  documento,
  dni_norm
FROM
  datos.to_puma_4
WHERE
  dni_norm IS NULL
  AND documento IS NOT NULL
  AND documento <> "";ALTER TABLE
  datos.to_puma_4
ADD
  COLUMN id INT auto_increment PRIMARY KEY;UPDATE
  datos.to_puma_4
SET
  id = id + 1805792;ALTER TABLE
  temp_telefonos_puma_4
DROP
  COLUMN id;ALTER TABLE
  temp_telefonos_puma_4
ADD
  COLUMN id INT auto_increment PRIMARY KEY;UPDATE
  temp_telefonos_puma_4
SET
  id = id + 1805792;SELECT
  *
FROM
  datos.to_puma_4;SELECT
  fijo1
FROM
  datos.to_puma_4
WHERE
  fijo1 IS NOT NULL
  AND fijo1 <> "";SELECT
  *
FROM
  temp_telefonos_puma_4
ORDER BY
  id ASC;SELECT
  *
FROM
  datos.to_puma_4
ORDER BY
  id ASC;SELECT
  *
FROM
  datos.to_puma_4;SELECT
  *
FROM
  temp_telefonos_puma_4;######################################################################################################
DROP
  TABLE temp_documentos_puma_4;CREATE TABLE temp_documentos_puma_4 (
  dni VARCHAR(40),
  id VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/dnis salida.csv' INTO TABLE temp_documentos_puma_4 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;ALTER TABLE
  temp_documentos_puma_4
ADD
  INDEX id(id);UPDATE
  datos.to_puma_4 a
  INNER JOIN temp_documentos_puma_4 b ON a.id_num = b.id
SET
  a.dni_norm = b.dni;SELECT
  documento,
  dni_norm
FROM
  datos.to_puma_4
LIMIT
  10000;######################################################################################################
SELECT
  id,
  mail1
FROM
  datos.to_puma_4
LIMIT
  999999999999999;ALTER TABLE
  datos.to_puma_4
ADD
  COLUMN mail_norm VARCHAR(80);CREATE TABLE temp_mail_puma_4(
  id VARCHAR(20),
  mail VARCHAR(80),
  validez VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mails verificados.csv' INTO TABLE temp_mail_puma_4 CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 0 LINES;ALTER TABLE
  temp_mail_puma_4
ADD
  INDEX id(id);ALTER TABLE
  temp_mail_puma_4
ADD
  INDEX mail(mail);ALTER TABLE
  datos.to_puma_4
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_4
ADD
  INDEX mail1(mail1);UPDATE
  datos.to_puma_4 a
  INNER JOIN temp_mail_puma_4 b ON a.mail1 = b.mail
SET
  a.mail1_normalizado = b.mail;SELECT
  *
FROM
  temp_mail_puma_4;#inner JOIN
SELECT
  count(*)
FROM
  datos.to_puma_4
WHERE
  mail1_normalizado IS NOT NULL;SELECT
  id,
  mail
FROM
  temp_mail_puma_4
ORDER BY
  id ASC;#1805794 natysilasin1984@yahoo.com.ar
SELECT
  count(*)
FROM
  datos.to_puma_4
WHERE
  mail_norm IS NOT NULL;SELECT
  id
FROM
  temp_mail_puma_4;UPDATE
  datos.to_puma_4
SET
  id = id + 1000000
WHERE
  id < 1800000;DROP
  TABLE temp_mail_puma_4;######################################################################################################
SELECT
  *
FROM
  puma.reuniones
GROUP BY
  barrio;load data local INFILE 'C:/Users/Administrador/reuniones.csv' INTO TABLE puma.enri_concurrentes_reuniones CHARACTER SET 'latin1' fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r' IGNORE 1 LINES;DELETE FROM
  puma.enri_concurrentes_reuniones
WHERE
  id_reunion IS NULL;SELECT
  *
FROM
  puma.enri_concurrentes_reuniones
WHERE
  id_reunion = 153;SELECT
  id_reunion,
  Count(*)
FROM
  enri_concurrentes_reuniones
GROUP BY
  id_reunion
ORDER BY
  id_reunion DESC;UPDATE
  enri_concurrentes_reuniones
SET
  nombre = REPLACE(nombre, '\n', '');UPDATE
  enri_concurrentes_reuniones a
  INNER JOIN puma.padron_nombresfemenino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  enri_concurrentes_reuniones a
  INNER JOIN puma.padron_nombresmasculino b ON Trim(a.nombre)= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  enri_concurrentes_reuniones a
  INNER JOIN puma.padron_nombresfemenino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'F'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;UPDATE
  enri_concurrentes_reuniones a
  INNER JOIN puma.padron_nombresmasculino b ON LEFT(
    a.nombre,
    Locate(' ', a.nombre)
  )= b.nombres
SET
  a.sexo = 'M'
WHERE
  a.sexo = ''
  OR a.sexo IS NULL;SELECT
  *
FROM
  enri_concurrentes_reuniones
WHERE
  sexo = ''
ORDER BY
  id_reunion DESC;SELECT
  *
FROM
  enri_concurrentes_reuniones
WHERE
  id_reunion IN(153);SELECT
  *
FROM
  puma.reuniones_concurrentes
WHERE
  reunion_id = 153;UPDATE
  puma.reuniones_concurrentes
SET
  reunion_id = reunion_id + 500
WHERE
  reunion_id = 153;INSERT INTO puma.reuniones_concurrentes
SELECT
  *,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  NULL,
  0,
  0,
  0,
  id_reunion
FROM
  enri_concurrentes_reuniones
WHERE
  id_reunion IN(153);#alter TABLE puma.reuniones_concurrentes ADD INDEX id (documento, sexo);UPDATE
  puma.reuniones_concurrentes a
  INNER JOIN puma.pumasf b ON a.documento = b.documento
  AND a.sexo = b.sexo
SET
  a.id_puma = b.id_puma;SELECT
  DISTINCT id_puma,
  reunion_id
FROM
  puma.reuniones_concurrentes
WHERE
  id_puma <> 0
  AND reunion_id IN(153)
LIMIT
  5000;########################################################################################################
SELECT
  id_reunion,
  count(*)
FROM
  puma.reuniones_concurrentes
GROUP BY
  id_reunion;SELECT
  *
FROM
  puma.reuniones
ORDER BY
  fecha_formato DESC;SELECT
  Count(*)
FROM
  puma.enri_concurrentes_reuniones;########################################################################################################
SELECT
  *
FROM
  listado_socios_2013 a
  INNER JOIN puma.data_mails_unicos b ON a.email = b.mail
WHERE
  b.detalle_estado = "valid"
  AND eliminar = 0;SELECT
  *
FROM
  listado_socios_2013
WHERE
  email <> "";SELECT
  *
FROM
  listado_socios_2013 a
  INNER JOIN temporal.pumasf b
  INNER JOIN puma.data_mails_unicos c ON a.dni = b.documento
  AND a.email <> ""
  AND a.email = b.mail1
  AND a.email = c.mail
where
  c.control_verificado = 1;########################################################################################################
CREATE TABLE listado_socios_2013(
  nro_socio VARCHAR(10),
  nombre VARCHAR(160),
  direccion VARCHAR(120),
  dni VARCHAR(15),
  provincia VARCHAR(60),
  pais VARCHAR(80),
  cp VARCHAR(40),
  telefono VARCHAR(40),
  celular VARCHAR(40),
  email VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/listado socios 2013.csv' INTO TABLE listado_socios_2013 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  listado_socios_2013
ADD
  INDEX dni(dni);ALTER TABLE
  listado_socios_2013
ADD
  INDEX email(email);########################################################################################################
CREATE TABLE actualizar_domicilios_pumasf(
  id INT(9),
  calle VARCHAR(120),
  altura VARCHAR(8)
);load data local INFILE 'C:/Users/Administrador/direcciones numero separado.csv' INTO TABLE actualizar_domicilios_pumasf CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temporal.pumasf
ADD
  COLUMN calle_sola VARCHAR(120);ALTER TABLE
  temporal.pumasf
ADD
  COLUMN altura_sola VARCHAR(8);ALTER TABLE
  actualizar_domicilios_pumasf
ADD
  INDEX id(id);UPDATE
  temporal.pumasf a
  INNER JOIN actualizar_domicilios_pumasf b ON a.id_puma = b.id
SET
  a.calle_sola = b.calle,
  a.altura_sola = b.altura;SELECT
  id_puma,
  calle_sola,
  altura_sola,
  g_pe_2013_domicilio
FROM
  temporal.pumasf
WHERE
  Locate(calle_sola, g_pe_2013_domicilio) = 0;SELECT
  Count(*)
FROM
  actualizar_domicilios_pumasf
GROUP BY
  id DESC;truncate TABLE actualizar_domicilios_pumasf;########################################################################################################
CREATE TABLE to_export (
  id_puma INT(9),
  domicilio VARCHAR(30)
);INSERT INTO to_export (
  select
    id_puma,
    g_pe_2013_domicilio
  FROM
    temporal.pumasf
);SELECT
  id_puma,
  Count(*) AS cuenta
FROM
  to_export
GROUP BY
  id_puma
HAVING
  cuenta > 1
ORDER BY
  id_puma DESC;SELECT
  Count(*)
FROM
  temporal.pumasf
WHERE
  g_crm_lat IS NOT NULL;########################################################################################################
CREATE TABLE enri_cio_interesados_1(
  telefono VARCHAR(40),
  fecha_y_hora VARCHAR(40),
  codigo_campana VARCHAR(4)
);load data local INFILE 'C:/Users/Administrador/enri interesados 1203.csv' INTO TABLE enri_cio_interesados_1 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  enri_cio_interesados_1
SET
  telefono = REPLACE(telefono, "(0  )", "11");UPDATE
  enri_cio_interesados_1
SET
  telefono = REPLACE(telefono, "-", "");INSERT INTO puma.telefonos_cio_interesados(
  telefono, fecha_y_hora, codigo_campana
)
SELECT
  telefono,
  fecha_y_hora,
  codigo_campana
FROM
  enri_cio_interesados_1;SELECT
  *
FROM
  puma.cio_interesados
LIMIT
  999999999;########################################################################################################
CREATE TABLE tabla_actualizar_telefonos_to_puma_2(
  id VARCHAR(20),
  fijo1 VARCHAR(15),
  fijo2 VARCHAR(15),
  celular VARCHAR(15),
  compania VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/Telefonos Final.csv' INTO TABLE tabla_actualizar_telefonos_to_puma_2 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_telefonos_to_puma_2
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_2
ADD
  COLUMN fijo1_norm VARCHAR(15);ALTER TABLE
  datos.to_puma_2
ADD
  COLUMN fijo2_norm VARCHAR(15);ALTER TABLE
  datos.to_puma_2
ADD
  COLUMN celular_norm VARCHAR(15);ALTER TABLE
  datos.to_puma_2
ADD
  COLUMN compania VARCHAR(20);UPDATE
  datos.to_puma_2 a
  INNER JOIN tabla_actualizar_telefonos_to_puma_2 b ON a.id = b.id
SET
  a.fijo1_norm = b.fijo1,
  a.fijo2_norm = b.fijo2,
  a.celular_norm = b.celular,
  a.compania = b.compania;CREATE TABLE tabla_actualizar_telefonos_to_puma_3(
  id VARCHAR(20),
  fijo1 VARCHAR(15),
  fijo2 VARCHAR(15),
  celular VARCHAR(15),
  compania VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/Telefonos final.csv' INTO TABLE tabla_actualizar_telefonos_to_puma_3 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_telefonos_to_puma_3
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN fijo1_norm VARCHAR(15);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN fijo2_norm VARCHAR(15);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN celular_norm VARCHAR(15);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN compania VARCHAR(20);UPDATE
  datos.to_puma_3 a
  INNER JOIN tabla_actualizar_telefonos_to_puma_3 b ON a.id = b.id
SET
  a.fijo1_norm = b.fijo1,
  a.fijo2_norm = b.fijo2,
  a.celular_norm = b.celular,
  a.compania = b.compania;########################################################################################################
SELECT
  id,
  documento
FROM
  datos.to_puma_3
WHERE
  documento <> ""
  AND documento IS NOT NULL
LIMIT
  99999999999;CREATE TABLE tabla_actualizar_mail_to_puma_3(
  id VARCHAR(20),
  mail1 VARCHAR(120),
  mail2 VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mails to puma 3 completo.csv' INTO TABLE tabla_actualizar_mail_to_puma_3 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_3
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_3
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN mail1_normalizado VARCHAR(120);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN mail2_normalizado VARCHAR(120);UPDATE
  datos.to_puma_3 a
  INNER JOIN tabla_actualizar_mail_to_puma_3 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail1,
  a.mail2_normalizado = b.mail2;########################################################################################################
CREATE TABLE tabla_actualizar_dni_to_puma_3(
  id VARCHAR(20),
  dni VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/dnis salida.csv' INTO TABLE tabla_actualizar_dni_to_puma_3 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_dni_to_puma_3
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_3
ADD
  COLUMN dni_norm VARCHAR(20);UPDATE
  datos.to_puma_3 a
  INNER JOIN tabla_actualizar_dni_to_puma_3 b ON a.id = b.id
SET
  a.dni_norm = b.dni;SELECT
  *
FROM
  datos.to_puma_3
WHERE
  mail1_normalizado IS NOT NULL
  AND dni_norm IS NOT NULL;########################################################################################################
SELECT
  documento
FROM
  datos.to_puma_2
WHERE
  documento <> ""
  AND documento IS NOT NULL
LIMIT
  9999999999;CREATE TABLE tabla_actualizar_to_puma_2_doc(
  id VARCHAR(20),
  dni VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/dnis salida.csv' INTO TABLE tabla_actualizar_to_puma_2_doc CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  datos.to_puma_2
ADD
  COLUMN doc_normalizado VARCHAR(20);ALTER TABLE
  datos.to_puma_2
ADD
  INDEX id(id);ALTER TABLE
  tabla_actualizar_to_puma_2_doc
ADD
  INDEX id(id);UPDATE
  datos.to_puma_2 a
  INNER JOIN tabla_actualizar_to_puma_2_doc b ON a.id = b.id
SET
  a.doc_normalizado = b.dni;########################################################################################################
CREATE TABLE tabla_actualizar_mail_to_puma_2 (
  id VARCHAR(10),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mailsverificados to puma 2.csv' INTO TABLE tabla_actualizar_mail_to_puma_2 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_2
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_2
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma_2
ADD
  COLUMN mail1_normalizado VARCHAR(120);#AJENO
UPDATE
  datos.to_puma_2 a
  INNER JOIN tabla_actualizar_mail_to_puma_2 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail;########################################################################################################
CREATE TABLE tabla_actualizar_mail_to_puma_1_11 (
  id VARCHAR(10),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mailsverificados 1 - 1.csv' INTO TABLE tabla_actualizar_mail_to_puma_1_11 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_1_11
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail1_normalizado VARCHAR(120);#AJENO
ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail2_normalizado VARCHAR(120);#AJENO
UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_to_puma_1_11 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail;CREATE TABLE tabla_actualizar_mail_to_puma_1_12 (
  id VARCHAR(10),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mailsverificados 1 - 2.csv' INTO TABLE tabla_actualizar_mail_to_puma_1_12 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_1_12
ADD
  INDEX id(id);UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_to_puma_1_12 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  a.mail1_normalizado = ''
  OR a.mail1_normalizado IS NULL;UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_to_puma_1_12 b ON a.id = b.id
SET
  a.mail2_normalizado = b.mail
WHERE
  a.mail1_normalizado <> b.mail;CREATE TABLE tabla_actualizar_mail_to_puma_1_21(
  id VARCHAR(10),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mailsverificados 2 - 1.csv' INTO TABLE tabla_actualizar_mail_to_puma_1_21 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_1_21
ADD
  INDEX id(id);UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_to_puma_1_21 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail;CREATE TABLE tabla_actualizar_mail_to_puma_1_22(
  id VARCHAR(10),
  mail VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/mailsverificados 2 - 2.csv' INTO TABLE tabla_actualizar_mail_to_puma_1_22 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_mail_to_puma_1_22
ADD
  INDEX id(id);UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_to_puma_1_22 b ON a.id = b.id
SET
  a.mail1_normalizado = b.mail
WHERE
  a.mail1_normalizado = ""
  OR a.mail1_normalizado IS NULL;UPDATE
  datos.to_puma a
  INNER JOIN tabla_actualizar_mail_to_puma_1_22 b ON a.id = b.id
SET
  a.mail2_normalizado = b.mail
WHERE
  a.mail1_normalizado <> b.mail;########################################################################################################
SELECT
  domicilio
FROM
  datos.to_puma_3
WHERE
  domicilio <> ""
  AND domicilio IS NOT NULL
LIMIT
  99999999999999;########################################################################################################
SELECT
  documento,
  fijo1,
  fijo2,
  celular,
  mail1,
  mail2,
  mail3,
  mail4,
  mail5,
  domicilio,
  id
FROM
  datos.to_puma_2
LIMIT
  99999999;SELECT
  domicilio
FROM
  datos.to_puma_2
WHERE
  domicilio IS NOT NULL
  AND domicilio <> ''
LIMIT
  99999999;########################################################################################################
CREATE TABLE puma.cio_telefonos (
  telefono VARCHAR(20),
  direccion VARCHAR(180),
  barrio VARCHAR(40),
  zona VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/Base_CABA_salida.csv' INTO TABLE puma.cio_telefonos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_todo_junto_8
LIMIT
  2;INSERT INTO datos.to_puma_2(
  id_archivo, documento, nombre, apellido,
  sexo, anio_nac, mes_nac, dia_nac,
  fijo1, fijo2, celular, mail1, cod_postal,
  barrio, comuna, domicilio
) #id archivoooooooooooo
SELECT
  id_archivo,
  dni,
  nombre,
  apellido,
  sexo,
  anio_nac,
  mes_nac,
  dia_nac,
  telefono1,
  telefono2,
  telefono3,
  email,
  cp,
  localidad,
  comuna,
  dire_completa
FROM
  temp_mario.tabla_todo_junto_8;ALTER TABLE
  temp_mario.tabla_todo_junto_8
ADD
  COLUMN dire_completa VARCHAR(180);UPDATE
  temp_mario.tabla_todo_junto_8
SET
  dire_completa = Concat(
    direccion, ' ', altura, ' ', piso, ' ',
    departamento
  );########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_todo_junto_6
LIMIT
  2;INSERT INTO datos.to_puma_2(
  id_archivo, documento, nombre, apellido,
  sexo, anio_nac, mes_nac, dia_nac,
  fijo1, fijo2, mail1, domicilio, cod_postal,
  barrio
) #id archivoooooooooooo
SELECT
  id_archivo,
  dni,
  nombre,
  apellido,
  sexo,
  anio_nac,
  mes_nac,
  dia_nac,
  telefono1,
  telefono2,
  email,
  direccion,
  cp,
  localidad
FROM
  temp_mario.tabla_todo_junto_6;########################################################################################################
truncate TABLE datos.to_puma_2;INSERT INTO datos.to_puma_2
SELECT
  *
FROM
  datos.to_puma_copia2;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cv_planillas;INSERT INTO datos.to_puma_2(
  nombre, apellido, mail1, id_archivo
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  email,
  id_archivo
FROM
  temp_mario.tabla_cv_planillas;########################################################################################################
DROP
  TABLE datos.to_puma_copia2;CREATE TABLE datos.`to_puma_copia2` (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT '',
  `pumasf` TINYINT(4) DEFAULT '0',
  `pasado` TINYINT(4) DEFAULT '0',
  `validado` TINYINT(4) DEFAULT '0',
  `mail_valido` TINYINT(1) DEFAULT '0',
  KEY `mail1` (`mail1`),
  KEY `documento` (`documento`)
) engine = myisam DEFAULT charset = latin1;INSERT INTO datos.to_puma_copia2
SELECT
  *
FROM
  datos.to_puma_2;SELECT
  documento
FROM
  datos.to_puma_3
WHERE
  documento <> ""
  AND documento IS NOT NULL
LIMIT
  999999999;########################################################################################################
CREATE TABLE tabla_primer_update_to_puma_1(
  id VARCHAR(15),
  dire_norm VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/direcciones to puma primer filtro.csv' INTO TABLE tabla_primer_update_to_puma_1 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_primer_update_to_puma_1
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma
ADD
  COLUMN dire_norm VARCHAR(120);UPDATE
  datos.to_puma a
  INNER JOIN tabla_primer_update_to_puma_1 b ON a.id = b.id
SET
  a.dire_norm = b.dire_norm;########################################################################################################
SELECT
  id_archivo,
  count(*)
FROM
  datos.to_puma
GROUP BY
  id_archivo
ORDER BY
  count(*);DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 11102;SELECT
  *
FROM
  datos.to_puma
WHERE
  id_archivo = 13303
LIMIT
  50;#13401 son la misma tabla
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 13303;SELECT
  *
FROM
  datos.to_puma
WHERE
  id_archivo = 11403
LIMIT
  50;#11407  11403
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 11407;DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 11408;SELECT
  *
FROM
  datos.to_puma
WHERE
  id_archivo = 13308
LIMIT
  50;#13308  12909
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 13308;SELECT
  *
FROM
  datos.to_puma
WHERE
  id_archivo = 13503
LIMIT
  50;#13501  13503
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 13503;SELECT
  *
FROM
  datos.to_puma
WHERE
  id_archivo = 13105
LIMIT
  50;#13105  13103
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 13105;DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 13104;SELECT
  documento
FROM
  datos.to_puma
WHERE
  (
    id_archivo = 13502
    OR id_archivo = 13504
  )
  AND documento <> 0
ORDER BY
  documento;#13502 13504
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 13502;SELECT
  mail1
FROM
  datos.to_puma
WHERE
  (
    id_archivo = 11103
    OR id_archivo = 12602
  )
  AND mail1 <> ""
ORDER BY
  mail1;#11130 12602
DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 11103;DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 11104;########################################################################################################
INSERT INTO datos.to_puma_copia
SELECT
  *
FROM
  datos.to_puma;DROP
  TABLE datos.to_puma_copia;CREATE TABLE datos.to_puma_copia (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT '',
  `pumasf` TINYINT(4) DEFAULT '0',
  `pasado` TINYINT(4) DEFAULT '0',
  `validado` TINYINT(4) DEFAULT '0',
  `mail_valido` TINYINT(1) DEFAULT '0',
  `id` INT(11) NOT NULL auto_increment,
  `mail1_ok` TINYINT(4) DEFAULT '0',
  `mail2_ok` TINYINT(4) DEFAULT '0',
  `fijo1_ok` VARCHAR(20) DEFAULT NULL,
  `fijo2_ok` VARCHAR(20) DEFAULT NULL,
  `celular_ok` VARCHAR(20) DEFAULT NULL,
  `compania` VARCHAR(20) DEFAULT NULL,
  `id_puma` INT(11) DEFAULT '0',
  `mail1_verificado` TINYINT(4) DEFAULT '0',
  `mail2_verificado` TINYINT(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mail1` (`mail1`),
  KEY `documento` (`documento`),
  KEY `id` (`id`),
  KEY `doc` (`documento`, `sexo`)
) engine = myisam auto_increment = 1919454 DEFAULT charset = latin1;########################################################################################################
CREATE TABLE tabla_update_to_puma_1 (
  id VARCHAR(10),
  fijo1 VARCHAR(20),
  fijo2 VARCHAR(20),
  celular VARCHAR(20),
  compania VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/telefonos 1 final.csv' INTO TABLE tabla_update_to_puma_1 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_to_puma_1
ADD
  INDEX id(id);CREATE TABLE tabla_update_to_puma_2 (
  id VARCHAR(10),
  fijo1 VARCHAR(20),
  fijo2 VARCHAR(20),
  celular VARCHAR(20),
  compania VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/telefonos 2 final.csv' INTO TABLE tabla_update_to_puma_2 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_to_puma_2
ADD
  INDEX id(id);ALTER TABLE
  datos.to_puma
ADD
  COLUMN fijo1_ok VARCHAR(20);ALTER TABLE
  datos.to_puma
ADD
  COLUMN fijo2_ok VARCHAR(20);ALTER TABLE
  datos.to_puma
ADD
  COLUMN celular_ok VARCHAR(20);ALTER TABLE
  datos.to_puma
ADD
  COLUMN compania VARCHAR(20);UPDATE
  datos.to_puma a
  INNER JOIN tabla_update_to_puma_1 b ON a.id = b.id
SET
  a.fijo1_ok = b.fijo1,
  a.fijo2_ok = b.fijo2,
  a.celular_ok = b.celular,
  a.compania = b.compania;UPDATE
  datos.to_puma a
  INNER JOIN tabla_update_to_puma_2 b ON a.id = b.id
SET
  a.fijo1_ok = b.fijo1,
  a.fijo2_ok = b.fijo2,
  a.celular_ok = b.celular,
  a.compania = b.compania;SELECT
  *
FROM
  datos.to_puma
WHERE
  mail2_ok = 1;SELECT
  domicilio
FROM
  datos.to_puma
WHERE
  domicilio IS NOT NULL
  AND domicilio <> "";########################################################################################################
CREATE TABLE puma.cio_push_poll_2015_02(
  telefono VARCHAR(15),
  seleccion VARCHAR(10),
  barrio VARCHAR(40),
  dia VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/encuesta final.csv' INTO TABLE puma.cio_push_poll_2015_02 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;########################################################################################################
CREATE TABLE puma.cio_interesados(
  telefono VARCHAR(40),
  fecha_y_hora VARCHAR(40),
  codigo_campana VARCHAR(4)
);load data local INFILE 'C:/Users/Administrador/reportes interesados final.csv' INTO TABLE puma.cio_interesados CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;SELECT
  *
FROM
  puma.cio_interesados
LIMIT
  999999999;UPDATE
  puma.cio_interesados
SET
  telefono = REPLACE(telefono, "(0  )", "11");UPDATE
  puma.cio_interesados
SET
  telefono = REPLACE(telefono, "-", "");#Nombre cambiado a puma.telefonos_cio_interesados
SELECT
  *
FROM
  puma.telefonos_cio_interesados
GROUP BY
  codigo_campana;########################################################################################################
CREATE TABLE datos.to_puma_2 (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT '',
  `pumasf` TINYINT(4) DEFAULT '0',
  `pasado` TINYINT(4) DEFAULT '0',
  `validado` TINYINT(4) DEFAULT '0',
  `mail_valido` TINYINT(1) DEFAULT '0',
  KEY `mail1` (`mail1`),
  KEY `documento` (`documento`)
) engine = myisam DEFAULT charset = latin1;########################################################################################################
CREATE TABLE datos.to_puma_copia2 (
  `id_archivo` INT(11) DEFAULT '0',
  `documento` VARCHAR(25) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT '',
  `nombre` VARCHAR(100) DEFAULT '',
  `apellido` VARCHAR(100) DEFAULT '',
  `anio_nac` VARCHAR(10) DEFAULT NULL,
  `mes_nac` INT(11) DEFAULT '0',
  `dia_nac` INT(11) DEFAULT '0',
  `fijo1` VARCHAR(50) DEFAULT NULL,
  `fijo2` VARCHAR(50) DEFAULT NULL,
  `celular` VARCHAR(50) DEFAULT NULL,
  `mail1` VARCHAR(200) DEFAULT '',
  `mail2` VARCHAR(200) DEFAULT '',
  `mail3` VARCHAR(200) DEFAULT '',
  `mail4` VARCHAR(200) DEFAULT '',
  `mail5` VARCHAR(200) DEFAULT '',
  `facebook` VARCHAR(100) DEFAULT '',
  `twitter` VARCHAR(100) DEFAULT '',
  `google_plus` VARCHAR(100) DEFAULT '',
  `des_mail` INT(11) DEFAULT '0',
  `barrio` VARCHAR(100) DEFAULT '',
  `comuna` VARCHAR(100) DEFAULT '',
  `domicilio` VARCHAR(200) DEFAULT '',
  `cod_postal` VARCHAR(20) DEFAULT '',
  `pumasf` TINYINT(4) DEFAULT '0',
  `pasado` TINYINT(4) DEFAULT '0',
  `validado` TINYINT(4) DEFAULT '0',
  `mail_valido` TINYINT(1) DEFAULT '0',
  KEY `mail1` (`mail1`)
) engine = myisam DEFAULT charset = latin1;INSERT INTO datos.to_puma_copia2
SELECT
  *
FROM
  datos.to_puma;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_todo_junto_3
WHERE
  dni <> ""
  AND direccion <> "";INSERT INTO datos.to_puma(
  id_archivo, documento, nombre, apellido,
  sexo, anio_nac, mes_nac, dia_nac,
  fijo1, fijo2, celular, mail1
) #id archivoooooooooooo
SELECT
  id_archivo,
  dni,
  nombre,
  apellido,
  sexo,
  anio_nac,
  mes_nac,
  dia_nac,
  telefono1,
  telefono2,
  telefono3,
  email
FROM
  temp_mario.tabla_todo_junto_3;ALTER TABLE
  temp_mario.tabla_todo_junto_3
ADD
  COLUMN dire_completa VARCHAR(80);UPDATE
  temp_mario.tabla_todo_junto_3
SET
  dire_completa = Concat(direccion, "", altura);ALTER TABLE
  temp_mario.tabla_todo_junto_3
ADD
  INDEX dni(dni);ALTER TABLE
  datos.to_puma
ADD
  INDEX documento(documento);UPDATE
  temp_mario.tabla_todo_junto_3
SET
  dire_completa = "";UPDATE
  datos.to_puma a
  INNER JOIN temp_mario.tabla_todo_junto_3 b ON a.documento = b.dni
SET
  a.domicilio = b.dire_completa;#14:19:10  ALTER TABLE temp_mario.tabla_todo_junto_3 ADD INDEX dni(dni)  error CODE: 2013. lost connection TO mysql server during query  600.495 sec
#no se pudo terminar el UPDATE
########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_nuevas_bases;INSERT INTO datos.to_puma(
  id_archivo, documento, nombre, apellido,
  fijo1, fijo2, mail1, anio_nac, mes_nac,
  dia_nac, sexo, domicilio
) #id archivoooooooooooo
SELECT
  id_archivo,
  dni,
  nombre,
  apellido,
  telefono1,
  telefono2,
  email,
  anio_nac,
  mes_nac,
  dia_nac,
  sexo,
  dire_completa
FROM
  temp_mario.tabla_nuevas_bases;ALTER TABLE
  temp_mario.tabla_nuevas_bases
ADD
  COLUMN dire_completa VARCHAR(80);UPDATE
  temp_mario.tabla_nuevas_bases
SET
  dire_completa = Concat(direccion, "", altura);########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_licencias;INSERT INTO datos.to_puma(
  documento, sexo, nombre, apellido,
  fijo1, domicilio, id_archivo
) #id archivoooooooooooo
SELECT
  dni,
  sexo,
  nombre,
  apellido,
  telefono,
  dire_completa,
  id_archivo
FROM
  temp_mario.tabla_licencias;ALTER TABLE
  temp_mario.tabla_licencias
ADD
  COLUMN dire_completa VARCHAR(80);UPDATE
  temp_mario.tabla_licencias
SET
  dire_completa = Concat(
    direccion, "", altura, "", piso, "",
    departamento
  );########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_hospitales_sms;INSERT INTO datos.to_puma(
  id_archivo, documento, nombre, apellido,
  sexo, anio_nac, mes_nac, dia_nac,
  fijo1, cod_postal, domicilio
) #id archivoooooooooooo
SELECT
  id_archivo,
  dni,
  nombre,
  apellido,
  sexo,
  anio_nac,
  mes_nac,
  dia_nac,
  telefono,
  cod_postal,
  dire_completa
FROM
  temp_mario.tabla_hospitales_sms;ALTER TABLE
  temp_mario.tabla_hospitales_sms
ADD
  COLUMN dire_completa VARCHAR(80);UPDATE
  temp_mario.tabla_hospitales_sms
SET
  dire_completa = Concat(
    direccion, "", altura, "", piso, "",
    departamento
  );########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_empleados_hosp;INSERT INTO datos.to_puma(
  id_archivo, nombre, apellido, sexo,
  documento, cod_postal, fijo1, fijo2,
  celular, mail1, domicilio
) #id archivoooooooooooo
SELECT
  id_archivo,
  nombre,
  apellido,
  sexo,
  dni,
  cod_postal,
  telefono1,
  telefono2,
  telefono3,
  email,
  dire_completa
FROM
  temp_mario.tabla_empleados_hosp;ALTER TABLE
  temp_mario.tabla_empleados_hosp
ADD
  COLUMN dire_completa VARCHAR(80);UPDATE
  temp_mario.tabla_empleados_hosp
SET
  dire_completa = Concat(
    direccion, "", altura, "", piso, "",
    departamento
  );########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_ba_playa4;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, mail1, barrio, fijo1, id_archivo
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  email,
  localidad,
  telefono,
  id_archivo
FROM
  temp_mario.tabla_ba_playa4;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_ba_playa2;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, mail1, barrio, fijo1, id_archivo
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  email,
  localidad,
  telefono,
  id_archivo
FROM
  temp_mario.tabla_ba_playa2;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_ba_playa1;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, mail1, barrio, fijo1, id_archivo
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  email,
  localidad,
  telefono,
  id_archivo
FROM
  temp_mario.tabla_ba_playa1;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc9;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc9;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc8;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc8;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc7;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc7;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc6;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc6;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc5;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc5;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc4;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc4;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc15;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc15;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc14;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc14;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc12;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc12;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc11;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc11;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc10;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc11;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_cgpc1;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_cgpc11;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_agenda_exposiciones;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_agenda_exposiciones;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_calendario_turismo;INSERT INTO datos.to_puma(mail1, id_archivo) #id archivoooooooooooo
SELECT
  email,
  id_archivo
FROM
  temp_mario.tabla_calendario_turismo;########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_vacaciones_inv_agus;ALTER TABLE
  temp_mario.tabla_vacaciones_inv_agus
ADD
  COLUMN anio_nac VARCHAR(10);UPDATE
  temp_mario.tabla_vacaciones_inv_agus
SET
  dia_nac = Substring(nacimiento, 1, 2);UPDATE
  temp_mario.tabla_vacaciones_inv_agus
SET
  mes_nac = Substring(nacimiento, 4, 5);UPDATE
  temp_mario.tabla_vacaciones_inv_agus
SET
  anio_nac = Substring(nacimiento, 7, 10);INSERT INTO datos.to_puma(
  nombre, apellido, mail1, fijo1, celular,
  id_archivo, dia_nac, mes_nac, anio_nac
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  email,
  telefono,
  celular,
  id_archivo,
  dia_nac,
  mes_nac,
  anio_nac
FROM
  temp_mario.tabla_vacaciones_inv_agus;UPDATE
  temp_mario.tabla_vacaciones_inv_agus
SET
  mes_nac = REPLACE(mes_nac, "/19", "");########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_periodico_concurrente;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, documento, barrio, fijo1,
  celular, mail1, id_archivo, sexo,
  domicilio
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  dni,
  barrio,
  telefono,
  celular,
  email,
  id_archivo,
  sexo,
  direccion
FROM
  temp_mario.tabla_periodico_concurrente;ALTER TABLE
  temp_mario.tabla_periodico_concurrente
ADD
  COLUMN direccion VARCHAR(80);UPDATE
  temp_mario.tabla_periodico_concurrente2
SET
  direccion = Trim(
    Concat(
      calle, "", altura, "", piso, depto
    )
  );#hecho
########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_periodico_concurrente2;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, documento, barrio, fijo1,
  celular, mail1, id_archivo, sexo,
  domicilio
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  dni,
  barrio,
  telefono,
  celular,
  email,
  id_archivo,
  sexo,
  direccion
FROM
  temp_mario.tabla_periodico_concurrente2;ALTER TABLE
  temp_mario.tabla_periodico_concurrente2
ADD
  COLUMN direccion VARCHAR(80);UPDATE
  temp_mario.tabla_periodico_concurrente2
SET
  direccion = Trim(
    Concat(
      calle, "", altura, "", piso, depto
    )
  );#hecho
########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_periodico_concurrente;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, documento, barrio, fijo1,
  celular, mail1, id_archivo, sexo,
  domicilio
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  dni,
  barrio,
  telefono,
  celular,
  email,
  id_archivo,
  sexo,
  direccion
FROM
  temp_mario.tabla_periodico_concurrente2;ALTER TABLE
  temp_mario.tabla_periodico_concurrente
ADD
  COLUMN direccion VARCHAR(80);UPDATE
  temp_mario.tabla_periodico_concurrente
SET
  direccion = Trim(
    Concat(
      calle, " ", altura, " ", piso, depto
    )
  ) #hecho
  ########################################################################################################
  CREATE TABLE tabla_update_dnis_tabla_final(
    dni VARCHAR(8),
    id VARCHAR(8)
  );ALTER TABLE
  tabla_update_dnis_tabla_final
ADD
  INDEX dni(dni);load data local INFILE 'C:/Users/Administrador/dni final.csv' INTO TABLE tabla_update_dnis_tabla_final CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  tabla_final a
  INNER JOIN tabla_update_dnis_tabla_final b ON a.id = b.id
SET
  a.dni = b.dni;SELECT
  dni
FROM
  tabla_final
WHERE
  dni <> ""
  AND dni IS NOT NULL
  AND dni = 0;SELECT
  fijo1
FROM
  datos.to_puma
WHERE
  fijo1 IS NOT NULL
  AND fijo1 <> ""
LIMIT
  10000000;SELECT
  *
FROM
  temp_mario.tabla_maldonado_sc10;########################################################################################################
DROP
  TABLE tabla_final_aux2;CREATE TABLE `tabla_final_aux2` (
  `nombre` VARCHAR(150) DEFAULT NULL,
  `apellido` VARCHAR(80) DEFAULT NULL,
  `tipo` VARCHAR(40) DEFAULT NULL,
  `dni` VARCHAR(80) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT NULL,
  `fecha_nac` VARCHAR(16) DEFAULT NULL,
  `pais` VARCHAR(80) DEFAULT NULL,
  `provincia` VARCHAR(80) DEFAULT NULL,
  `ciudad` VARCHAR(80) DEFAULT NULL,
  `barrio` VARCHAR(80) DEFAULT NULL,
  `direccion` VARCHAR(80) DEFAULT NULL,
  `cpo` VARCHAR(15) DEFAULT NULL,
  `email` VARCHAR(80) DEFAULT NULL,
  `telefono1` VARCHAR(80) DEFAULT NULL,
  `telefono2` VARCHAR(80) DEFAULT NULL,
  `celular1` VARCHAR(80) DEFAULT NULL,
  `acepta_recibir_info` VARCHAR(3) DEFAULT NULL,
  `origen` INT(11) DEFAULT NULL,
  `id` INT(11) NOT NULL auto_increment,
  `pumasf` TINYINT(4) DEFAULT NULL,
  `eliminar` TINYINT(4) DEFAULT NULL,
  `detalle_estado` VARCHAR(200) DEFAULT NULL,
  `control_verificado` TINYINT(4) DEFAULT NULL,
  `dni_en_puma` TINYINT(4) DEFAULT NULL,
  `fuente` VARCHAR(20) DEFAULT NULL,
  `compania` VARCHAR(50) DEFAULT NULL,
  `celular_sin_espacio` VARCHAR(25) DEFAULT NULL,
  `documento` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `id2` (`dni`, `sexo`),
  KEY `id3` (`email`),
  KEY `celular1` (`celular1`),
  KEY `id` (`documento`, `sexo`)
) engine = myisam auto_increment = 1413452 DEFAULT charset = latin1;INSERT INTO tabla_final_aux2
SELECT
  *
FROM
  tabla_final;########################################################################################################
CREATE TABLE tabla_mails_to_puma_validos(
  mail VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/actualizar.csv' INTO TABLE tabla_mails_to_puma_validos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  datos.to_puma
ADD
  COLUMN mail_valido TINYINT(1) DEFAULT 0;ALTER TABLE
  datos.to_puma
ADD
  INDEX mail1(mail1);ALTER TABLE
  tabla_mails_to_puma_validos
ADD
  INDEX mail(mail);UPDATE
  datos.to_puma a
  INNER JOIN tabla_mails_to_puma_validos b ON a.mail1 = b.mail
SET
  mail_valido = 1;########################################################################################################
DROP
  TABLE temp_tabla_feria_del_libro;CREATE TABLE temp_tabla_feria_del_libro(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  anio_nac VARCHAR(10),
  mes_nac VARCHAR(10),
  dia_nac VARCHAR(10),
  email VARCHAR(80),
  telefono VARCHAR(80),
  celular VARCHAR(80)
);########################################################################################################
SELECT
  *
FROM
  temp_mario.tabla_periodico_concurrente2;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, documento, barrio, fijo1,
  celular, mail1, id_archivo, sexo,
  domicilio
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  dni,
  barrio,
  telefono,
  celular,
  email,
  id_archivo,
  sexo,
  direccion
FROM
  temp_mario.tabla_periodico_concurrente2;ALTER TABLE
  temp_mario.tabla_periodico_concurrente2
ADD
  COLUMN direccion VARCHAR(80);UPDATE
  temp_mario.tabla_periodico_concurrente2
SET
  direccion = Trim(
    Concat(
      calle, " ", altura, " ", piso, depto
    )
  ) #hecho
  ########################################################################################################
  INSERT INTO datos.to_puma(
    nombre, apellido, domicilio, mail1,
    id_archivo
  ) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  localidad,
  email,
  id_archivo
FROM
  temp_mario.tabla_periodico_rebotes_bajas;########################################################################################################
INSERT INTO datos.to_puma(
  nombre, apellido, documento, mail1,
  fijo1, domicilio, fijo2, id_archivo,
  sexo
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  dni,
  email,
  telefono1,
  domicilio,
  telefono2,
  id_archivo,
  sexo
FROM
  temp_mario.tabla_periodico_llamados;########################################################################################################
LOAD data local INFILE 'C:/Users/Administrador/feria del libro.csv' INTO TABLE temp_tabla_feria_del_libro CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_feria_del_libro
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11901;INSERT INTO datos.to_puma(
  nombre, apellido, anio_nac, mes_nac,
  dia_nac, mail1, fijo1, celular, id_archivo
) #id archivoooooooooooo
SELECT
  nombre,
  apellido,
  anio_nac,
  mes_nac,
  dia_nac,
  email,
  telefono,
  celular,
  id_archivo
FROM
  temp_tabla_feria_del_libro;########################################################################################################
DROP
  TABLE temp_tabla_bafici_total;CREATE TABLE temp_tabla_bafici_total(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  email VARCHAR(80),
  barrio VARCHAR(80),
  celular VARCHAR(80),
  anio_nac VARCHAR(10)
);load data local INFILE 'C:/Users/Administrador/BAFICI 2012 Total.csv' INTO TABLE temp_tabla_bafici_total CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;SELECT
  Count(*)
FROM
  temp_tabla_bafici_total
WHERE
  celular IS NOT NULL
  AND celular <> "";ALTER TABLE
  temp_tabla_bafici_total
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11804;SELECT
  *
FROM
  temp_tabla_bafici_total;INSERT INTO datos.to_puma(
  nombre, apellido, mail1, barrio, celular,
  anio_nac, id_archivo
) #id archivoooooooooooo
SELECT
  apellido,
  nombre,
  email,
  barrio,
  celular,
  anio_nac,
  id_archivo
FROM
  temp_tabla_bafici_total;########################################################################################################
CREATE TABLE temp_tabla_email_bafici_2010(
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  email VARCHAR(80),
  barrio VARCHAR(80),
  celular VARCHAR(40),
  telefono VARCHAR(40),
  calle VARCHAR(120)
);load data local INFILE 'C:/Users/Administrador/Emails BAFICI 2010.csv' INTO TABLE temp_tabla_email_bafici_2010 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_email_bafici_2010
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11803;SELECT
  Count(*)
FROM
  temp_tabla_email_bafici_2010
WHERE
  (
    telefono <> ""
    AND telefono IS NOT NULL
  )
  OR (
    celular <> ""
    AND celular IS NOT NULL
  );INSERT INTO datos.to_puma(
  apellido, nombre, mail1, barrio, celular,
  fijo1, domicilio, id_archivo
) #id archivoooooooooooo
SELECT
  apellido,
  nombre,
  email,
  barrio,
  celular,
  telefono,
  calle,
  id_archivo
FROM
  temp_tabla_email_bafici_2010;########################################################################################################
DROP
  TABLE temp_tabla_copia_bafici;CREATE TABLE temp_tabla_copia_bafici(
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  email VARCHAR(80),
  telefono1 VARCHAR(80),
  telefono2 VARCHAR(80),
  calle VARCHAR(120)
);SELECT
  Count(*)
FROM
  temp_tabla_copia_bafici
WHERE
  (
    telefono1 <> ""
    AND telefono1 IS NOT NULL
  )
  OR (
    telefono2 <> ""
    AND telefono2 IS NOT NULL
  );load data local INFILE 'C:/Users/Administrador/copia de base bafici 2010.csv' INTO TABLE temp_tabla_copia_bafici CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_copia_bafici
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11802;INSERT INTO datos.to_puma(
  apellido, nombre, mail1, fijo1, fijo2,
  domicilio, id_archivo
) #id archivoooooooooooo
SELECT
  apellido,
  nombre,
  email,
  telefono1,
  telefono2,
  calle,
  id_archivo
FROM
  temp_tabla_copia_bafici;########################################################################################################
CREATE TABLE temp_tabla_bafici_2011(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  barrio VARCHAR(80),
  anio_nac VARCHAR(10),
  email VARCHAR(80),
  celular VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/bafici 2011.csv' INTO TABLE temp_tabla_bafici_2011 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_bafici_2011
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11801;INSERT INTO datos.to_puma(
  apellido, nombre, barrio, anio_nac,
  mail1, celular, id_archivo
)
SELECT
  apellido,
  nombre,
  barrio,
  anio_nac,
  email,
  celular,
  id_archivo
FROM
  temp_tabla_bafici_2011;########################################################################################################
CREATE TABLE temp_tabla_defu(
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  sexo VARCHAR(1),
  tipo VARCHAR(25),
  dni VARCHAR(40),
  f_def VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/defu.csv' INTO TABLE temp_tabla_defu CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_defu
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11705;########################################################################################################
DROP
  TABLE temp_tabla_prefectura;CREATE TABLE temp_tabla_prefectura(
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  domicilio VARCHAR(80),
  localidad VARCHAR(80),
  cpo VARCHAR(10),
  provincia VARCHAR(80),
  telefono VARCHAR(85),
  celular VARCHAR(85),
  email VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/padron.csv' INTO TABLE temp_tabla_prefectura CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_prefectura
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11601;INSERT INTO datos.to_puma(
  apellido, nombre, domicilio, cod_postal,
  fijo1, celular, mail1
)
SELECT
  apellido,
  nombre,
  domicilio,
  cpo,
  telefono,
  celular,
  email
FROM
  temp_tabla_prefectura;UPDATE
  datos.to_puma
SET
  id_archivo = 11601
WHERE
  id_archivo = "";INSERT INTO datos.to_puma_copia
SELECT
  *
FROM
  datos.to_puma;########################################################################################################
DROP
  TABLE temp_tabla_medicos;CREATE TABLE temp_tabla_medicos(
  nombre VARCHAR(80),
  dni VARCHAR(15)
);load data local INFILE 'C:/Users/Administrador/medicos.csv' INTO TABLE temp_tabla_medicos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_medicos
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11503;########################################################################################################
DROP
  TABLE temp_tabla_mails_medicos;CREATE TABLE temp_tabla_mails_medicos(
  mail VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mails_medicos.csv' INTO TABLE tabla_mails_medicos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_mails_medicos
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11502;ALTER TABLE
  tabla_mails_medicos RENAME temp_tabla_mails_medicos;SELECT
  *
FROM
  temp_tabla_mails_medicos;INSERT INTO datos.to_puma(mail1, id_archivo)
SELECT
  mail,
  id_archivo
FROM
  temp_tabla_mails_medicos;########################################################################################################
ALTER TABLE
  temp_mario.`table_colonia_deportes`
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11101;SELECT
  *
FROM
  temp_mario.table_colonia_deportes;INSERT INTO datos.to_puma(
  nombre, apellido, fijo1, celular, mail1,
  id_archivo
)
SELECT
  nombre,
  apellido,
  telefono,
  celular,
  email,
  id_archivo
FROM
  temp_mario.table_colonia_deportes;DELETE FROM
  datos.to_puma
WHERE
  id_archivo = 11302;SELECT
  Count(*)
FROM
  datos.to_puma;DROP
  TABLE temp_tabla_listado1;CREATE TABLE temp_tabla_listado1(
  nombre1 VARCHAR(80),
  nombre2 VARCHAR(80),
  nombre3 VARCHAR(80),
  nombre4 VARCHAR(80),
  nombre5 VARCHAR(80),
  nombre6 VARCHAR(80),
  dni VARCHAR(20)
);load data local INFILE 'C:/Users/Administrador/listado 1.csv' sssssssss #no cargar
INTO TABLE temp_tabla_listado1 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  temp_tabla_listado1
ADD
  COLUMN nombre VARCHAR(80);ALTER TABLE
  temp_tabla_listado1
ADD
  COLUMN apellido VARCHAR(80);ALTER TABLE
  temp_tabla_listado1
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  temp_tabla_listado1
ADD
  INDEX nombre1(nombre);ALTER TABLE
  temp_tabla_listado1
ADD
  INDEX nombre2(nombre);ALTER TABLE
  temp_tabla_listado1
ADD
  INDEX nombre3(nombre);ALTER TABLE
  temp_tabla_listado1
ADD
  INDEX nombre4(nombre);ALTER TABLE
  temp_tabla_listado1
ADD
  INDEX nombre5(nombre);ALTER TABLE
  temp_tabla_listado1
ADD
  INDEX nombre6(nombre);UPDATE
  temp_tabla_listado1 a
  JOIN puma.padron_nombresfemenino b ON a.nombre1 = b.nombre1;SELECT
  *
FROM
  temp_tabla_listado1;########################################################################################################
CREATE TABLE `temp_tabla_vacaciones_inv_agus` (
  `nombre` VARCHAR(80) DEFAULT NULL,
  `apellido` VARCHAR(80) DEFAULT NULL,
  anio_nac VARCHAR(15),
  mes_nac VARCHAR(15),
  dia_nac VARCHAR(15),
  `provincia` VARCHAR(80) DEFAULT NULL,
  `localidad` VARCHAR(80) DEFAULT NULL,
  `email` VARCHAR(80) DEFAULT NULL,
  `telefono` VARCHAR(80) DEFAULT NULL,
  `celular` VARCHAR(80) DEFAULT NULL,
  `id` INT(4) NOT NULL auto_increment,
  `id_archivo` VARCHAR(10) DEFAULT '11102',
  PRIMARY KEY (`id`)
) engine = myisam auto_increment = 27 DEFAULT charset = latin1;load data local INFILE 'C:/Users/Administrador/tabla_vacaciones_inv_agus.csv' INTO TABLE temp_tabla_vacaciones_inv_agus CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;########################################################################################################
CREATE TABLE `temp_tabla_tc_silvia` (
  `nombre` VARCHAR(80) DEFAULT NULL,
  `apellido` VARCHAR(80) DEFAULT NULL,
  anio_nac VARCHAR(15),
  mes_nac VARCHAR(15),
  dia_nac VARCHAR(15),
  `provincia` VARCHAR(80) DEFAULT NULL,
  `ciudad` VARCHAR(80) DEFAULT NULL,
  `email` VARCHAR(80) DEFAULT NULL,
  `telefono` VARCHAR(80) DEFAULT NULL,
  `celular` VARCHAR(80) DEFAULT NULL,
  `id` INT(4) NOT NULL auto_increment,
  `id_archivo` VARCHAR(10) DEFAULT '11101',
  PRIMARY KEY (`id`)
) engine = myisam auto_increment = 6078 DEFAULT charset = latin1;load data local INFILE 'C:/Users/Administrador/tabla_tc_silvia.csv' INTO TABLE temp_tabla_tc_silvia CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;########################################################################################################
CREATE TABLE `temp_tabla_entrenamiento_fpe` (
  `nombre` VARCHAR(80) DEFAULT NULL,
  `apellido` VARCHAR(80) DEFAULT NULL,
  `dni` VARCHAR(80) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT NULL,
  `email` VARCHAR(80) DEFAULT NULL,
  `nacimiento` VARCHAR(20) DEFAULT NULL,
  `contacto` VARCHAR(80) DEFAULT NULL,
  `id` INT(4) NOT NULL auto_increment,
  `id_archivo` VARCHAR(10) DEFAULT '11403',
  PRIMARY KEY (`id`)
) engine = myisam auto_increment = 170 DEFAULT charset = latin1;load data local INFILE 'C:/Users/Administrador/tabla_entrenamiento_entrevista.csv' INTO TABLE tabla_entrenamiento_entrevista_temp CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_entrenamiento_entrevista_temp
ADD
  COLUMN id_archivo VARCHAR(10) DEFAULT 11402;INSERT INTO datos.to_puma(
  nombre, apellido, documento, sexo,
  mail1, anio_nac, id_archivo
)
SELECT
  nombre,
  apellido,
  dni,
  sexo,
  email,
  nacimiento,
  id_archivo
FROM
  temp_tabla_entrenamiento_fpe;########################################################################################################
CREATE TABLE tabla_update_tabla_final(
  id VARCHAR(15),
  telefono1 VARCHAR(25),
  telefono2 VARCHAR(25),
  celular1 VARCHAR(25),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/tabla_final_numeros.csv' INTO TABLE tabla_update_tabla_final CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final b ON a.id = b.id
SET
  a.telefono1 = b.telefono1,
  a.telefono2 = b.telefono2,
  a.celular1 = b.celular1;SELECT
  *
FROM
  tabla_update_tabla_final_telefono1_int
LIMIT
  1;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono1_int b ON a.id = b.id
SET
  a.celular1 = b.celular,
  a.compania = b.compania
WHERE
  (
    a.celular1 = ""
    OR a.celular1 IS NULL
  )
  AND b.celular <> "";UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2_int b ON a.id = b.id
SET
  a.celular1 = b.celular,
  a.compania = b.compania
WHERE
  (
    a.celular1 = ""
    OR a.celular1 IS NULL
  )
  AND b.celular <> "";UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_celulares_int b ON a.id = b.id
SET
  a.celular1 = b.celular,
  a.compania = b.compania
WHERE
  (
    a.celular1 = ""
    OR a.celular1 IS NULL
  )
  AND b.celular <> "";########################################################################################################
ALTER TABLE
  tabla_reuniones
ADD
  COLUMN id INT auto_increment PRIMARY KEY;ALTER TABLE
  tabla_reuniones
ADD
  INDEX id(id);SELECT
  *
FROM
  tabla_reuniones
LIMIT
  1;SELECT
  telefono,
  celular,
  mail,
  id
FROM
  tabla_reuniones
WHERE
  telefono <> ""
  OR celular <> ""
  OR mail <> ""
LIMIT
  9999;DROP
  TABLE tabla_update_telefonos_reuniones;CREATE TABLE tabla_update_telefonos_reuniones(
  id VARCHAR(10),
  telefono VARCHAR(15),
  celular VARCHAR(15),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/numeracion reuniones telefonos.csv' INTO TABLE tabla_update_telefonos_reuniones CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_telefonos_reuniones
ADD
  INDEX id(id);DROP
  TABLE tabla_update_celulares_reuniones;CREATE TABLE tabla_update_celulares_reuniones(
  id VARCHAR(10),
  telefono VARCHAR(15),
  celular VARCHAR(15),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/numeracion reuniones celulares.csv' INTO TABLE tabla_update_celulares_reuniones CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_celulares_reuniones
ADD
  INDEX id(id);DROP
  TABLE tabla_update_mails_reuniones;CREATE TABLE tabla_update_mails_reuniones(
  id VARCHAR(10),
  mail VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/numeracion reuniones mails.csv' INTO TABLE tabla_update_mails_reuniones CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_mails_reuniones
ADD
  INDEX id(id);SELECT
  *
FROM
  tabla_reuniones
LIMIT
  9999;UPDATE
  tabla_reuniones a
  INNER JOIN tabla_update_telefonos_reuniones b ON a.id = b.id
SET
  a.telefono = b.telefono
WHERE
  b.telefono <> "";UPDATE
  tabla_reuniones a
  INNER JOIN tabla_update_telefonos_reuniones b ON a.id = b.id
SET
  a.celular = b.celular
WHERE
  b.celular <> "";UPDATE
  tabla_reuniones a
  INNER JOIN tabla_update_celulares_reuniones b ON a.id = b.id
SET
  a.telefono = b.telefono
WHERE
  b.telefono <> "";UPDATE
  tabla_reuniones a
  INNER JOIN tabla_update_celulares_reuniones b ON a.id = b.id
SET
  a.celular = b.celular
WHERE
  b.celular <> "";UPDATE
  tabla_reuniones a
  INNER JOIN tabla_update_mails_reuniones b ON a.id = b.id
SET
  a.mail = b.mail;########################################################################################################
DROP
  TABLE tabla_reuniones #####;CREATE TABLE tabla_reuniones(
    nombre VARCHAR(80),
    apellido VARCHAR(80),
    fecha_nac VARCHAR(80),
    tipo VARCHAR(80),
    documento VARCHAR(80),
    sexo VARCHAR(80),
    calle VARCHAR(80),
    altura VARCHAR(80),
    piso VARCHAR(80),
    dpto VARCHAR(80),
    barrio VARCHAR(80),
    comuna VARCHAR(80),
    telefono VARCHAR(80),
    celular VARCHAR(80),
    mail VARCHAR(80),
    evento VARCHAR(480),
    comunicacion VARCHAR(80),
    id_reunion VARCHAR(80)
  );load data local INFILE 'C:/Users/Administrador/reuniones.csv' INTO TABLE tabla_reuniones CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_reuniones
ADD
  (
    educacion TINYINT(1) DEFAULT 0,
    bacheos TINYINT(1) DEFAULT 0,
    vida_saludable TINYINT(1) DEFAULT 0,
    deportes TINYINT(1) DEFAULT 0,
    seguridad TINYINT(1) DEFAULT 0,
    poda TINYINT(1) DEFAULT 0,
    transito_y_transporte TINYINT(1) DEFAULT 0,
    limpieza TINYINT(1) DEFAULT 0,
    veredas TINYINT(1) DEFAULT 0,
    cultura TINYINT(1) DEFAULT 0,
    reuniones_presenciales TINYINT(1) DEFAULT 0
  );ALTER TABLE
  tabla_reuniones
ADD
  (
    mensaje_telefonico TINYINT(1) DEFAULT 0,
    facebook TINYINT(1) DEFAULT 0,
    twitter TINYINT(1) DEFAULT 0,
    por_un_tercero TINYINT(1) DEFAULT 0,
    volante TINYINT(1) DEFAULT 0
  );UPDATE
  tabla_reuniones
SET
  educacion = 1
WHERE
  Locate("educacion", evento);UPDATE
  tabla_reuniones
SET
  bacheos = 1
WHERE
  Locate("bacheos", evento);UPDATE
  tabla_reuniones
SET
  vida_saludable = 1
WHERE
  Locate("vida saludable", evento);UPDATE
  tabla_reuniones
SET
  deportes = 1
WHERE
  Locate("deportes", evento);UPDATE
  tabla_reuniones
SET
  seguridad = 1
WHERE
  Locate("seguridad", evento);UPDATE
  tabla_reuniones
SET
  poda = 1
WHERE
  Locate("poda", evento);UPDATE
  tabla_reuniones
SET
  transito_y_transporte = 1
WHERE
  Locate("transito y transporte", evento);UPDATE
  tabla_reuniones
SET
  limpieza = 1
WHERE
  Locate("limpieza", evento);UPDATE
  tabla_reuniones
SET
  veredas = 1
WHERE
  Locate("veredas", evento);UPDATE
  tabla_reuniones
SET
  cultura = 1
WHERE
  Locate("cultura", evento);UPDATE
  tabla_reuniones
SET
  reuniones_presenciales = 1
WHERE
  Locate(
    "reuniones presenciales", evento
  );UPDATE
  tabla_reuniones
SET
  mensaje_telefonico = 1
WHERE
  Locate(
    "mensaje telefonico", comunicacion
  );UPDATE
  tabla_reuniones
SET
  facebook = 1
WHERE
  Locate("facebook", comunicacion);UPDATE
  tabla_reuniones
SET
  twitter = 1
WHERE
  Locate("twitter", comunicacion);UPDATE
  tabla_reuniones
SET
  por_un_tercero = 1
WHERE
  Locate("por un tercero", comunicacion);UPDATE
  tabla_reuniones
SET
  volante = 1
WHERE
  Locate("volante", comunicacion);UPDATE
  tabla_reuniones a
  INNER JOIN puma.padron_nombresmasculino b ON a.nombre = b.nombres
SET
  sexo = "m";UPDATE
  tabla_reuniones a
  INNER JOIN puma.padron_nombresfemenino b ON a.nombre = b.nombres
SET
  sexo = "f";INSERT INTO tabla_reuniones (
  nombre, apellido, fecha_nac, tipo,
  documento, sexo, calle, altura, piso,
  dpto, barrio, comuna, telefono, celular,
  mail, evento, comunicacion, id_reunion
)
SELECT
  nombre,
  apellido,
  fecha_nacimiento,
  tipo,
  documento,
  sexo,
  calle,
  altura,
  piso,
  dpto,
  barrio,
  comuna,
  telefono,
  celular,
  mail,
  evento,
  comunicacion,
  id_reunion
FROM
  puma.enri_concurrentes_reuniones;SELECT
  *
FROM
  tabla_reuniones;SELECT
  *
FROM
  puma.enri_concurrentes_reuniones
LIMIT
  2000;################################################################################################################
CREATE TABLE tabla_update_vecinos_telefonos_int(
  dni VARCHAR(25),
  sexo VARCHAR(1),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_vecinos_telefonos_sin_11.csv' INTO TABLE tabla_update_vecinos_telefonos_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_vecinos_telefonos_int
ADD
  COLUMN fuente VARCHAR(4);UPDATE
  tabla_update_vecinos_telefonos_int
SET
  fuente = 37;ALTER TABLE
  tabla_update_vecinos_telefonos_int
ADD
  INDEX id(dni, sexo);ALTER TABLE
  tabla_datos_telefonos_vecinos
ADD
  INDEX id2(dni, sexo);INSERT INTO tabla_datos_telefonos_vecinos (
  dni, sexo, telefono, celular, fuente,
  compania
)
SELECT
  dni,
  sexo,
  telefono,
  celular,
  fuente,
  compania
FROM
  tabla_update_vecinos_telefonos_int
WHERE
  tabla_update_vecinos_telefonos_int.celular <> "";################################################################################################################
CREATE TABLE tabla_update_vecinos_celulares_int(
  dni VARCHAR(25),
  sexo VARCHAR(1),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_vecinos_celulares_sin_11.csv' INTO TABLE tabla_update_vecinos_celulares_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_vecinos_celulares_int
ADD
  COLUMN fuente VARCHAR(4);UPDATE
  tabla_update_vecinos_celulares_int
SET
  fuente = 37;ALTER TABLE
  tabla_update_vecinos_celulares_int
ADD
  INDEX id(dni, sexo);################################################################################################################
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#a la tabla tabla_datos_telefonos_vecinos le faltan la compania a muchos celulares.
#########################################################################################################
CREATE TABLE tabla_update_telefonos_creditos_int(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_creditos_telefonos_sin_11.csv' INTO TABLE tabla_update_telefonos_creditos_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_creditos
ADD
  COLUMN celular_sin_espacio VARCHAR(25);UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_telefonos_creditos_int b ON a.id = b.id
SET
  a.celular = b.celular
WHERE
  a.celular = ""
  AND b.celular <> "";UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_telefonos_creditos_int b ON a.id = b.id
SET
  a.celular_sin_espacio = b.celular
WHERE
  a.celular <> b.celular
  AND a.celular <> ""
  AND b.celular <> "";#########################################################################################################
DROP
  TABLE tabla_update_celulares_creditos_int;CREATE TABLE tabla_update_celulares_creditos_int(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_creditos_celulares_sin_11.csv' INTO TABLE tabla_update_celulares_creditos_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_celulares_creditos_int b ON a.id = b.id
SET
  a.telefono = b.telefono
WHERE
  a.telefono = "";UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_celulares_creditos_int b ON a.id = b.id
SET
  a.celular = b.celular
WHERE
  b.celular <> "";UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_celulares_creditos_int b ON a.id = b.id
SET
  a.celular_sin_espacio = b.celular
WHERE
  a.celular <> b.celular
  AND b.celular <> "";SELECT
  celular,
  celular_sin_espacio
FROM
  tabla_creditos
WHERE
  celular_sin_espacio IS NOT NULL;#########################################################################################################
CREATE TABLE tabla_update_tabla_final_telefono1_int(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_tfinal_telefono1_sin_11.csv' INTO TABLE tabla_update_tabla_final_telefono1_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;SELECT
  *
FROM
  tabla_update_tabla_final_telefono1_int;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono1_int b ON a.id = b.id
SET
  a.telefono1 = ""
WHERE
  a.telefono1 = b.telefono
  AND a.telefono1 <> "";UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono1_int b ON a.id = b.id
SET
  a.celular1 = b.celular
WHERE
  b.celular <> "";CREATE TABLE tabla_update_tabla_final_telefono2_int(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_tfinal_telefono2_sin_11.csv' INTO TABLE tabla_update_tabla_final_telefono2_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;SELECT
  *
FROM
  tabla_update_tabla_final_telefono2_int;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2_int b ON a.id = b.id
SET
  a.celular1 = b.celular
WHERE
  b.celular <> "";CREATE TABLE tabla_update_tabla_final_celulares_int(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion_tfinal_celular_sin_11.csv' INTO TABLE tabla_update_tabla_final_celulares_int CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_celulares_int b ON a.id = b.id
SET
  a.celular1 = b.celular
WHERE
  b.celular <> "";SELECT
  Count(*)
FROM
  tabla_final
WHERE
  Substr(telefono2, 1, 2) <> "11"
  AND telefono2 <> ""
  AND telefono2 IS NOT NULL;UPDATE
  tabla_final
SET
  telefono2 = ""
WHERE
  Substr(telefono2, 1, 2) <> "11"
  AND telefono2 <> ""
  AND telefono2 IS NOT NULL;#########################################################################################################
CREATE TABLE tabla_update_telefonos_militantes(
  id VARCHAR(10),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion telefonos_militantes.csv' INTO TABLE tabla_update_telefonos_militantes CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_militantes
ADD
  INDEX id(id);ALTER TABLE
  tabla_update_telefonos_militantes
ADD
  INDEX id(id);UPDATE
  tabla_militantes a
  INNER JOIN tabla_update_telefonos_militantes b ON a.id = b.id
SET
  a.telefono = b.telefono;UPDATE
  tabla_militantes a
  INNER JOIN tabla_update_telefonos_militantes b ON a.id = b.id
SET
  a.celular = b.celular
WHERE
  b.celular <> ""
  AND b.celular IS NOT NULL;CREATE TABLE tabla_update_celulares_militantes(
  id VARCHAR(10),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(50)
);load data local INFILE 'C:/Users/Administrador/Numeracion celulares_militantes.csv' INTO TABLE tabla_update_celulares_militantes CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_celulares_militantes
ADD
  INDEX id(id);UPDATE
  tabla_militantes a
  INNER JOIN tabla_update_celulares_militantes b ON a.id = b.id
SET
  a.celular = b.celular;UPDATE
  tabla_militantes a
  INNER JOIN tabla_update_celulares_militantes b ON a.id = b.id
SET
  a.telefono = b.telefono
WHERE
  b.telefono <> ""
  AND b.telefono IS NOT NULL;##########################################################################################################
ALTER TABLE
  tabla_creditos
ADD
  COLUMN id INT auto_increment PRIMARY KEY;CREATE TABLE tabla_update_telefonos_creditos(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/Numeracion telefonos creditos.csv' INTO TABLE tabla_update_telefonos_creditos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_telefonos_creditos
ADD
  INDEX id(id);SELECT
  *
FROM
  tabla_update_telefonos_creditos;ALTER TABLE
  tabla_creditos
ADD
  COLUMN compania VARCHAR(50);UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_telefonos_creditos b ON a.id = b.id
SET
  a.telefono = b.telefono
WHERE
  b.compania = "";UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_telefonos_creditos b ON a.id = b.id
SET
  a.celular = b.telefono
WHERE
  b.compania <> "";UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_telefonos_creditos b ON a.id = b.id
SET
  a.compania = b.compania
WHERE
  a.celular = b.telefono
  AND b.compania <> "";SELECT
  *
FROM
  tabla_creditos
WHERE
  compania IS NOT NULL;##########################################################################################################
CREATE TABLE tabla_update_celulares_creditos(
  id VARCHAR(15),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/Numeracion celulares creditos.csv' INTO TABLE tabla_update_celulares_creditos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_celulares_creditos
ADD
  INDEX id(id);UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_celulares_creditos b ON a.id = b.id
SET
  a.celular = b.celular,
  a.compania = b.compania
WHERE
  a.celular <> "";UPDATE
  tabla_creditos a
  INNER JOIN tabla_update_celulares_creditos b ON a.id = b.id
SET
  a.telefono = b.telefono
WHERE
  b.telefono <> "";SELECT
  *
FROM
  tabla_creditos;##########################################################################################################
CREATE TABLE tabla_update_vecinos_telefonos(
  dni VARCHAR(25),
  sexo VARCHAR(1),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/Telefonos_vecinos.csv' INTO TABLE tabla_update_vecinos_telefonos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;DROP
  TABLE tabla_datos_telefonos_vecinos;CREATE TABLE `tabla_datos_telefonos_vecinos` (
  `dni` VARCHAR(40) DEFAULT NULL,
  `sexo` VARCHAR(1) DEFAULT NULL,
  `telefono` VARCHAR(40) DEFAULT NULL,
  `celular` VARCHAR(40) DEFAULT NULL,
  `fuente` VARCHAR(5) DEFAULT NULL
) engine = myisam DEFAULT charset = latin1;INSERT INTO tabla_datos_telefonos_vecinos
SELECT
  *
FROM
  tabla_datos_telefonos_vecinos_copia;ALTER TABLE
  tabla_datos_telefonos_vecinos
ADD
  COLUMN compania VARCHAR(50);ALTER TABLE
  tabla_datos_telefonos_vecinos
ADD
  INDEX dnisexo(dni, sexo);ALTER TABLE
  tabla_update_vecinos_telefonos
ADD
  INDEX dnisexo(dni, sexo);UPDATE
  tabla_datos_telefonos_vecinos a
  INNER JOIN tabla_update_vecinos_telefonos b ON a.dni = b.dni
  AND a.sexo = b.sexo
SET
  a.telefono = b.telefono
WHERE
  b.dni IS NOT NULL
  AND b.dni <> "null";UPDATE
  tabla_datos_telefonos_vecinos a
  INNER JOIN tabla_update_vecinos_telefonos b ON a.dni = b.dni
  AND a.sexo = b.sexo
SET
  a.celular = b.celular,
  a.compania = b.compania
WHERE
  b.dni IS NOT NULL
  AND b.dni <> "null";#######################################################################################################################
CREATE TABLE tabla_update_vecinos_celulares(
  dni VARCHAR(25),
  sexo VARCHAR(1),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/Celulares_vecinos.csv' INTO TABLE tabla_update_vecinos_celulares CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_vecinos_celulares
ADD
  INDEX dni(dni);UPDATE
  tabla_datos_telefonos_vecinos a
  INNER JOIN tabla_update_vecinos_celulares b ON a.dni = b.dni
  AND a.sexo = b.sexo
SET
  a.celular = b.celular,
  a.compania = b.compania
WHERE
  b.dni IS NOT NULL
  AND b.dni <> "null";UPDATE
  tabla_datos_telefonos_vecinos a
  INNER JOIN tabla_update_vecinos_celulares b ON a.dni = b.dni
  AND a.sexo = b.sexo
SET
  a.telefono = b.telefono
WHERE
  b.dni IS NOT NULL
  AND b.dni <> "null"
  AND (
    a.telefono = ""
    OR a.telefono IS NULL
  );SELECT
  *
FROM
  tabla_datos_telefonos_vecinos;#######################################################################################################################
UPDATE
  tabla_final
SET
  telefono1 = celular_sin_espacio
WHERE
  celular_sin_espacio <> ""
  AND celular_sin_espacio IS NOT NULL
  AND (
    telefono1 IS NULL
    OR telefono1 = ""
  );UPDATE
  tabla_final
SET
  telefono2 = celular_sin_espacio
WHERE
  celular_sin_espacio <> ""
  AND celular_sin_espacio IS NOT NULL
  AND (
    telefono1 IS NULL
    OR telefono1 = ""
  );ALTER TABLE
  tabla_final
ADD
  COLUMN compania VARCHAR(50);ALTER TABLE
  tabla_final
ADD
  COLUMN celular_sin_espacio VARCHAR(25);DROP
  TABLE tabla_update_tabla_final_celulares;CREATE TABLE tabla_update_tabla_final_celulares(
  dni VARCHAR(25),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/Numeracion_salida_celular.csv' INTO TABLE tabla_update_tabla_final_celulares CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_update_tabla_final_celulares
ADD
  INDEX dni(dni);SELECT
  *
FROM
  tabla_update_tabla_final_celulares;SELECT
  *
FROM
  tabla_final;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_celulares b ON a.id = b.dni
SET
  a.celular1 = b.celular
  AND a.compania = b.compania;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_celulares b ON a.id = b.dni
SET
  a.telefono1 = b.telefono
WHERE
  b.telefono <> ""
  AND (
    a.telefono1 IS NULL
    OR a.telefono1 = ""
  );UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_celulares b ON a.id = b.dni
SET
  a.telefono2 = b.telefono
WHERE
  b.telefono <> ""
  AND a.telefono1 IS NOT NULL
  AND a.telefono1 <> ""
  AND (
    a.telefono2 IS NULL
    OR a.telefono2 = ""
  );UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_celulares b ON a.id = b.dni
SET
  a.celular_sin_espacio = b.telefono
WHERE
  b.telefono <> ""
  AND a.telefono1 IS NOT NULL
  AND a.telefono1 <> ""
  AND a.telefono2 IS NOT NULL
  AND a.telefono2 <> "";SELECT
  *
FROM
  tabla_final
WHERE
  celular_sin_espacio <> "";UPDATE
  tabla_final
SET
  celular_sin_espacio = ""
WHERE
  celular_sin_espacio = telefono1
  OR celular_sin_espacio = telefono2;SELECT
  *
FROM
  tabla_final
WHERE
  celular_sin_espacio <> "";##################################################################################################################################
CREATE TABLE tabla_update_tabla_final_telefono1(
  dni VARCHAR(25),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/Numeracion_salida_telefono1.csv' INTO TABLE tabla_update_tabla_final_telefono1 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono1 b ON a.id = b.dni
SET
  a.telefono1 = b.telefono;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono1 b ON a.id = b.dni
SET
  a.celular1 = b.celular,
  a.compania = b.compania
WHERE
  b.celular <> ""
  AND (
    a.celular1 = ""
    OR a.celular1 IS NULL
  );ALTER TABLE
  tabla_final
ADD
  INDEX celular1(celular1);ALTER TABLE
  tabla_update_tabla_final_telefono1
ADD
  INDEX celular(celular);SELECT
  Count(*)
FROM
  tabla_update_tabla_final_telefono1;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono1 b ON a.celular1 = b.celular
SET
  a.compania = b.compania;##################################################################################################################################
CREATE TABLE tabla_update_tabla_final_telefono2(
  dni VARCHAR(25),
  telefono VARCHAR(25),
  celular VARCHAR(25),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/Numeracion_salida_telefono2.csv' INTO TABLE tabla_update_tabla_final_telefono2 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2 b ON a.id = b.dni
SET
  a.telefono2 = b.telefono
WHERE
  b.telefono = "";UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2 b ON a.id = b.dni
SET
  a.telefono1 = b.telefono
WHERE
  (
    a.telefono1 = ""
    OR a.telefono1 IS NULL
  )
  AND b.telefono <> "";UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2 b ON a.id = b.dni
SET
  a.telefono2 = b.telefono
WHERE
  (
    a.telefono1 <> ""
    AND a.telefono1 IS NOT NULL
  )
  AND b.telefono <> "";UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2 b ON a.id = b.dni
SET
  a.celular1 = b.celular,
  a.compania = b.compania
WHERE
  b.celular <> ""
  AND (
    a.celular1 = ""
    OR a.celular1 IS NULL
  );ALTER TABLE
  tabla_update_tabla_final_telefono2
ADD
  INDEX celular(celular);UPDATE
  tabla_final a
  INNER JOIN tabla_update_tabla_final_telefono2 b ON a.celular1 = b.celular
SET
  a.compania = b.compania
WHERE
  b.celular <> ""
  AND b.celular IS NOT NULL;###################################################################################
DROP
  TABLE puma.pumasf_contactos;CREATE TABLE puma.pumasf_contactos AS
SELECT
  documento,
  sexo,
  IF(mail1 <> '', 1, 0) AS TieneMail,
  IF(celular <> '', 1, 0) AS TieneCelular,
  IF(fijo1 <> '', 1, 0) AS TieneTelefono,
  0 AS NuevoMail,
  0 AS NuevoCelular,
  0 AS NuevoTelefono
FROM
  puma.pumasf;ALTER TABLE
  puma.pumasf_contactos
ADD
  INDEX id(documento, sexo);UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_final b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevomail = 1
WHERE
  Trim(email)<> ''
  AND email IS NOT NULL
  AND tienemail = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_final b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevocelular = 1
WHERE
  Trim(celular1)<> ''
  AND celular1 IS NOT NULL
  AND tienecelular = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_final b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevotelefono = 1
WHERE
  Trim(telefono1)<> ''
  AND telefono1 IS NOT NULL
  AND tienetelefono = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_creditos_unificados b ON a.documento = b.documento
  AND a.sexo = b.sexo
SET
  nuevomail = 1
WHERE
  mail = 1
  AND tienemail = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_creditos_unificados b ON a.documento = b.documento
  AND a.sexo = b.sexo
SET
  nuevocelular = 1
WHERE
  celular = 1
  AND tienecelular = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_creditos_unificados b ON a.documento = b.documento
  AND a.sexo = b.sexo
SET
  nuevotelefono = 1
WHERE
  telefono = 1
  AND tienetelefono = 0;SELECT
  *
FROM
  puma.enri_todovecinos;SELECT
  *
FROM
  tabla_congreso;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_militantes b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevomail = 1
WHERE
  Trim(email)<> ''
  AND email IS NOT NULL;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_militantes b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevocelular = 1
WHERE
  Trim(celular)<> ''
  AND celular IS NOT NULL
  AND tienecelular = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_militantes b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevotelefono = 1
WHERE
  Trim(telefono)<> ''
  AND telefono IS NOT NULL
  AND tienetelefono = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_accion_social b ON a.documento = b.documento
  AND a.sexo = b.sexo
SET
  nuevomail = 1
WHERE
  Trim(email)<> ''
  AND email IS NOT NULL
  AND tienemail = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_congreso b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevomail = 1
WHERE
  Trim(email)<> ''
  AND email IS NOT NULL
  AND tienemail = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_congreso b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevocelular = 1
WHERE
  Trim(celular)<> ''
  AND celular IS NOT NULL
  AND tienecelular = 0;UPDATE
  puma.pumasf_contactos a
  INNER JOIN tabla_congreso b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  nuevotelefono = 1
WHERE
  Trim(telefono)<> ''
  AND telefono IS NOT NULL
  AND tienetelefono = 0;SELECT
  Sum(tienemail) AS MailsEnPuma,
  Sum(tienecelular) AS CelularesEnPuma,
  Sum(tienetelefono) AS TelefonosEnPuma,
  Sum(nuevomail) AS NuevosMails,
  Sum(nuevocelular) AS NuevosCelulares,
  Sum(nuevotelefono) AS NuevosTelefonos
FROM
  puma.pumasf_contactos;SELECT
  *
FROM
  temp_simon.tabla_militantes;SELECT
  *
FROM
  tabla_final;SELECT
  *
FROM
  puma.data_mails_unicos
WHERE
  control_verificado = 1
LIMIT
  5000;SELECT
  Count(*)
FROM
  puma.enri_todovecinos
WHERE
  telefonofijo IS NOT NULL;SELECT
  *
FROM
  tabla_datos_telefonos_vecinos
LIMIT
  999999999999999;###################################################################################
CREATE TABLE tabla_accion_social(
  aniorib VARCHAR(5),
  nrorib VARCHAR(15),
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  fnac VARCHAR(15),
  sexo VARCHAR(1),
  email VARCHAR(80),
  plan VARCHAR(25),
  documento VARCHAR(40),
  sexo_d VARCHAR(40),
  p_bem VARCHAR(1),
  p_cps VARCHAR(1),
  p_fit VARCHAR(1),
  p_dtc VARCHAR(1),
  p_eet VARCHAR(1),
  p_adl VARCHAR(1),
  p_cp VARCHAR(1),
  p_ts VARCHAR(1),
  p_beg VARCHAR(1),
  p_bes VARCHAR(1),
  p_nf VARCHAR(1),
  p_690 VARCHAR(1),
  p_agd VARCHAR(1),
  p_cpi VARCHAR(1),
  p_cdi VARCHAR(1),
  p_caf VARCHAR(1),
  p_jgt VARCHAR(1),
  p_ecm VARCHAR(1),
  p_fd VARCHAR(1),
  p_dep VARCHAR(1),
  p_bec VARCHAR(1),
  p_rvf VARCHAR(1),
  p_ers VARCHAR(1),
  p_vc VARCHAR(1),
  p_lae VARCHAR(1),
  p_aep VARCHAR(1),
  p_mlu VARCHAR(1),
  p_ra VARCHAR(1)
);load data local INFILE 'C:/Users/Administrador/Accion_social.csv' INTO TABLE tabla_accion_social CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_accion_social
ADD
  COLUMN origen VARCHAR(3) DEFAULT "45";###################################################################################
CREATE TABLE tabla_congreso(
  cant VARCHAR(4),
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  empresa VARCHAR(120),
  dni VARCHAR(25),
  telefono VARCHAR(40),
  celular VARCHAR(40),
  pais VARCHAR(40),
  email VARCHAR(80),
  tipo_acred VARCHAR(40),
  dominacion VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/base de datos Congreso.csv' INTO TABLE tabla_congreso CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_congreso
ADD
  COLUMN origen VARCHAR(5) DEFAULT "44";ALTER TABLE
  tabla_congreso
ADD
  COLUMN sexo VARCHAR(1);UPDATE
  tabla_congreso a
  INNER JOIN puma.padron_nombresmasculino b ON a.nombre = b.nombres
SET
  a.sexo = "m";UPDATE
  tabla_congreso a
  INNER JOIN puma.padron_nombresfemenino b ON a.nombre = b.nombres
SET
  a.sexo = "f";SELECT
  *
FROM
  tabla_congreso;ALTER TABLE
  tabla_congreso
ADD
  INDEX cant(cant);ALTER TABLE
  tabla_congreso
ADD
  COLUMN compania VARCHAR(25);DROP
  TABLE tabla_actualizar_congreso;CREATE TABLE tabla_actualizar_congreso(
  cant VARCHAR(3),
  telefono VARCHAR(15),
  celular VARCHAR(15),
  compania VARCHAR(25)
);load data local INFILE 'C:/Users/Administrador/Numeracion_salida.csv' INTO TABLE tabla_actualizar_congreso CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_actualizar_congreso
ADD
  INDEX cant(cant);UPDATE
  tabla_congreso a
  INNER JOIN tabla_actualizar_congreso b ON a.cant = b.cant
SET
  a.telefono = b.telefono,
  a.celular = b.celular,
  a.compania = b.compania;SELECT
  id,
  telefono1,
  telefono2,
  celular1,
  celular2
FROM
  tabla_final
WHERE
  (
    telefono1 <> ""
    AND telefono1 IS NOT NULL
  )
  OR (
    celular1 <> ""
    AND celular1 IS NOT NULL
  )
LIMIT
  99999999999999999;####################################################################################
SELECT
  *
FROM
  puma.enri_accionsocial;SELECT
  Count(*)
FROM
  puma.enri_accionsocial;
-- 29302SELECT
  plan,
  Count(*) AS cuenta
FROM
  puma.enri_accionsocial
WHERE
  documento <> 0
GROUP BY
  plan
ORDER BY
  cuenta DESC;SELECT
  Sum(p_bem),
  Sum(p_cps),
  Sum(p_fit),
  Sum(p_dtc),
  Sum(p_eet),
  Sum(p_adl),
  Sum(p_cp),
  Sum(p_ts),
  Sum(p_beg),
  Sum(p_bes),
  Sum(p_nf),
  Sum(p_690),
  Sum(p_agd),
  Sum(p_cpi),
  Sum(p_cdi),
  Sum(p_caf),
  Sum(p_jgt),
  Sum(p_ecm),
  Sum(p_fd),
  Sum(p_dep),
  Sum(p_bec),
  Sum(p_rvf),
  Sum(p_ers),
  Sum(p_vc),
  Sum(p_lae),
  Sum(p_aep),
  Sum(p_mlu),
  Sum(p_ra)
FROM
  puma.enri_accionsocial
WHERE
  documento <> "";ALTER TABLE
  puma.enri_accionsocial
ADD
  COLUMN p_bem TINYINT DEFAULT 0;UPDATE
  puma.enri_accionsocial
SET
  p_bem = 1
WHERE
  Locate('BEM', plan)<> 0;####################################################################################
CREATE TABLE tabla_creditos_1(
  cuil VARCHAR(40),
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  edad VARCHAR(4),
  mail VARCHAR(80),
  calle VARCHAR(80),
  barrio VARCHAR(80),
  localidad VARCHAR(80),
  cpo VARCHAR(20),
  celular VARCHAR(40),
  telefono VARCHAR(40),
  estado VARCHAR(40),
  fecha VARCHAR(40),
  fuente VARCHAR(2)
);load data local INFILE 'C:/Users/Administrador/Creditos final 1.csv' INTO TABLE tabla_creditos_1 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;####################################################################################
DROP
  TABLE tabla_creditos_2;CREATE TABLE tabla_creditos_2(
  cuil VARCHAR(40),
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  edad VARCHAR(4),
  mail VARCHAR(80),
  calle VARCHAR(80),
  barrio VARCHAR(80),
  localidad VARCHAR(80),
  cpo VARCHAR(20),
  celular VARCHAR(40),
  telefono VARCHAR(40),
  estado VARCHAR(40),
  fecha VARCHAR(40),
  fuente VARCHAR(2)
);load data local INFILE 'C:/Users/Administrador/Creditos final 2.csv' INTO TABLE tabla_creditos_2 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;####################################################################################
CREATE TABLE tabla_creditos_3(
  cuil VARCHAR(40),
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  edad VARCHAR(4),
  mail VARCHAR(80),
  calle VARCHAR(80),
  barrio VARCHAR(80),
  localidad VARCHAR(80),
  cpo VARCHAR(20),
  celular VARCHAR(40),
  telefono VARCHAR(40),
  estado VARCHAR(40),
  fecha VARCHAR(40),
  fuente VARCHAR(2)
);load data local INFILE 'C:/Users/Administrador/Creditos final 3.csv' INTO TABLE tabla_creditos_3 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;####################################################################################
CREATE TABLE tabla_creditos_4(
  cuil VARCHAR(40),
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  edad VARCHAR(4),
  mail VARCHAR(80),
  calle VARCHAR(80),
  barrio VARCHAR(80),
  localidad VARCHAR(80),
  cpo VARCHAR(20),
  celular VARCHAR(40),
  telefono VARCHAR(40),
  estado VARCHAR(40),
  fecha VARCHAR(40),
  fuente VARCHAR(2)
);load data local INFILE 'C:/Users/Administrador/Creditos final 4.csv' INTO TABLE tabla_creditos_4 CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;####################################################################################
DROP
  TABLE tabla_creditos_c;CREATE TABLE tabla_creditos(
  cuil VARCHAR(40),
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  edad VARCHAR(4),
  mail VARCHAR(80),
  calle VARCHAR(80),
  barrio VARCHAR(80),
  localidad VARCHAR(80),
  cpo VARCHAR(20),
  celular VARCHAR(40),
  telefono VARCHAR(40),
  estado VARCHAR(40),
  fecha VARCHAR(40),
  fuente VARCHAR(2)
);INSERT INTO tabla_creditos
SELECT
  *
FROM
  tabla_creditos_1;INSERT INTO tabla_creditos
SELECT
  *
FROM
  tabla_creditos_2;INSERT INTO tabla_creditos
SELECT
  *
FROM
  tabla_creditos_3;INSERT INTO tabla_creditos
SELECT
  *
FROM
  tabla_creditos_4;###################################################################################################
ALTER TABLE
  tabla_creditos
ADD
  COLUMN en_puma VARCHAR(1);ALTER TABLE
  tabla_creditos
ADD
  COLUMN dni VARCHAR(40);ALTER TABLE
  tabla_creditos
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  tabla_creditos
ADD
  INDEX mail(mail);ALTER TABLE
  tabla_creditos
ADD
  INDEX nombre(nombre);ALTER TABLE
  tabla_creditos
ADD
  INDEX dni(dni);UPDATE
  tabla_creditos a
  INNER JOIN puma.data_mails b ON a.mail = b.mail
SET
  a.sexo = b.sexo,
  a.dni = b.documento,
  a.en_puma = b.pumasf
WHERE
  b.pumasf = 1;UPDATE
  tabla_creditos a
  INNER JOIN temporal.pumasf b ON a.dni = b.documento
  AND a.sexo = b.sexo
SET
  en_puma = 1;SELECT
  Count(*)
FROM
  tabla_creditos
WHERE
  en_puma IS NULL;UPDATE
  tabla_creditos a
  INNER JOIN puma.padron_nombresmasculino b ON a.nombre = b.nombres
SET
  a.sexo = "m";UPDATE
  tabla_creditos a
  INNER JOIN puma.padron_nombresfemenino b ON a.nombre = b.nombres
SET
  a.sexo = "f";UPDATE
  tabla_creditos
SET
  dni = Substring(cuil, 3, 8)
WHERE
  cuil <> "";############################################################################################################
DROP
  TABLE tabla_datos_mails_t_final;CREATE TABLE tabla_datos_mails_t_final(
  #tabla PARA actualizar
  mail VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mails(TablaFinal).csv' INTO TABLE tabla_datos_mails_t_final CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n';ALTER TABLE
  tabla_datos_mails_t_final
ADD
  COLUMN dni VARCHAR(40);ALTER TABLE
  tabla_datos_mails_t_final
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  tabla_datos_mails_t_final
ADD
  COLUMN fuente VARCHAR(5);ALTER TABLE
  tabla_datos_mails_t_final
ADD
  COLUMN nombre VARCHAR(80);ALTER TABLE
  tabla_datos_mails_t_final
ADD
  COLUMN apellido VARCHAR(80);ALTER TABLE
  tabla_datos_mails_t_final
ADD
  INDEX id2(mail);UPDATE
  tabla_datos_mails_t_final a
  INNER JOIN tabla_final b ON a.mail = b.email
SET
  a.dni = b.dni,
  a.sexo = b.sexo,
  a.fuente = b.origen;UPDATE
  tabla_datos_mails_t_final a
  INNER JOIN tabla_final b ON a.mail = b.email
SET
  a.nombre = b.nombre,
  a.apellido = b.apellido
WHERE
  b.dni IS NULL;UPDATE
  tabla_datos_mails_t_final a
  INNER JOIN puma.data_mails b ON a.mail = b.mail
SET
  a.dni = b.documento,
  a.sexo = b.sexo;SELECT
  *
FROM
  tabla_datos_mails_t_final
WHERE
  dni IS NULL
  AND nombre IS NULL
  AND apellido IS NULL;SELECT
  Count(*)
FROM
  tabla_datos_mails_t_final
WHERE
  dni IS NOT NULL;############################################################################################################
DROP
  TABLE tabla_datos_mails_vecinos;CREATE TABLE tabla_datos_mails_vecinos(
  #tabla PARA actualizar
  mail VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mails(TodoVecinos).csv' INTO TABLE tabla_datos_mails_vecinos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n';ALTER TABLE
  tabla_datos_mails_vecinos
ADD
  COLUMN dni VARCHAR(40);ALTER TABLE
  tabla_datos_mails_vecinos
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  tabla_datos_mails_vecinos
ADD
  COLUMN fuente VARCHAR(5);ALTER TABLE
  tabla_datos_mails_vecinos
ADD
  COLUMN verificado VARCHAR(80);UPDATE
  tabla_datos_mails_vecinos
SET
  fuente = 37;UPDATE
  tabla_datos_mails_vecinos a
  INNER JOIN puma.enri_todovecinos b ON a.mail = b.correoelectronico
SET
  a.dni = b.numerodocumento,
  a.sexo = b.sexo;############################################################################################################
DROP
  TABLE tabla_datos_telefonos_t_final;CREATE TABLE tabla_datos_telefonos_t_final(
  #tabla PARA actualizar
  dni VARCHAR(40),
  sexo VARCHAR(1),
  telefono1 VARCHAR(40),
  telefono2 VARCHAR(40),
  celular VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/telefonos (TablaFinal).csv' INTO TABLE tabla_datos_telefonos_t_final CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_datos_telefonos_t_final
ADD
  COLUMN fuente VARCHAR(5);ALTER TABLE
  tabla_datos_telefonos_t_final
ADD
  INDEX id(dni, sexo);UPDATE
  tabla_datos_telefonos_t_final a
  INNER JOIN tabla_final b ON a.dni = b.dni
  AND a.sexo = b.sexo
SET
  a.fuente = b.origen;############################################################################################################
DROP
  TABLE tabla_datos_telefonos_vecinos;CREATE TABLE tabla_datos_telefonos_vecinos(
  #tabla PARA actualizar
  dni VARCHAR(40),
  sexo VARCHAR(1),
  telefono VARCHAR(40),
  celular VARCHAR(40),
  fuente VARCHAR(5)
);load data local INFILE 'C:/Users/Administrador/telefonos(TodoVecinos).csv' INTO TABLE tabla_datos_telefonos_vecinos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n';############################################################################################################
SELECT
  mail,
  detalle_estado
FROM
  puma.data_mails_unicos
WHERE
  control_verificado = 1
LIMIT
  20000;#######################################################################################################
SELECT
  count(*)
FROM
  tabla_datos_telefonos_t_final
WHERE
  (
    telefono1 IS NOT NULL
    AND telefono1 <> ""
  )
  OR (
    telefono2 IS NOT NULL
    AND telefono2 <> ""
  );SELECT
  Count(*)
FROM
  tabla_datos_telefonos_t_final
WHERE
  celular IS NOT NULL
  AND celular <> "";#######################################################################################################
CREATE TABLE tabla_militantes(
  apellido VARCHAR(80),
  nombre VARCHAR(80),
  email VARCHAR(80),
  barrio VARCHAR(40),
  telefono VARCHAR(20),
  celular VARCHAR(20),
  direccion VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/Militantes PRO.csv' INTO TABLE tabla_militantes CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_militantes
ADD
  COLUMN en_puma VARCHAR(1);ALTER TABLE
  tabla_militantes
ADD
  INDEX email(email);ALTER TABLE
  tabla_militantes
ADD
  COLUMN score TINYINT(4);ALTER TABLE
  tabla_militantes
ADD
  COLUMN dni VARCHAR(40);ALTER TABLE
  tabla_militantes
ADD
  COLUMN sexo VARCHAR(1);ALTER TABLE
  tabla_militantes
ADD
  COLUMN id_puma MEDIUMINT(9);ALTER TABLE
  tabla_militantes
ADD
  COLUMN f58 VARCHAR (1);UPDATE
  tabla_militantes
SET
  f58 = 1
WHERE
  en_puma = 1;UPDATE
  tabla_militantes a
  INNER JOIN temporal.pumasf b ON a.dni = b.documento
  AND a.sexo = b.sexo
SET
  a.id_puma = b.id_puma;UPDATE
  tabla_militantes a
  INNER JOIN puma.data_mails b ON a.email = b.mail
SET
  a.sexo = b.sexo,
  a.dni = b.documento
WHERE
  b.pumasf = 1;UPDATE
  tabla_militantes a
  INNER JOIN puma.pumasf b ON a.dni = b.documento
SET
  a.score = b.score_pro
WHERE
  a.en_puma = 1;UPDATE
  tabla_militantes a
  INNER JOIN puma.data_mails b ON a.email = b.mail
SET
  a.en_puma = 1
WHERE
  b.pumasf = 1;ALTER TABLE
  tabla_militantes
ADD
  COLUMN barrio_puma VARCHAR(80);SELECT
  score,
  Count(*)
FROM
  tabla_militantes
WHERE
  en_puma = 1
GROUP BY
  score;SELECT
  barrio_puma,
  Count(*)
FROM
  tabla_militantes
WHERE
  en_puma = 1
GROUP BY
  barrio_puma;UPDATE
  tabla_militantes a
  INNER JOIN puma.pumasf b ON a.dni = b.documento
SET
  a.barrio_puma = b.g_u_barrio
WHERE
  a.en_puma = 1;#######################################################################################################
DELETE FROM
  tabla_datos_telefonos_vecinos
WHERE
  substring(telefono, 1, 2) <> 11
  AND telefono <> " "
  AND (
    celular = NULL
    OR celular = ""
  );UPDATE
  tabla_datos_telefonos_vecinos
SET
  telefono = ""
WHERE
  Length(telefono) <> 10
  AND telefono <> ""
  AND telefono IS NOT NULL
  AND telefono <> ""
  AND (
    celular <> NULL
    OR celular <> ""
  );DELETE FROM
  tabla_datos_telefonos_t_final
WHERE
  Substring(telefono1, 1, 2) <> 11
  AND (
    telefono2 IS NULL
    OR telefono2 = ""
  )
  AND (
    celular IS NULL
    OR celular = ""
  );UPDATE
  tabla_datos_telefonos_t_final
SET
  telefono1 = ""
WHERE
  Substring(telefono1, 1, 2) <> 11
  AND (
    telefono2 IS NOT NULL
    OR telefono2 <> ""
  )
  AND (
    celular IS NOT NULL
    OR celular <> ""
  );SELECT
  Count(*)
FROM
  tabla_datos_telefonos_vecinos
WHERE
  telefono IS NOT NULL
  AND telefono <> ""
  AND dni <> ""
  AND dni IS NOT NULL;DELETE FROM
  tabla_datos_telefonos_vecinos
WHERE
  Length(celular) <> 10
  AND celular <> ""
  AND celular IS NOT NULL
  AND celular <> ""
  AND (
    telefono = NULL
    OR telefono = ""
  );UPDATE
  tabla_datos_telefonos_vecinos
SET
  celular = ""
WHERE
  Length(celular) <> 10
  AND celular <> ""
  AND celular IS NOT NULL
  AND celular <> ""
  AND (
    telefono <> NULL
    OR telefono <> ""
  );SELECT
  Count(*)
FROM
  tabla_datos_telefonos_vecinos
WHERE
  (
    telefono IS NOT NULL
    AND telefono <> ""
  )
  AND dni <> ""
  AND dni IS NOT NULL
  AND sexo <> ""
  AND sexo IS NOT NULL;SELECT
  Count(*)
FROM
  tabla_datos_mails_vecinos
WHERE
  mail IS NOT NULL
  AND mail <> "";SELECT
  Count(*)
FROM
  tabla_datos_mails_vecinos
WHERE
  mail IS NOT NULL
  AND mail <> ""
  AND dni IS NULL
  OR dni = ""
  AND sexo IS NULL
  AND sexo = "";SELECT
  Count(*)
FROM
  puma.enri_todovecinos
WHERE
  correoelectronico IS NOT NULL
  AND correoelectronico <> ""
  AND numerodocumento IS NOT NULL
  AND numerodocumento <> ""
  AND sexo IS NOT NULL
  AND sexo <> "";SELECT
  Count(*)
FROM
  puma.enri_todovecinos
WHERE
  telefonocelular IS NOT NULL
  AND telefonocelular <> ""
  AND numerodocumento IS NOT NULL
  AND numerodocumento <> "";#######################################################################################################
DROP
  TABLE tabla_mails_t_final;CREATE TABLE tabla_mails_t_final (
  mails VARCHAR(80)
);DROP
  TABLE tabla_mails_vecinos;CREATE TABLE tabla_mails_vecinos (
  mails VARCHAR(80)
);load data local INFILE 'C:/Users/Administrador/mailsvecinos.csv' INTO TABLE tabla_mails_vecinos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;load data local INFILE 'C:/Users/Administrador/mailsfinal.csv' INTO TABLE tabla_mails_t_final CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_mails_t_final
ADD
  INDEX mail(mails);ALTER TABLE
  tabla_mails_vecinos
ADD
  INDEX mail(mails);CREATE TABLE tabla_telefonos_t_final(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  dni VARCHAR(40),
  sexo VARCHAR(1),
  telefono1 VARCHAR(40),
  telefono2 VARCHAR(40),
  celular VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/telefonos final.csv' INTO TABLE tabla_telefonos_t_final CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;#######################################################################################################
CREATE TABLE tabla_telefonos_corregidos(
  nombre VARCHAR(80),
  apellido VARCHAR(80),
  dni VARCHAR(30),
  sexo VARCHAR(1),
  telefono1 VARCHAR(40),
  telefono2 VARCHAR(40),
  celular1 VARCHAR(40),
  celular2 VARCHAR(40)
);load data local INFILE 'C:/Users/Administrador/telefonos final.csv' INTO TABLE tabla_telefonos_corregidos CHARACTER SET latin1 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;ALTER TABLE
  tabla_telefonos_corregidos
ADD
  INDEX dni(dni);ALTER TABLE
  tabla_mails_corregidos RENAME tabla_telefonos_corregidos;SELECT
  *
FROM
  tabla_telefonos_corregidos;SELECT
  comodin,
  Count(*)
FROM
  temporal.pumasf
GROUP BY
  comodin;UPDATE
  temporal.pumasf a
  INNER JOIN tabla_mails_corregidos b ON a.documento = b.dni
  AND a.sexo = b.sexo
SET
  comodin = 2;#######################################################################################################
SELECT
  nombre,
  apellido,
  dni,
  sexo,
  telefono1,
  telefono2,
  celular1,
  celular2
FROM
  tabla_final
WHERE
  (
    telefono1 IS NOT NULL
    AND telefono1 <> ""
    AND telefono1 <> " "
  )
  OR (
    celular1 IS NOT NULL
    AND celular1 <> ""
    AND celular1 <> " "
  )
LIMIT
  9999999999999999999;SELECT
  numerodocumento,
  sexo,
  correoelectronico
FROM
  puma.enri_todovecinos
WHERE
  correoelectronico <> ""
  AND correoelectronico IS NOT NULL
LIMIT
  9999999;ALTER TABLE
  puma.enri_todovecinos
ADD
  INDEX mail(correoelectronico);SELECT
  lugarresidencia_tipo,
  Count(*) LugarResidencia_Tipo
FROM
  puma.enri_todovecinos
GROUP BY
  lugarresidencia_tipo;SELECT
  *
FROM
  puma.enri_todovecinos
WHERE
  lugarresidencia_tipo = "provincia";INSERT INTO tabla_final (
  nombre, apellido, tipo, dni, sexo, email,
  acepta_recibir_info, telefono1,
  celular1
)
SELECT
  nombre,
  apellido,
  tipodocumento,
  numerodocumento,
  sexo,
  correoelectronico,
  suscriptonotificaciones,
  telefonofijo,
  telefonocelular
FROM
  puma.enri_todovecinos;####################################################################################################
CREATE TABLE tabla_updatetodovecinos (
  email VARCHAR(80),
  dni INT(11),
  sexo VARCHAR(1)
);load data local INFILE 'C:/Users/Administrador/update.csv' INTO TABLE tabla_updatetodovecinos CHARACTER SET utf8 fields TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' -- IGNORE 1 LINES
;SELECT
  *
FROM
  tabla_updatetodovecinos;DELETE FROM
  tabla_updatetodovecinos
WHERE
  dni IS NULL;ALTER TABLE
  puma.enri_todovecinos
ADD
  INDEX id(numerodocumento, sexo);ALTER TABLE
  tabla_updatetodovecinos
ADD
  INDEX id(dni, sexo);UPDATE
  puma.enri_todovecinos a
  INNER JOIN tabla_updatetodovecinos b ON a.numerodocumento = b.dni
  AND a.sexo = b.sexo
SET
  a.correoelectronico = b.email;ALTER TABLE
  puma.enri_todovecinos
ADD
  INDEX mail(correoelectronico);UPDATE
  tabla_final a
  INNER JOIN tabla_updatetodovecinos b ON a.dni = b.dni
  AND a.sexo = b.sexo
SET
  a.email = b.email;SELECT
  Count(*) AS cuenta
FROM
  puma.enri_todovecinos
WHERE
  correoelectronico <> ''
  AND correoelectronico IS NOT NULL;SELECT
  Count(*) email
FROM
  tabla_final
WHERE
  dni_en_puma = 1
  AND detalle_estado IS NULL
LIMIT
  99999999;UPDATE
  tabla_final
SET
  telefono1 = REPLACE(telefono1, "-", "");SELECT
  Count(*) AS cuenta
FROM
  tabla_datos_mails_t_final a
  INNER JOIN temporal.pumasf b ON a.dni = b.documento
  AND a.sexo = b.sexo
WHERE
  b.mail1 = ''
  AND a.mail IS NOT NULL
  AND a.mail <> '';SELECT
  Count(*) AS cuenta
FROM
  tabla_datos_mails_vecinos a
  INNER JOIN temporal.pumasf b ON a.dni = b.documento
  AND a.sexo = b.sexo
WHERE
  b.mail1 = ''
  AND a.mail IS NOT NULL
  AND a.mail <> '';#####################################################################################################
#copia de seguridad#
INSERT INTO tabla_seguridad3
SELECT
  *
FROM
  tabla_final;####################
ALTER TABLE
  tabla_final
DROP
  COLUMN dni_en_puma;ALTER TABLE
  tabla_final
ADD
  COLUMN dni_en_puma TINYINT(4);UPDATE
  tabla_final a
  INNER JOIN puma.pumasf b ON a.dni = b.documento
SET
  dni_en_puma = 1
WHERE
  a.sexo = b.sexo
  AND a.sexo <> ''
  AND a.sexo IS NOT NULL;SELECT
  dni_en_puma,
  Count(*)
FROM
  tabla_final
WHERE
  dni_en_puma = 1
GROUP BY
  dni_en_puma
ORDER BY
  dni_en_puma;################
UPDATE
  tabla_final
SET
  dni = REPLACE(dni, ".", "")
WHERE
  locate(".", dni);ALTER TABLE
  tabla_final
ADD
  COLUMN pumasf TINYINT(4),
ADD
  COLUMN eliminar TINYINT(4),
ADD
  COLUMN detalle_estado VARCHAR(200),
ADD
  COLUMN control_verificado TINYINT(4);ALTER TABLE
  tabla_final
ADD
  INDEX email(email);UPDATE
  tabla_final a
  INNER JOIN puma.data_mails_unicos b ON a.email = b.mail
SET
  a.pumasf = b.pumasf,
  a.eliminar = b.eliminar,
  a.detalle_estado = b.detalle_estado,
  a.control_verificado = b.control_verificado;SELECT
  -- detalle_estado, 
  Count(*)
FROM
  tabla_final
WHERE
  -- dni_en_puma =1 and 
  email IS NOT NULL
  AND email <> ''
  AND origen IS NULL -- group by detalle_estado order by detalle_estado;
  ;################
SELECT
  origen,
  count(*)
FROM
  tabla_final
GROUP BY
  origen;SELECT
  Count(*)
FROM
  puma.enri_todovecinos;SELECT
  Count(*)
FROM
  tabla_final
WHERE
  telefono1 IS NOT NULL
  AND Length(telefono1) > 4
  AND dni <> ""
  AND dni IS NOT NULL;SELECT
  Count(*)
FROM
  tabla_final
WHERE
  celular1 IS NOT NULL
  AND Length(celular1) > 6
  AND dni <> ""
  AND dni IS NOT NULL;SELECT
  celular1
FROM
  tabla_final
WHERE
  celular1 IS NOT NULL
  AND Length(celular1) > 6;UPDATE
  tabla_final
SET
  celular1 = REPLACE(celular1, "-", "");########################################################################################################
SHOW TABLE status;########################################################################################################
ALTER TABLE
  tabla_final modify COLUMN origen INT;SELECT
  origen,
  Count(*) AS cuenta
FROM
  tabla_final
WHERE
  email IS NOT NULL
  AND Length(email) > 5
  AND Locate("@", email)
  AND dni <> ""
  AND dni IS NOT NULL
  AND (
    sexo = "m"
    OR sexo = "f"
  )
GROUP BY
  origen
ORDER BY
  origen;SELECT
  origen,
  Count(*) AS cuenta
FROM
  tabla_final
WHERE
  email IS NOT NULL
  AND Length(email) > 5
  AND Locate("@", email)
  AND dni <> ""
  AND dni IS NOT NULL;SELECT
  *
FROM
  tabla_final;SELECT
  email
FROM
  tabla_36
WHERE
  Length(email) > 5
  AND Locate("@", email)
LIMIT
  9999999;SELECT
  Count(*)
FROM
  tabla_final
WHERE
  sexo <> "m"
  OR sexo <> "f";