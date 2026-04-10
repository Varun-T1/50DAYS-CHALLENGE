USE 50_day_challenge;

-----What is the average  salary for each department?
SELECT d.dept_name,AVG(s.salary) AS avg_salary
FROM cleaned_employee e
JOIN cleaned_department d ON e.dept_id = d.dept_id
JOIN Cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

---how many days has each employee attended present?
SELECT e.emp_id,e.emp_name,COUNT(a.attendance_id) AS present_days
FROM cleaned_employee e
JOIN cleaned_attendance a ON e.emp_id = a.emp_id
WHERE a.status = 'present'
GROUP BY e.emp_id, e.emp_name;

--which employee  belong to same department?
SELECT dept_id, GROUP_CONCAT(emp_name) AS employees
FROM cleaned_employee
GROUP BY dept_id
HAVING COUNT(*) > 1;

--which employee has more than 1 salary record?
SELECT e.emp_id,e.emp_name,COUNT(s.salary_id) AS salary_count
FROM cleaned_employee e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id,e.emp_name
HAVING COUNT(s.salary_id) > 1;