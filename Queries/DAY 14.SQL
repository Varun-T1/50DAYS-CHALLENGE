--- List employees earning more than the department average salary
SELECT e1.emp_id, e1.emp_name, s1.salary, e1.dept_id
FROM cleaned_employee e1
JOIN cleaned_salaries s1 
ON e1.emp_id = s1.emp_id
WHERE s1.salary > (
    SELECT AVG(s.salary)
    FROM cleaned_employee e
    JOIN cleaned_salaries s 
    ON e.emp_id = s.emp_id
    WHERE e.dept_id = e1.dept_id)ORDER BY e1.emp_id ASC;

----• List employees whose salary is equal to the highest salary in their department
SELECT e1.emp_id, e1.emp_name, s1.salary, e1.dept_id
FROM cleaned_employee e1
JOIN cleaned_salaries s1 
ON e1.emp_id = s1.emp_id
WHERE s1.salary = (
    SELECT MAX(s.salary)
    FROM cleaned_employee e
    JOIN cleaned_salaries s 
    ON e.emp_id = s.emp_id
    WHERE e.dept_id = e1.dept_id)ORDER BY e1.emp_id ASC;



-----• List all employees whose salary is equal to the lowest salary in their department
SELECT e1.emp_id, e1.emp_name, s1.salary, e1.dept_id
FROM cleaned_employee e1
JOIN cleaned_salaries s1
ON e1.emp_id = s1.emp_id
WHERE s1.salary = (
    SELECT MIN(s.salary)
    FROM cleaned_employee e
    JOIN cleaned_salaries s 
    ON e.emp_id = s.emp_id
    WHERE e.dept_id = e1.dept_id)ORDER BY e1.emp_id ASC;