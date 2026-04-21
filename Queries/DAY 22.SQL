----Show each employee with average salary of their department
SELECT e.emp_id,s.salary,e.dept_id,AVG(s.salary) OVER(PARTITION BY e.dept_id ORDER BY e.emp_id) AS dept_avg_salary
FROM  Cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id=s.emp_id;

---• Show total salary of each department for every employee
SELECT e.emp_id,s.salary,e.dept_id,SUM(s.salary) OVER(PARTITION BY e.dept_id) AS dept_total_salary
FROM  Cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id=s.emp_id;

---Show average performance rating of each department
SELECT e.emp_id,e.dept_id,(p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 AS emp_avg_rating,
AVG((p.rating_2022 + p.rating_2023 + p.rating_2024) / 3) OVER (PARTITION BY e.dept_id) AS dept_avg_rating
FROM Cleaned_employee e
JOIN cleaned_performance p ON e.emp_id = p.emp_id;