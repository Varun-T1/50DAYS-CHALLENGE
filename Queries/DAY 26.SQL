--• Find rank of employees within each department based on salary
SELECT e.emp_id,s.salary,e.dept_id,
    RANK() OVER(PARTITION BY e.dept_id ORDER BY s.salary DESC) AS department_rank
FROM cleaned_employee e
JOIN cleaned_salaries s ON s.emp_id = e.emp_id;

--• Compare each employee’s salary with their department average (Above Avg / Below Avg / Equal)
SELECT e.emp_id,s.salary,e.dept_id ,AVG(s.salary) OVER (PARTITION BY e.dept_id) as avg_sal,
CASE 
    WHEN s.salary > AVG(s.salary) OVER (PARTITION BY e.dept_id) THEN 'Above Avg'
    WHEN s.salary < AVG(s.salary) OVER (PARTITION BY e.dept_id) THEN 'Below Avg'
    ELSE 'Equal'
END AS salary_comparison
FROM cleaned_employee e 
JOIN cleaned_salaries s ON s.emp_id = e.emp_id;

--• Find top 3 highest paid employees in each department
SELECT *
FROM (SELECT e.emp_id,e.emp_name,e.dept_id,s.salary,RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS rnk
    FROM cleaned_employee e
    JOIN cleaned_salaries s ON s.emp_id = e.emp_id
) AS ranked
WHERE rnk <= 3;

--• Find lowest salary employee in each department
SELECT *
FROM (SELECT e.emp_id,e.emp_name,e.dept_id,s.salary,RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary ASC) AS rnk
    FROM cleaned_employee e
    JOIN cleaned_salaries s ON s.emp_id = e.emp_id
) AS ranked
WHERE rnk <= 3;
