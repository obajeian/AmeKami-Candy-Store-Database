-- Create the AmeKami database
CREATE DATABASE AmeKami;
GO

-- Use the AmeKami database
USE AmeKami;
GO

-- Create the Orders table
CREATE TABLE Orders (
    row_id INT NOT NULL PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    item_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    cust_id INT NOT NULL,
    delivery VARCHAR(10) NOT NULL,
    address_id INT NOT NULL
);
GO

-- Create the Customers table
CREATE TABLE Customers (
    cust_id INT NOT NULL PRIMARY KEY,
    cust_firstname VARCHAR(50) NOT NULL,
    cust_lastname VARCHAR(50) NOT NULL
);
GO

-- Create the Addresses table
CREATE TABLE Addresses (
    address_id INT NOT NULL PRIMARY KEY,
    delivery_address1 VARCHAR(200) NOT NULL,
    delivery_address2 VARCHAR(200) NULL,
    delivery_city VARCHAR(50) NOT NULL,
    delivery_zipcode VARCHAR(20) NOT NULL
);
GO

-- Create the Items table
CREATE TABLE Items (
    item_id VARCHAR(10) NOT NULL PRIMARY KEY,
    sku VARCHAR(20) NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    item_category VARCHAR(50) NOT NULL,
    item_size VARCHAR(50) NOT NULL,
    item_price FLOAT NOT NULL
);
GO

-- Create the Recipes table
CREATE TABLE Recipes (
    row_id INT NOT NULL PRIMARY KEY,
    recipe_id VARCHAR(20) NOT NULL,
    ing_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL
);
GO

-- Create the Ingredient table
CREATE TABLE Ingredient (
    ing_id VARCHAR(10) NOT NULL PRIMARY KEY,
    ing_name VARCHAR(50) NOT NULL,
    ing_weight INT NOT NULL,
    ing_measurement VARCHAR(20) NOT NULL,
    ing_price FLOAT NOT NULL
);
GO

-- Create the Inventory table
CREATE TABLE Inventory (
    inv_id INT NOT NULL PRIMARY KEY,
    item_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL
);
GO

-- Create the Staffs table
CREATE TABLE Staffs (
    staff_id VARCHAR(10) NOT NULL PRIMARY KEY,
    staff_firstname VARCHAR(50) NOT NULL,
    staff_lastname VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hourly_rate FLOAT NOT NULL
);
GO

-- Create the Rotas table
CREATE TABLE Rotas (
    row_id INT NOT NULL PRIMARY KEY,
    rota_id VARCHAR(20) NOT NULL,
    date DATETIME NOT NULL,
    staff_id VARCHAR(10) NOT NULL,
    shift_id VARCHAR(20) NOT NULL
);
GO

-- Create the Shifts table
CREATE TABLE Shifts (
    shift_id VARCHAR(20) NOT NULL PRIMARY KEY,
    day_of_week VARCHAR(10) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);
GO

-- Add foreign key constraints

-- Foreign key from Orders to Customers
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (cust_id)
REFERENCES Customers (cust_id);
GO

-- Foreign key from Orders to Addresses
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Addresses FOREIGN KEY (address_id)
REFERENCES Addresses (address_id);
GO

-- Foreign key from Orders to Items
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Items FOREIGN KEY (item_id)
REFERENCES Items (item_id);
GO

-- Foreign key from Recipes to Items
ALTER TABLE Recipes
ADD CONSTRAINT FK_Recipes_Items FOREIGN KEY (ing_id)
REFERENCES Items (item_id);
GO

-- Foreign key from Inventory to Items
ALTER TABLE Inventory
ADD CONSTRAINT FK_Inventory_Items FOREIGN KEY (item_id)
REFERENCES Items (item_id);
GO

-- Foreign key from Rotas to Staffs
ALTER TABLE Rotas
ADD CONSTRAINT FK_Rotas_Staffs FOREIGN KEY (staff_id)
REFERENCES Staffs (staff_id);
GO

-- Foreign key from Rotas to Shifts
ALTER TABLE Rotas
ADD CONSTRAINT FK_Rotas_Shifts FOREIGN KEY (shift_id)
REFERENCES Shifts (shift_id);
GO
