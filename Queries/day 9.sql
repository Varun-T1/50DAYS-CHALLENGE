USE 50_day_challenge;
----Show only employees who have a valid department

SELECT e.emp_id,e.emp_name,d.dept_name
FROM cleaned_employee e
JOIN cleaned_department d ON e.dept_id = d.dept_id;

---Show all employees (even without department)
SELECT e.emp_id,e.emp_name,d.dept_name
FROM cleaned_employee e
LEFT JOIN cleaned_department d ON e.dept_id = d.dept_id;

--- Find employees without department
SELECT e.emp_id,e.emp_name,d.dept_name
FROM cleaned_employee e
LEFT JOIN cleaned_department d ON e.dept_id = d.dept_id
WHERE d.dept_name IS NULL;

---Find who earns how much
SELECT e.emp_id,e.emp_name,s.salary
FROM cleaned_employee e 
JOIN cleaned_salaries s ON e.emp_id = s.emp_id;

--List employees without salary
SELECT e.emp_id,e.emp_name,s.salary
FROM cleaned_employee e
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary IS NULL;