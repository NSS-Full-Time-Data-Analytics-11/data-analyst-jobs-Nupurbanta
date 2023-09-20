select *
FROM data_analysis_jobs
---1.How many rows are in the data_analyst_jobs table?

SELECT COUNT(title)
FROM data_analysis_jobs;

--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT company 
FROM data_analysis_jobs
LIMIT 10;

--3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(title),location
FROM data_analysis_jobs
WHERE location = 'TN' or location = 'KY'
GROUP BY location;

--4.How many postings in Tennessee have a star rating above 4?

SELECT COUNT(title) 
FROM data_analysis_jobs
WHERE location ='TN' AND star_rating >4;

--5.How many postings in the dataset have a review count between 500 and 1000

SELECT COUNT (*)
FROM data_analysis_jobs
WHERE review_account BETWEEN 500 and 1000;

--6.Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS location,
    AVG(star_rating) AS avg_rating
FROM data_analysis_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;


--7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT (DISTINCT title)
FROM data_analysis_jobs;

--8.	How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title) AS unique_job_titles
FROM data_analysis_jobs
WHERE location = 'CA';

--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

  SELECT count(company), avg(star_rating)
  FROM data_analysis_jobs
  GROUP BY company
  HAVING SUM (review_account) >5000;
  
  --10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
   
   SELECT count(company), avg(star_rating)
  FROM data_analysis_jobs
  WHERE review_account >5000
  ORDER BY avg(star_rating)DESC;
  
  --11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
  
SELECT COUNT(DISTINCT title) AS job_title
FROM data_analysis_jobs
WHERE title LIKE '%Analyst%';

   
--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT COUNT(DISTINCT title) AS job_title
FROM data_analysis_jobs
WHERE title NOT LIKE '%Analyst%'
  AND title NOT LIKE '%Analytics%';
  
 --BONUS:**

SELECT domain,
    COUNT(*) AS num_jobs,
    SUM(CASE WHEN days_since_posting > 21 THEN 1 ELSE 0 END) AS num_jobs_gt_3_weeks
FROM data_analysis_jobs
WHERE domain IS NOT NULL
    AND skill ='SQL'
GROUP BY domain
ORDER BY num_jobs DESC
LIMIT 4;
