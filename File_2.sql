-- Exercise 1

SELECT
	p.CategoryID,
	SUM(od.Quantity) AS total_quantity, 
	SUM(od.Quantity * p.Price) AS total_revenue
FROM
	"_OrderDetails" od 
JOIN
	Копия_Products p ON od.ProductID = p.ProductID  
GROUP BY
	p.CategoryID
ORDER BY
	total_revenue DESC; 

-- Exercise 2

SELECT 
	p.CategoryID,
	COUNT(DISTINCT od.OrderID) AS order_count
FROM
	"_OrderDetails" od 
JOIN
	Копия_Products p ON od.ProductID = p.ProductID
GROUP BY
	p.CategoryID
ORDER BY 
	order_count DESC;

-- Exercise 3

SELECT 
	p.ProductName, 
	SUM(od.Quantity) AS total_quantity
FROM
	"_OrderDetails" od 
JOIN
	Копия_Products p ON od.ProductID = p.ProductID
GROUP BY 
	p.ProductName
ORDER BY 
	total_quantity DESC; 




