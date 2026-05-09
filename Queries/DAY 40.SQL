-----• Create temporary table for employee salary summary
CREATE TEMPORARY TABLE temp_sal_summary
(emp_id INT,total_salary int);

-----• Insert aggregated salary data into temporary table

insert into temp_sal_summary (emp_id,total_salary)
select emp_id,sum(salary)from cleaned_salaries GROUP BY emp_id;

select * from temp_sal_summary;

----• Join temporary table with employee table to fetch employee details

select e.emp_id,e.emp_name,t.total_salary
from temp_sal_summary t
JOIN cleaned_employee_data e 
ON t.emp_id=e.emp_id;

----Drop temporary table after usage
DROP TEMPORARY TABLE temp_sal_summary;
