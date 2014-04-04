DROP TABLE people;
DROP TABLE actors;
DROP TABLE directors;
DROP TABLE moves;
DROP TABLE moviedirectors;
DROP TABLE movieactors;

CREATE TABLE people (
  pid      char(4) not null,
  name     text,
  address  text,
 primary key(pid)
);

CREATE TABLE actors (
  pid      char(4) not null references people(pid),
  dob      numeric(8),
  haircolor text,
  eyecolor  text,
  height   numeric(3),
  weight   numeric(3),
  sadad  text,
 primary key(pid)
);

CREATE TABLE directors (
  pid char(4) not null references people(pid),
  filmschool text,
  dgad text,
 primary key(pid)
);

CREATE TABLE movies (
  mid      char(3) not null,
  name     text,
  yearreleased    text,
  dbos numeric,
  fbos numeric,
  dvdbrsales numeric,
 primary key(mid)
);

CREATE TABLE moviedirectors (
  mid char(3) not null references movies(mid),
  pid char(4) not null references directors(pid)
);

CREATE TABLE movieactors (
  mid char(3) not null references movies(mid),
  pid char(4) not null references actors(pid)
);

INSERT INTO people( pid, name, address)
  VALUES('p001', 'Sean Connery', '7 Beverly Hills');
  
INSERT INTO people( pid, name, address)
  VALUES('p002', 'Daniel Craig', '8 Beverly Hills');
  
INSERT INTO people( pid, name, address)
  VALUES('p003', 'Roger Moore', '9 Beverly Hills');
  
INSERT INTO people( pid, name, address)
  VALUES('p004', 'Terence Young', '10 Beverly Hills');
  
INSERT INTO people( pid, name, address)
  VALUES('p005', 'Sam Mendes', '11 Beverly Hills');
  
INSERT INTO people( pid, name, address)
  VALUES('p006', 'Guy Hamilton', '9 Beverly Hills');
  
INSERT INTO actors( pid, dob, haircolor, eyecolor, height, weight, sadad)
  VALUES('p001', 08251930, 'white', 'brown', 74, 200, 10092012);
  
INSERT INTO actors( pid, dob, haircolor, eyecolor, height, weight, sadad)
  VALUES('p002', 03021968, 'blonde', 'blue', 70, 172, 04132007);
  
INSERT INTO actors( pid, dob, haircolor, eyecolor, height, weight, sadad)
  VALUES('p003', 10141927, 'brown', 'brown', 73, 164, 10151987);
  
INSERT INTO directors( pid, filmschool, dgad)
  VALUES('p004', 'James Bond School of Film', 04132011);
  
INSERT INTO directors( pid, filmschool, dgad)
  VALUES('p005', 'James Bond School of Film', 10262012);
  
INSERT INTO directors( pid, filmschool, dgad)
  VALUES('p006', 'James Bond School of Film', 09202011);
