# Relational Database Implementation for Customer Management: Orange Telecom

## Project Overview
This project involved transforming a single dataset into a structured relational database for Orange Telecom. The main dataset provided customer information, service plans, usage details, and churn status. The goal was to create a normalized database schema, populate it with the data from the dataset, and ensure referential integrity between the tables.

## Project Objectives
- **Normalization**: To design a relational database schema that adheres to the principles of normalization to eliminate redundancy and improve data integrity.
- **Data Transformation**: To transform and populate the data from the given dataset into the normalized schema.
- **Referential Integrity**: To establish relationships between tables to ensure data consistency.
- **Documentation**: To provide comprehensive documentation of the database schema, data transformation process, and SQL scripts used.

## Data Overview
The dataset contains the following columns:
- State
- Account length
- Area code
- International plan
- Voice mail plan
- Number vmail messages
- Total day minutes
- Total day calls
- Total day charge
- Total eve minutes
- Total eve calls
- Total eve charge
- Total night minutes
- Total night calls
- Total night charge
- Total intl minutes
- Total intl calls
- Total intl charge
- Customer service calls
- Churn

## Database Schema
The relational database schema consists of the following tables:

### Customer
- **CustomerID**: `INT`, Primary Key, Auto Increment
- **State**: `VARCHAR(50)`
- **AccountLength**: `INT`
- **AreaCode**: `INT`
- **CustomerServiceCalls**: `INT`

### ServicePlan
- **ServicePlanID**: `INT`, Primary Key, Auto Increment
- **CustomerID**: `INT`, Foreign Key
- **InternationalPlan**: `VARCHAR(10)`
- **VoiceMailPlan**: `VARCHAR(10)`
- **NumberVmailMessages**: `INT`

### Usage
- **UsageID**: `INT`, Primary Key, Auto Increment
- **CustomerID**: `INT`, Foreign Key
- **TotalDayMinutes**: `DECIMAL(10, 2)`
- **TotalDayCalls**: `INT`
- **TotalDayCharge**: `DECIMAL(10, 2)`
- **TotalEveMinutes**: `DECIMAL(10, 2)`
- **TotalEveCalls**: `INT`
- **TotalEveCharge**: `DECIMAL(10, 2)`
- **TotalNightMinutes**: `DECIMAL(10, 2)`
- **TotalNightCalls**: `INT`
- **TotalNightCharge**: `DECIMAL(10, 2)`
- **TotalIntlMinutes**: `DECIMAL(10, 2)`
- **TotalIntlCalls**: `INT`
- **TotalIntlCharge**: `DECIMAL(10, 2)`

### Churn
- **ChurnID**: `INT`, Primary Key, Auto Increment
- **CustomerID**: `INT`, Foreign Key
- **Churn**: `BOOLEAN`

### Payment
- **PaymentID**: `INT`, Primary Key, Auto Increment
- **CustomerID**: `INT`, Foreign Key
- **PaymentDate**: `DATE`
- **Amount**: `DECIMAL(10, 2)`
- **PaymentMethod**: `VARCHAR(50)`

## Data Transformation and Population
### Steps Involved:
1. **Customer Table**: Extracted unique customer-related data (State, Account length, Area code, Customer service calls) from the master dataset and populated the Customer table.
2. **ServicePlan Table**: Joined the Customer table with the master dataset on State, Account length, Area code, and Customer service calls to retrieve and populate service plan details (International plan, Voice mail plan, Number vmail messages) in the ServicePlan table.
3. **Usage Table**: Similar to the ServicePlan table, joined the Customer table with the master dataset to retrieve and populate usage details (Total day minutes, Total day calls, Total day charge, Total eve minutes, Total eve calls, Total eve charge, Total night minutes, Total night calls, Total night charge, Total intl minutes, Total intl calls, Total intl charge) in the Usage table.
4. **Churn Table**: Joined the Customer table with the master dataset to retrieve and populate churn status (Churn) in the Churn table, converting 'True' and 'False' to boolean values.
5. **Payment Table**: Joined the Customer table with the master dataset to retrieve and populate payment details (Total day charge + Total eve charge + Total night charge + Total intl charge as Amount, Credit Card as PaymentMethod, CURDATE() as PaymentDate) in the Payment table.

## SQL Scripts
Refer to the script files in the repository for the SQL queries used for creating and populating the tables.

## Conclusion
The project successfully transformed a flat dataset into a normalized relational database for Orange Telecom. The new database schema improves data integrity and reduces redundancy, making it easier to manage and query customer data, service plans, usage details, churn status, and payments. The provided SQL scripts ensure the correct creation and population of all tables while maintaining referential integrity. This documentation serves as a comprehensive guide to the project's design, implementation, and data transformation process.
