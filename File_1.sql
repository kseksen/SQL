-- Exercise 1

SELECT COUNT (DISTINCT Country) AS unique_countries
FROM Customers c ;

-- Exercise 2

SELECT COUNT(*) AS customers_brazil
FROM Customers c 
WHERE Country = 'Brazil';

-- Exercise 3

SELECT 
	AVG(Price) AS avg_price, 
	COUNT(*) AS total_amount_products
FROM Products p 
WHERE CategoryID = 5; 

-- Exericise 4

SELECT AVG(
    (strftime('%Y', '2024-01-01') - strftime('%Y', BirthDate)) 
    - (strftime('%m-%d', '2024-01-01') < strftime('%m-%d', BirthDate))
) AS AverageAGE
FROM Employees;

-- Exercise 5 

SELECT *
FROM Копия_Orders кo 
WHERE OrderDate BETWEEN '2024-01-16' AND '2024-02-15'
ORDER BY OrderDate; 


-- Exercise 6

SELECT COUNT(*) AS nov_orders
FROM Копия_Orders кo 
WHERE OrderDate >= '2023-11-01' AND OrderDate <= '2023-11-30';


-- Exercise 7 

SELECT COUNT(*) AS jan_orders
FROM Копия_Orders кo 
WHERE OrderDate LIKE '2024-01%';


-- Exercise 8

SELECT COUNT(*) AS orders_2024
FROM Копия_Orders кo 
WHERE strftime('%Y', OrderDate) = '2024';





