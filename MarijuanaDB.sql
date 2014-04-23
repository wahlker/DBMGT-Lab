DROP TABLE IF EXISTS Type CASCADE;
DROP TABLE IF EXISTS Strains CASCADE;
DROP TABLE IF EXISTS Plants CASCADE;
DROP TABLE IF EXISTS Effects CASCADE;
DROP TABLE IF EXISTS PlantEffects CASCADE;
DROP TABLE IF EXISTS People CASCADE;
DROP TABLE IF EXISTS Dispensaries CASCADE;
DROP TABLE IF EXISTS Growers CASCADE;
DROP TABLE IF EXISTS GrowerPlants CASCADE;
DROP TABLE IF EXISTS DispensaryPlants CASCADE;
DROP TABLE IF EXISTS Patients CASCADE;
DROP TABLE IF EXISTS DispensaryPatients CASCADE;
DROP TABLE IF EXISTS Dealers CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS DealersCustomers CASCADE;

CREATE TABLE Type
(
	tid INTEGER NOT NULL PRIMARY KEY,
	type VARCHAR(6) UNIQUE
);

CREATE TABLE Strains
(
	sid INTEGER NOT NULL PRIMARY KEY,
	tid INTEGER NOT NULL,
	name TEXT,
	FOREIGN KEY (tid) REFERENCES Type(tid)
);

CREATE TABLE Plants
(
	pid INTEGER NOT NULL PRIMARY KEY,
	sid INTEGER NOT NULL,
	gender VARCHAR(6),
	pottingdate DATE,
	germination INTEGER,
	seedling INTEGER,
	vegcycle INTEGER,
	floweringcycle INTEGER,
	cbdpercent DECIMAL,
	thcpercent DECIMAL,
	ismatured BOOLEAN,
	avgheight INTEGER,
	description TEXT,
	FOREIGN KEY (sid) REFERENCES Strains(sid)
);

CREATE TABLE Effects
(
	eid INTEGER NOT NULL PRIMARY KEY,
	PostiveDesc text,
	NegativeDesc text
);

CREATE TABLE PlantEffects
(
	pid INTEGER,
	eid INTEGER,
	FOREIGN KEY (pid) REFERENCES Plants(pid),
	FOREIGN KEY (eid) REFERENCES Effects(eid),
	PRIMARY KEY (pid, eid)
);

CREATE TABLE People
(
	peid INTEGER NOT NULL PRIMARY KEY,
	firstname VARCHAR(20),
	lastname VARCHAR(30),
	haircolor VARCHAR(10),
	eyecolor VARCHAR(10),
	height INTEGER,
	weight INTEGER,
	gender VARCHAR(6),
	address TEXT
);

CREATE TABLE Dispensaries
(
	disid INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	description TEXT,
	address TEXT
);

CREATE TABLE Growers
(
	gid INTEGER NOT NULL PRIMARY KEY,
	peid INTEGER,
	FOREIGN KEY (peid) REFERENCES People(peid)
);

CREATE TABLE GrowerPlants
(
	gid INTEGER,
	peid INTEGER,
	FOREIGN KEY (gid) REFERENCES Growers(gid),
	FOREIGN KEY (peid) REFERENCES People(peid),
	PRIMARY KEY (gid, peid)
);

CREATE TABLE DispensaryPlants
(
	gid INTEGER,
	peid INTEGER,	
	disid INTEGER,
	FOREIGN KEY (gid) REFERENCES Growers(gid),
	FOREIGN KEY (peid) REFERENCES People(peid),
	FOREIGN KEY (disid) REFERENCES Dispensaries(disid),
	PRIMARY KEY (gid, peid, disid)
);

CREATE TABLE Patients
(
	paid INTEGER NOT NULL PRIMARY KEY,
	peid INTEGER,
	FOREIGN KEY (peid) REFERENCES People(peid)
);

CREATE TABLE DispensaryPatients
(
	paid INTEGER,
	disid INTEGER,
	FOREIGN KEY (paid) REFERENCES Patients(paid),
	FOREIGN KEY (disid) REFERENCES Dispensaries(disid),
	PRIMARY KEY (paid, disid)
);

CREATE TABLE Dealers 
(
	did INTEGER NOT NULL PRIMARY KEY,
	peid INTEGER,
	FOREIGN KEY (peid) REFERENCES People(peid)
);

CREATE TABLE Customers
(
	cid INTEGER NOT NULL PRIMARY KEY,
	peid INTEGER,
	FOREIGN KEY (peid) REFERENCES People(peid)
);

CREATE TABLE DealersCustomers
(
	did INTEGER,
	cid INTEGER,
	FOREIGN KEY (did) REFERENCES Dealers(did),
	FOREIGN KEY (cid) REFERENCES Customers(cid),
	PRIMARY KEY (did, cid)
);

