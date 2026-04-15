----List employees with more than 2 salary records
SELECT emp_id, COUNT(*) AS salary_record_count
FROM Cleaned_salaries
GROUP BY emp_id
HAVING COUNT(*) > 2;

---List departments with more than 3 employees
SELECT dept_id, COUNT(*) AS employee_count
FROM Cleaned_employee
GROUP BY dept_id
HAVING COUNT(*) > 3;

-----List employees with total salary greater than 100000
SELECT emp_id, SUM(salary) AS total_salary
FROM Cleaned_salaries
GROUP BY emp_id
HAVING SUM(salary) > 100000;

----List departments with high average salary (greater than 50000)
SELECT e.dept_id, AVG(s.salary) AS average_salary
FROM  cleaned_employee e
join cleaned_salaries s on e.emp_id = s.emp_id
GROUP BY e.dept_id
HAVING AVG(s.salary) > 50000;
