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


-- Exercise 1

WITH ProductAvgPrice AS (
    SELECT
        p.CategoryID,
        p.ProductID,
        p.ProductName,
        AVG(p.Price) AS AvgPrice
    FROM Копия_Products p
    JOIN "_OrderDetails" od ON p.ProductID = od.ProductID
    GROUP BY p.CategoryID, p.ProductID, p.ProductName
)
SELECT
    CategoryID,
    ProductID,
    ProductName, 
    AvgPrice, 
    RANK() OVER (PARTITION BY CategoryID ORDER BY AvgPrice DESC) AS Rank
FROM ProductAvgPrice;


-- Exercise 2

SELECT 
    a.month, 
    a.cluster, 
    a.AvgCreditAmount, 
    m.MaxCreditAmount
FROM 
    (SELECT
        month,
        cluster, 
        AVG(credit_amount) AS AvgCreditAmount
     FROM Clusters
     GROUP BY month, cluster
    ) a
JOIN 
    (SELECT
        month,
        MAX(credit_amount) AS MaxCreditAmount
     FROM Clusters
     GROUP BY month
    ) m
ON a.month = m.month;

-- Exercise 3

WITH CreditWithPrevious AS (
    SELECT
        month, 
        cluster, 
        credit_amount, 
        LAG(credit_amount) OVER (PARTITION BY cluster ORDER BY month) AS PreviousCreditAmount
    FROM Clusters
)
SELECT 
    month,
    cluster, 
    credit_amount,
    PreviousCreditAmount,
    COALESCE(credit_amount - PreviousCreditAmount, 0) AS Difference
FROM CreditWithPrevious;






