/* =====================================================
   Project: Layoffs Data Cleaning
   Author: HajarEzzy
   Purpose: One-time data cleaning and standardization
   Database: MySQL
   Created: 2025-11
   ===================================================== */
-- =====================================
-- 1. Create Initial Staging Table
-- =====================================
create table layoffs_staging like layoffs;
 
 insert layoffs_staging
 select * from layoffs;
 -- =====================================
 -- 2. Identify Duplicate Records
 -- =====================================
with duplicate_cte as (
select* , row_number() over(partition by company, industry, 
 total_laid_off, percentage_laid_off, `date`) as row_num
 from layoffs_staging
) select * from  duplicate_cte 
  where row_num >1;

-- =====================================
-- 3. Create Second Staging Table for Deduplication
-- =====================================

create table `layoffs_staging2`(
`company` text,
`location` text,
`indestry` text,
`total_laid_off`int default null,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`found_raised_millions`int default null,
`row_num` int
)engine=innodb default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

-- Convert percentage_laid_off from TEXT to DECIMAL for accurate numeric analysis
ALTER TABLE layoffs_staging2
MODIFY COLUMN percentage_laid_off DECIMAL(5,2);

-- Correcting column names 
ALTER TABLE layoffs_staging2
RENAME COLUMN indestry TO industry;

ALTER TABLE layoffs_staging2 
RENAME COLUMN found_raised_millions TO funds_raised_millions;

-- =====================================
-- 4. Remove Duplicates Using ROW_NUMBER
-- =====================================

insert into layoffs_staging2 
select* , row_number() over(partition by company,location, industry, 
 total_laid_off, percentage_laid_off, `date`,stage,country,funds_raised_millions ) as row_num
 from layoffs_staging;

SET SQL_SAFE_UPDATES = 1;

DELETE FROM layoffs_staging2
WHERE row_num > 1;

select*from layoffs_staging2
 where row_num >1;
 
-- =====================================
-- 5. Standardize Text Fields
-- =====================================
-- Trim company names
update layoffs_staging2
 set company=trim(company);
 
select distinct industry 
from layoffs_staging2 order by 1;

select industry from layoffs_staging2 
where industry like 'crypto%';

-- Normalize industry names
update layoffs_staging2 
set industry = 'crypto'
where industry like 'crypto%';

select distinct country 
from layoffs_staging2 order by 1 ;

-- Clean country names
update layoffs_staging2 
set country= trim(trailing '.' from country)
where country like 'united states%';

-- =====================================
-- 6. Convert and Standardize Date Column
-- =====================================

update layoffs_staging2
set `date` = str_to_date(`date` , '%m/%d/%Y');

alter table layoffs_staging2 
modify column `date` date;
-- =====================================
-- 7. Handle NULL and Blank Values
-- ===================================== 

-- Identify records with missing industry values 
 select * from layoffs_staging2 t1 join layoffs_staging2 t2
 ON t1.company =t2.company where (t1.industry is null 
 or t1.industry='') and t2.industry is not null ;
 
 -- Convert blank industry values to NULL
 update layoffs_staging2 
 set industry = null where industry = '' ;

-- Populate missing industry values using self join
update layoffs_staging2 t1 join layoffs_staging2 t2 
on t1.company = t2.company  set t1.industry=t2.industry 
where t1.industry is null and t2.industry is not null;

select count(*) as tt
 from layoffs_staging2;

-- =====================================
-- 8. Final Cleanup
-- =====================================

-- Remove helper column used for deduplication
alter table layoffs_staging2 
drop column row_num;
