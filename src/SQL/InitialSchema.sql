-- SQL initialization code

/* These lines temporarily disable certain checks and set a specific SQL mode:

UNIQUE_CHECKS=0: Disables unique key checks, which can speed up table imports.
FOREIGN_KEY_CHECKS=0: Disables foreign key constraint checking, allowing you to import data in any order.
SQL_MODE=...: Sets a specific SQL mode that enforces stricter data integrity rules.


Before changing these settings, the current values are stored in variables (@OLD_...), so they can be restored later.*/


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Create the database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS employee_management_system;
USE employee_management_system;

-- Drop tables if they exist to ensure a clean slate
DROP TABLE IF EXISTS responsibilities;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS employee_roles;
DROP TABLE IF EXISTS role_responsibilities;
DROP TABLE IF EXISTS employee_responsibilities;

-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    hire_date DATE,
    teaching_salary DECIMAL(10, 2),
    hospitality_salary DECIMAL(10, 2)
);

-- Create the roles table
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL,
    sub_flag BOOLEAN NOT NULL,
    description TEXT NOT NULL
);

-- Create the responsibilities table
CREATE TABLE responsibilities (
    responsibility_id INT PRIMARY KEY AUTO_INCREMENT,
    description TEXT NOT NULL
);

-- Create the employee_roles junction table
CREATE TABLE employee_roles (
    id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Create the role_responsibilities junction table
CREATE TABLE role_responsibilities (
    id INT PRIMARY KEY,
    responsibility_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (responsibility_id) REFERENCES responsibilities(responsibility_id)
);

-- Create the employee_responsibilities table to track responsibility assignments
CREATE TABLE employee_responsibilities (
    id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    responsibility_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (responsibility_id) REFERENCES responsibilities(responsibility_id),
    assigned_date DATE NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending'
);

-- Restore previous SQL settings
/*These lines restore the original settings:

They set the SQL mode, foreign key checks, and unique checks back to their original values.
This ensures that after your script runs, the database environment returns to its normal operating state.

The purpose of temporarily changing these settings is to:

Improve performance during large data imports or schema changes.
Allow for more flexibility in the order of operations when creating or modifying tables.
Ensure that strict SQL rules are applied during the schema creation.

However, it's crucial to restore these settings afterward to maintain data integrity 
during normal database operations. This practice is especially useful in development environments 
where you might frequently reset and recreate your database schema.*/

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;