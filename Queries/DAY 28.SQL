----• Find top 2 highest paid employees in each department
SELECT * FROM (
SELECT e.emp_id,e.dept_id,s.salary,DENSE_RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS rnk
FROM cleaned_employee e
JOIN cleaned_salaries s ON s.emp_id = e.emp_id
) AS ranked
WHERE rnk <= 2;

---• Calculate salary gap (difference between current salary and previous salary)
SELECT emp_id,salary,LAG(salary) OVER(PARTITION BY emp_id ORDER BY salary) as prev_salary,
salary-LAG(salary) OVER(PARTITION BY emp_id ORDER BY salary) as salary_gap
FROM cleaned_salaries;

---• Calculate performance gap (change in performance between years)
SELECT p.emp_id,p.rating_2022 , p.rating_2023 , p.rating_2024,
p.rating_2023-p.rating_2022 as gap_23,
p.rating_2024-p.rating_2023 as gap_24
FROM cleaned_performance p;


--- Filter only top performers based on ranking
SELECT emp_id,avg_rating,performance_rank 
FROM (
    SELECT emp_id, (rating_2022 + rating_2023 + rating_2024) / 3 AS avg_rating, 
    DENSE_RANK() OVER (ORDER BY (rating_2022 + rating_2023 + rating_2024) / 3 DESC) AS performance_rank
    FROM cleaned_performance
) AS ranked
WHERE performance_rank = 1;




