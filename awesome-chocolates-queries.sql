

# Queries
#Where Clause
select * from sales
where amount>10000;

#Order Clause
select * from sales
where amount>10000
Order by Boxes desc;

select * from sales
where GeoID="g1"
Order by PID,Amount  desc;


#Gropuby
select geoID,sum(amount),AVG(AMOUNT)
FROM SALES
GROUP BY  GEOID; 

#Operator 
#AND 
select * from sales
where amount>10000 and SaleDate >= "2022-01-01";

SELECT SALEDATE , AMOUNT  FROM SALES
WHERE AMOUNT>10000 AND YEAR(SALEDATE) = 2022
ORDER BY AMOUNT;

#Between
SELECT SALEDATE , AMOUNT,Boxes  FROM SALES
WHERE boxes between 0 and 100;

#weekday
Select Saledate,amount,boxes, weekday(Saledate) as "Days of Week"
from sales
where weekday(SaleDate) = 4;

#or 
select * from people
where Team = "Delish" or team = "Jucies" ;

#in
select * from people
where Team in ("Delish","Jucies","Yummies");

# Pattern Matching
# end with b 
select * from people 
where Salesperson like "%b";

# start with b 
select * from people 
where Salesperson like "b%";

#  have b 
select * from people 
where Salesperson like "%b%";

#Start with s and end with d
select * from people 
where Salesperson like "s%d";

select * from people 
where Salesperson like "_aine Padly";

# CASE 

SELECT SALEDATE,AMOUNT,
	   CASE     WHEN AMOUNT <1000 THEN "Under 1k"
		        WHEN AMOUNT <5000 THEN "Under 5k"
                WHEN AMOUNT <10000 THEN "Under 10 k"
	  else "10 k or more"
   end as "Amount Category"
from sales;
   
#JOINS
#Inner Join
Select Saledate,Amount,Salesperson 
from sales
inner join people on sales.spid=people.spid;

#left join
Select Saledate,Product
from sales
left join products on sales.PID=products.PID;

#right join
Select Saledate,Product,GeoID,AMOUNT
from sales
right join products on sales.PID=products.PID
Where amount<1000 and Size="Large";

Select Saledate,Product,GeoID,AMOUNT
from sales
right join products on sales.PID=products.PID
Where amount<1000 and Size = " " ;

Select Saledate,AMOUNT,Region,Geo 
from sales
join geo on sales.GeoID = geo.GeoID
Where geo in ("India", "USA")
order by SALEDATE;
























