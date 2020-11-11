-- COALESCE
-- Returns the first non null value in a list

-- Written for MySQL using https://www.beekeeperstudio.io/ and https://www.mysql.com/products/workbench/
-- Tweak any failures 

-- ---------------------------------------------------------------------
-- Data Langugage References
-- (DDL) Data Definition Language - create, drop, rename, alter
-- (DML) Data Manipulation Language - insert, update, delete
-- (DQL) Data Query Language - select
-- ---------------------------------------------------------------------

-- (DDL) (SET-UP) Create a database called Publications
CREATE DATABASE Publications;

-- (DDL) (SET-UP)Create a table called Publications
CREATE TABLE Publications (
  id int,
  title varchar(255),
  excerpt varchar(255),
  published_at date,
  body varchar(255)
);

-- (DML) (SET-UP) Insert data into the table, note that some excerpts are missing
INSERT INTO
  Publications (id, title, excerpt, published_at, body)
VALUES
  (
    2,
    'The first acrticle',
    'An excerpt of text from the first section of the article.',
    '2020-01-01',
    'First section - this is the article description'
  ),
  (
    3,
    'Second article',
    NULL,
    '2020-01-02',
    'Second article description that is quite long'
  ),
  (
    4,
    'Third Article',
    NULL,
    '2020-01-03',
    'Third article description that is quite long'
  );
  
-- (DQL) Select all data from the table and check the NULL values exist in the excerpt column
SELECT * FROM Publications;
  
-- (DQL) Now do a COALESCE on the excerpt and body text to populate NULL values in the excerpt column
SELECT
  id,
  title AS Title,
  COALESCE(excerpt, LEFT(body, 100)) AS Excerpt,
  published_at AS 'Publish Date'
FROM
  Publications;
  
-- In the results we can see the copy from the body column has been coalesced into the NULL value columns
-- of the Exceprt column.

-- (DQL) Select all data again to prove the table data has not been modified
SELECT * FROM Publications;
  
-- (DQL) We can also substitute null values for some similar value
SELECT
  id,
  title AS Title,
  COALESCE(excerpt, 'n/a') AS Excerpt,
  published_at AS 'Publish Date'
FROM
  Publications;

-----------------------------
-- (DDL) (TEAR DOWN) Optional tear down
DROP DATABASE Publications;
