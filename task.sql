-- Drop the existing database if it exists
DROP DATABASE IF EXISTS ShopDB;

-- Create the new normalized database
CREATE DATABASE ShopDB;
USE ShopDB;

-- Create Countries table
CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- Create Products table
CREATE TABLE Products (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL
);

-- Create Warehouses table
CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(50) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

-- Create ProductWarehouseInventory table (many-to-many relationship between Products and Warehouses)
CREATE TABLE ProductWarehouseInventory (
    ProductID INT,
    WarehouseID INT,
    WarehouseAmount INT NOT NULL,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Populate test data

-- Insert data into Countries table
INSERT INTO Countries (ID, Name) VALUES
    (1, 'Country1'),
    (2, 'Country2');

-- Insert data into Products table
INSERT INTO Products (ID, ProductName) VALUES
    (1, 'AwesomeProduct');

-- Insert data into Warehouses table
INSERT INTO Warehouses (ID, WarehouseName, WarehouseAddress, CountryID) VALUES
    (1, 'Warehouse-1', 'City-1, Street-1', 1),
    (2, 'Warehouse-2', 'City-2, Street-2', 2);

-- Insert data into ProductWarehouseInventory table
INSERT INTO ProductWarehouseInventory (ProductID, WarehouseID, WarehouseAmount) VALUES
    (1, 1, 2),
    (1, 2, 5);
