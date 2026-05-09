use 50_day_challenge;
CREATE TABLE  raw_coustmer(
    customer_id VARCHAR(50),
     customer_name VARCHAR(50),
     city VARCHAR(50),
    sign_up_date VARCHAR(50)
);

CREATE TABLE  raw_orders(
   order_id VARCHAR(50),
   customer_id VARCHAR(50),
   order_date VARCHAR(50)
);

CREATE TABLE raw_products (
   product_id VARCHAR(50),
   product_name VARCHAR(50),
   category VARCHAR(50),
   price VARCHAR(50)
); 


 CREATE TABLE raw_order_details(
    order_detail_id VARCHAR(50),
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity VARCHAR(50)
 ); 


 CREATE TABLE raw_payments(
    payment_id VARCHAR(50),
    order_id VARCHAR(50),
    payment_amount VARCHAR(50),
    payment_date VARCHAR(50)
 ); 
 
select * from raw_coustmer;
select * from raw_orders;
select * from raw_products;
select * from raw_order_details;
select * from raw_payments;    