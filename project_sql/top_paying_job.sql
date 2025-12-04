/*
Question: What are the top-paying data analyst job posted in AI-jobs.net located in the Philippines in 2023?
*/


SELECT 
    job_title, 
    TO_CHAR(salary_year_avg, '$999,999,999') AS salary_year_avg,
    job_posted_date::DATE AS job_posted_date,
    company_dim.name AS company_name,  
    job_location, 
    job_country
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id 
WHERE
    job_title LIKE '%Data%'
    AND job_title LIKE '%Analyst%'
    AND job_country = 'Philippines' 
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;