1.Find top customers by number of orders

SELECT
c.customer_id,
c.customer_name,
COUNT(o.order_id) AS Total_Orders
FROM cleaned_customers c
JOIN cleaned_orders o
ON c.customer_id=o.customer_id
GROUP BY customer_id
ORDER BY Total_Orders DESC;

2. Find top customers by generated revenue
SELECT
c.customer_id,
c.customer_name,
SUM(p.payment_amount) AS Revenue_Per_Customer
FROM cleaned_customers c
JOIN cleaned_orders o
ON c.customer_id=o.customer_id
JOIN cleaned_payments p
ON o.order_id=p.order_id
GROUP BY customer_id,customer_name
ORDER BY Revenue_Per_Customer DESC;

3. Find customers with no orders
SELECT
c.customer_id,
c.customer_name
FROM cleaned_customers c
WHERE c.customer_id NOT IN (
SELECT DISTINCT customer_id
FROM cleaned_orders
);

4. Analyze new customer signup trend month-wise

SELECT
MONTH(sign_up_date) as month_no,
MONTHNAME(sign_up_date) as month_name,
COUNT(customer_id) AS Total_Customers
FROM cleaned_customer
GROUP BY MONTH(sign_up_date),MONTHNAME(sign_up_date)
ORDER BY month_no;

5. • Find repeat customers with multiple orders

SELECT
customer_id,
COUNT(order_id) AS Orders_Per_Customer
FROM cleaned_orders
GROUP BY customer_id
HAVING Orders_Per_Customer>1;
6. • Calculate customer lifetime value
SELECT 
customer_id,
SUM(p.payment_amount) AS customer_lifetime_value
FROM cleaned_orders o
JOIN cleaned_payments p
ON o.order_id=p.order_id
GROUP BY customer_id
ORDER BY customer_lifetime_value DESC;

7. • Calculate average spend per customer
SELECT 
customer_id,
AVG(p.payment_amount) AS average_spend_per_customer
FROM cleaned_orders o
JOIN cleaned_payments p
ON o.order_id=p.order_id
GROUP BY customer_id
ORDER BY average_spend_per_customer DESC;

8. • Find total customers per city
SELECT
c.city,
COUNT(c.customer_id) AS total_customers
FROM cleaned_customers c
GROUP BY c.city
ORDER BY total_customers DESC;
