----• Create procedure with IF condition to return message based on salary
DELIMITER //
CREATE PROCEDURE check_salary_1(IN emp_id_input INT)
BEGIN
    DECLARE emp_salary INT;
    SELECT salary INTO emp_salary FROM cleaned_salaries 
    WHERE emp_id = emp_id_input limit 1;
    
    IF emp_salary > 50000 THEN
        SELECT 'High Salary';
    ELSE
        SELECT 'Low Salary';
    END IF;
END //
DELIMITER 
call check_salary_1(11);

---• Create procedure with CASE statement to categorize employees (High / Medium / Low)
DELIMITER //
CREATE PROCEDURE get_salary_category_2(IN emp_id_input INT)
BEGIN
    DECLARE emp_salary INT;
    
    SELECT salary INTO emp_salary FROM cleaned_salaries 
    WHERE emp_id = emp_id_input;
    
    CASE 
        WHEN emp_salary > 80000 THEN
            SELECT 'Category A (Top Tier)';
        WHEN emp_salary > 50000 THEN
            SELECT 'Category B (Upper Tier)';
        WHEN emp_salary > 20000 THEN
            SELECT 'Category C (Mid Tier)';
        ELSE
            SELECT 'Category D (Lower Tier)';
    END CASE;
END //
DELIMITER ;

call get_salary_category_2(101);      

----• Create procedure using aggregation to calculate total salary per employee
DELIMITER //
CREATE PROCEDURE get_total_salary()      
BEGIN
    SELECT 
        emp_id, 
        name, 
         SUM(salary) as total_salary
    FROM cleaned_employee e
    join cleaned_salaries s on e.emp_id=s.emp_id
    group by emp_id, name;
END //
DELIMITER ;

call get_total_salary();