INSERT INTO Type(tid, type)
  VALUES(1, 'Indica');

INSERT INTO Type(tid, type)
  VALUES(2, 'Sativa');

INSERT INTO Type(tid, type)
  VALUES(3, 'Hybrid');

SELECT * FROM TYPE;

INSERT INTO Strains(sid, tid, name)
  VALUES(1, 1, 'Afghan Kush');

INSERT INTO Strains(sid, tid, name)
  VALUES(2, 1, 'Northern Lights');

INSERT INTO Strains(sid, tid, name)
  VALUES(3, 1, 'Bubba Kush');

INSERT INTO Strains(sid, tid, name)
  VALUES(4, 1, 'LA Confidential');

INSERT INTO Strains(sid, tid, name)
  VALUES(5, 1, 'Skywalker');

INSERT INTO Strains(sid, tid, name)
  VALUES(6, 1, 'G13');

INSERT INTO Strains(sid, tid, name)
  VALUES(7, 1, 'Death Star');

INSERT INTO Strains(sid, tid, name)
  VALUES(8, 1, 'Granddaddy Purple');

INSERT INTO Strains(sid, tid, name)
  VALUES(9, 1, 'Strawberry Kush');

INSERT INTO Strains(sid, tid, name)
  VALUES(10, 1, 'Obama Kush');

INSERT INTO Strains(sid, tid, name)
  VALUES(11, 2, 'Sour Diesel');

INSERT INTO Strains(sid, tid, name)
  VALUES(12, 2, 'Purple Power');

INSERT INTO Strains(sid, tid, name)
  VALUES(13, 2, 'Cannalope Haze');

INSERT INTO Strains(sid, tid, name)
  VALUES(14, 2, 'Candy Jack');

INSERT INTO Strains(sid, tid, name)
  VALUES(15, 2, 'Ultimate Trainwreck');

INSERT INTO Strains(sid, tid, name)
  VALUES(16, 2, 'Voodoo');

INSERT INTO Strains(sid, tid, name)
  VALUES(17, 2, 'Very Berry Haze');

INSERT INTO Strains(sid, tid, name)
  VALUES(18, 2, 'Mango Dream');

INSERT INTO Strains(sid, tid, name)
  VALUES(19, 2, 'OG');

INSERT INTO Strains(sid, tid, name)
  VALUES(20, 2, 'AK 47');

INSERT INTO Strains(sid, tid, name)
  VALUES(21, 3, 'Barneys Tangerine Dream');

INSERT INTO Strains(sid, tid, name)
  VALUES(22, 3, 'Sour Diesel');

INSERT INTO Strains(sid, tid, name)
  VALUES(23, 3, 'Super Silver Haze');

INSERT INTO Strains(sid, tid, name)
  VALUES(24, 3, 'Super Lemon Haze');

INSERT INTO Strains(sid, tid, name)
  VALUES(25, 3, 'White Widow');

INSERT INTO Strains(sid, tid, name)
  VALUES(26, 3, 'Trainwreck Kush Haze');

INSERT INTO Strains(sid, tid, name)
  VALUES(27, 3, 'Blue Dream');

INSERT INTO Strains(sid, tid, name)
  VALUES(28, 3, 'Atomic Northern Lights');

INSERT INTO Strains(sid, tid, name)
  VALUES(29, 3, 'Skywalker OG');

INSERT INTO Strains(sid, tid, name)
  VALUES(30, 3, 'Pineapple Express');

SELECT Strains.sid, Type.tid, Strains.name 
 FROM Strains FULL OUTER JOIN Type ON (Strains.tid = Type.tid)
 ORDER BY Strains.sid ASC;

INSERT INTO Plants(pid, sid, gender, pottingdate, germination, seedling, vegcycle, floweringcycle, cbdpercent, thcpercent, ismatured, avgheight, description)
  VALUES(1, 1, 'Female', '2014-04-20', 3, 28, 45, 51, 0.25, 15.13, FALSE, 60, 'The Afghan Kush plant is known for having buds that are light in color during their flowering stages, typically covered in dark red hairs, may smell a hint of spice, and is very tasty leaving the users with a hint of fruity pebbles.');

SELECT Plants.pid, Strains.sid, Strains.name, Type.type, gender, pottingdate, germination, seedling, vegcycle, floweringcycle, cbdpercent, thcpercent, ismatured, description 
 FROM Plants FULL OUTER JOIN Strains ON (Plants.sid = Strains.sid)
 INNER JOIN Type ON (Strains.tid = Type.tid)
 ORDER BY Plants.pid ASC;
