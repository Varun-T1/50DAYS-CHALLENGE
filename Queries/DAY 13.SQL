USE 50_day_challenge;

---List employees earning more than average salary
SELECT e.emp_id , e.emp_name, s.salary
FROM cleaned_employee e
JOIN Cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary > (SELECT AVG(salary) FROM  Cleaned_salaries s);

--List employees with salary equal to maximum salary
SELECT e.emp_id , e.emp_name, s.salary
FROM cleaned_employee e
JOIN Cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary = (SELECT MAX(salary) FROM  Cleaned_salaries s);


---• List employees earning less than average salary
SELECT e.emp_id , e.emp_name, s.salary
FROM cleaned_employee e
JOIN Cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary < (SELECT AVG(salary) FROM  Cleaned_salaries s);

----List employees with minimum salary
SELECT e.emp_id , e.emp_name, s.salary
FROM cleaned_employee e
JOIN Cleaned_salaries s ON e.emp_id = s.emp_id
WHERE s.salary = (SELECT MIN(salary) FROM  Cleaned_salaries s);