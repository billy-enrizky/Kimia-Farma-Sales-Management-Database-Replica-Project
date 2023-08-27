USE kimia_farma;

# 1. calculate the average sales revenue for each month, considering all years.
SELECT DATE_FORMAT(date_transaction, '%Y-%m') AS month,
       AVG(total_sales) AS average_revenue
FROM aggregate_table
GROUP BY month;

# 2. the top 5 customers by their total purchase value from the aggregate_table
SELECT id_customer, name_customer, SUM(total_sales) AS total_purchase
FROM aggregate_table
GROUP BY id_customer, name_customer
ORDER BY total_purchase DESC
LIMIT 5;

# 3. How can you determine the top 5 best-selling product in terms of the total number of units sold?
SELECT product_id, product_name, SUM(number_of_products) AS total_units_sold
FROM aggregate_table
GROUP BY product_id, product_name
ORDER BY total_units_sold DESC
LIMIT 5;
# 4. categorize customers into different loyalty tiers based on their total purchase value. 
# if the total purchase value is less than 100000, they are in the "Bronze" tier, 
# if it's between 100000 and 500000, they are in the "Silver" tier, if it's between
# 500000 and 1000000, they are in the "Gold" tier. If it's greater than 10000,
# then, they are in the "Platinum" Tier.
SELECT id_customer, name_customer,
       CASE
           WHEN total_purchase < 100000 THEN 'Bronze'
           WHEN total_purchase BETWEEN 100000 AND 500000 THEN 'Silver'
           WHEN total_purchase BETWEEN 500000 AND 1000000 THEN 'Gold'
           ELSE 'Platinum'
       END AS loyalty_tier
FROM (
    SELECT c.id_customer, c.name_customer, SUM(at.total_sales) AS total_purchase
    FROM customers c
    JOIN aggregate_table at ON c.id_customer = at.id_customer
    GROUP BY c.id_customer, c.name_customer
) customer_totals;

# 5. Calculate the average product price for each brand
SELECT brand_name, AVG(product_price) AS avg_product_price
FROM products
GROUP BY brand_name;

# 6. Find the top 5 dates with the highest total sales revenue.
SELECT date_transaction, SUM(total_sales) AS total_revenue
FROM aggregate_table
GROUP BY date_transaction
ORDER BY total_revenue DESC
LIMIT 5;

# 7. List the customer names and the total number of distinct products they have purchased.
SELECT c.name_customer, COUNT(DISTINCT at.product_id) AS total_distinct_products
FROM customers c
JOIN aggregate_table at ON c.id_customer = at.id_customer
GROUP BY c.name_customer;

# 8. Calculate the average transaction value (total_sales) for each customer group.
SELECT c.customer_group, AVG(at.total_sales) AS avg_transaction_value
FROM customers c
JOIN aggregate_table at ON c.id_customer = at.id_customer
GROUP BY c.customer_group;


