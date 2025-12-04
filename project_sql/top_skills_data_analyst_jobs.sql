/*
Question: What are the top in demand skills for data analyst in 2023?
*/

SELECT 
*
FROM
job_postings_fact
WHERE
job_title_short = 'Data Analyst'
AND EXTRACT(YEAR FROM job_posted_date) = 2023
LIMIT 10;