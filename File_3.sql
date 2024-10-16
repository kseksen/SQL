CREATE TABLE Categories (
	`CategoryID` SMALLINT,
	`CategoryName` VARCHAR(20),
	`Description` VARCHAR(60));

INSERT INTO Categories (`CategoryID`,`CategoryName`,`Description`) VALUES 
 ('1','Beverages','Soft drinks, coffees, teas, beers, and ales'), 
 ('2','Condiments','Sweet and savory sauces, relishes, spreads, and seasonings'), 
 ('3','Confections','Desserts, candies, and sweet breads'), 
 ('4','Dairy Products','Cheeses'), 
 ('5','Grains/Cereals','Breads, crackers, pasta, and cereal'), 
 ('6','Meat/Poultry','Prepared meats'), 
 ('7','Produce','Dried fruit and bean curd'), 
 ('8','Seafood','Seaweed and fish');

-- Execrise 1

SELECT
    c.CategoryName, 
    SUM(p.Price * od.Quantity) AS TotalProfit
FROM "_OrderDetails" od 
JOIN "_Orders" o ON od.OrderID = o.OrderID 
JOIN "Копия_Products" p ON od.ProductID = p.ProductID 
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

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

