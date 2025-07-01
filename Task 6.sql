-- Scalar SubQuery
SELECT Name,Salary
FROM Employees
WHERE Salary>(SELECT AVG(Salary) FROM  Employees);

CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
	Name VARCHAR(100),
	Salary DECIMAL(10,2),
	DepartmentID INT
);

INSERT INTO Employee(EmployeeID,Name,Salary,DepartmentID) 
VALUES 
(1,'Alice',50000,101),
(2,'Bob',40000,102),
(3,'CHarlie',60000,103)
;

-- Correlated Subquery
SELECT e.Name,e.Salary,e.DepartmentID
FROM Employee e
WHERE e.Salary>=(
      SELECT AVG(Salary)
	  FROM Employee
	  WHERE DepartmentID = e.DepartmentID
);

INSERT INTO Employee(EmployeeID,Name,Salary,DepartmentID) 
VALUES 
(4,'David',30000,101),
(5,'Evagelin',60000,102),
(6,'Esther',70000,103)
;

-- Subquery with IN
SELECT Name,DepartmentID
       FROM Employee
	   WHERE DepartmentID IN(
	     SELECT DepartmentID
		  FROM Employee
		  GROUP BY DepartmentID
		  HAVING COUNT(*)>1);

-- Subqueries with Exists
SELECT DISTINCT DepartmentID
FROM Employee e
WHERE EXISTS(
  SELECT 1
   FROM Employee
   WHERE DepartmentID = e.DepartmentID
   AND Salary>50000);

-- SubQuery with =
SELECT Name, Salary
 FROM Employee
 WHERE Salary = (
  SELECT MAX(Salary)
  FROM Employee
);
