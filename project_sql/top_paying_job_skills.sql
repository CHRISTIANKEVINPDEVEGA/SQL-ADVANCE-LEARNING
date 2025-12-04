/*
Question: What are the skills of the top-paying data analyst job posted in AI-jobs.net located in the Philippines in 2023?
*/

WITH top_paying_job AS (
SELECT
    job_id,
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
LIMIT 10)

SELECT
    skills,
    type,
    COUNT(skills) AS num_jobs_req_skills
FROM 
    top_paying_job
    JOIN 
        skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
    JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY 
    skills, type
ORDER BY 
    COUNT(skills) DESC
;