--- 1. Retrieve the names and contact details of employees hired after January 1, 2023.
SELECT 
FirstName,
LastName,
Email,
Phone 
FROM 
Employees
Where 
HireDate >'1-1-2023';

--- 2. Find the total payroll amount paid to each department. 
SELECT
d.DepartmentName,
sum(p.Amount) as total_amount
FROM 
Payroll p 
JOIN
Employees e ON p.EmployeeID = e.EmployeeID
JOIN
Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY
d.DepartmentName
ORDER BY
total_amount Desc

--- 3. List all employees who have not been assigned a manager. 
SELECT 
EmployeeID,
FirstName,
LastName
FROM 
EMPLOYEES
Where 
ManagerID is NULL

--- 4. Retrieve the highest salary in each department along with the employee’s name.
SELECT 
e.FirstName,
e.LastName,
e.Salary,
d.DepartmentName
FROM 
Employees e 
JOIN 
Departments d ON e.DepartmentID = d.DepartmentID
where
e.Salary = (SELECT 
             Max(Salary) from Employees
			 where DepartmentID = e.DepartmentID )
Order by
d.DepartmentName asc

--- 5. Find the most recent performance review for each employee. 
SELECT 
    e.FirstName,
    e.LastName,
    pr.ReviewDate,
    pr.PerformanceScore,
    pr.Comments
FROM 
    Employees e
JOIN 
    PerformanceReviews pr ON e.EmployeeID = pr.EmployeeID
WHERE 
    pr.ReviewDate = (
        SELECT 
            MAX(ReviewDate)
        FROM 
            PerformanceReviews
        WHERE 
            EmployeeID = e.EmployeeID
    )
ORDER BY 
    e.LastName, e.FirstName;

--- 6.Count the number of employees in each department. 
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM 
    Departments d
LEFT JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentName
ORDER BY 
    d.DepartmentName;

--- 7. List all employees who have received a performance score of "Excellent.
 
 SELECT
e.FirstName,
e.LastName,
p.PerformanceScore
FROM
Employees e
JOIN
PerformanceReviews p ON e.EmployeeID = p.EmployeeID
where
PerformanceScore = 'Excellent'

--- 8. --- "Identify the most frequently used payment method in payroll.

SELECT TOP 1 
PaymentMethod
from
Payroll
Group by
PaymentMethod

--- 9. Retrieve the top 5 highest-paid employees along with their departments.
SELECT TOP 5
e.FirstName,
e.LastName,
e.Salary,
d.DepartmentName
FROM
Employees e 
JOIN
Departments d ON e.DepartmentID = d.DepartmentID
order by 
e.Salary desc

--- 10 . Show details of all employees who report directly to a specific manager (e.g., ManagerID = 101). 
SELECT
EmployeeID,
FirstName,
LastName,
ManagerID
FROM
Employees
WHERE
ManagerID = '2'
