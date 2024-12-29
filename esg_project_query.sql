CREATE SCHEMA IF NOT EXISTS esg_project;

USE esg_project;

/* Renaming columns*/ 
ALTER TABLE esg_data
CHANGE full_name full_name VARCHAR(255) NOT NULL;

ALTER TABLE esg_data
CHANGE `GICS Sector` gics_sector VARCHAR(100) NOT NULL;

ALTER TABLE esg_data
CHANGE `GICS Sub-Industry` gics_sub_industry VARCHAR(100) NOT NULL;

ALTER TABLE esg_data
CHANGE environmentscore environment_score DECIMAL(4,2);

ALTER TABLE esg_data
CHANGE socialscore social_score DECIMAL(4,2);

ALTER TABLE esg_data
CHANGE governancescore governance_score DECIMAL(4,2);

ALTER TABLE esg_data
CHANGE totalesg total_esg DECIMAL(4,2);

ALTER TABLE esg_data
CHANGE highestcontroversy highest_controversy DECIMAL(2,1);

ALTER TABLE esg_data
CHANGE ratingyear rating_year YEAR;

ALTER TABLE esg_data
CHANGE ratingMonth rating_month TINYINT UNSIGNED;

SELECT * 
FROM esg_data;

DESCRIBE esg_data;

/*Check if symbol column is unique and can be considered as primary key
if the unique_count = total_count then symbol is unique */

SELECT 
    COUNT(DISTINCT symbol) AS unique_count,
    COUNT(*) AS total_count
FROM
    esg_data;

/* Check if symbol column has null values */

SELECT 
    COUNT(*) - COUNT(symbol) AS null_count
FROM
    esg_data;

/* Column symbol passes both checks, so we set it as Primary Key */

ALTER TABLE esg_data
MODIFY symbol VARCHAR(50) NOT NULL;

ALTER TABLE esg_data
ADD PRIMARY KEY (symbol);

/* Begin data cleaning */
-- check for nulls
SELECT 
    *
FROM
    esg_data
WHERE
    environment_score IS NULL
	OR social_score IS NULL
	OR governance_score IS NULL
	OR total_esg IS NULL;

-- Check for duplicates        
SELECT 
    symbol, COUNT(*)
FROM
    esg_data
GROUP BY symbol
HAVING COUNT(*) > 1;

-- Check for Inconsistent or Erroneous Data
SELECT 
    *
FROM
    esg_data
WHERE
    (environment_score < 0 OR environment_score > 100) OR 
    (social_score < 0 OR social_score > 100) OR 
    (governance_score < 0 OR governance_score > 100) OR 
    (total_esg < 0 OR total_esg > 100);
    
SELECT DISTINCT
    gics_sector
FROM
    esg_data;
    
-- Check for Outdated or Missing Dates
SELECT 
    *
FROM
    esg_data
WHERE
    rating_year < 2023 OR rating_year > 2024;
    
DELETE FROM esg_data 
WHERE
    rating_year = 2021 OR rating_year = 2022;

-- Check for Relationships Between Columns. 
/* verify that derived columns like total_esg match the sum of environment_score, social_score, and governance_score */

SELECT 
    *
FROM
    esg_data
WHERE
    total_esg != (environment_score + social_score + governance_score);

SELECT *
FROM esg_data
WHERE ABS(total_esg - (environment_score + social_score + governance_score)) > 0.01;

UPDATE esg_data
SET total_esg = ROUND(environment_score + social_score + governance_score, 2);

-- Check for Case Sensitivity e.g., "Technology" vs. "technology"
SELECT *
FROM esg_data
WHERE gics_sector != CONCAT(UPPER(LEFT(gics_sector, 1)), LOWER(SUBSTRING(gics_sector, 2)));

/* Export the cleaned table into a CSV file */

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sp500_esg_data_cleaned.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
FROM esg_data;