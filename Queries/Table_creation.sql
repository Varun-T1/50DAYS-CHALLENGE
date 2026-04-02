use 50_day_challenge;

-#-- CREATE TABLE department

CREATE TABLE department (
   ddept_id VARCHAR(60),
   	dept_name  VARCHAR(60));

# --CREATE TABLE employee

CREATE TABLE employee (
   emp_id VARCHAR(60),
    emp_name VARCHAR(60),
    age VARCHAR(60),
    city	VARCHAR(60),
    dept_id	VARCHAR(60),
    hire_date VARCHAR(60)
    );

#--CREATE TABLE salaries

CREATE TABLE salaries( 
    salary_id VARCHAR(60),
    emp_id VARCHAR(60),
    salary VARCHAR(60),
    salary_date VARCHAR(60)
    );

   
#--CREATE TABLE attendance

    CREATE TABLE attendance (
        attendance_id VARCHAR(60),
        emp_id VARCHAR(60),
        attendance_date VARCHAR(60),
        status VARCHAR(60)
    );

 #---CREATE TABLE performance

 CREATE TABLE performance (
    emp_id VARCHAR(60),
    rating_2022 VARCHAR(60),
    rating_2023 VARCHAR(60),
    rating_2024 VARCHAR(60)
);
 USE 50_day_challenge;

CREATE TABLE Cleaned_department
as
SELECT * FROM department;
 
CREATE TABLE Cleaned_employee
as
SELECT * FROM employee;

CREATE TABLE Cleaned_salaries
 as
SELECT * FROM salaries;
  
CREATE TABLE Cleaned_attendance
 as
SELECT * FROM attendance;
  
CREATE TABLE Cleaned_performance
 as
SELECT * FROM performance;
SELECT * FROM Cleaned_department;

