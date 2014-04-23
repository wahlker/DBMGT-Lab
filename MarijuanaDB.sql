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
	pottingdate DATE,
	germination INTEGER,
	seedling INTEGER,
	vegcycle INTEGER,
	floweringcycle INTEGER,
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
