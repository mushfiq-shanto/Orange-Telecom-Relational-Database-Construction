CREATE TABLE Churn (
    ChurnID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Churn BOOLEAN,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Populate Churn Table
INSERT INTO Churn (CustomerID, Churn)
SELECT 
    c.CustomerID, 
    CASE 
        WHEN m.Churn = 'True' THEN 1 
        WHEN m.Churn = 'False' THEN 0 
        ELSE NULL 
    END AS Churn
FROM 
    master_table m
JOIN 
    Customer c ON c.State = m.State AND c.AccountLength = m.`Account length` AND c.AreaCode = m.`Area code` AND c.CustomerServiceCalls = m.`Customer service calls`;
