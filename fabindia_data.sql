-- ===========================
-- PART 2: SAMPLE DATA
-- ===========================

-- 1. STORES (10 rows)
INSERT INTO stores (store_code, store_name, city, state_code, pincode, format) VALUES
('DEL_CP01', 'Fabindia Connaught Place',    'New Delhi',   'DL', '110001', 'Experience Centre'),
('DEL_SAK1', 'Fabindia Select Citywalk',    'New Delhi',   'DL', '110017', 'Boutique'),
('MUM_BND1', 'Fabindia Bandra Linking Rd',  'Mumbai',      'MH', '400050', 'Boutique'),
('MUM_PWL1', 'Fabindia Phoenix Mall',       'Mumbai',      'MH', '400013', 'Home & Lifestyle'),
('BLR_IND1', 'Fabindia Indiranagar',        'Bengaluru',   'KA', '560038', 'Experience Centre'),
('BLR_OOR1', 'Fabindia Orion Mall',         'Bengaluru',   'KA', '560055', 'Home & Lifestyle'),
('PUN_KOR1', 'Fabindia Koregaon Park',      'Pune',        'MH', '411001', 'Boutique'),
('CHE_TNA1', 'Fabindia T. Nagar',           'Chennai',     'TN', '600017', 'Boutique'),
('HYD_BAN1', 'Fabindia Banjara Hills',      'Hyderabad',   'TS', '500034', 'Experience Centre'),
('JAI_CSC1', 'Fabindia C-Scheme',           'Jaipur',      'RJ', '302001', 'Boutique');

-- 2. CUSTOMERS (10 rows)
INSERT INTO customers (first_name, last_name, phone, email, city, created_on) VALUES
('Aarav',   'Sharma',  '9810000001', 'aarav.sharma@example.com',  'New Delhi',  '2024-04-01'),
('Neha',    'Verma',   '9810000002', 'neha.verma@example.com',    'Mumbai',     '2024-04-05'),
('Rohan',   'Kapoor',  '9810000003', 'rohan.kapoor@example.com',  'Bengaluru',  '2024-04-10'),
('Simran',  'Singh',   '9810000004', 'simran.singh@example.com',  'Chennai',    '2024-04-13'),
('Ishita',  'Agarwal', '9810000005', 'ishita.agarwal@example.com','Pune',       '2024-04-15'),
('Karan',   'Mehta',   '9810000006', 'karan.mehta@example.com',   'Jaipur',     '2024-04-20'),
('Priya',   'Jain',    '9810000007', 'priya.jain@example.com',    'Hyderabad',  '2024-04-22'),
('Rahul',   'Gupta',   '9810000008', 'rahul.gupta@example.com',   'New Delhi',  '2024-04-25'),
('Ananya',  'Bose',    '9810000009', 'ananya.bose@example.com',   'Kolkata',    '2024-04-27'),
('Vikram',  'Nair',    '9810000010', 'vikram.nair@example.com',   'Bengaluru',  '2024-04-30');

-- 3. PRODUCT CATEGORIES (10 rows)
INSERT INTO product_categories (category_name, department, gst_slab) VALUES
('Women Kurtas & Kurtis',     'Apparel',      12.00),
('Men Kurtas',                'Apparel',      12.00),
('Kids Wear',                 'Apparel',      5.00),
('Bed Covers',                'Home',         12.00),
('Curtains & Drapes',         'Home',         12.00),
('Dining & Table Linen',      'Home',         12.00),
('Organic Staples',           'Food',         5.00),
('Snacks & Beverages',        'Food',         12.00),
('Skincare & Wellness',       'Personal Care',18.00),
('Fragrances & Diffusers',    'Personal Care',18.00);

-- 4. SUPPLIERS / ARTISAN CLUSTERS (10 rows)
INSERT INTO suppliers (supplier_name, region, contact_phone) VALUES
('Kutch Weavers Collective',        'Kutch, Gujarat',       '9899000001'),
('Jaipur Block Printers Guild',     'Jaipur, Rajasthan',    '9899000002'),
('Banaras Handloom Cluster',        'Varanasi, UP',         '9899000003'),
('Panipat Home Textiles',           'Panipat, Haryana',     '9899000004'),
('Madurai Organic Farmers Coop',    'Madurai, Tamil Nadu',  '9899000005'),
('Assam Tea Growers Society',       'Assam',                '9899000006'),
('Karnataka Millet Collective',     'North Karnataka',      '9899000007'),
('Himalayan Skincare Artisans',     'Uttarakhand',          '9899000008'),
('Kerala Spice Growers',            'Kerala',               '9899000009'),
('Rajasthan Fragrance Blenders',    'Rajasthan',            '9899000010');

