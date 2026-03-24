/* =====================================================
   Exploratory Data Analysis (EDA)
   Dataset: layoffs_staging2
   Purpose: Identify patterns, trends, and outliers
   ===================================================== */
-- -------------------------------------
-- Company-level Analysis
-- -------------------------------------
-- companies with maximum total laid off and maximum percentage laid off
SELECT company, total_laid_off, percentage_laid_off
FROM layoffs_staging2
WHERE total_laid_off = (SELECT MAX(total_laid_off)
 FROM layoffs_staging2);

SELECT company, total_laid_off, percentage_laid_off
FROM layoffs_staging2
WHERE percentage_laid_off = (SELECT MAX(percentage_laid_off)
 FROM layoffs_staging2);

-- High-Funded Companies Experiencing 100% Staff Layoffs
select * from layoffs_staging2 
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- Companies with the Highest Total Layoffs
select company, sum(total_laid_off) as total_laid_off 
from layoffs_staging2 
group by company 
order by 2 desc;

-- -------------------------------------
-- Industry-level Analysis
-- -------------------------------------
-- industries with the Highest Total Layoffs
select industry, sum(total_laid_off) from layoffs_staging2 
group by industry 
order by 2 desc;

-- -------------------------------------
-- Geographic Analysis
-- -------------------------------------
-- countries with the Highest Total Layoffs
select country, sum(total_laid_off) from layoffs_staging2 
group by country 
order by 2 desc;

-- -------------------------------------
-- Time-based Trends
-- -------------------------------------
-- Earliest and Latest Layoff Dates
select max(`date`), min(`date`) from layoffs_staging2;

-- Total Layoffs by Year
select year(`date`) , sum(total_laid_off) from layoffs_staging2
group by year(`date`)
order by 1 desc;

-- Cumulative Monthly Layoffs Analysis
with rolling_total as (
select DATE_FORMAT(`date`, '%Y-%m') as month , sum(total_laid_off) as sum_laid
from layoffs_staging2 
where DATE_FORMAT(`date`, '%Y-%m') is not null
group by month 
order by 1
)select month , sum_laid ,sum(sum_laid) over(order by month) as rolling
from rolling_total;

-- Top 5 Companies by Annual Layoffs
with year_company (company,years,total_laid_off)as( 
select company, year(`date`), sum(total_laid_off) from layoffs_staging2
 group by company, year(`date`) 
), company_year_rank as(
select*, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from year_company 
)
select * from company_year_rank where ranking <= 5
and years is not null;
