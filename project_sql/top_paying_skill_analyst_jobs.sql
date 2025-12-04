/*
Question: What are the top paying skills for data analyst in 2023?
*/

WITH data_analyst_job AS (
SELECT 
    *
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND EXTRACT(YEAR FROM job_posted_date) = 2023
    AND salary_year_avg IS NOT NULL
)

SELECT
skills, type, TO_CHAR(ROUND(AVG(salary_year_avg), 0), '$999,999,999') AS avg_pay_skill
FROM 
data_analyst_job 
JOIN skills_job_dim ON skills_job_dim.job_id = data_analyst_job.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills, type
ORDER BY avg_pay_skill DESC
;
