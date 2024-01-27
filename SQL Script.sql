-- MySQL Workbench
-- Data Science Company Database (dsc_database)

-- creation database
DROP DATABASE IF EXISTS dsc_database;
CREATE DATABASE dsc_database;
USE dsc_database;

-- departments table
CREATE TABLE departments (
    dept_no INT(2),
    department_name VARCHAR(50),
    PRIMARY KEY (dept_no)
);

-- employees table
CREATE TABLE employees (
    emp_id CHAR(6),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    emp_phone INT,
    dept_no INT(2),
    position VARCHAR(50),
    start_date DATE,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_dept_no_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- projects table
CREATE TABLE projects (
    project_id INT(5),
    project_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    dept_no INT(2),
    PRIMARY KEY (project_id)
);

-- tasks table
CREATE TABLE tasks (
    task_id INT(4),
    project_id INT(5),
    emp_id CHAR(6),
    due_date DATE,
    status VARCHAR(50),
    PRIMARY KEY (task_id),
    CONSTRAINT fk_tasks_project_id FOREIGN KEY (project_id) REFERENCES projects(project_id),
    CONSTRAINT fk_tasks_emp_id FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- customers table
CREATE TABLE customers (
    cust_id CHAR(6),
    cust_name VARCHAR(50),
    email VARCHAR(50),
    cust_phone INT,
    address VARCHAR(50),
    project_id INT(5),
    PRIMARY KEY (cust_id),
    CONSTRAINT fk_customers_project_id FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- sales table
CREATE TABLE sales (
    sale_id INT(3),
    cust_id CHAR(6),
    sales_date DATE,
    sales_price INT,
    PRIMARY KEY (sale_id),
    CONSTRAINT fk_sales_cust_id FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

-- expenses table
CREATE TABLE expenses (
    exp_no INT(7),
    project_id INT(5),
    exp_date DATE,
    exp_amount INT,
    category VARCHAR(50),
    PRIMARY KEY (exp_no),
    CONSTRAINT fk_expenses_project_id FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- futurePlans table
CREATE TABLE futurePlans (
    plan_no INT(3),
    description VARCHAR(50),
    target_date DATE,
    priority INT,
    status VARCHAR(50),
    dept_no INT(2),
    PRIMARY KEY (plan_no),
    CONSTRAINT fk_dept_no_futurePlans FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
