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
  sid      char(4) not null references people(hid),
  name text,
  tailnumber    numeric(6),
  weightintons numeric,
  crewcapacity numeric,
 primary key(sid)
);

CREATE TABLE crew (

);

