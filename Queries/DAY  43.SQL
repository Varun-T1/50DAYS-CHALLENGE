--CLEANED ALL THE DATE COLUMENS
UPDATE cleaned_payments
SET payment_date =
CASE
WHEN payment_date LIKE '____-__-__'
THEN payment_date
WHEN CAST(SUBSTRING(payment_date,1,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
    STR_TO_DATE(payment_date,'%d-%m-%Y'),
    '%Y-%m-%d')
WHEN CAST(SUBSTRING(payment_date,4,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
    STR_TO_DATE(payment_date,'%m-%d-%Y'),
    '%Y-%m-%d'
)
ELSE payment_date
END;

SELECT * FROM cleaned_payments;


UPDATE cleaned_orders
SET order_date =
CASE
WHEN order_date LIKE '____-__-__'
THEN order_date
WHEN CAST(SUBSTRING(order_date,1,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
    STR_TO_DATE(order_date,'%d-%m-%Y'),
    '%Y-%m-%d')
WHEN CAST(SUBSTRING(order_date,4,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
    STR_TO_DATE(order_date,'%m-%d-%Y'),
    '%Y-%m-%d')
ELSE order_date
END;

UPDATE cleaned_customers
SET sign_up_date =
CASE
WHEN sign_up_date LIKE '____-__-__'
THEN sign_up_date
WHEN CAST(SUBSTRING(sign_up_date,1,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
    STR_TO_DATE(sign_up_date,'%d-%m-%Y'),
    '%Y-%m-%d')
WHEN CAST(SUBSTRING(sign_up_date,4,2) AS UNSIGNED) > 12
THEN DATE_FORMAT(
    STR_TO_DATE(sign_up_date,'%m-%d-%Y'),
    '%Y-%m-%d')
ELSE sign_up_date
END;

SELECT * FROM cleaned_customers
----Datatype Fix & Add Constraints
ALTER TABLE cleaned_customers
MODIFY customer_id INT PRIMARY KEY,
MODIFY customer_name VARCHAR(100),
MODIFY city VARCHAR(100),
MODIFY sign_up_date DATE;

ALTER TABLE cleaned_products
MODIFY product_id INT PRIMARY KEY,
MODIFY product_name VARCHAR(100),
MODIFY category VARCHAR(100),
MODIFY price DECIMAL(10,2);

ALTER TABLE cleaned_orders
MODIFY order_id INT PRIMARY KEY,
MODIFY customer_id INT,
MODIFY order_date DATE,
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES cleaned_customers(customer_id);


ALTER TABLE cleaned_order_details
MODIFY order_detail_id INT PRIMARY KEY,
MODIFY order_id INT,
MODIFY product_id INT,
MODIFY quantity INT,
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES cleaned_orders(order_id),
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES cleaned_products(product_id);

ALTER TABLE cleaned_payments
MODIFY payment_id INT PRIMARY KEY,
MODIFY order_id INT,
MODIFY payment_amount DECIMAL(10,2),
MODIFY payment_date DATE,
ADD CONSTRAINT fk_payment_order
FOREIGN KEY (order_id)
REFERENCES cleaned_orders(order_id);
