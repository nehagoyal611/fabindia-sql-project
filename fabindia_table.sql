

CREATE DATABASE IF NOT EXISTS fabindia_db;
USE fabindia_db;

-- 1. STORES: physical Fabindia outlets
CREATE TABLE stores (
    store_id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_code    VARCHAR(10) NOT NULL UNIQUE,   
    store_name    VARCHAR(60) NOT NULL,
    city          VARCHAR(40) NOT NULL,
    state_code    CHAR(2) NOT NULL,              
    pincode       CHAR(6) NOT NULL,
    format        ENUM('Experience Centre','Boutique','Home & Lifestyle','Outlet') NOT NULL
) ENGINE=InnoDB;

-- 2. CUSTOMERS: Fabindia Shoppers / Loyalty Customers
CREATE TABLE customers (
    customer_id   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(30) NOT NULL,
    last_name     VARCHAR(30) NOT NULL,
    phone         CHAR(10) NOT NULL,             
    email         VARCHAR(80) NOT NULL,
    city          VARCHAR(40) NOT NULL,
    created_on    DATE NOT NULL
) ENGINE=InnoDB;

-- 3. PRODUCT CATEGORIES
CREATE TABLE product_categories (
    category_id   TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(40) NOT NULL,
    department    ENUM('Apparel','Home','Food','Personal Care') NOT NULL,
    gst_slab      DECIMAL(4,2) NOT NULL          
) ENGINE=InnoDB;

-- 4. SUPPLIERS / ARTISAN CLUSTERS
CREATE TABLE suppliers (
    supplier_id   SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(60) NOT NULL,
    region        VARCHAR(40) NOT NULL,          
    contact_phone CHAR(10) NOT NULL
) ENGINE=InnoDB;

-- 5. PRODUCTS (SKUs)
CREATE TABLE products (
    product_id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sku              VARCHAR(15) NOT NULL UNIQUE,
    product_name     VARCHAR(80) NOT NULL,
    category_id      TINYINT UNSIGNED NOT NULL,
    supplier_id      SMALLINT UNSIGNED NOT NULL,
    mrp              DECIMAL(8,2) NOT NULL,      
    fabric_material  VARCHAR(30),                
    size             ENUM('XS','S','M','L','XL','Free') DEFAULT 'Free',
    is_online_only   TINYINT(1) NOT NULL DEFAULT 0,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES product_categories(category_id),
    CONSTRAINT fk_products_supplier
        FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
) ENGINE=InnoDB;

-- 6. INVENTORY: stock per store per product
CREATE TABLE inventory (
    store_id       INT UNSIGNED NOT NULL,
    product_id     INT UNSIGNED NOT NULL,
    stock_qty      SMALLINT UNSIGNED NOT NULL,   
    last_restocked DATE NOT NULL,
    PRIMARY KEY (store_id, product_id),
    CONSTRAINT fk_inventory_store
        FOREIGN KEY (store_id) REFERENCES stores(store_id),
    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

-- 7. EMPLOYEES
CREATE TABLE employees (
    employee_id  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id     INT UNSIGNED NOT NULL,
    first_name   VARCHAR(30) NOT NULL,
    last_name    VARCHAR(30) NOT NULL,
    role         ENUM('Store Manager','Sales Associate','Cashier','Stock Associate') NOT NULL,
    date_joined  DATE NOT NULL,
    salary       DECIMAL(9,2) NOT NULL,
    CONSTRAINT fk_employees_store
        FOREIGN KEY (store_id) REFERENCES stores(store_id)
) ENGINE=InnoDB;


-- 8. ORDERS
CREATE TABLE orders (
    order_id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_id   INT UNSIGNED NOT NULL,
    store_id      INT UNSIGNED,                  
    order_date    DATE NOT NULL,
    channel       ENUM('Store','Online') NOT NULL,
    total_amount  DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_store
        FOREIGN KEY (store_id) REFERENCES stores(store_id)
) ENGINE=InnoDB;

-- 9. ORDER ITEMS
CREATE TABLE order_items (
    order_id    INT UNSIGNED NOT NULL,
    line_no     TINYINT UNSIGNED NOT NULL,
    product_id  INT UNSIGNED NOT NULL,
    quantity    TINYINT UNSIGNED NOT NULL,
    unit_price  DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (order_id, line_no),
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

-- 10. PAYMENTS
CREATE TABLE payments (
    payment_id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id        INT UNSIGNED NOT NULL UNIQUE,
    payment_method  ENUM('Cash','Card','UPI') NOT NULL,
    paid_amount     DECIMAL(10,2) NOT NULL,
    payment_status  ENUM('Pending','Success','Failed') NOT NULL,
    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
) ENGINE=InnoDB;
