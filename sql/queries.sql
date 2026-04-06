create database sales_db;
use sales_db;

create table sales (
    date DATE,
    product_id INT,
    quantity INT
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock_quantity INT,
    lead_time_days INT
); 

select * from sales;
select * from inventory;

/*1. Ukupna prodaja po proizvodu*/
SELECT 
    product_id,
    SUM(quantity) AS total_sold
FROM sales
GROUP BY product_id
ORDER BY total_sold DESC;

/*2. Ukupna prodaja po datumu*/
SELECT 
    date,
    SUM(quantity) AS daily_sales
FROM sales
GROUP BY date
ORDER BY date;

/*3. Prosečna dnevna prodaja po proizvodu*/
SELECT 
    product_id,
    AVG(daily_qty) AS avg_daily_sales
FROM (
    SELECT 
        product_id,
        date,
        SUM(quantity) AS daily_qty
    FROM sales
    GROUP BY product_id, date
) t
GROUP BY product_id;

/*4. Top 5 proizvoda po prodaji*/
SELECT 
    product_id,
    SUM(quantity) AS total_sold
FROM sales
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 5;

/*5. Proizvodi sa niskim lagerom*/
SELECT 
    product_id,
    stock_quantity
FROM inventory
WHERE stock_quantity < 10;

/*6. Proizvodi koji su “out of stock risk”*/
SELECT 
    i.product_id,
    i.stock_quantity,
    SUM(s.quantity) AS total_sold
FROM inventory i
JOIN sales s ON i.product_id = s.product_id
GROUP BY i.product_id, i.stock_quantity
HAVING i.stock_quantity < SUM(s.quantity);

/*7. Poslednja prodaja po proizvodu*/
SELECT 
    product_id,
    MAX(date) AS last_sale_date
FROM sales
GROUP BY product_id;

/*8. Spajanje sales i inventory*/
SELECT 
    s.product_id,
    s.date,
    s.quantity,
    i.stock_quantity
FROM sales s
JOIN inventory i 
ON s.product_id = i.product_id;

/*9. Ukupna prodaja vs lager*/
SELECT 
    i.product_id,
    i.stock_quantity,
    SUM(s.quantity) AS total_sold
FROM inventory i
LEFT JOIN sales s 
ON i.product_id = s.product_id
GROUP BY i.product_id, i.stock_quantity;

/*10. Reorder signal*/
SELECT 
    i.product_id,
    i.stock_quantity,
    ROUND(AVG(s.quantity), 2) AS avg_daily_sales,
    ROUND((AVG(s.quantity) * i.lead_time_days), 2) AS demand_during_lead_time
FROM inventory i
JOIN sales s 
ON i.product_id = s.product_id
GROUP BY i.product_id, i.stock_quantity, i.lead_time_days
HAVING i.stock_quantity < (AVG(s.quantity) * i.lead_time_days);
