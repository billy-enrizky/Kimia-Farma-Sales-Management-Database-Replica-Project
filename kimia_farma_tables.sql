# create database
CREATE DATABASE kimia_farma;
USE kimia_farma;
# create customer table
CREATE TABLE customers (
id_customer VARCHAR(50) PRIMARY KEY NOT NULL,
level_customer VARCHAR(50) NOT NULL,
name_customer VARCHAR(100) NOT NULL,
id_branches VARCHAR(50) NOT NULL,
branch_city VARCHAR(50) NOT NULL,
id_distributor VARCHAR(50) NOT NULL,
customer_group VARCHAR(50) NOT NULL
);
# create products table
CREATE TABLE products (
product_id VARCHAR(50) PRIMARY KEY NOT NULL,
product_name VARCHAR(50) NOT NULL,
packaging VARCHAR(50) NOT NULL,
product_price INT NOT NULL,
type_id VARCHAR(50) NOT NULL,
brand_id INT NOT NULL,
brand_name VARCHAR(50) NOT NULL
);
# create product sales
CREATE TABLE sales (
id_sales INT AUTO_INCREMENT UNIQUE PRIMARY KEY NOT NULL,
id_invoice VARCHAR(50) NOT NULL,
date_transaction DATE NOT NULL,
id_customer VARCHAR(50) NOT NULL,
id_product VARCHAR(50) NOT NULL,
number_of_products INT NOT NULL,
unit VARCHAR(50) NOT NULL,
currency VARCHAR(50) NOT NULL,
FOREIGN KEY (id_customer) REFERENCES customer (id_customer) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_product) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

# importing all datas from customer.csv to MYSQL customer table
# right click customer table -> table data import wizard
SELECT * FROM customer; #check outputs from the 'customer' table

# importing all datas from products.csv to MYSQL products table
# right click 'products' table -> table data import wizard
SELECT * FROM products; #check outputs from the 'products' table

# importing all datas from sales.csv to MYSQL sales table
# right click sales table -> table data import wizard
SELECT * FROM sales; #check outputs from the 'sales' table

# Create aggregate_table as
# Left Join Sales On Customer, Then Left Join Sales on Products
CREATE TABLE aggregate_table AS (SELECT s.id_sales, s.id_invoice, s.date_transaction,
s.number_of_products, s.unit, s.currency,
c.id_customer, c.level_customer, c.name_customer, c.id_branches,
c.branch_city, c.id_distributor, c.customer_group,
p.product_id, p.product_name, p.packaging, p.product_price, 
p.type_id, p.brand_id, p.brand_name
FROM sales as s
LEFT JOIN customers as c on s.id_customer = c.id_customer
LEFT JOIN products as p on s.id_product = p.product_id);

# Add 'total_sales column as number of products * product_price
ALTER TABLE aggregate_table
ADD total_sales DECIMAL(12,0) AS (number_of_products * product_price);

# Export it to CSV File
# Right click aggregate_table -> Table Data Export Wizard
# Alternatively, SELECT * FROM aggregate_table; Then click Export
