 --------Show current salary along with previous salary for each employee
 SELECT emp_id,salary,salary_date,
 LAG(salary) OVER(PARTITION BY emp_id ORDER BY salary_date) AS prev_salary
 FROM cleaned_salaries;

 ----Calculate difference between current salary and previous salary
 SELECT emp_id,salary,salary_date,
 LAG(salary) OVER(PARTITION BY emp_id ORDER BY salary_date) AS prev_salary,
 salary - LAG(salary) OVER(PARTITION BY emp_id ORDER BY salary_date) AS salary_difference
 FROM cleaned_salaries;

 ----Analyze attendance trend (compare current status with previous status)
 SELECT emp_id,attendance_date,status,
 LAG(status) OVER(PARTITION BY emp_id ORDER BY attendance_date) AS prev_status
 FROM cleaned_attendance;