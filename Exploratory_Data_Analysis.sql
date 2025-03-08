-- Exploratory Data Analysis (EDA)

SELECT *
FROM layoffs_staging2;

-- max and min layoffs
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Which company has highest layoff done
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
;

-- What is data gyap or when it begins
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2
;

-- Which industry has highest layoff done
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC
;

-- Which Country has Highest Layoffs
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC
;

-- Day wise Layoffs
SELECT `date`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY `date`
ORDER BY 1 
;

-- Year wise Layoffs
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY 1 
;

-- Which stage has highest Layoffs
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
WHERE stage IS NOT NULL
GROUP BY stage
ORDER BY 2 DESC
;

-- Rolling Sum of Layoffs Based on the Month
SELECT SUBSTRING(`date`,1,7) AS `Month`,SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 
;

WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `Month`,SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 
)
SELECT `Month`, total_off,
SUM(total_off) OVER(ORDER BY `Month`) AS rolling_total
FROM Rolling_Total
;

-- Rolling Total of Company by Year 
SELECT company,YEAR(`date`) AS `Year`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC
;

-- Ranking Which Company Has Highest Laid_Off
WITH Ranking_Company (Company, years, total_laid_off) AS
(
SELECT company,YEAR(`date`) AS `Year`, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC
), Compnay_Year_Rank AS
(SELECT *, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Ranking_Company
WHERE years IS NOT NULL
)
SELECT *
FROM Compnay_Year_Rank
WHERE ranking <= 5
;