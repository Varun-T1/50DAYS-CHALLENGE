

CREATE TABLE  Cleaned_coustmer
AS 
SELECT * FROM Cleaned_customers;

CREATE TABLE  Cleaned_orders
AS 
SELECT * FROM raw_orders;

CREATE TABLE  Cleaned_products
AS 
SELECT * FROM raw_products;

CREATE TABLE  Cleaned_order_details
AS 
SELECT * FROM raw_order_details;

CREATE TABLE  Cleaned_payments
AS 
SELECT * FROM raw_payments;


----REMOVE ALLTHE SPACES

UPDATE Cleaned_customers
SET customer_id = TRIM(customer_id),
customer_name = TRIM(customer_name),
city = TRIM(city),
sign_up_date = TRIM(sign_up_date)
;


update  Cleaned_orders
set order_id=trim(order_id),
customer_id=trim(customer_id),
order_date=trim(order_date)
;

update  cleaned_products
set product_id=trim(product_id),
product_name=trim(product_name),
category=trim(category),
price=trim(price)
;


update Cleaned_order_details
set order_detail_id=trim(order_detail_id),
order_id=trim(order_id),
product_id=trim(product_id),
quantity=trim(quantity)
;

update Cleaned_payments
set payment_id=trim(payment_id),
order_id=trim(order_id),
payment_amount=trim(payment_amount),
payment_date=trim(payment_date)
;

-----STANDARDIZE TEXT
UPDATE Cleaned_customers
SET customer_name = UPPER(customer_name),
city = UPPER(city)
;


update  cleaned_products
set  product_name =UPPER(product_name),
category =UPPER(category)
;

-----REPLACE NULL VALUE

SELECT * FROM  Cleaned_customers WHERE city is NULL OR city =" "
OR customer_name is null OR customer_name =""
;

UPDATE Cleaned_customers
SET city ="UNKNOWN"
WHERE city is NULL OR city =" "
OR customer_name is null OR customer_name =""
;

UPDATE Cleaned_products
set  product_name ="Unknown product",
category ="UNKNOWN"
WHERE  product_name =" "or product_name is null
OR category =" " or category is null
;



DELETE FROM Cleaned_customers
WHERE customer_id in(
    SELECT  customer_id
    FROM(
        SELECT customer_id,
        row_number() OVER(
            partition by customer_id
            order by customer_id
        ) as rn
    from Cleaned_customers
)t
WHERE rn > 1
);


DELETE FROM cleaned_orders
WHERE order_id in(
    SELECT  order_id
    FROM(
        SELECT order_id,
        row_number() OVER(
            partition by order_id
            order by order_id
        ) as rn
    from cleaned_orders
)t
WHERE rn > 1
);


DELETE FROM cleaned_products
WHERE product_id in(
    SELECT  product_id
    FROM(
        SELECT product_id,
        row_number() OVER(
            partition by product_id
            order by product_id
        ) as rn
    from cleaned_products
)t
WHERE rn > 1
);

DELETE FROM Cleaned_order_details
WHERE order_detail_id in(
    SELECT  order_detail_id
    FROM(
        SELECT order_detail_id,
        row_number() OVER(
            partition by order_detail_id
            order by order_detail_id
        ) as rn
    from Cleaned_order_details
)t
WHERE rn > 1
);

DELETE FROM Cleaned_payments
WHERE payment_id in(
    SELECT  payment_id
    FROM(
        SELECT payment_id,
        row_number() OVER(
            partition by payment_id
            order by payment_id
        ) as rn
    from Cleaned_payments
)t
WHERE rn > 1
);
