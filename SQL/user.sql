CREATE DATABASE usermanagement DEFAULT CHARACTER SET utf8;
USE login
CREATE TABLE user(id SERIAL,login_id varchar(255)UNIQUE NOT NULL,name varchar(255)NOT NULL,birth_date DATE NOT NULL,password varchar(255)NOT NULL,create_date DATETIME NOT NULL,update_date DATETIME NOT NULL);
INSERT INTO user(login_id,name,birth_date,password,create_date,update_date)VALUES('admin','ä«óùé“',1111,'1214',cast('2009-08-03' as date),cast('2018-07-27' as date));
SELECT MD5('1214');