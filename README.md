# Layoffs Data Cleaning & Exploratory Data Analysis (SQL)

## 📌 Project Overview
This project presents an end-to-end data analytics workflow 
applied to a global layoffs dataset.
It covers data cleaning and transformation using SQL, 
exploratory data analysis to identify trends and patterns, 
and the development of interactive dashboards in Excel and Power BI.
The goal is to analyze layoffs by company, industry, country, 
and time, and to explore the relationship between funding and 
layoffs to derive meaningful business insights.

## 🛠 Tools & Technologies
* MySQL 8.0
* SQL (CTEs, Window Functions, Aggregations)
* Microsoft Excel (Dashboard & Analysis)
* Power BI Desktop (Interactive Dashboard)
* GitHub (Version Control)

## 📂 Project Structure
* layoffs_raw.csv — original dataset
* data_cleaning_layoffs.sql — SQL cleaning script
* exploratory_data_analysis_layoffs.sql — SQL EDA queries
* layoffs_dashboard.xlsx — Excel interactive dashboard
* layoffs_dashboard.pbix — Power BI dashboard
* images/ — dashboard screenshots & demo
* README.md — project documentation

## 📊 Data Source
The dataset is a public layoffs dataset containing company-level 
information such as industry, location, company stage, funding, 
and layoff dates (2020–2023).

## 🧹 Data Cleaning Steps
* Removed duplicates
* Standardized company and industry names
* Handled missing and null values
* Converted date fields to proper date format
* Validated numerical fields

## 🔍 Exploratory Data Analysis (EDA)
* Identified companies with the highest total and percentage of layoffs
* Analyzed layoffs by industry and country
* Examined layoffs across company funding levels and stages
* Investigated trends over time (yearly and monthly)
* Ranked top companies by annual layoffs

## 📊 Dashboards

### Excel Dashboard
* Interactive dashboard using Pivot Tables, Charts, and Slicers
* Includes:
  * Layoffs overview
  * Funding vs layoffs analysis
  * Key insights

### Power BI Dashboard ✅ NEW
* Interactive dashboard with 4 pages:
  * **Overview** – Total layoffs, trends & top companies
  * **Funding vs Layoffs** – Funding analysis & comparisons
  * **Insights** – Key findings & conclusions
  * **Dashboard Guide** – How to use the dashboard
* Features:
  * Dynamic KPI Cards with YOY Growth
  * Filled Map, Bar, Line, Scatter, Matrix visuals
  * DAX Measures & Dynamic Ranking (RANKX)
  * Year & Month Slicers

## 📸 Dashboard Preview
### Excel
#### Overview
#### Funding vs Layoffs
#### Insights

### Power BI
#### Overview
#### Funding vs Layoffs
#### Insights

## ⚠️ Notes
* Avg Layoffs per Company & Avg Funds per Company may differ 
  between Excel and Power BI when filtering by year, due to 
  different aggregation methods. Overall totals are consistent.
* Top 10 Companies in Scatter Plot may differ slightly between 
  Excel and Power BI due to different ranking methodologies.
  Power BI uses dynamic DAX RANKX while Excel uses manual RANK formula.

## 📌 Key Insights
* Layoffs surged by 703% in 2022 compared to 2021
* The United States accounts for the highest number of layoffs
* Highly funded companies still experienced massive layoffs
* Post-IPO companies recorded the highest layoffs
* Retail & Consumer sectors were the most affected
* Layoffs peaked between March and November 2022

## 🔄 Data Pipeline
1. Raw dataset (CSV)
2. Data cleaning and transformation using SQL (MySQL)
3. Exploratory Data Analysis (SQL)
4. Data export for visualization
5. Dashboard development in Excel
6. Dashboard development in Power BI
