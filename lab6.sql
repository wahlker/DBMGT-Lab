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
	   
SELECT Customers.name, Orders.pid, Orders.dollars
 FROM Customers LEFT OUTER JOIN Orders ON (Customers.cid = Orders.cid)
 WHERE Orders.dollars IS NOT NULL
 ORDER BY Orders.dollars DESC
