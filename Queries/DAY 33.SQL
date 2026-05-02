---• Update employee data using a view
create view v_emp_details as(select emp_id,emp_name,city
from cleaned_employee);

---emp_id 101 and city as HYDERABAD
SELECT * FROM v_emp_details  where emp_id=101;
update v_emp_details set city ='HYDERABAD' where emp_id=101;

---• Create view for high salary employees (salary > 50000) and fetch data from it
create view high_salary_view as(select e.emp_id,e.emp_name,e.city,s.salary
from cleaned_employee e join cleaned_salaries s 
on e.emp_id=s.emp_id);
select * from high_salary_view where salary>50000;



---• Create multi-table view combining employee, department, and salary
create view emp_dept_sal_view as(select e.emp_id,e.emp_name,e.city,d.dept_id,s.salary
from cleaned_employee e join cleaned_salaries s 
on e.emp_id=s.emp_id join cleaned_department d
on e.dept_id=d.dept_id);
select * from emp_dept_sal_view;

---• Create HR dashboard view for high salary employees with department name
create view hr_dashboard_view as(select e.emp_id,e.emp_name,e.city,d.dept_name,s.salary
from cleaned_employee e join cleaned_salaries s 
on e.emp_id=s.emp_id join cleaned_department d
on e.dept_id=d.dept_id);
select * from hr_dashboard_view where salary>50000;
