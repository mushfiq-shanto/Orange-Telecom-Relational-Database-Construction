CREATE TABLE `Usage` (
    UsageID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    TotalDayMinutes DECIMAL(10, 2),
    TotalDayCalls INT,
    TotalDayCharge DECIMAL(10, 2),
    TotalEveMinutes DECIMAL(10, 2),
    TotalEveCalls INT,
    TotalEveCharge DECIMAL(10, 2),
    TotalNightMinutes DECIMAL(10, 2),
    TotalNightCalls INT,
    TotalNightCharge DECIMAL(10, 2),
    TotalIntlMinutes DECIMAL(10, 2),
    TotalIntlCalls INT,
    TotalIntlCharge DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Populate `Usage` Table
INSERT INTO `Usage` (CustomerID, TotalDayMinutes, TotalDayCalls, TotalDayCharge, TotalEveMinutes, TotalEveCalls, TotalEveCharge, TotalNightMinutes, TotalNightCalls, TotalNightCharge, TotalIntlMinutes, TotalIntlCalls, TotalIntlCharge)
SELECT 
    c.CustomerID, 
    m.`Total day minutes`, 
    m.`Total day calls`, 
    m.`Total day charge`, 
    m.`Total eve minutes`, 
    m.`Total eve calls`, 
    m.`Total eve charge`, 
    m.`Total night minutes`, 
    m.`Total night calls`, 
    m.`Total night charge`, 
    m.`Total intl minutes`, 
    m.`Total intl calls`, 
    m.`Total intl charge`
FROM 
    master_table m
JOIN 
    Customer c ON c.State = m.State AND c.AccountLength = m.`Account length` AND c.AreaCode = m.`Area code` AND c.CustomerServiceCalls = m.`Customer service calls`;
