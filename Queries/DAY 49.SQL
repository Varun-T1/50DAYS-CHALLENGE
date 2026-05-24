1.Question: Find Top 5 Customers by Revenue using CTE.
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue
    FROM cleaned_customers c
    JOIN cleaned_orders o ON c.customer_id = o.customer_id
    JOIN cleaned_payments p ON o.order_id = p.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_id,
    customer_name,
    total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 5;

2.Question: Find Top 5 Products by Quantity Sold using CTE.
WITH product_quantity AS (
    SELECT 
        p.product_id,
        p.product_name,
        SUM(od.quantity) AS total_quantity_sold
    FROM cleaned_products p
    JOIN cleaned_order_details od ON p.product_id = od.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT 
    product_id,
    product_name,
    total_quantity_sold
FROM product_quantity
ORDER BY total_quantity_sold DESC
LIMIT 5;

3.Question: Rank customers based on generated revenue using
DENSE_RANK().
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(p.payment_amount) AS total_revenue
FROM cleaned_customers c
JOIN cleaned_orders o ON c.customer_id = o.customer_id
JOIN cleaned_payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.customer_name;


4.Question: Rank products based on quantity sold using RANK().
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold,
    RANK() OVER (ORDER BY SUM(od.quantity) DESC) AS quantity_rank
FROM cleaned_products p
JOIN cleaned_order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name;


5.Question: Find category-wise revenue using CTE.
WITH category_revenue AS (
    SELECT 
        p.category,
        SUM(p.price * od.quantity) AS category_revenue
    FROM cleaned_products p
    JOIN cleaned_order_details od ON p.product_id = od.product_id
    GROUP BY p.category
)
SELECT 
    category,
    category_revenue
FROM category_revenue
ORDER BY category_revenue DESC;

6.Question: Categorize customers into High, Medium, and Low Revenue
groups using CASE.
WITH customer_revenue AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue
    FROM cleaned_customers c
    JOIN cleaned_orders o ON c.customer_id = o.customer_id
    JOIN cleaned_payments p ON o.order_id = p.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT 
    customer_id,
    customer_name,
    total_revenue,
    CASE 
        WHEN total_revenue >= 5000 THEN 'High Revenue'
        WHEN total_revenue >= 2000 THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category
FROM customer_revenue
ORDER BY total_revenue DESC;

7.Question: Create Stored Procedure for Customer Revenue Report.
CREATE PROCEDURE GetCustomerRevenueReport()
BEGIN
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.payment_amount) AS total_revenue
    FROM cleaned_customers c
    JOIN cleaned_orders o ON c.customer_id = o.customer_id
    JOIN cleaned_payments p ON o.order_id = p.order_id
    GROUP BY c.customer_id, c.customer_name
    ORDER BY total_revenue DESC;
END;