----• List employees with salary records (at least once)
SELECT e.emp_id, e.emp_name
FROM cleaned_employee e
WHERE EXISTS (
 SELECT 1 FROM cleaned_salaries s
    WHERE e.emp_id = s.emp_id);

----List employees without salary records
SELECT e.emp_id, e.emp_name
FROM cleaned_employee e
WHERE NOT EXISTS (
 SELECT 1 FROM cleaned_salaries s
    WHERE e.emp_id = s.emp_id);

-----List employees with attendance records
SELECT e.emp_id, e.emp_name
FROM cleaned_employee e
WHERE EXISTS (
 SELECT 1 FROM cleaned_attendance a
    WHERE e.emp_id = a.emp_id); 

-----List employees without attendance records
SELECT e.emp_id, e.emp_name
FROM cleaned_employee e
WHERE NOT EXISTS (
 SELECT 1 FROM cleaned_attendance a
    WHERE e.emp_id = a.emp_id);