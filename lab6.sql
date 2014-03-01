SELECT Customers.name, Customers.city
 FROM Customers LEFT OUTER JOIN Products ON (Customers.city = Products.city)
 WHERE quantity = (select max(quantity) from Products)
 LIMIT 1
 
SELECT Customers.name, Customers.city
 FROM Customers LEFT OUTER JOIN Products ON (Customers.city = Products.city)
 WHERE quantity = (select max(quantity) from Products)

SELECT *
 FROM Products
 WHERE priceUSD >= (
	SELECT
	   AVG(priceUSD)
	FROM
	   Products);
	   
SELECT Customers.name, Orders.pid, Orders.dollars, COALESCE(Orders.dollars, 0)
 FROM Customers LEFT OUTER JOIN Orders ON (Customers.cid = Orders.cid)
 ORDER BY Orders.dollars ASC
	   
SELECT Customers.name, Orders.pid, Orders.dollars
 FROM Customers LEFT OUTER JOIN Orders ON (Customers.cid = Orders.cid)
 WHERE Orders.dollars IS NOT NULL
 ORDER BY Orders.dollars DESC

SELECT Customers.name, Products.name, Agents.name
 FROM Customers LEFT OUTER JOIN Products ON (Customers.city = Products.city)
 INNER JOIN Agents ON (Agents.city = 'New York')
 WHERE Products.name IS NOT NULL
 
CREATE VIEW DiscountCheck 
 AS SELECT Customers.name, Customers.discount, Products.priceUSD, Products.quantity 
 FROM Orders, Customers, Products;
 

