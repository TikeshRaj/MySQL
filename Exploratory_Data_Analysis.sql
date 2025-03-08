-- EXPLORATORY DATA ANALYSIS (EDA) ON LAYOFFS DATA  

-- Checking the structure and data of the layoffs_staging2 table  
SELECT *  
FROM layoffs_staging2;  

-- Finding the maximum number of layoffs and the maximum percentage of layoffs  
SELECT MAX(total_laid_off), MAX(percentage_laid_off)  
FROM layoffs_staging2;  

-- Retrieving all records where the entire workforce (100%) was laid off, sorted by total layoffs in descending order  
SELECT *  
FROM layoffs_staging2  
WHERE percentage_laid_off = 1  
ORDER BY total_laid_off DESC;  

-- Identifying the company with the highest total layoffs  
SELECT company, SUM(total_laid_off) AS total_layoffs  
FROM layoffs_staging2  
GROUP BY company  
ORDER BY total_layoffs DESC;  

-- Finding the date range of the dataset (earliest and latest date)  
SELECT MIN(`date`) AS start_date, MAX(`date`) AS end_date  
FROM layoffs_staging2;  

-- Identifying the industry with the highest total layoffs  
SELECT industry, SUM(total_laid_off) AS total_layoffs  
FROM layoffs_staging2  
GROUP BY industry  
ORDER BY total_layoffs DESC;  

-- Identifying the country with the highest total layoffs  
SELECT country, SUM(total_laid_off) AS total_layoffs  
FROM layoffs_staging2  
GROUP BY country  
ORDER BY total_layoffs DESC;  

-- Calculating daily layoffs, ensuring the date is not NULL  
SELECT `date`, SUM(total_laid_off) AS daily_layoffs  
FROM layoffs_staging2  
WHERE `date` IS NOT NULL  
GROUP BY `date`  
ORDER BY `date`;  

-- Calculating yearly layoffs  
SELECT YEAR(`date`) AS `Year`, SUM(total_laid_off) AS yearly_layoffs  
FROM layoffs_staging2  
WHERE `date` IS NOT NULL  
GROUP BY YEAR(`date`)  
ORDER BY `Year`;  

-- Identifying which stage of a company's lifecycle had the most layoffs  
SELECT stage, SUM(total_laid_off) AS total_layoffs  
FROM layoffs_staging2  
WHERE stage IS NOT NULL  
GROUP BY stage  
ORDER BY total_layoffs DESC;  

-- Calculating the rolling sum of layoffs based on the month  
SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS monthly_layoffs  
FROM layoffs_staging2  
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL  
GROUP BY `Month`  
ORDER BY `Month`;  

-- Creating a CTE for calculating the rolling total of layoffs over time  
WITH Rolling_Total AS  
(  
    SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS total_off  
    FROM layoffs_staging2  
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL  
    GROUP BY `Month`  
    ORDER BY `Month`  
)  
SELECT `Month`, total_off,  
SUM(total_off) OVER (ORDER BY `Month`) AS rolling_total  
FROM Rolling_Total;  

-- Calculating layoffs per company per year  
SELECT company, YEAR(`date`) AS `Year`, SUM(total_laid_off) AS yearly_layoffs  
FROM layoffs_staging2  
GROUP BY company, YEAR(`date`)  
ORDER BY yearly_layoffs DESC;  

-- RANKING: Identifying the top 5 companies with the highest layoffs per year  
WITH Ranking_Company AS  
(  
    SELECT company, YEAR(`date`) AS `Year`, SUM(total_laid_off) AS total_laid_off  
    FROM layoffs_staging2  
    GROUP BY company, YEAR(`date`)  
    ORDER BY total_laid_off DESC  
),  
Company_Year_Rank AS  
(  
    SELECT *,  
    DENSE_RANK() OVER (PARTITION BY Year ORDER BY total_laid_off DESC) AS ranking  
    FROM Ranking_Company  
    WHERE Year IS NOT NULL  
)  
SELECT *  
FROM Company_Year_Rank  
WHERE ranking <= 5;  
