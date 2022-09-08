



select name, city
from Salesm
where city = 'Paris';

select c.*,d.cust_name
from orders5 c,customer_id d
where d.customer_id = c.customer_id and c.ord_date=2012-08-17;

select  salesman_id,name
from salesm 
where 1<
(select count(*)
from customer
where salesman_id=salesm.salesman_id);

select * from orders5 a
where purch_amt >
(select avg(purch_amt)
from orders5 b
where a.customer_id=b.customer_id);

select *
from salesm where salesman_id in 
(select distinct salesman_id from customer a where not exists
(select * from customer b where a.salesman_id = b.salesman_id and a.cust_name <> b.cust_name));

select salesman_id, name from salesm a where 1 < (select count(*) from customer where salesman_id = a.salesman_id);

select * from salesm where city in(select city from customer);
