/* ============================================================
   Project  : MySQL Practice & Learning Repository
   File     : mysql_practice.sql
   Date     : 18-11-2025
   Author   : Dhruv Sharma
   Purpose  : Contains SQL Queries, Concepts, Examples, and Notes
              used for learning MySQL (DDL, DML, Joins, Views, 
              Constraints, Subqueries, Set Operations, etc.)
   Updated  : 18-11-2025
   ============================================================ */




-- Creating a new database for organization data
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

-- Creating the Worker table to store employee details
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- Inserting sample employee records into Worker table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

DESC Worker;
SELECT * FROM Worker;

-- Bonus table to store bonus history for employees
CREATE TABLE Bonus (
    Worker_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

DESCRIBE Bonus;

-- Inserting bonus records
INSERT INTO Bonus (Worker_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

SELECT * FROM Bonus;

-- Title table to track employee job titles over time
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- Inserting records into Title table
INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM Title;

-- Basic queries for practice
SELECT * FROM Worker;
SELECT FIRST_NAME, SALARY FROM Worker;

SELECT 44+11;
SELECT LCASE('DHRUV SHARMA');
SELECT UCASE('dhruv sharma');

-- Filtering employees based on salary
SELECT * FROM Worker WHERE SALARY > 100000;

-- Fetch employees from HR department
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- Fetch employees whose salary is between 80k and 3 lakh
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 300000;

-- Employees belonging to HR OR Admin
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin');

-- Excluding HR and Admin employees
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Admin');

-- Check for NULL department
SELECT * FROM Worker WHERE DEPARTMENT IS NULL;

-- Using wildcards in SQL LIKE operator
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

-- Sorting data
SELECT * FROM Worker ORDER BY SALARY;         -- Ascending
SELECT * FROM Worker ORDER BY SALARY DESC;    -- Descending

-- Removing duplicate values
SELECT DISTINCT department FROM Worker;

-- Grouping data and using aggregate functions
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT, COUNT(*) FROM Worker GROUP BY DEPARTMENT;

-- Calculate average salary per department
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- Minimum salary per department
SELECT DEPARTMENT, MIN(Salary) FROM Worker GROUP BY DEPARTMENT;

-- Maximum salary per department
SELECT DEPARTMENT, MAX(Salary) FROM Worker GROUP BY DEPARTMENT;

-- Total salary per department
SELECT DEPARTMENT, SUM(Salary) FROM Worker GROUP BY DEPARTMENT;

-- Departments having more than 2 employees
SELECT DEPARTMENT, COUNT(*) 
FROM Worker 
GROUP BY DEPARTMENT 
HAVING COUNT(*) > 2;

----------------------------------------------------------
-- Practicing DDL & DML using another sample database
----------------------------------------------------------

CREATE DATABASE temp;
USE temp;

-- Creating Customer table
CREATE TABLE Customer (
    id INT PRIMARY KEY,
    cname VARCHAR(225),
    Address VARCHAR(225),
    Gender CHAR(2),
    City VARCHAR(225),
    Pincode INT
);

DROP TABLE Customer;

-- Inserting customer records
INSERT INTO Customer VALUES
(1251, 'Ram Kumar','Dilbagh Nagar','M','Jalandhar', 144002),
(1300, 'Shayam Singh', 'Ludhiana H.O', 'M','Ludhiana', 141001),
(245, 'Neelabh Shukla', 'Ashok Nagar','M','Jalandhar', 144003),
(210, 'Barkha Singh', 'Dilbagh Nagar', 'F','Jalandhar', 144002),
(500, 'Rohan Arora', 'Ludhiana H.O', 'M','Ludhiana', 141001);

SELECT * FROM Customer;

INSERT INTO Customer 
VALUES (600, 'Dhruv Sharma', 'Aligarh', 'M','Aligarh', NULL);

-- Creating Order_details table with foreign key
CREATE TABLE Order_details (
    Order_id INT PRIMARY KEY,
    delivery_date DATE,
    Cust_id INT,
    FOREIGN KEY(Cust_id) REFERENCES Customer(id)
);

DESC Order_details;

-- Insert a sample order
INSERT INTO Order_details VALUES (1, '2019-03-11', 245);

-- Creating Account table with a CHECK constraint
CREATE TABLE Account (
    id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT,
    CONSTRAINT acc_balance_chk CHECK(balance > 10000)
);

INSERT INTO Account VALUES (1, 'A', 100000);
SELECT * FROM Account;

INSERT INTO Account VALUES (2, 'B', 100000);

-- This will fail because balance < 10000
INSERT INTO Account (id, name, balance) VALUES (2, 'C', 500);

-- Table with default value demonstration
CREATE TABLE BALANCED (
    id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

INSERT INTO BALANCED(id, name) VALUES (1, 'A');

DESC BALANCED;
SELECT * FROM BALANCED;

-- Adding a new column
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

SELECT * FROM account;

-- Modifying column type
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 6;

DESC account;

-- Renaming a column
ALTER TABLE account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 6;

-- Deleting a column
ALTER TABLE account DROP COLUMN saving_interest;

-- Renaming the table
ALTER TABLE account RENAME TO account_details;

----------------------------------------------------------
-- DML Operations
----------------------------------------------------------

USE temp;

-- Insert examples
INSERT INTO Customer (id, cname, Address, Gender, City, Pincode)
VALUES (1009, 'Sumit', 'Mirzapur', 'M', 'Delhi', 3001019);

SELECT * FROM Customer;

-- Updating customer records
UPDATE Customer SET Address = 'Mumbai', Gender ='M' WHERE id = 121;

-- Updating multiple rows (safe mode off)
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pincode = 1100010;
UPDATE Customer SET Pincode = Pincode + 1;

-- Deleting records
DELETE FROM Customer WHERE id = 500;

-- Delete all rows
DELETE FROM Customer;

-- Demonstrating ON DELETE CASCADE and ON DELETE SET NULL
DESC order_details;
SELECT * FROM order_details;

-- This will fail because of foreign key
DELETE FROM Customer WHERE id = 1;

-- Example with ON DELETE CASCADE
CREATE TABLE Order_details (
    Order_id INT PRIMARY KEY,
    delivery_date DATE,
    Cust_id INT,
    FOREIGN KEY(Cust_id) REFERENCES Customer(id) ON DELETE CASCADE
);

-- Example with ON DELETE SET NULL
CREATE TABLE Order_details (
    Order_id INT PRIMARY KEY,
    delivery_date DATE,
    Cust_id INT,
    FOREIGN KEY(Cust_id) REFERENCES Customer(id) ON DELETE SET NULL
);

----------------------------------------------------------
-- REPLACE command
----------------------------------------------------------

-- REPLACE works like INSERT, but replaces existing row if primary key matches
REPLACE INTO Customer(id, City) VALUES (6, 'colony');

-- REPLACE works as insert if data does not exist
REPLACE INTO Customer(id, cname, City)
VALUES (500, 'abs', 'alwar');

-- Using SET syntax
REPLACE INTO Customer SET id = 1300, cname ='Mac', City='utah';

-- Using REPLACE with SELECT
REPLACE INTO Customer (id, cname, City)
SELECT id, cname, City FROM Customer WHERE id = 500;

----------------------------------------------------------
-- JOINS
----------------------------------------------------------

-- Creating Company database and tables for joins practice
CREATE DATABASE Company_DB;
USE Company_DB;

-- Employee table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(50),
    PhoneNO VARCHAR(50),
    City VARCHAR(50)
);

-- Client table with reference to employee
CREATE TABLE Client_Details (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    Age INT,
    emailID VARCHAR(50),
    PhoneNO VARCHAR(50),
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);

-- Project table referencing employee and client
CREATE TABLE Project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id),
    FOREIGN KEY (clientID) REFERENCES Client_Details(id)
);

