--• Find employees whose total salary is greater than 100000
with total_sal as(
    select emp_id,
    sum(salary) as total_salary
    from cleaned_salaries 
    GROUP BY emp_id),higher_sal as(select * from total_sal where total_salary > 100000)
select * from higher_sal;

----• Show employee salary along with department average salary using CTE
with dept_avg as(
    select e.emp_id,e.dept_id,s.salary,
    avg(salary) over(partition by e.dept_id) as avg_salary
    from cleaned_employee e join cleaned_salaries s on e.emp_id = s.emp_id
)
select * from dept_avg;

----• Find department with highest total salary
with dept_total as(
    select e.dept_id,sum(salary) as total_salary
    from cleaned_employee e join cleaned_salaries s on e.emp_id = s.emp_id
    GROUP BY e.dept_id),
highest_dept_salary as(select * from dept_total order by total_salary desc limit 1)
select * from highest_dept_salary;

