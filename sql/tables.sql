drop table if exists quotes;

CREATE TABLE quotes (
  id integer NOT NULL primary key AUTOINCREMENT,
  author varchar(64) check ( length(author) <= 64 ) DEFAULT NULL,
  category varchar(32) check ( length(category) <= 64 ) DEFAULT NULL,
  quote text,
  rating integer DEFAULT NULL
);

drop table if exists quotes_deleted;

CREATE TABLE quotes_deleted (
  id integer NOT NULL primary key AUTOINCREMENT,
  author varchar(64) check( length(author) <= 64 ) DEFAULT NULL,
  category varchar(32) check( length(category) <= 32 ) DEFAULT NULL,    
  quote text,
  rating integer DEFAULT NULL
);

drop table if exists quotes_sent;

CREATE TABLE quotes_sent (
  quote_id integer not null unique 
);

drop table if exists users;

CREATE TABLE users (
  id integer NOT NULL primary key AUTOINCREMENT,
  username varchar(64) check( length(username) <= 64 ) NOT NULL,
  email varchar(64) check( length(email) <= 64 ) NOT NULL UNIQUE,
  password varchar(128) check( length(password) <= 128 ) DEFAULT NULL
);