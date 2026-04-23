----Show current salary along with next salary for each employee
SELECT emp_id,salary,salary_date,
LEAD(salary) OVER(PARTITION BY emp_id ORDER BY salary_date) AS next_salary
FROM cleaned_salaries;

---• Compare current salary with next salary for growth analysis
SELECT emp_id,salary,salary_date,
LEAD(salary) OVER(PARTITION BY emp_id ORDER BY salary_date) AS next_salary,
salary - LEAD(salary) OVER(PARTITION BY emp_id ORDER BY salary_date) AS salary_difference
FROM cleaned_salaries;

---• Predict attendance trend by comparing current and next status
SELECT emp_id,attendance_date,status,
LEAD(status) OVER(PARTITION BY emp_id ORDER BY attendance_date) AS next_status
FROM cleaned_attendance;
