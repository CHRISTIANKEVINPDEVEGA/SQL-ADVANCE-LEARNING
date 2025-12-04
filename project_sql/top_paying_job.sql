SELECT 
    *
FROM
    job_postings_fact
WHERE
    job_title LIKE '%Data%'
    AND job_title LIKE '%Analyst%'
    AND job_country = 'Philippines' 
    AND salary_year_avg IS NOT NULL
LIMIT 10;