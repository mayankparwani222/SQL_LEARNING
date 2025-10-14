-- Order By (Sort) --

-- order single column
select * from payment order by customer_id desc;

-- order multipe columns
select * from payment order by customer_id desc, amount desc;

-- conditional functions
select customer_id, amount, if(amount>3, "HIGH", "LOW") from payment;
select customer_id, amount, if(amount>3, "HIGH", if(amount=5.5, "AVG", "LOW")) from payment;

select customer_id, amount,
	case
		when amount=2.99 then 'HIGH'
		when amount=5.99 then 'AVG'
		else 'HIGH'
	END AS STATUS
FROM PAYMENT ;
         
SELECT CUSTOMER_ID,
	CASE
		WHEN CUSTOMER_ID>4 THEN "USER"
		WHEN CUSTOMER_ID>1 THEN "HELLO"
		ELSE "REGEX"
    END AS STATUS
FROM PAYMENT ;

-- cusid, status id cusid>1 print hello , cusid>4 print user otherwise print regex 

-- primary key, super key, joins , relations 
-- sql zoo 1,2,3,5


