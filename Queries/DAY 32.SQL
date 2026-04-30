-----• Create employee view to store reusable employee details
CREATE view emp_view as(select emp_id,emp_name,dept_id,city 
from cleaned_employee);

SELECT * FROM emp_view WHERE city ='Mumbai';

---• Create salary view to store salary-related data
create view sal_view as(select emp_id,salary,salary_date
from cleaned_salaries);

SELECT * FROM sal_view WHERE salary > 50000;

----• Create joined view combining employee and salary details
create view emp_sal_view as(select e.emp_id,e.emp_name,e.city,e.dept_id,
s.salary,s.salary_date
from cleaned_employee e join cleaned_salaries s 
on e.emp_id=s.emp_id);

select * from emp_sal_view where city ="Chennai";

---• Use created view to filter employees with salary greater than 50000
SELECT *
FROM emp_sal_view
WHERE salary > 50000;