-- Sample data
INSERT INTO employee VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

INSERT INTO client_details VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com','333','Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com','222','Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com','111','Delhi', 1),
(4, 'Sushant', 'Aggarwal',23,'sushant@yahoo.com','45454','Hyderabad',5),
(5, 'Pratap', 'Singh',36,'p@xyz.com','77767','Mumbai',2);

INSERT INTO project VALUES
(1,1,'A','2021-04-21',3),
(2,2,'B','2021-03-12',1),
(3,3,'C','2021-01-16',5),
(4,3,'D','2021-04-27',2),
(5,5,'E','2021-05-01',4);

-- INNER JOIN: Show employee and the projects assigned to them
SELECT e.id, e.fname, e.lname, p.id, p.name 
FROM employee e
INNER JOIN project p ON e.id = p.empID;

-- Employees from Jaipur working with clients from Hyderabad
SELECT e.id, e.emailID, e.PhoneNo, c.first_name, c.last_name
FROM employee e
INNER JOIN client_details c ON e.id = c.empID
WHERE e.City = 'Jaipur' AND c.City = 'Hyderabad';

-- LEFT JOIN: Show all employees and their projects
SELECT * FROM employee e
LEFT JOIN project p ON e.id = p.empID;

-- RIGHT JOIN: Show all projects and their assigned employees
SELECT p.id, p.name, e.fname, e.lname, e.emailID
FROM employee e
RIGHT JOIN project p ON e.id = p.empID;

