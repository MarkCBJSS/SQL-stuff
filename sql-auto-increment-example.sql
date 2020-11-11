-- Auto Increment
-- Adds a value to a column that can be used as a uinique auto-generated key
-- This value is a system/record level value and has no direct business value

-- Written for MySQL using https://www.beekeeperstudio.io/ and https://www.mysql.com/products/workbench/
-- Tweak any failures for your particular version of SQL

-- ---------------------------------------------------------------------
-- Data Langugage References
-- (DDL) Data Definition Language - create, drop, rename, alter
-- (DML) Data Manipulation Language - insert, update, delete
-- (DQL) Data Query Language - select
-- ---------------------------------------------------------------------

-- (DDL) (SET-UP) Create a database called Publications
CREATE DATABASE Publications;

-- Ensure the correct database is targetted
USE Publications;

-- (DDL) (SET-UP) Create a table called Publications
CREATE TABLE Publications (
  id int AUTO_INCREMENT PRIMARY KEY,
  title varchar(255),
  published_on date,
  body varchar(255)
);

-- (DML) (SET-UP) Insert data into the table, note that no Id value is provided
INSERT INTO
  Publications (title, published_on, body)
VALUES
  (
    'First Article Title',
    '2020-01-01',
    'A long body of text such as the first chapter of an article'
  ),
  (
    'Second Article Title',
    '2020-01-02',
    'A long body of text such as the second chapter of an article'
  ),
  (
    'Third Article Title',
    '2020-01-03',
    'A long body of text such as the third chapter of an article'
  );

-- (DQL) Select all data from the table and note that the Id column is auto incremented
SELECT * FROM Publications;

-- (DDL) Remove a row from the table where its Id is 2
DELETE FROM Publications
WHERE id = 2;

-- (DQL) Select all data from the table and note the column with Id of 2 is removed
-- There is no re-numbering of the column Id, they remain as when created
SELECT * FROM Publications;

-- (DML) Add a new row to the table
-- The Id will be the next in sequence, the row does not take a 'missing' Id such as 2
INSERT INTO
  Publications (title, published_on, body)
VALUES
  (
    'Fourth Article Title',
    '2020-01-04',
    'A long body of text such as the fourth chapter of an article'
  );
  
-- (DQL) Select all data from the table and note the Id for the fourth row is added
SELECT * FROM Publications;

-- ------------------------------------
-- (DDL) (TEAR DOWN) Optional tear down
DROP DATABASE Publications;
