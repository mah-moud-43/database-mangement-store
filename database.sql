CREATE DATABASE StoreDB; 
USE StoreDB; 
 
CREATE TABLE Categories ( 
    category_id INT PRIMARY KEY, 
    category_name VARCHAR(50) 
); 
 
CREATE TABLE Products ( 
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(50), 
    brand_id INT, 
    category_id INT, 
    model_year INT, 
    list_price DECIMAL(5,2), 
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) 
); 
 
CREATE TABLE Stores ( 
    store_id INT PRIMARY KEY, 
    store_name VARCHAR(50), 
    phone VARCHAR(15), 
    manager_id INT 
); 
 
CREATE TABLE Staffs ( 
    staff_id INT PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    email VARCHAR(50), 
    phone VARCHAR(15), 
    active BIT, 
    store_id INT, 
    manager_id INT, 
    FOREIGN KEY (store_id) REFERENCES Stores(store_id), 
    FOREIGN KEY (manager_id) REFERENCES Staffs(staff_id) 
); 
 
CREATE TABLE Customers ( 
    customer_id INT PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    phone VARCHAR(15), 
    email VARCHAR(50), 
    street VARCHAR(50), 
    city VARCHAR(50), 
    state VARCHAR(50), 
    zip_code VARCHAR(10) 
); 
 
CREATE TABLE Orders ( 
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    order_status VARCHAR(50), 
    order_date DATETIME, 
    required_date DATETIME, 
    shipped_date DATETIME, 
    email VARCHAR(50), 
    street VARCHAR(50), 
    city VARCHAR(50), 
    state VARCHAR(50), 
    zip_code VARCHAR(10), 
    store_id INT, 
    staff_id INT, 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id), 
    FOREIGN KEY (store_id) REFERENCES Stores(store_id), 
    FOREIGN KEY (staff_id) REFERENCES Staffs(staff_id) 
); 
 
CREATE TABLE OrderItems ( 
    order_id INT, 
    product_id INT, 
    quantity INT, 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), 
    FOREIGN KEY (product_id) REFERENCES Products(product_id) 
); 
 
CREATE TABLE Stocks ( 
    store_id INT, 
    product_id INT, 
    quantity INT, 
    FOREIGN KEY (store_id) REFERENCES Stores(store_id), 
    FOREIGN KEY (product_id) REFERENCES Products(product_id), 
    PRIMARY KEY (store_id, product_id) 
); 
 
INSERT INTO Customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code) 
VALUES 
(4, 'John', 'Doe', '555-1234', 'john.doe@example.com', '123 Main St', 'Anytown', 'CA', '12345'), 
(5, 'Jane', 'Smith', '555-5678', 'jane.smith@example.com', '456 Elm St', 'Othertown', 'NY', '67890'), 
(6, 'Bob', 'Johnson', '555-9012', 'bob.johnson@example.com', '789 Oak St', 'Thirdtown', 'FL', '11122'); 
 
INSERT INTO Products (product_id, product_name, brand_id, category_id, model_year, list_price) 
VALUES 
(1, 'Product 1', 1, 1, 2022, 50.00), 
(2, 'Product 2', 1, 2, 2021, 75.00), 
(3, 'Product 3', 2, 1, 2020, 100.00), 
(4, 'Product 4', 2, 2, 2022, 120.00), 
(5, 'Product 5', 3, 1, 2021, 80.00), 
(6, 'Product 6', 3, 2, 2020, 90.00); 
 
 
INSERT INTO Orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id) 
VALUES 
(4, 4, 'Pending', GETDATE(), DATEADD(day, 7, GETDATE()), NULL, 1, 1), 
(5, 5, 'Shipped', GETDATE(), DATEADD(day, 5, GETDATE()), GETDATE(), 2, 2), 
(6, 6, 'Pending', GETDATE(), DATEADD(day, 10, GETDATE()), NULL, 3, 3); 
 
INSERT INTO Stores (store_id, store_name, phone) 
VALUES 
(4, 'Store 4', '555-9876'); 
 
INSERT INTO OrderItems (order_id, product_id, quantity) 
VALUES 
(1, 1, 2), 
(1, 2, 1), 
(2, 3, 3), 
(2, 4, 1), 
(3, 5, 1), 
(3, 6, 2); 
INSERT INTO Categories (category_id, category_name) 
VALUES 
(4, 'Category 4'), 
(5, 'Category 5'), 
(6, 'Category 6'); 
INSERT INTO Products (product_id, product_name, brand_id, category_id, model_year, list_price) 
VALUES 
(7, 'Product 7', 1, 1, 2022, 50.00), 
(8, 'Product 8', 1, 2, 2021, 75.00), 
(9, 'Product 9', 2, 1, 2020, 100.00), 
(10, 'Product 10', 2, 2, 2022, 120.00), 
(11, 'Product 11', 3, 1, 2021, 80.00), 
(12, 'Product 12', 3, 2, 2020, 90.00); 
 
INSERT INTO Staffs (staff_id, first_name, last_name, email, phone, active, store_id, manager_id) 
VALUES 
(1, 'John', 'Doe', 'john.doe@example.
com', '555-1234', 1, 1, NULL), 
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', 1, 2, 1), 
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-9012', 1, 3, 2); 
-- SELECT * FROM Customers; 
-- SELECT * FROM Products; 
-- SELECT * FROM Orders; 
-- SELECT * FROM Stores; 
-- SELECT * FROM OrderItems; 
-- SELECT * FROM Categories; شؤ
-- SELECT * FROM Stocks; 
-- SELECT * FROM Staffs;