-- CROSS JOIN: All possible employee–project combinations
SELECT e.fname, e.lname, p.id, p.name
FROM Employee e
CROSS JOIN Project p;

-- JOIN without using JOIN keyword
SELECT e.id, e.fname, e.lname, p.id, p.name
FROM employee e, project p
WHERE e.id = p.empID;

----------------------------------------------------------
-- SET OPERATIONS
----------------------------------------------------------

-- Sample dept tables
CREATE TABLE DEPT1 (
 empid INT,
 name VARCHAR(255),
 role VARCHAR(255)
);
CREATE TABLE DEPT2 (
 empid INT,
 name VARCHAR(255),
 role VARCHAR(255)
);

INSERT INTO DEPT1 VALUES
(1,'A','engineering'),
(2,'B','salesman'),
(3,'C','manager'),
(4,'D','salesman'),
(5,'E','engineer');

INSERT INTO DEPT2 VALUES
(3,'C','manager'),
(6,'F','marketing'),
(7,'G','salesman');

-- UNION: List employees in both depts (no duplicates)
SELECT * FROM Dept1
UNION
SELECT * FROM Dept2;

-- UNION: Salesmen from both departments
SELECT * FROM Dept1 WHERE role='salesman'
UNION
SELECT * FROM Dept2 WHERE role='salesman';

-- INTERSECTION: Employees present in both tables
SELECT DISTINCT dept1.*
FROM dept1
INNER JOIN dept2 USING(empid);

-- MINUS: Employees in Dept1 but not in Dept2
SELECT DISTINCT dept1.*
FROM dept1
LEFT JOIN dept2 USING(empid)
WHERE dept2.empid IS NULL;

----------------------------------------------------------
-- SUBQUERIES
----------------------------------------------------------

-- Employees older than 30
SELECT * FROM employee 
WHERE age IN (SELECT age FROM employee WHERE age > 30);

-- Employees working on more than 1 project
SELECT * FROM employee 
WHERE id IN (
    SELECT empID FROM project 
    GROUP BY empID 
    HAVING COUNT(empID) > 1
);

-- Employees older than average age
SELECT * FROM Employee 
WHERE age > (SELECT AVG(age) FROM Employee);

-- Derived table example
SELECT MAX(age)
FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

-- Correlated subquery: Find 3rd oldest employee
SELECT *
FROM employee e1
WHERE 3 = (
    SELECT COUNT(e2.age)
    FROM employee e2
    WHERE e2.age >= e1.age
);

----------------------------------------------------------
-- SQL Views
----------------------------------------------------------

-- Creating a simple view
CREATE VIEW custom_view AS 
SELECT fname, age FROM employee;

SELECT * FROM custom_view;

-- Updating the view
ALTER VIEW custom_view AS 
SELECT fname, lname, age FROM employee;

-- Dropping the view
DROP VIEW IF EXISTS custom_view;