-- 5. PRODUCTS (10 rows)
INSERT INTO products (sku, product_name, category_id, supplier_id, mrp, fabric_material, size, is_online_only) VALUES
('WKU12345', 'Indigo Handblock Kurta',           1, 2, 2499.00, 'Organic Cotton',  'M',     0),
('MKU22346', 'Beige Chanderi Men Kurta',         2, 3, 2999.00, 'Chanderi Silk',   'L',     0),
('KID33450', 'Printed Cotton Kids Dress',        3, 2, 1499.00, 'Cotton',          'S',     0),
('BED44501', 'King Size Jaipuri Bed Cover',      4, 2, 3599.00, 'Cotton',          'Free',  0),
('CUR55610', 'Sheer Linen Window Curtain',       5, 4, 1999.00, 'Linen',           'Free',  1),
('DIN66720', 'Handwoven Table Runner',           6, 1, 1299.00, 'Cotton',          'Free',  0),
('ORG77830', 'Organic Sonamasuri Rice 5kg',      7, 5,  899.00, NULL,              'Free',  1),
('SNK88940', 'Roasted Millet Namkeen 200g',      8, 7,  199.00, NULL,              'Free',  1),
('SKN99051', 'Apricot Kernel Face Scrub 75g',    9, 8,  699.00, NULL,              'Free',  1),
('FRG10160', 'Vetiver & Lime Room Diffuser',    10,10, 1499.00, NULL,              'Free',  0);

-- 6. INVENTORY (10 rows)
INSERT INTO inventory (store_id, product_id, stock_qty, last_restocked) VALUES
(1, 1, 35, '2024-05-01'),
(1, 4, 15, '2024-05-03'),
(2, 1, 20, '2024-05-02'),
(2, 6, 25, '2024-05-04'),
(3, 2, 18, '2024-05-01'),
(3, 8, 40, '2024-05-05'),
(4, 4, 10, '2024-05-02'),
(5, 7, 30, '2024-05-06'),
(6, 9, 22, '2024-05-03'),
(7, 3, 16, '2024-05-04');

-- 7. EMPLOYEES (10 rows)
INSERT INTO employees (store_id, first_name, last_name, role, date_joined, salary) VALUES
(1, 'Suresh',  'Yadav',   'Store Manager',   '2021-04-10', 480000.00),
(1, 'Meena',   'Rao',     'Sales Associate', '2022-01-15', 260000.00),
(2, 'Arjun',   'Gill',    'Cashier',         '2023-03-01', 240000.00),
(2, 'Kavita',  'Iyer',    'Sales Associate', '2022-11-20', 250000.00),
(3, 'Deepak',  'Bose',    'Store Manager',   '2020-06-05', 520000.00),
(3, 'Ritika',  'Singh',   'Stock Associate', '2023-02-18', 230000.00),
(4, 'Imran',   'Khan',    'Sales Associate', '2021-09-12', 255000.00),
(5, 'Shreya',  'Das',     'Cashier',         '2022-07-30', 245000.00),
(6, 'Varun',   'Nair',    'Stock Associate', '2023-01-10', 225000.00),
(7, 'Nikita',  'Jain',    'Sales Associate', '2021-12-01', 260000.00);

-- 8. ORDERS (10 rows)
INSERT INTO orders (customer_id, store_id, order_date, channel, total_amount) VALUES
(1, 1, '2024-05-05', 'Store', 2499.00),
(2, 3, '2024-05-06', 'Store', 2999.00),
(3, 5, '2024-05-06', 'Online', 899.00),
(4, 2, '2024-05-07', 'Store', 3599.00),
(5, 4, '2024-05-07', 'Online', 1999.00),
(6, 1, '2024-05-08', 'Store', 1299.00),
(7, 6, '2024-05-08', 'Online', 699.00),
(8, 2, '2024-05-09', 'Store', 1499.00),
(9, 9, '2024-05-09', 'Online', 199.00),
(10,7, '2024-05-10', 'Store', 2499.00);

-- 9. ORDER ITEMS (10 rows, one line per order for simplicity)
INSERT INTO order_items (order_id, line_no, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 2499.00),   -- Indigo Kurta
(2, 1, 2, 1, 2999.00),   -- Men Kurta
(3, 1, 7, 1,  899.00),   -- Rice
(4, 1, 4, 1, 3599.00),   -- Bed Cover
(5, 1, 5, 1, 1999.00),   -- Curtain
(6, 1, 6, 1, 1299.00),   -- Table Runner
(7, 1, 9, 1,  699.00),   -- Face Scrub
(8, 1,10, 1, 1499.00),   -- Diffuser
(9, 1, 8, 1,  199.00),   -- Namkeen
(10,1, 1, 1, 2499.00);   -- Indigo Kurta again

-- 10. PAYMENTS (10 rows)
INSERT INTO payments (order_id, payment_method, paid_amount, payment_status) VALUES
(1,  'Card', 2499.00, 'Success'),
(2,  'Card', 2999.00, 'Success'),
(3,  'UPI',   899.00, 'Success'),
(4,  'Cash', 3599.00, 'Success'),
(5,  'UPI',  1999.00, 'Success'),
(6,  'Card', 1299.00, 'Success'),
(7,  'UPI',   699.00, 'Success'),
(8,  'Cash', 1499.00, 'Success'),
(9,  'UPI',   199.00, 'Success'),
(10, 'Card', 2499.00, 'Success');
