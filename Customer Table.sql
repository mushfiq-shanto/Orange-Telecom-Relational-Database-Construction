CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    State VARCHAR(50),
    AccountLength INT,
    AreaCode INT,
    CustomerServiceCalls INT
);

-- Populate Customer Table
INSERT INTO Customer (State, AccountLength, AreaCode, CustomerServiceCalls)
SELECT DISTINCT State, `Account length`, `Area code`, `Customer service calls`
FROM master_table;
