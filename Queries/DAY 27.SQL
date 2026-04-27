•------ Compare each employee's salary with overall average salary (> avg → Above Avg, < avg → Below Avg,= avg → Equal)
SELECT e.emp_id,s.salary,AVG(s.salary) OVER () as avg_sal,
CASE 
    WHEN s.salary > AVG(s.salary) OVER () THEN 'Above Avg'
    WHEN s.salary < AVG(s.salary) OVER () THEN 'Below Avg'
    ELSE 'Equal'
END AS salary_comparison
FROM cleaned_employee e 
JOIN cleaned_salaries s ON s.emp_id = e.emp_id;

----• Compare employee salary with total salary of all employees (salary > 10% of total salary → High Contributor, else → Low Contributor)
SELECT e.emp_id,s.salary,SUM(s.salary) OVER () as total_sal,
CASE 
    WHEN s.salary > SUM(s.salary) OVER () * 0.1 THEN 'High Contributor'
    ELSE 'Low Contributor'
END AS salary_comparison
FROM cleaned_employee e 
JOIN cleaned_salaries s ON s.emp_id = e.emp_id;

---• Compare department total salary with overall total salary (dept total > 30% of total → High Dept, else → Low Dept)
SELECT 
 e.dept_id,
    SUM(s.salary) AS dept_total_salary,
    (SELECT SUM(salary) FROM cleaned_salaries) AS overall_total_salary,
    CASE 
     WHEN SUM(s.salary) > 0.3 * (SELECT SUM(salary) FROM cleaned_salaries)
        THEN 'High Dept'
        ELSE 'Low Dept'
    END AS dept_category
FROM cleaned_employee e
join cleaned_salaries s ON s.emp_id = e.emp_id
GROUP BY e.dept_id;