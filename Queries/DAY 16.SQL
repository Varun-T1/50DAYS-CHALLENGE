------Calculate total salary paid to each employee
SELECT e.emp_id, e.emp_name, SUM(s.salary) AS total_salary
FROM cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
ORDER BY total_salary DESC;
USE 50_day_challenge;

-----Calculate average salary of each employee
SELECT e.emp_id, e.emp_name, AVG(s.salary) AS average_salary
FROM cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name ;

---Count number of salary records for each employee
SELECT e.emp_id, e.emp_name, COUNT(s.salary) AS salary_count
FROM cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name ;


----Find maximum salary received by each employee
SELECT e.emp_id, e.emp_name, MAX(s.salary) AS max_salary
FROM cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name ;
