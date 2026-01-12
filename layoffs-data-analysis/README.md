# Layoffs Data Cleaning & Exploratory Data Analysis (SQL)

## 📌 Project Overview
This project focuses on cleaning and analyzing global layoff data using **MySQL**.  
The goal is to transform raw, inconsistent data into a clean, analysis-ready dataset and perform **exploratory data analysis (EDA)** to uncover trends across companies, industries, locations, and time.

This is a one-time data cleaning and analysis project.

---

## 🛠 Tools & Technologies
- MySQL 8.0
- SQL (CTEs, Window Functions, Aggregations)
- GitHub (Version Control)

---

## 📂 Project Structure
- layoffs_raw.csv — original dataset (unchanged)
- data_cleaning_layoffs.sql — SQL script for cleaning and standardizing the data
- exploratory_data_analysis_layoffs.sql — SQL queries for exploratory analysis
- README.md — project documentation

## 📊 Data Source
The dataset is a public layoffs dataset containing company-level information such as industry, location, company stage, funding, and layoff dates.


## 🧹 Data Cleaning Steps
- Removed duplicates
- Standardized company and industry names
- Handled missing and null values
- Converted date fields to proper date format
- Validated numerical fields


## 🔍 Exploratory Data Analysis (EDA)
- Identified companies with the highest total and percentage of layoffs  
- Analyzed layoffs by industry and country  
- Examined layoffs across company funding levels and stages  
- Investigated trends over time (yearly and monthly)  
- Ranked top companies by annual layoffs