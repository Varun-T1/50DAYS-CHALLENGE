---• Find latest salary per employee along with total salary till that point
SELECT * from 
(SELECT emp_id,salary,salary_date,
ROW_NUMBER() OVER(PARTITION BY emp_id ORDER BY salary DESC) as rn,
SUM(salary) OVER(PARTITION BY emp_id  ORDER BY salary_date) as running_total
FROM cleaned_salaries
) AS ranked
WHERE rn = 1;

--- Rank employees based on salary and compare with department average salary
SELECT * FROM
(SELECT e.emp_id,e.dept_id,s.salary,
RANK() OVER(PARTITION BY e.emp_id ORDER BY s.salary DESC) as emp_rnk,
AVG(s.salary) OVER(PARTITION BY e.dept_id) as dept_avg_salary,
s.salary - AVG(s.salary) OVER(PARTITION BY e.dept_id) as diff_from_avg
FROM cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
) AS ranked;

--- Check whether salary has increased or decreased compared to previous record
SELECT 
    emp_id,
    salary,
    LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS prev_salary,
    salary - LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS salary_diff,
    CASE 
        WHEN salary > LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) THEN 'Increased'
        WHEN salary < LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) THEN 'Decreased'
        ELSE 'No Change'
    END AS salary_status
FROM cleaned_salaries;