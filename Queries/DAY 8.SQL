USE 50_day_challenge;

UPDATE Cleaned_employee
SET emp_name =TRIM(emp_name);

--DATATYPE CONVERSION

--1.Employee table
ALTER TABLE cleaned_employee
MODIFY emp_id INT,
MODIFY emp_name VARCHAR(100),
MODIFY age INT,
MODIFY city VARCHAR(90),
MODIFY dept_id INT,
MODIFY hire_date DATE;

DESCRIBE cleaned_employee;

--2.Department table
ALTER TABLE cleaned_department
MODIFY dept_id INT,
MODIFY dept_name VARCHAR(90);

DESCRIBE cleaned_department;

--3.Salaries table
ALTER TABLE cleaned_salaries
MODIFY salary_id INT,
MODIFY emp_id INT,
MODIFY salary INT,
MODIFY salary_date DATE;

DESCRIBE cleaned_salaries;

--4.Attendance table
ALTER TABLE cleaned_attendance
MODIFY attendance_id INT,
MODIFY emp_id INT,
MODIFY attendance_date DATE,
MODIFY status VARCHAR(100);

DESCRIBE cleaned_attendance;

--5.Performance table
ALTER TABLE cleaned_performance
MODIFY emp_id INT,
MODIFY rating_2022 INT,
MODIFY rating_2023 INT,
MODIFY rating_2024 INT;

DESCRIBE cleaned_performance;