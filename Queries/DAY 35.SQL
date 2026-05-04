----• Analyze query performance before applying index using EXPLAIN ANALYZE
EXPLAIN ANALYZE  SELECT  e.emp_name,s.salary,e.emp_id,e.city
from cleaned_employee e join cleaned_salaries s on
e.emp_id=s.emp_id;

----• Apply index on join columns and compare performance after indexing
CREATE INDEX idx_emp_emp ON Cleaned_employee (emp_id);

----• Analyze query using multiple conditions (emp_id, salary_date) and optimize using composite index
CREATE INDEX idx_emp_sal ON cleaned_salaries (emp_id);

---after appying lets run analyse query again
EXPLAIN ANALYZE  SELECT  e.emp_name,s.salary,e.emp_id,e.city
from cleaned_employee e join cleaned_salaries s on
e.emp_id=s.emp_id;

----• Compare query performance before and after applying index on emp_id
EXPLAIN ANALYZE
SELECT  e.emp_name,s.salary,e.emp_id,e.city
from cleaned_employee e join cleaned_salaries s on
e.emp_id=s.emp_id
where e.emp_id=101; 

EXPLAIN ANALYZE
SELECT * FROM cleaned_salaries
WHERE emp_id=101;

