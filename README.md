# Rbac

# Build a Role-Based Access Control (RBAC) Model

 **What I Built**

I built a **Role-Based Access Control (RBAC)** system using **MySQL** to manage and control database access for different types of users — **Admin**, **Editor**, and **Viewer**.
This system defines specific roles, assigns permissions, and restricts unauthorized database actions like inserting, updating, or deleting data based on the user’s role.

The project includes:

* SQL scripts to **create users and roles**
* Granting and revoking privileges
* Demonstrating **role usage** through practical queries
* Screenshots showing access control in action



 **Why I Built It**

The purpose of this task was to:

* Enhance database security by ensuring that only authorized users can perform sensitive actions.
* Prevent accidental or unauthorized data modification in shared environments.
* Understand how SQL privileges, GRANT, REVOKE, and CREATE ROLE statements work in real-world database management.
* Simulate a real company structure, where Admins have full control, Editors can make changes, and Viewers can only read data.

 **How I Built It**

 **Created Database and Table**

```sql
CREATE DATABASE companyDB;
USE companyDB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```

**Created Roles**

```sql
CREATE ROLE 'admin_role';
CREATE ROLE 'editor_role';
CREATE ROLE 'viewer_role';
```

 **Granted Privileges**

```sql
GRANT ALL PRIVILEGES ON companyDB.* TO 'admin_role';
GRANT SELECT, INSERT, UPDATE ON companyDB.* TO 'editor_role';
GRANT SELECT ON companyDB.* TO 'viewer_role';
```

 **Created Users and Assigned Roles**

```sql
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@123';
CREATE USER 'editor_user'@'localhost' IDENTIFIED BY 'Editor@123';
CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'Viewer@123';

GRANT 'admin_role' TO 'admin_user'@'localhost';
GRANT 'editor_role' TO 'editor_user'@'localhost';
GRANT 'viewer_role' TO 'viewer_user'@'localhost';
```

 **Verified Access per Role**

Each user logged in and performed actions:

| Role   | Allowed Actions                | Restricted Actions     |
| ------ | ------------------------------ | ---------------------- |
| Admin  | SELECT, INSERT, UPDATE, DELETE | None                   |
| Editor | SELECT, INSERT, UPDATE         | DELETE                 |
| Viewer | SELECT                         | INSERT, UPDATE, DELETE |



 **Observed Results**

* **Admin:** All operations successful 
* **Editor:** Only SELECT, INSERT, UPDATE allowed 
* **Viewer:** Only SELECT allowed 



<img width="1366" height="768" alt="Screenshot (115)" src="https://github.com/user-attachments/assets/06b0d6f6-86f6-4dc9-a209-28b021841701" />
<img width="1366" height="768" alt="Screenshot (116)" src="https://github.com/user-attachments/assets/b40fdaea-8d37-4126-86f7-d7995e934b2e" />
<img width="1366" height="768" alt="Screenshot (117)" src="https://github.com/user-attachments/assets/ef0f5ac5-e2a2-41fd-a660-579c89cf4090" />
<img width="1366" height="768" alt="Screenshot (118)" src="https://github.com/user-attachments/assets/bf248af7-2fc1-48e5-a65b-8353edebc1b0" />





