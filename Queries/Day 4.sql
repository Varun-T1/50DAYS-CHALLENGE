---emp table
with cte as (
select * ,ROW_NUMBER() OVER (PARTITION BY emp_id ,emp_name,city
 ORDER BY emp_id) as rn
from Cleaned_employee)
delete from cleaned_employee
where emp_id in 
(select emp_id from cte where rn > 1);

--performance table
with cte as (
select * ,ROW_NUMBER() OVER (PARTITION BY emp_id,rating_2022,rating_2023,rating_2024
 ORDER BY emp_id) as rn
from Cleaned_performance)
delete from cleaned_performance
where emp_id in
(select emp_id from cte where rn > 1);

--salaries table
with cte as (
select * ,ROW_NUMBER() OVER
 (PARTITION BY salary_id,emp_id
 ORDER BY salary_id) as rn 
from Cleaned_salaries)
delete from cleaned_salaries
where salary_id in
(select salary_id from cte where rn > 1);

---task 2 identify textual inconsistencies
--city

SELECT  DISTINCT city FROM Cleaned_employee;

SELECT DISTINCT dept_name FROM cleaned_department;

--cahnge fist letter of city to upper case and rest to lower case 
 
 UPDATE cleaned_employee
 set city=concat(upper(left(TRIM(city),1)),
 lower(substring(TRIM(city),2)));


UPDATE cleaned_employee
set city = case
WHEN city IN ('Dlhi','Delhi NCR','New delhi') THEN 'Delhi'
WHEN city IN ('Hydbd') THEN 'Hyderabad'
WHEN city IN ('Bangalore') THEN 'Bengaluru'
ELSE city
END;


TRUNCATE TABLE cleaned_employee;