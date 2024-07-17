/* 
Question: What are the top skills based on salary?
- Look at the avg salary associated with each skill for Data Analyst positions
- Focus on roles with specified salaries, regardless of location
- It reveals how different skills impact salary levels for DAs
- It helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
  skills,
  ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY 
  skills
ORDER BY
  avg_salary DESC
LIMIT 25;

-- Here are the insights condensed into three key bullet points:

-- 	•	Big Data and Machine Learning Tools: Skills like PySpark ($208,172), DataRobot ($155,486), and scikit-learn ($125,781) command high salaries, reflecting the demand for expertise in large-scale data processing and AI-driven solutions.
-- 	•	Version Control and Collaboration: Proficiency in tools such as Bitbucket ($189,155) and GitLab ($154,500) is highly valued for managing complex data projects, emphasizing the importance of version control and collaborative development.
-- 	•	Essential Data Analysis Libraries: Libraries like Jupyter ($152,777), Pandas ($151,821), and NumPy ($143,513) are critical for data manipulation, exploration, and numerical computing, underscoring their central role in data analytics.