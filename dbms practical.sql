B. Practical:
Create a Hospital Staff Management System using Department and Staff tables.
1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
3. Insert at least 4 department records and 6 staff records.
4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
5. Display staff members whose names start with a specified letter using LIKE.
6. Display staff members belonging to selected departments using IN.
7. Display unique staff designations using DISTINCT.
8. Count the number of staff members in each department using GROUP BY and COUNT().
9. Display the maximum and minimum salary using MAX() and MIN().
10. Update the salary of a staff member.
11. Display the final staff records using SELECT with appropriate column aliases.

CREATE DATABASE  Hospital_Staff_Management_System;
USE  Hospital_Staff_Management_System;
CREATE TABLE Department(
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) DEFAULT 'Main Building'
      );
CREATE TABLE Staff(
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50) NOT NULL,
    Designation VARCHAR(50),
    Salary INT CHECK (Salary > 0),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
INSERT INTO department
VALUES
(1,'Cardiology','Block A'),
(2,'Neurology','Block c'),
(3,'Physiotherapy','Block A'),
(4,'Ortho','Block B');
INSERT INTO Staff
VALUES
(1,'A','Nurse',50000,2),
(2,'B','Nurse',40000,1),
(3,'C','Doctor',100000,2),
(4,'D','Doctor',80000,4),
(5,'E','Nurse',60000,3),
(6,'F','Doctor',120000,4);

SELECT StaffID,StaffName
FROM Staff 
WHERE Salary BETWEEN 20000 AND 100000;

SELECT StaffID,StaffName
FROM Staff
WHERE StaffName LIKE 'A%'; 

SELECT StaffName, DeptID
FROM Staff
WHERE DeptID IN (1, 3);

SELECT DISTINCT Designation 
FROM Staff;

SELECT  DeptID,COUNT(*) as Total_staff
FROM Staff
GROUP BY DeptID;

SELECT MIN(Salary)
FROM Staff;

SELECT MAX(Salary)
FROM Staff;

UPDATE Staff
SET Salary=80000
WHERE StaffID=5;

SELECT * FROM Staff;
SELECT * FROM Department;
