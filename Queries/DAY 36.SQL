----• Create a procedure to get all employee data
DELIMITER //
CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT * FROM cleaned_employee;
END //
DELIMITER ;

call get_all_employees();

---• Create a procedure with input parameter to find employee by emp_id
DELIMITER //
CREATE PROCEDURE get_employee_by_id_bi(IN emp_id_input INT)
BEGIN
    SELECT * FROM cleaned_employee WHERE emp_id = emp_id_input;
END //
DELIMITER ;

call get_employee_by_id_bi(101);

---• Create a procedure using JOIN to fetch employee and salary details
DELIMITER //
CREATE PROCEDURE get_employee_salary_details(IN emp_id_input INT)
BEGIN
    SELECT * FROM cleaned_employee e join cleaned_salaries s 
    on e.emp_id=s.emp_id WHERE e.emp_id=emp_id_input;
END //
DELIMITER ;

---• Create a procedure for salary report (employees with salary > 50000)
DELIMITER //
CREATE PROCEDURE get_salary_report()
BEGIN
    SELECT * FROM cleaned_employee e join cleaned_salaries s 
    on e.emp_id=s.emp_id WHERE s.salary > 50000;
END //
DELIMITER ;

call get_salary_report();
