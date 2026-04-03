USE 50_day_challenge;
 

 update Cleaned_employee
set emp_name = 'unknown' WHERE emp_name IS NULL
 OR emp_name = ''


-emp age
update Cleaned_employee
set age = 'not_available'
WHERE age IS NULL OR age = '';



--EMP 13 =DELHI
update Cleaned_employee
set city='Delhi '
WHERE emp_id = 'EMP13';


update Cleaned_employee
set city='Delhi NCR'
WHERE city IS NULL OR city = '';


--RATEING 2023

UPDATE cleaned_performance
SET rating_2023 = 0
WHERE rating_2023 IS NULL OR rating_2023 = '';


----FIND DUPLICATE IN CLEANED_EMPLOYEE
SELECT emp_id,emp_name,city ,COUNT(*) 
FROM Cleaned_employee
GROUP BY emp_id,emp_name,city
HAVING COUNT(*) > 1;

--FIND DUPLICATE IN CLEANED_SALARIES
SELECT salary_id,emp_id,salary,salary_date, COUNT(*)
FROM Cleaned_salaries
GROUP BY salary_id,emp_id,salary,salary_date
HAVING COUNT(*) > 1;

--FIND DUPLICATE IN CLEANED_ATTENDANCE
SELECT attendance_id,attendance_date,status, COUNT(*)
FROM Cleaned_attendance
GROUP BY attendance_id,attendance_date,status
HAVING COUNT(*) > 1;

--FIND DUPLICATE IN CLEANED_PERFORMANCE
SELECT emp_id,rating_2022,rating_2023,rating_2024, COUNT(*)
FROM Cleaned_performance 
GROUP BY emp_id,rating_2022,rating_2023,rating_2024
HAVING COUNT(*) > 1;

---FIND DUPLICATE IN CLEANED_DEPARTMENT
SELECT dept_id,dept_name, COUNT(*)
FROM Cleaned_department
GROUP BY dept_id,dept_name
HAVING COUNT(*) > 1;