---• Create BEFORE INSERT trigger to prevent negative salary insertion
DELIMITER //
CREATE TRIGGER prevent_negative_salary_insert
BEFORE INSERT ON cleaned_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //
DELIMITER ;

INSERT INTO cleaned_salaries (emp_id,salary,salary_id,salary_date)values(202702,-644474,7045,'2026-08-01');

SELECT * FROM cleaned_salaries;


---• Automatically convert negative salary values to 0 before inserting data

UPDATE cleaned_salaries SET salary = 0 WHERE salary < 0;

SELECT * FROM cleaned_salaries WHERE salary < 0;

---• • Create AFTER UPDATE trigger to track salary changes Store old salary and new salary records inside salary_logs table
CREATE Table new_log_salary (emp_id INT,old_salary INT,new_salary INT);
DELIMITER //
CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON cleaned_salaries
FOR EACH ROW
BEGIN
    INSERT INTO new_log_salary (emp_id, old_salary, new_salary)
    VALUES (NEW.emp_id, OLD.salary, NEW.salary);
END //
DELIMITER ;

UPDATE cleaned_salaries SET salary=70000 WHERE emp_id=463;

SELECT * FROM new_log_salary;

