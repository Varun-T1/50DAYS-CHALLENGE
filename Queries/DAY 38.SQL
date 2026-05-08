--- Create BEFORE UPDATE trigger to prevent negative salary updates
DELIMITER //
CREATE TRIGGER prevent_negative_salary
BEFORE UPDATE ON cleaned_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET new.salary = old.salary;
    END IF;
END //
DELIMITER ;

SELECT * FROM cleaned_salaries WHERE emp_id=164;


UPDATE cleaned_salaries SET salary=-53324 WHERE emp_id=164 ;

--- Create AFTER INSERT trigger to log attendance records automatically
CREATE TABLE attendance_logs ( emp_id INT, attendance_date DATE, message VARCHAR(200));
DELIMITER //
CREATE TRIGGER log_attendance_insert
AFTER INSERT ON cleaned_attendance
FOR EACH ROW
BEGIN
    INSERT INTO attendance_logs (emp_id, attendance_date, message)
    VALUES (NEW.emp_id, NEW.attendance_date, 'attendece added');
END //
DELIMITER ;

select * from attendance_logs;

---• Store attendance activity inside attendance_logs table

INSERT INTO cleaned_attendance VALUES (202601,101, '2026-08-06', 'present');


---• Test trigger execution using UPDATE and INSERT operations
DELIMITER //
CREATE TRIGGER log_attendance_upd
AFTER UPDATE ON cleaned_attendance
FOR EACH ROW
BEGIN
    INSERT INTO attendance_logs (emp_id, attendance_date, message)
    VALUES (NEW.emp_id, NEW.attendance_date, 'attendece added');
END //
DELIMITER ;

SELECT emp_id FROM cleaned_attendance where emp_id=101;

UPDATE cleaned_attendance SET status='Absent' WHERE emp_id=101;