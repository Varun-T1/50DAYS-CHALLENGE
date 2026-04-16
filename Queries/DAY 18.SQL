----List employees whose average performance rating is greater than 4
SELECT e.emp_id,e.emp_name,d.dept_name,(p.rating_2022+p.rating_2023+p.rating_2024)/3 AS avg_rating
FROM cleaned_employee  e
JOIN cleaned_department d ON e.dept_id = d.dept_id
join cleaned_performance p on e.emp_id=p.emp_id
WHERE (p.rating_2022+p.rating_2023+p.rating_2024)/3 > 4;


---List employees with more than 2 present days
SELECT e.emp_id,e.emp_name,COUNT(a.attendance_date) AS present_days
FROM cleaned_employee  e
join cleaned_attendance a on e.emp_id=a.emp_id
GROUP BY e.emp_id,e.emp_name
HAVING COUNT(a.attendance_date) > 10;


---List departments where total salary paid is greater than 200000
SELECT d.dept_id,d.dept_name,SUM(s.salary) AS total_salary
FROM cleaned_department d
JOIN cleaned_employee e ON d.dept_id = e.dept_id
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_id,d.dept_name
HAVING SUM(s.salary) > 200000;  

---List employees whose total salary is greater than their department average salary
SELECT emp_id, dept_id, total_salary
FROM (
    SELECT e.emp_id,e.dept_id,SUM(s.salary) AS total_salary,AVG(SUM(s.salary)) OVER 
    (PARTITION BY e.dept_id) AS dept_avg_salary
    FROM cleaned_employee e
    JOIN cleaned_salaries s 
        ON e.emp_id = s.emp_id
    GROUP BY e.emp_id, e.dept_id
) t
WHERE total_salary > dept_avg_salary;