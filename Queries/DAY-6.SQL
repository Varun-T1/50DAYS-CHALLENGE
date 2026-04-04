ALTER TABLE cleaned_salaries
MODIFY salary INT;

--BASIC UNDERSTANDING 

SELECT
min(salary) as min_salary,
max(salary) as max_salary,
avg(salary) as avg_salary
FROM cleaned_salaries
WHERE salary >0;

--clint rules max salary =2,000,000 min_salary = 20,000

ALTER TABLE cleaned_salaries
add column is_outlier int;

UPDATE cleaned_salaries
SET is_outlier =
CASE
WHEN salary < 20000 OR salary > 2000000 
THEN 1
ELSE 0
END;

SELECT * from cleaned_salaries
WHERE is_outlier = 1;

UPDATE cleaned_salaries
SET salary = 
CASE
WHEN salary_id = 17 AND emp_id = 35 THEN 67000
WHEN salary_id = 37 AND emp_id = 262 THEN 97000
END
WHERE (salary_id = 17 AND emp_id = 35)
OR (salary_id = 37 AND emp_id = 262);
