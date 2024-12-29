# ESG-Analysis-S-P500-2023-
This is my first data analysis project, where I explored ESG (Environmental, Social, and Governance) data for S&P 500 companies (2023).

The data provided for this project were taken from Kaggle "S&P 500 ESG and Stocks Data" in the following link https://bit.ly/41UmKrR.
This CSV file contains, among others, a data table on the ESG performance of companies in the S&P 500 index. The dataset likely includes the following columns:
Company Name: The name of the S&P 500 companies.
Ticker Symbol: The stock ticker symbol for each company.
Sector: The sector or industry classification of each company.
ESG Score: A composite score indicating the overall ESG performance of the company.
Environmental Score (E): Represents the company’s environmental impact, including factors like carbon emissions, energy use, and waste management.
Social Score (S): Measures the company’s relationships with its employees, suppliers, customers, and the communities where it operates.
Governance Score (G): Evaluates corporate governance, including executive pay, audits, internal controls, and shareholder rights.
Date: The date or time period for which the ESG data is relevant
Market Cap: Total dollar value of all the shares of a company’s stock

The analysis was split into two major steps:
1) Setting Up and Preparing Data in MySQL Workbench
2) Creating Visualizations in Tableau

MySQL Workbench for data cleaning includes the following:
- Create a new schema for the project
- Import the CSV File
  Imported the sp500_esg_data.csv file into MySQL Workbench as a new table named esg_data
- Rename the columns properly and set the value type such as INT, DECIMAL, YEAR etc. (Data Type Validation)
- Check for a Potential Primary Key:
- Modify the symbol column to be NOT NULL and Set the symbol column as the primary key.
- Check for null values
- Check for duplicates
- Check for Inconsistent or Erroneous Data 
- Check for Outdated or Missing Dates for example if there are values for years < 2023 or >2024
- Check for Relationships Between Columns  Verify that derived columns like total_esg match the sum of environment_score, social_score, and governance_score
- Check for Case Sensitivity
- Export the cleaned table to CSV

Tableau for visualization to extract and present key insights includes the following:
- Import the cleaned CSV File
- Rename columns
- Create the following Charts
  Top 10 Companies by ESG Score 2023
  Breakdown of ESG Scores for Top 10 Companies (2023)
  Average ESG Scores by Sector
  Market Cap vs. ESG Scores by Sector (2023)
  Sector-Wise Distribution of ESG Scores
  Top Companies by Environmental, Social, and Governance Scores (2023)
- Create Dashboards

  What I Accomplished:
  1) Identified top ESG performers, balanced sectors, and correlations with market cap.
  2) Cleaned and prepared raw data in MySQL to ensure reliable insights.
  3) Designed interactive dashboards in Tableau for clear storytelling.
 
Key Insights of the Project:
a) Leaders: Occidental Petroleum leads in Environmental scores; Wells Fargo excels in Governance.
b) Balanced Sectors: Consumer Staples stands out as the most balanced ESG sector.
c) Industrials: This sector has the highest total ESG score and number of companies.
d) Correlation: Market Cap does not strongly correlate with ESG scores.

This project taught me the importance of data cleaning and visualization in uncovering actionable insights. I’m eager to continue learning and contributing to projects that use data for impact. I'd love your feedback or suggestions on this project—let’s connect and discuss!
