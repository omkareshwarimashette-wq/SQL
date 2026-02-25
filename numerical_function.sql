## NUMERICAL FUNCTIONS

-- 1.Round Unit_Price to 2 decimal places.
select Round(unit_price,2) as Round_unit_price
From orders;

-- 2.Find total sales per order.
Select SUM (unit_price) from orders

-- 3.Calculate average order value.
select avg (unit_price*quantity) As average_unit_price from orders;

-- 4.Find highest product price.
select MAX (unit_price)As highest_product  from orders;

-- 5.Find lowest product price.
select MIN (unit_price)As lowest_product from orders;

-- 6.Calculate percentage discount applied.


-- 7.Find modulus of Quantity divided by 2.
select  quantity, mod (quantity ,2) as remainder 
from orders;

-- 8.Convert negative values to positive.
select abs (quantity) from orders;

-- 9.Truncate price without rounding.
select TRUNC(unit_price,2)AS TRUNC_unit_price from orders;

-- 10.Find square root of total sales.
select sqrt(sum(unit_price * quantity)) as sqrt_total_sales
from orders;

-- 11.Calculate exponential value of a number.
select exp(quantity)as exponential_value 
From orders;

-- 12.Calculate power of 2^5.
select power (2,5) from orders;

--13.Find absolute difference between two prices.
select  


--14.Calculate sales growth percentage.
select per

--15.Find random number between 1 and 100.
select trunc (quantity) as trunc_quantity from orders;

--16.Divide total sales by number of orders.
select sum (quantity*unit_price)/ count (order_id) from orders;

--17.Find ceiling value of price.
select ceil (unit_price) as celling_price from orders;

--18.Find floor value of price.
select floor (unit_price) as floor_price from orders;

--19.Convert decimal to integer.
select trunc (unit_price) as integer_price
from orders;

--20Calculate compound interest.
