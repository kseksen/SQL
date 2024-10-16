
-- Exercise 1 

DELETE FROM EmployeeDetails WHERE EmployeeID IN (1, 2, 3);

CREATE TABLE IF NOT EXISTS EmployeeDetails (
    EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
    EmployeeName TEXT,
    Position TEXT,
    HireDate DATE,
    Salary NUMERIC
);

INSERT INTO EmployeeDetails (EmployeeID, EmployeeName, Position, HireDate, Salary)
VALUES
(4, 'John Snow', 'Associate Director', '2022-05-06', 75000),
(5, 'Katya Adushkina', 'Backend Developer', '2023-03-15', 60000),
(6, 'Nikolai Andreich', 'HR Specialist', '2021-11-30', 55000);

SELECT * FROM EmployeeDetails

-- Exercise 2

DROP VIEW IF EXISTS HighValueOrders;

CREATE VIEW HighValueOrders AS
SELECT
    o.OrderID,
    o.OrderDate,
    SUM(od.Quantity * p.Price) AS TotalAmount
FROM Orders o
JOIN _OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID, o.OrderDate
HAVING SUM(od.Quantity * p.Price) > 10000;

-- Exercise 3

DELETE FROM EmployeeDetails WHERE Salary < 50000;
SELECT * FROM EmployeeDetails;

DROP TABLE EmployeeDetails;

-- Exercise 4

CREATE PROCEDURE GetProductSales(IN p_ProductID INTEGER)
BEGIN
    SELECT
        o.OrderID,
        o.OrderDate,
        o.CustomerID
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE od.ProductID = p_ProductID;
END;


















