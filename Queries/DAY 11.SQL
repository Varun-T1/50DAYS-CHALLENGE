USE 50_day_challenge;

----What is the employee name, department, and performance ratings?
SELECT e.emp_id,e.emp_name,d.dept_name,p.rating_2022,p.rating_2023,p.rating_2024
FROM cleaned_employee e
JOIN cleaned_department d ON e.dept_id = d.dept_id
JOIN cleaned_performance p ON e.emp_id = p.emp_id;

---What is the complete profile of each employee (department, salary, performance)?
SELECT e.emp_id,e.emp_name,d.dept_name,s.salary,p.rating_2022,p.rating_2023,p.rating_2024
FROM cleaned_employee e
LEFT JOIN cleaned_department d ON e.dept_id = d.dept_id
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
LEFT JOIN cleaned_performance p ON e.emp_id = p.emp_id;

------How many salary records does each employee have?
SELECT e.emp_id,e.emp_name,COUNT(s.salary_id) AS salary_count
FROM cleaned_employee e
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id,e.emp_name;

---• What is the total salary paid to each employee?
SELECT e.emp_id,e.emp_name,SUM(s.salary) AS total_salary
FROM cleaned_employee e
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id 
GROUP BY e.emp_id,e.emp_name;