# ESG-Analysis-S-P500-2023-
This is my first data analysis project, where I explored ESG (Environmental, Social, and Governance) data for S&P 500 companies (2023).

## Table of Contents
1. [Introduction](#introduction)
2. [Dataset](#dataset)
3. [Analysis Workflow](#analysis-workflow)
    - [MySQL Data Cleaning](#mysql-data-cleaning)
    - [Tableau Visualizations](#tableau-visualizations)
4. [Key Insights](#key-insights)
5. [What I Accomplished](#what-i-accomplished)
6. [Feedback and Next Steps](#feedback-and-next-steps)

The dataset, sourced from [Kaggle's "S&P 500 ESG and Stocks Data"](https://bit.ly/41UmKrR), includes:
- **Company Name**: S&P 500 companies.
- **Ticker Symbol**: Stock ticker for each company.
- **Sector**: Industry classification.
- **ESG Scores**:
  - **Environmental (E)**: Carbon emissions, energy use, waste management.
  - **Social (S)**: Employee relations, community impact.
  - **Governance (G)**: Executive pay, audits, shareholder rights.
- **Market Cap**: Total stock value.
- **Date**: Relevant time period for ESG data.

### MySQL Data Cleaning
1. **Created Schema**: Set up a new schema for the project.
2. **Imported Dataset**: Uploaded `sp500_esg_data.csv` as a table named `esg_data`.
3. **Column Renaming and Data Validation**:
    - Renamed columns for clarity.
    - Assigned appropriate data types (**INT**, **DECIMAL**, **YEAR**, etc.).
4. **Primary Key Validation**: Modified `symbol` column to be `NOT NULL` and set as the primary key.
5. **Cleaned Data**:
    - Checked for null values, duplicates, inconsistent data, and erroneous dates.
    - Verified relationships between derived columns (e.g., `total_esg = environmental + social + governance`).
6. **Exported Clean Data**: Saved the cleaned table as a CSV file for visualization.

### Tableau Visualizations
1. **Imported Cleaned Data**: Loaded the cleaned CSV file into Tableau.
2. **Created Charts**:
    - Top 10 Companies by ESG Score (2023)
    - Breakdown of ESG Scores for Top Companies
    - Average ESG Scores by Sector
    - Market Cap vs. ESG Scores by Sector (2023)
    - Sector-Wise Distribution of ESG Scores
    - Top Companies by Environmental, Social, and Governance Scores
3. **Built Dashboards**: Designed interactive dashboards to tell a data-driven story.

### Key Insights
- **Top Performers**:
    - *Environmental*: Occidental Petroleum.
    - *Governance*: Wells Fargo.
- **Balanced Sectors**: Consumer Staples has the most balanced ESG performance.
- **Industrials Sector**:
    - Highest total ESG score across all sectors.
    - Largest number of companies represented.
- **Market Cap Correlation**: No strong correlation with ESG scores.

### Explore the Project
- **Tableau Public Dashboard**: [View Here](https://bit.ly/3DwsNIS)
- **Dataset on Kaggle**: [S&P 500 ESG and Stocks Data](https://bit.ly/41UmKrR)
- **GitHub Repository**: [View Repository](https://github.com/Mikegr1990/ESG-Analysis-S-P500-2023-)

### Feedback and Next Steps
This project taught me the importance of data cleaning and visualization in uncovering actionable insights. 

I’m eager to expand my skills in data analysis and visualization. I would love your feedback or suggestions—please feel free to reach out and connect!

Let’s discuss how we can use data to make a positive impact.






