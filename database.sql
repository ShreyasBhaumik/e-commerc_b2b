CREATE DATABASE WarehousingLogistics;
USE WarehousingLogistics;

CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    capacity INT,
    available_space INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT,
    product_id INT,
    quantity INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'in-progress', 'fulfilled', 'cancelled') DEFAULT 'pending',
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    warehouse_id INT,
    carrier VARCHAR(100),
    tracking_number VARCHAR(100),
    status ENUM('in-transit', 'delivered', 'delayed') DEFAULT 'in-transit',
    shipped_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estimated_delivery DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Warehouses
INSERT INTO Warehouses (name, location, capacity, available_space) 
VALUES ('Warehouse A', 'Location A', 10000, 8000),
       ('Warehouse B', 'Location B', 15000, 12000);

-- Sample Products
INSERT INTO Products (name, category, price)
VALUES ('Product 1', 'Category A', 100.00),
       ('Product 2', 'Category B', 50.00);

-- Sample Customers
INSERT INTO Customers (name, email, phone, address)
VALUES ('Customer 1', 'customer1@example.com', '1234567890', 'Address 1'),
       ('Customer 2', 'customer2@example.com', '0987654321', 'Address 2');

-- Sample Orders
INSERT INTO Orders (customer_id, total_amount)
VALUES (1, 150.00), (2, 100.00);

-- Sample Order Items
INSERT INTO OrderItems (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 100.00), (1, 2, 1, 50.00), (2, 1, 1, 100.00);

-- Sample Inventory
INSERT INTO Inventory (warehouse_id, product_id, quantity)
VALUES (1, 1, 500), (1, 2, 300), (2, 1, 700);

-- Sample Shipments
INSERT INTO Shipments (order_id, warehouse_id, carrier, tracking_number, estimated_delivery)
VALUES (1, 1, 'Carrier A', 'TRACK1234', '2024-11-30'),
       (2, 2, 'Carrier B', 'TRACK5678', '2024-12-01');

SELECT Products.name, Inventory.quantity
FROM Inventory
JOIN Products ON Inventory.product_id = Products.product_id
WHERE Inventory.warehouse_id = 1;

SELECT Orders.order_id, Orders.status, Shipments.tracking_number, Shipments.status AS shipment_status
FROM Orders
LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id
WHERE Orders.customer_id = 1;

SELECT name, location, capacity, available_space
FROM Warehouses;
