USE 50_day_challenge;
-- What are the performance ratings of each employee?
SELECT e.emp_id,e.emp_name,p.rating_2022,p.rating_2023,p.rating_2024
FROM cleaned_employee e
JOIN cleaned_performance p ON e.emp_id = p.emp_id;

---- Which employees do not have any salary records?
SELECT e.emp_id,e.emp_name,s.salary
FROM cleaned_employee e
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary IS NULL;

---Which employees do not have any attendance records?
SELECT e.emp_id,e.emp_name,a.attendance_date,a.status
FROM cleaned_employee e
LEFT JOIN cleaned_attendance a ON e.emp_id = a.emp_id
WHERE a.attendance_date IS NULL;


--What is the employee name, department, and salary together?
SELECT e.emp_id,e.emp_name,d.dept_name,s.salary
FROM cleaned_employee e
JOIN cleaned_department d ON e.dept_id = d.dept_id
JOIN cleaned_salaries s ON e.emp_id = s.emp_id;