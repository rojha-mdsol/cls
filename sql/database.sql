-- psql -f sql/database.sql

DROP DATABASE IF EXISTS consumerlawyer;
CREATE DATABASE consumerlawyer;

\c consumerlawyer;

CREATE TYPE user_type AS ENUM ('consumer', 'lawyer');
CREATE TYPE salutation_type AS ENUM ('mr', 'mrs', 'miss');
CREATE TYPE sex_type AS ENUM ('male', 'female');

CREATE EXTENSION pgcrypto;

CREATE TABLE user_detail (
  ID UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR UNIQUE NOT NULL,
  type user_type NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR,
  title VARCHAR,
  sex sex_type NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  middle_name VARCHAR,
  last_login VARCHAR NOT NULL,
  last_logout VARCHAR
);

INSERT INTO user_detail (user_id, password, type, last_login, last_logout)
  VALUES ('ravi', 'password123', 'consumer');

INSERT INTO user_detail (user_id, password, type, last_login, last_logout)
  VALUES ('ravi01', 'password123', 'consumer');

INSERT INTO user_detail (user_id, password, type, last_login, last_logout)
  VALUES ('ravi_l', 'password123', 'lawyer');

INSERT INTO user_detail (user_id, password, type, last_login, last_logout)
  VALUES ('ravi_l01', 'password123', 'lawyer');

CREATE TABLE user_profile (
  ID UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR REFERENCES login_detail(user_id) ON DELETE CASCADE,
  practice VARCHAR,
  work_destination VARCHAR,
  field VARCHAR,
  introduction VARCHAR NOT NULL,
  address_1 VARCHAR,
  address_2 VARCHAR,
  address_3 VARCHAR,
  profile_image VARCHAR
);

INSERT INTO user_profile (
	user_id, email, title, sex, first_name, last_name, middle_name,
	work_destination, field, introduction, address_1, address_2, address_3, profile_image
) VALUES (
	'ravi', 'rbojha008@gmail.com', 'mr', 'male', 'ravi', 'ojha', '',
	'software_engineer', 'it', 'As it so contrasted oh estimating instrument. Size like body some one had. Are conduct viewing boy minutes warrant expense. Tolerably behaviour may admitting daughters offending her ask own. Praise effect wishes change way and any wanted. Lively use looked latter regard had. Do he it part more last in. Merits ye if mr narrow points. Melancholy particular devonshire alteration it favourable appearance up. ',
	'bangalore', '', '', 'ravi.png'
	);

INSERT INTO user_profile (
	user_id, email, title, sex, first_name, last_name, middle_name,
	work_destination, field, introduction, address_1, address_2, address_3, profile_image
) VALUES (
	'ravi01', 'rbojha008@gmail.com', 'mr', 'male', 'ravi', 'ojha', '',
	'software_engineer', 'it', 'As it so contrasted oh estimating instrument. Size like body some one had. Are conduct viewing boy minutes warrant expense. Tolerably behaviour may admitting daughters offending her ask own. Praise effect wishes change way and any wanted. Lively use looked latter regard had. Do he it part more last in. Merits ye if mr narrow points. Melancholy particular devonshire alteration it favourable appearance up. ',
	'bangalore', '', '', 'ravi.png'
	);

INSERT INTO user_profile (
	user_id, email, title, sex, first_name, last_name, middle_name,
	work_destination, field, introduction, address_1, address_2, address_3, profile_image
) VALUES (
	'ravi_l', 'rbojha008@gmail.com', 'mr', 'male', 'ravi', 'ojha', '',
	'software_engineer', 'it', 'As it so contrasted oh estimating instrument. Size like body some one had. Are conduct viewing boy minutes warrant expense. Tolerably behaviour may admitting daughters offending her ask own. Praise effect wishes change way and any wanted. Lively use looked latter regard had. Do he it part more last in. Merits ye if mr narrow points. Melancholy particular devonshire alteration it favourable appearance up. ',
	'bangalore', '', '', 'ravi.png'
	);

CREATE TABLE user_details (
  
);


CREATE TABLE consumer_details (
  ID UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR REFERENCES login_detail(user_id) ON DELETE CASCADE
);

CREATE TABLE lawer_details (
  ID UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR REFERENCES login_detail(user_id) ON DELETE CASCADE
);