SELECT Agents.city
 FROM Agents, Customers, Orders
 WHERE Customers.name = 'Basics' AND Orders.cid = Customers.cid;

SELECT Orders.pid, Customers.city
 FROM Customers, Orders
 WHERE Customers.city = 'Kyoto' AND Orders.cid = Customers.cid;

SELECT Customers
 FROM Customers
 WHERE cid NOT IN (
	Select cid
	FROM Orders
	Where cid IS NOT NULL)

SELECT *
 FROM Customers LEFT OUTER JOIN Orders ON (Customers.cid = Orders.cid)
 WHERE Orders.cid IS NULL;

SELECT Customers.name, Agents.name
 FROM Customers LEFT OUTER JOIN Agents ON (Customers.city = Agents.city)
 WHERE cid IN (
	SELECT cid
	From Orders
	WHERE cid is NOT NULL)
			  
SELECT Customers.name, Agents.name
 FROM Customers LEFT OUTER JOIN Agents ON (Customers.city = Agents.city)
 WHERE Agents.city = Customers.city;

SELECT min(Products.quantity)
 FROM Customers LEFT OUTER JOIN Products ON (Customers.city = Products.city);
 


 