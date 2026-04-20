----Retrieve latest salary record for each employee
SELECT * FROM
(SELECT * ,ROW_NUMBER () OVER (PARTITION BY emp_id ORDER BY salary_date DESC) AS rn FROM cleaned_salaries) t
WHERE rn=1;

-----• Retrieve first (oldest) salary record for each employee
SELECT * FROM
(SELECT * ,ROW_NUMBER () OVER (PARTITION BY emp_id ORDER BY salary_date ASC) AS rn FROM cleaned_salaries) t
WHERE rn=1;

----• Rank salary entries for each employee
SELECT * FROM
(SELECT * ,RANK () OVER (PARTITION BY emp_id ORDER BY salary_date DESC) AS rn FROM cleaned_salaries) t
WHERE rn=1;

----Get top 2 salary records per employee
SELECT * FROM
(SELECT * ,DENSE_RANK () OVER (PARTITION BY emp_id ORDER BY salary_date DESC) AS rn FROM cleaned_salaries) t
WHERE rn<=2;