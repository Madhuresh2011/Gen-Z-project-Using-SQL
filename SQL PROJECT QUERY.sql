create database sql_task;

use sql_task;

show tables;

-- QUESTIONS:-



-- 1. What is the gender distribution of respondents from India?

SELECT * FROM dataset;

SELECT Gender, COUNT(*) AS COUNT
FROM dataset 
WHERE Country="INDIA"
GROUP BY Gender;


-- 2. What percentage of respondents from India are interested in education abroad and sponsorship?

SELECT 
    (COUNT(*) * 100.0 / 
     (SELECT COUNT(*) 
      FROM dataset 
      WHERE country = 'India')
    ) AS percentage
FROM dataset
WHERE country = 'India' 
  AND Higher_Education_Aspiration IN ('Yes', 'Needs a sponsor');
  
  
-- 3. What are the 6 top influences on career aspirations for respondents in India?

SELECT 
    Influencing_Factors,
    COUNT(*) AS influence_count
FROM dataset
WHERE country = 'India'
GROUP BY Influencing_Factors
ORDER BY influence_count DESC
LIMIT 6;


-- 4. How do career aspiration influences vary by gender in India?

SELECT 
    Gender,
    Higher_Education_Aspiration,
    COUNT(*) AS influence_count
FROM dataset
WHERE country = 'India'
GROUP BY Gender,Higher_Education_Aspiration
ORDER BY Gender, Higher_Education_Aspiration ;


-- 5. What percentage of respondents are willing to work for a company for at least 3 years?

SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dataset)) AS percentage
FROM dataset
WHERE  3_year_tenurity = 'yes';


-- 6. How many respondents prefer to work for socially impactful companies?

SELECT 
    COUNT(*) AS respondent_count
FROM dataset
WHERE Likley_Rate_For_Unethical_Company >= 5;


-- 7. How many preference for socially impactful companies vary by gender?

SELECT 
    gender,
    COUNT(*) AS respondent_count
FROM dataset
WHERE Likley_Rate_For_Unethical_Company >= 5 
GROUP BY gender
ORDER BY respondent_count DESC;


-- 8. What is the distribution of minimum expected salary in the first three years among respondents?

SELECT 
    Minimum_expected_in_hand_monthly_salary_after_3_years,
    COUNT(*) AS respondent_count
FROM dataset
GROUP BY Minimum_expected_in_hand_monthly_salary_after_3_years
ORDER BY Minimum_expected_in_hand_monthly_salary_after_3_years
DESC;


-- 9. What is the expected minimum monthly salary in hand?

SELECT 
    Minimum_expected_in_hand_monthly_salary_after_3_years    
FROM dataset
GROUP BY Minimum_expected_in_hand_monthly_salary_after_3_years
ORDER BY Minimum_expected_in_hand_monthly_salary_after_3_years
DESC;


-- 10. What percentage of respondents prefer remote working?    

SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dataset)) AS percentage
FROM dataset
WHERE work_in_environment  = 'Remote_work';


-- 11. What is the preferred number of daily work at office?      

SELECT 
    work_in_environment,
    COUNT(*) AS respondent_count
FROM dataset where work_in_environment = 'Every_Day_Office_work'
GROUP BY work_in_environment
ORDER BY work_in_environment ASC;


-- 12. What is the distribution of minimum expected salary after five years?

SELECT 
    Minimum_expected_in_hand_monthly_salary_after_5_years,
    COUNT(*) AS respondent_count
FROM dataset
GROUP BY Minimum_expected_in_hand_monthly_salary_after_5_years
ORDER BY Minimum_expected_in_hand_monthly_salary_after_5_years ASC;


-- 13. What are the remote working preferences by gender?

SELECT 
    gender,
    COUNT(*) AS respondent_count
FROM dataset where work_in_environment = 'remote_work'
GROUP BY gender
ORDER BY gender, respondent_count ;


-- 14. What percentage of respondents need sponsorship for education abroad?


SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dataset)) AS sponsorship_percentage
FROM dataset
WHERE Higher_Education_Aspiration = 'Needs a sponsor';

