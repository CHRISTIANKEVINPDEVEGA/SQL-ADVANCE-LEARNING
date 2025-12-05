/*
Question: What is the most optimal skills to learn? Both highest paying and in demand skill.
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
    AND job_work_from_home =TRUE

),

in_demand_skill AS (
SELECT
skills_dim.skill_id, skills_dim.skills, skills_dim.type, COUNT(skills) AS demand_counts
FROM 
data_analyst_job 
JOIN skills_job_dim ON skills_job_dim.job_id = data_analyst_job.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills_dim.skill_id, skills_dim.skills, skills_dim.type
ORDER BY COUNT(skills) DESC
),

highest_paying_skill AS (
SELECT
skills_dim.skill_id, skills_dim.skills, skills_dim.type, ROUND(AVG(salary_year_avg), 0) AS avg_pay_skill
FROM 
data_analyst_job 
JOIN skills_job_dim ON skills_job_dim.job_id = data_analyst_job.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills_dim.skill_id, skills_dim.skills, skills_dim.type
ORDER BY avg_pay_skill DESC
)

SELECT 
highest_paying_skill.skills, highest_paying_skill.type, demand_counts, avg_pay_skill
FROM in_demand_skill
JOIN highest_paying_skill ON highest_paying_skill.skill_id = in_demand_skill.skill_id
ORDER BY (demand_counts * avg_pay_skill) DESC
LIMIT 10
;