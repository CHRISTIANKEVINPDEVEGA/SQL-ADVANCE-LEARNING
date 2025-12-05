/*
Question: What are the top in demand skills for data analyst in 2023?
*/

WITH data_analyst_job AS (
SELECT 
    *
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND EXTRACT(YEAR FROM job_posted_date) = 2023
)

SELECT
skills, type, COUNT(skills) AS demand_counts
FROM 
data_analyst_job 
JOIN skills_job_dim ON skills_job_dim.job_id = data_analyst_job.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills, type
ORDER BY COUNT(skills) DESC
LIMIT 10
;