SELECT Agents.city
 From Agents
 WHERE Agents.city IN (SELECT City
			FROM Customers
			WHERE Agents.city = Customers.city);
			
SELECT city
 FROM Customers
 WHERE name = ('Basics');

SELECT pid
 FROM Orders, Customers
 WHERE city in ('Kyoto');

SELECT cid, name
 FROM Orders, Products
 WHERE NOT aid = ('a03');

SELECT cid, name
 From Customers
 Where cid IN (Select cid
		FROM Orders
		WHERE pid = 'p01' OR pid = 'p07');
SELECT pid
 FROM Orders
 WHERE aid = ('a03');

SELECT name, discount
 FROM Customers
 WHERE city in ('Dallas' , 'Duluth');

SELECT discount
 FROM Customers
 WHERE city in ('Dallas' , 'Kyoto');
