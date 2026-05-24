1.Question: Find number of orders placed daily.
SELECT 
 order_date,
COUNT(order_id) AS number_of_orders
FROM cleaned_orders
GROUP BY order_date
ORDER BY order_date;

2.Question: Find monthly order trend.
SELECT 
MONTHNAME(order_date) AS order_month,
MONTH(order_date) AS order_month_number,
COUNT(order_id) AS number_of_orders
FROM cleaned_orders
GROUP BY MONTH(order_date),MONTHNAME(order_date)
ORDER BY order_month_number ;

3.Question: Find the highest value order.
SELECT O.order_id,
sum(p.payment_amount) AS total_value
FROM cleaned_orders O
JOIN cleaned_payments p
ON O.order_id=p.order_id
GROUP BY O.order_id
ORDER BY total_value DESC
LIMIT 1;

4.Question: Find the lowest value order.
SELECT O.order_id,
sum(p.payment_amount) AS total_value
FROM cleaned_orders O
JOIN cleaned_payments p
ON O.order_id=p.order_id
GROUP BY O.order_id
ORDER BY total_value ASC
LIMIT 1;

5.Question: Find average quantity per order.
SELECT AVG(order_quantity) AS average_quantity
FROM(SELECT order_id,sum(quantity)as order_quantity
FROM cleaned_order_details
GROUP BY order_id) t;

6.Question: Categorize orders by quantity size (Small / Medium / Large Orders).
SELECT 
CASE
WHEN quantity <= 2 THEN 'Small'
WHEN quantity <= 5 THEN 'Medium'
ELSE 'Large'
END AS order_type,
COUNT(*)as total_orders
FROM cleaned_order_details
GROUP BY order_type;

7.Question: Find the day with the highest number of orders.
SELECT order_date,
COUNT(order_id) AS number_of_orders
FROM cleaned_orders
GROUP BY order_date
ORDER BY number_of_orders DESC
LIMIT 1;