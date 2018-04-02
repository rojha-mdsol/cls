-- psql -f sql/database.sql

DROP DATABASE IF EXISTS consumerlawyer;
CREATE DATABASE consumerlawyer;

\c consumerlawyer;

CREATE TYPE user_type AS ENUM ('consumer', 'lawyer');
CREATE TYPE sex_type AS ENUM ('male', 'female');

CREATE EXTENSION pgcrypto;

CREATE TABLE login_detail (
  ID UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR UNIQUE NOT NULL,
  password VARCHAR NOT NULL,
  type user_type NOT NULL
);

INSERT INTO login_detail (user_id, password, type)
  VALUES ('ravi', 'password123', 'consumer');

INSERT INTO login_detail (user_id, password, type)
  VALUES ('ravi01', 'password123', 'consumer');

INSERT INTO login_detail (user_id, password, type)
  VALUES ('ravi_l', 'password123', 'lawyer');

INSERT INTO login_detail (user_id, password, type)
  VALUES ('ravi_l01', 'password123', 'lawyer');

CREATE TABLE user_profile (
  ID UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id VARCHAR REFERENCES login_detail(user_id) ON DELETE CASCADE,
  email VARCHAR,
  title VARCHAR,
  sex sex_type NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  middle_name VARCHAR,
  work_destination VARCHAR,
  address_1 VARCHAR,
  address_2 VARCHAR,
  address_3 VARCHAR,
  profile_image VARCHAR
);

INSERT INTO user_profile (
	user_id, email, title, sex, first_name, last_name, middle_name,
	work_destination, address_1, address_2, address_3, profile_image
) VALUES (
	'ravi', 'rbojha008@gmail.com', 'mr', 'male', 'ravi', 'ojha', '',
	'software_engineer', 'bangalore', '', '', ''
	);

INSERT INTO user_profile (
	user_id, email, title, sex, first_name, last_name, middle_name,
	work_destination, address_1, address_2, address_3, profile_image
) VALUES (
	'ravi01', 'rbojha008@gmail.com', 'mr', 'male', 'ravi', 'ojha', '',
	'software_engineer', 'bangalore', '', '', ''
	);