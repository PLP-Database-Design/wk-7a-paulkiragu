-- Question 1 transforming productsDetail table into 1NF 
INSERT INTO ProductsDetail(OrderID,CustomerName,Products)VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emly Clark', 'Phone');

-- Question 2 : Transforming orderDetails table into 2NF by removing partial dependencies

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Transfering data from the original table to the new tables
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM ProductsDetail;

INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Products, Quantity FROM ProductsDetail;
