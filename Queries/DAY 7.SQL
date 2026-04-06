---1.Remove mount (invalid)>12
UPDATE cleaned_employee
set hire_date =null
WHERE
cast(SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date,'-', 2),'-', -1) AS UNSIGNED) > 12;

---STEP 2 DD-MM-YYYY TO YYYY-MM-DD

UPDATE cleaned_employee
SET hire_date = CONCAT
(RIGHT(hire_date, 4),'-',SUBSTRING(hire_date,4, 2),'-', LEFT(hire_date, 2))
WHERE hire_date LIKE '__-__-____';

---STEP 3 REMOVE INVALID DATE

UPDATE cleaned_employee
SET hire_date = null
WHERE CAST(RIGHT(hire_date, 2) AS UNSIGNED) > 31;

ALTER TABLE cleaned_employee
MODIFY hire_date DATE;

SELECT DISTINCT hire_date FROM cleaned_employee;

--REPLACE NULL AND EMTY VALUE WITH -'2024-02-2025'
UPDATE cleaned_employee
SET hire_date ='2024-02-25'
WHERE hire_date IS NULL ;

---1.Remove mount (invalid)>12
UPDATE cleaned_salaries
set salary_date=null
WHERE
cast(SUBSTRING_INDEX(SUBSTRING_INDEX(salary_date,'-', 2),'-', -1) AS UNSIGNED) > 12;

---STEP 2 DD-MM-YYYY TO YYYY-MM-DD

UPDATE cleaned_salaries
SET salary_date = CONCAT
(RIGHT(salary_date, 4),'-',SUBSTRING(salary_date,4, 2),'-', LEFT(salary_date, 2))
WHERE salary_date LIKE '__-__-____';

UPDATE cleaned_salaries
SET salary_date = null
WHERE CAST(RIGHT(salary_date, 2) AS UNSIGNED) > 31;

ALTER TABLE cleaned_salaries
MODIFY salary_date DATE;

SELECT DISTINCT salary_date FROM cleaned_salaries;

--REPLACE NULL AND EMTY VALUE WITH -'2024-02-2025'
UPDATE cleaned_salaries
SET salary_date ='2024-02-25'
WHERE salary_date IS NULL ;

attendance_date
---1.Remove mount (invalid)>12
UPDATE cleaned_attendance
set attendance_date=null
WHERE
cast(SUBSTRING_INDEX(SUBSTRING_INDEX(attendance_date,'-', 2),'-', -1) AS UNSIGNED) > 12;


---STEP 2 DD-MM-YYYY TO YYYY-MM-DD
UPDATE cleaned_attendance
SET attendance_date = CONCAT
(RIGHT(attendance_date, 4),'-',SUBSTRING(attendance_date,4, 2),'-', LEFT(attendance_date, 2))
WHERE attendance_date LIKE '__-__-____';

UPDATE cleaned_attendance
SET attendance_date = null
WHERE CAST(RIGHT(attendance_date, 2) AS UNSIGNED) > 31;

ALTER TABLE cleaned_attendance
MODIFY attendance_date DATE;

SELECT DISTINCT attendance_date FROM cleaned_attendance;

--REPLACE NULL AND EMTY VALUE WITH -'2024-02-2025'
UPDATE cleaned_attendance
SET attendance_date ='2024-02-25'
WHERE attendance_date IS NULL ;