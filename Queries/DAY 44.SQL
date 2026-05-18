1.Total Customers
SELECT COUNT(*) AS Total_Customers
FROM cleaned_customers;

2.Total Orders
SELECT COUNT(*) AS Total_Orders
FROM cleaned_orders;

3. Total Revenue
SELECT SUM(payment_amount) AS Total_Revenue
FROM cleaned_payments;

4.Avg Order Value
SELECT AVG(payment_amount) AS Avg_Order_Value
FROM cleaned_payments;

5.Total Products Sold
SELECT SUM(quantity) AS Total_Products_Sold
FROM cleaned_order_details;

6.Orders Per Customer
SELECT
customer_id,
COUNT(order_id) AS Orders_Per_Customer
FROM cleaned_orders
GROUP BY customer_id;

