---• Create index on emp_id to speed up employee search
create index idx_emp_id on cleaned_employee (emp_id);   

---• Create index on dept_id for faster department-based filtering
create index idx_dept_id on cleaned_employee (dept_id);   

---• Create composite index on (emp_id, salary_date) for optimized multi-column queries
create index idx_emp_id_salary_date on cleaned_salaries (emp_id,salary_date);   