# Use Different Database Engines

MySQL database engine is a software responsible for storing data in the database. MySQL has pluggable storage engines that allow you to set a storage engine when creating a table in the database: 

```sql
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;
```

Today you will work with the following storage engines: `InnoDB`, `MyISAM`, `MEMORY`, `BLACKHOLE`, and `CSV`. In this task, you will need to analyze the purpose and use cases of different tables in the database and, based on that, select the appropriate storage engine for each of them. 

You will work with the `ShopDB` database. This database has the `Countries` table with the `ID` and `Name` columns. This table uses the `InnoDB` database engine. 

## Prerequisites

1. Install and configure a MySQL database server on a Virtual Machine and connect to it with the MySQL client.
2. Fork this repository.

## Requirements

Write SQL code, which creates tables in the database:

1. Connect to your database server. 
2. Update the `task.sql` file to add SQL code to create tables with needed storage engines.

Create the following tables: 

- `GeoIPCache`, which has the following columns: `ID`, `IPRange`, and `CountryID`. Our shop shows different product descriptions based on the country from which the shop is accessed. The country is determined by the client's IP address — when a client connects to the shop, it uses an external service to determine the country to which this IP belongs. The information about IP range and country ID needs to be stored in storage, which will have the best performance we can get. It is okay if we lose this data due to the server restart. 
- `ProductDescription`, which has the following columns: `ID`, `Description`, `ProductID`, and `CountryID`. Our shop shows different product descriptions based on the country from which the shop is accessed. We need to have a separate table for storing those descriptions. As products rarely change, this table will have more reads than updates. We need to choose the storage engine which will allow us to get the best performance while protecting us from data loss in case of a server restart. 
- `Logs`, which has the following columns: `ID`, `Timestamp`, and `Message`. Our development team is working on a new logging system for the shop. It is not ready yet, so they just need any table that can accept the data, but they are not interested in saving it. 
- `ProductReporting`, which has the following columns: `Date`, `ProductName`, and `Orders`. Our shop operations team needs to know how many products are ordered daily. For such an analysis, they purchased a reposting system to import raw CSV data and build a dashboard. This table will store the data, which then will be fed to that reporting system. 

## How to Test Yourself

Just in case you want to test your script on your database before submitting a pull request, you can do it by performing the following actions: 

1. Drop the `ShopDB` database using the `DROP DATABASE ShopDB;` statement if you already have it on your database server. 
2. Run the script you wrote in the `task.sql` on your database server. 
3. Run the `test.sql` script on your database. If the script execution is finished without errors, you are ready to submit a pull request. 
