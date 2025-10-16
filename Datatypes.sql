/*
operators
functions. string, date, numeric. (scaler function)
group by ( operation on same set of rows )
  sum , avg, count
  
where and having

normaliztion:
- 1 nf
- 2 nf => partial dependency
	( non -key attribute partially on key value)
    1. a. 50
    1. a. 60
    
1. a    1. 50
		1. 60
join
- extract
join.         where 1.condition=2.condition
inner join    on
inner join    using

left join (most important join)
right join (least important)

natural join
cross join or cartesian join

self join


table join table 2 join table 3
where t1.cond=t2.cond and t2.cond=t3.cond

table join table2 on condition
join table3 on condition


-- subquery
-- price original (max price)

-- inner query return 1 row (single row subquery)
>,<,<=,>=,=,!=

-- multi row subquery
in  =any
>any,  <any

>all,   <all

exists keyword :- The EXISTS operator is used to test for the existence of any record
				  in a subquery. The EXISTS operator returns TRUE if the subquery
				  returns one or more records.
                  
in vs exists :- 
In :- Processes the subquery to create a full list of values,
	  then filters the outer query.
Exists :- Executes the subquery for each outer row, stopping once a
          single match is found (short-circuits).
Exists is faster than In

correlated subquery:-
type of subquery which is related to outer query for result
subquery is executed every single time based on outer query result

constrains :- 
rules and regulations that we apply on columns to discard 
or remove unwanted data from it.
not null, unique, primary key, foreign key, default, check
               
*/


-- Data Types :- 
-- numeric  => tinyint, smallint, mediumint, int, bigint, float, double

-- tinyint :- # range :- -127 to 127 (1 byte) 2**8
create table testing1(id tinyint);
insert into testing1 values(10), (-9);
insert into testing1 values(-130); # will give error 
select * from testing1;

-- smallint :- # (2 byte) 2**16

-- float vs double :- Both are used to store decimal values
#  float uses 4 bytes (32 bits) for single precision (about 7 decimal digits)
#  and is suitable for memory-efficient applications like graphics.
#  double uses 8 bytes (64 bits) for double precision (about 15-16 decimal digits)

-- decision and pricision :- 
create table t1 (id2 double(5,2));
insert into t1 values(1043.123) # error
# here 2 means round up to 2 decimal value and 5 means total length including 2 decimal

-- String datatypes:-
#  char vs varchar
-- char is fixed length character whereas varchar has variable length
-- char is less space efficient whereas varchar is more space efficient
-- char Pads shorter strings with spacesNo padding whereas varchar stores only actual data



-- Date time :-
# Store date and time information in the format YYYY-MM-DD HH: MM: SS.
# Represent dates and times with a high level of precision.
# Not affected by timezone changes.
# Storage Size: 8 bytes.
/* Does not convert or store timezone information. It stores the date and time as-is, 
   without considering the server’s timezone settings. */
# No automatic updates
   
# Timestamp :-
# Format: YYYY-MM-DD HH:MM:SS
# Storage Size: 4 bytes for values before the year 2038; 8 bytes for values after.
/* Converts values to UTC for storage and converts back to the current timezone 
  for retrieval based on the server’s timezone settings.*/
# Can auto-update with DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP

-- date time vs timestamp
/* 
If we use DATETIME, the timestamp will remain fixed regardless of the server’s timezone or changes to it.
However, using TIMESTAMP ensures that the time is stored in UTC and automatically adjusted according to the
server’s current timezone when retrieved, making it ideal for applications that operate across multiple time zones.
 */