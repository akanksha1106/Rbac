-- Step 1: Create a sample database
CREATE DATABASE companyDB;
USE companyDB;

-- Step 2: Create a sample table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Step 3: Create roles
CREATE ROLE 'admin_role';
CREATE ROLE 'editor_role';
CREATE ROLE 'viewer_role';

-- Step 4: Grant privileges to each role

-- Admin: Full access to all tables
GRANT ALL PRIVILEGES ON companyDB.* TO 'admin_role';

-- Editor: Can insert, update, and select data
GRANT SELECT, INSERT, UPDATE ON companyDB.employees TO 'editor_role';

-- Viewer: Can only view data
GRANT SELECT ON companyDB.employees TO 'viewer_role';

-- Step 5: Create users
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@123';
CREATE USER 'editor_user'@'localhost' IDENTIFIED BY 'Editor@123';
CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'Viewer@123';

-- Step 6: Assign roles to users
GRANT 'admin_role' TO 'admin_user'@'localhost';
GRANT 'editor_role' TO 'editor_user'@'localhost';
GRANT 'viewer_role' TO 'viewer_user'@'localhost';

-- Step 7: Activate roles for each user
SET DEFAULT ROLE ALL TO 'admin_user'@'localhost';
SET DEFAULT ROLE ALL TO 'editor_user'@'localhost';
SET DEFAULT ROLE ALL TO 'viewer_user'@'localhost';

-- Step 8: Verify privileges
SHOW GRANTS FOR 'admin_user'@'localhost';
SHOW GRANTS FOR 'editor_user'@'localhost';
SHOW GRANTS FOR 'viewer_user'@'localhost';

-- Step 9: Test role-based access
-- (Run these after logging in as each user)

-- As admin_user
-- Can perform all actions
INSERT INTO employees (emp_name, department, salary) VALUES ('Akanksha', 'HR', 50000);
UPDATE employees SET salary = 52000 WHERE emp_id = 1;
DELETE FROM employees WHERE emp_id = 1;

-- As editor_user
-- Can insert and update, but cannot delete
INSERT INTO employees (emp_name, department, salary) VALUES ('John', 'IT', 60000);
UPDATE employees SET salary = 65000 WHERE emp_id = 2;
-- DELETE FROM employees WHERE emp_id = 2;  -- ❌ Access denied

-- As viewer_user
-- Can only view data
SELECT * FROM employees;
-- INSERT or UPDATE will be denied
