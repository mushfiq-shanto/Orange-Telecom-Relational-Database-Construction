CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Populate Payment Table
INSERT INTO Payment (CustomerID, PaymentDate, Amount, PaymentMethod)
SELECT 
    c.CustomerID, 
    CURDATE() AS PaymentDate, 
    m.`Total day charge` + m.`Total eve charge` + m.`Total night charge` + m.`Total intl charge` AS Amount, 
    'Credit Card' AS PaymentMethod
FROM 
    master_table m
JOIN 
    Customer c ON c.State = m.State AND c.AccountLength = m.`Account length` AND c.AreaCode = m.`Area code` AND c.CustomerServiceCalls = m.`Customer service calls`;
