----• Create a temporary result set using CTE and filter data from it
WITH salary_cte AS (
    SELECT emp_id,
           salary
    FROM cleaned_salaries
)

SELECT * FROM salary_cte
where emp_id =62;

----• Combine employees and salaries using CTE
with emp_sal_cte as(
    select e.emp_id,e.emp_name,s.salary
    from cleaned_employee e join cleaned_salaries s on e.emp_id=s.emp_id
)
select * from emp_sal_cte;

----• Calculate department average salary using CTE
WITH dept_avg AS (
    SELECT e.dept_id,
           AVG(s.salary) AS avg_salary
    FROM cleaned_employee e
    JOIN cleaned_salaries s
        ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
)

SELECT *
FROM dept_avg;

---• Find employees earning more than department average using CTE
WITH emp_sal_avg AS (
    SELECT e.emp_id, e.emp_name, e.dept_id, s.salary, AVG(s.salary) OVER(PARTITION BY e.dept_id) AS avg_salary
    FROM cleaned_employee e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
)
SELECT *
FROM emp_sal_avg
WHERE salary > avg_salary;
