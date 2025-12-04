SELECT 
    *
FROM
    job_postings_fact
WHERE
    salary_hour_avg = 70.0
ORDER BY 
    salary_year_avg DESC
;

SELECT 
    job_posted_date::DATE
FROM
    job_postings_fact;

SELECT 
    job_posted_date::DATE
FROM
    job_postings_fact;
