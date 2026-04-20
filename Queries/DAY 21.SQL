-----• Rank employees based on salary
SELECT emp_id,salary,RANK() OVER
 (ORDER BY salary DESC) AS salary_rank FROM  Cleaned_salaries;
 
---• Perform department-wise ranking of employees
SELECT e.emp_id,  e.dept_id,s.salary ,DENSE_RANK() OVER
 (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS dept_rank FROM  cleaned_employee e
 join cleaned_salaries s
 on s.emp_id = e.emp_id;

 ----Identify top performers based on average performance rating
 SELECT emp_id, (rating_2022 + rating_2023 + rating_2024) / 3 AS avg_rating, 
 DENSE_RANK() OVER (ORDER BY (rating_2022 + rating_2023 + rating_2024) / 3 DESC) AS performance_rank
FROM cleaned_performance;


----Find top 3 employees based on salary ranking
WITH ranked_employees AS (
    SELECT emp_id,
           salary,
           RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM Cleaned_salaries
)
SELECT emp_id, salary, salary_rank
FROM ranked_employees
WHERE salary_rank <= 3;

