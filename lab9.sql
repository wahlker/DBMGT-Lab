DROP TABLE People;
DROP TABLE Astronauts;
DROP TABLE Engineers;
DROP TABLE Crew;
DROP TABLE FlightControlOperators;
DROP TABLE SpaceCraft;
DROP TABLE Suppliers;
DROP TABLE Parts;
DROP TABLE Systems;
DROP TABLE Catalog;

CREATE TABLE people(
  hid      char(4) not null,
  firstname     text,
  lastname     text,
  age numeric (2),
 primary key(pid)
);

CREATE TABLE Engineers (
  hid      char(4) not null references people(hid),
  firstname      text references people(firstname),
  lastname     text references people(lastname),
  age numeric text references people (age),
  highestdegree text,
  favoritevideogame text,
 primary key(hid)
);

CREATE TABLE Astronauts (
  hid      char(4) not null references people(hid),
  firstname      text references people(firstname),
  lastname     text references people(lastname),
  age numeric text references people (age),
  yearsflying text,
  golfhandicap text,
 primary key(hid)
);

CREATE TABLE FlightControlOperators (
  hid      char(4) not null references people(hid),
  firstname      text references people(firstname),
  lastname     text references people(lastname),
  age numeric text references people (age),
  preferreddrink text,
  chairpreference text,
 primary key(hid)
);

CREATE TABLE SpaceCraft (
  sid      char(4),
  name text,
  tailnumber    numeric(6),
  weightintons numeric,
  crewcapacity numeric,
 primary key(sid)
);

CREATE TABLE crew (
  cid char(4),
  hid      char(4) not null references people(hid),
  sid      char(4) not null references SpaceCraft(sid),   
  firstname      text references people(firstname),
  lastname     text references people(lastname),
  name      text references SpaceCraft(name),    
primary key(cid)
);

CREATE TABLE Suppliers (
  suid char(4),   
  name text,
  address text,
  paymenterms text,   
primary key(suid)
);

CREATE TABLE Parts (
  pid char(4), 
  name text,
  description text,
primary key(pid)
);

CREATE TABLE Systems (
  syid char(4), 
  name text,
  description text,
primary key(syid)
);

CREATE TABLE Catalog (
  suid not null references people(suid), 
  pid not null references parts(hid),
  suppliername text,
  partname text references parts(name),
primary key(syid)
);
