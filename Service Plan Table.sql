CREATE TABLE ServicePlan (
    ServicePlanID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    InternationalPlan VARCHAR(10),
    VoiceMailPlan VARCHAR(10),
    NumberVmailMessages INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Populate ServicePlan Table
INSERT INTO ServicePlan (CustomerID, InternationalPlan, VoiceMailPlan, NumberVmailMessages)
SELECT 
    c.CustomerID, 
    m.`International plan`, 
    m.`Voice mail plan`, 
    m.`Number vmail messages`
FROM 
    master_table m
JOIN 
    Customer c ON c.State = m.State AND c.AccountLength = m.`Account length` AND c.AreaCode = m.`Area code` AND c.CustomerServiceCalls = m.`Customer service calls`;
