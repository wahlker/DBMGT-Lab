1. 

drop function PreReqsFor(int, REFCURSOR);

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumVar int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select Prerequisites.courseNum, preReqNum
      from   Prerequisites
       where  Prerequisites.courseNum = courseNumVar;
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(308, 'results');
Fetch all from results;

2. 
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumVar int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select Prerequisites.courseNum, preReqNum, Courses.name
      from   Prerequisites INNER JOIN Courses ON (Prerequisites.courseNum = Courses.num)
       where  Prerequisites.courseNum = courseNumVar;
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqFor(308, 'results');
Fetch all from results;
