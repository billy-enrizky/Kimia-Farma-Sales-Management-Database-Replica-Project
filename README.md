# Kimia Farma Database Project README

This project involves creating a MySQL database for managing customer information, product details, and sales transactions for Kimia Farma. It also provides instructions for importing data from CSV files into the database, creating an aggregate table, and exporting data to a CSV file.

## Table of Contents

- [Database Setup](#database-setup)
- [Importing Data](#importing-data)
- [Creating Aggregate Table](#creating-aggregate-table)
- [Exporting Data](#exporting-data)

## Database Setup

1. Create a new MySQL database named `kimia_farma`.
2. Use the newly created database: `USE kimia_farma`.

## Importing Data

1. Create the `customers` table using the provided SQL script. This table stores customer information.
2. Create the `products` table using the provided SQL script. This table stores product details.
3. Create the `sales` table using the provided SQL script. This table stores sales transaction information.

After creating the tables, you can import data from CSV files into each table using MySQL's Table Data Import Wizard or by running appropriate SQL commands.

## Creating Aggregate Table

1. Create an aggregate table named `aggregate_table` by performing a LEFT JOIN operation on the `sales`, `customers`, and `products` tables. This table will combine sales data with customer and product details.
2. Add a computed column named `total_sales` to the `aggregate_table`. This column calculates the total sales amount for each transaction by multiplying the `number_of_products` with the `product_price`.

## Exporting Data

1. Use MySQL's Table Data Export Wizard to export the `aggregate_table` data to a CSV file. Alternatively, you can run the SQL query `SELECT * FROM aggregate_table` and then click Export.
2. The exported CSV file will contain the aggregated sales data along with customer and product information.

Note: Make sure to replace placeholders such as file paths, table names, and column names with actual values according to your system configuration and project requirements.

For any issues or inquiries, feel free to contact the project contributors.

---
Project Contributors: [Muhammad Enrizky Brillian]
