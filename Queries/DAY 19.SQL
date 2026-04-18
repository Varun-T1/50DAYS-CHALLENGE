---Categorize employees based on salary (Low 30000/ Medium 30000-60000 / High 60000+)
SELECT emp_id,salary,
CASE 
    WHEN salary < 30000 THEN 'Low'
    WHEN salary >= 30000 AND salary < 60000 THEN 'Medium'
    ELSE 'High'
END AS salary_category
FROM cleaned_salaries ;


----Categorize employees based on performance rating (Good >=4/ Average >=3/ Poor)
SELECT e.emp_id, e.emp_name, d.dept_name, (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 AS avg_rating, 
    CASE 
        WHEN (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 >= 4 THEN 'Good'
        WHEN (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 >= 3 THEN 'Average'
        ELSE 'Poor'
    END AS performance_category
FROM cleaned_employee e
JOIN cleaned_department d 
ON e.dept_id = d.dept_id
JOIN cleaned_performance p 
ON e.emp_id = p.emp_id;

-----Categorize employees based on attendance status (Active / Inactive)
SELECT e.emp_id,e.emp_name,COUNT(a.attendance_date) AS present_days,
CASE 
    WHEN COUNT(a.attendance_date) > 1 THEN 'Active'
    ELSE 'Inactive'
END AS attendance_status
FROM cleaned_employee  e
join cleaned_attendance a on e.emp_id=a.emp_id
GROUP BY e.emp_id,e.emp_name;

---• Categorize employees based on experience level (Fresher <2/ Mid-Level 2-5  / Experienced )
SELECT emp_id,emp_name,dept_id,hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS experience_years,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) < 2 THEN 'Fresher'
        WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) BETWEEN 2 AND 5 THEN 'Mid-Level'
        ELSE 'Experienced'
    END AS experience_level
FROM cleaned_employee;