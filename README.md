# Use different database engines

MySQL database engine - is a software, which is responsible for storing data in the database. MySQL has plugable storage engines - it allows you to set storage engine when creating a table in the database: 

`
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;
`

Today you will work with the following storage engines: `InnoDB`, `MyISAM`, `MEMORY`, `BLACKHOLE`, and `CSV`. In this task you will need to analyse the purpose and use-cases of different tables in the database, and based on that, select appropriate storage engine for each of them. You will work with the `ShopDB` database, which has the following tables:

- `Countries`, which has the following columns: `ID`, `Name`. This table is using `InnoDB` database engine. 

## Task

### Prerequisites

1. Install and configure a MySQL database server on a Virtual Machine, connect to it with the MySQL client.
2. Fork this repository.

### Requirements

In this task, you need to write SQL code, which creates tables in the database:

- Connect to your database server. 
- Update the file `task.sql` to add SQL code for creation of tables with needed storage engines.

You need to create the following tables: 

- `GeoIPCache`, which has the following columns: `ID`, `IPRange`, and `CountryID`. Our shop shows different product descriptions based on the country, from which shop is accessed. The country is determined by the client IP address - when client connects to the shop, it uses external service to determine country, to which this IP belongs. The information about IP range and country ID needs to be stored in storage, which will have the best performance we can get. It is OK if we loose this data due to the server restart. 
- `ProductDescription`, which has the following columns: `ID`, `Description`, `ProductID`, and `CountryID`. Our shop shows different product descriptions based on the country, from which shop is accessed. We need to have a separate table for storing those descriptions. As products are changing rarely, this table will have much more reads than updates. We need to shoose the storage engine, which will allow to get us the best performance while protect us from the data loss in case of server restart. 
- `Logs`, which has the following columns: `ID`, `Timestamp` and `Message`. Our development team is working on a new logging system for the shop. It is not ready yet, so they just need any table which can accept the data, but they are not interested in saving it at all. 
- `ProductReporting`, which has the following columns: `Date`, `ProductName` and `Orders`. Our shop operations team needs to know how much products was ordered each day. For such an analysis, they purchased a reposting system, which can import raw CSV data and build dashboard. This table will store the data, which then will be fed to that reporting system. 

### How to Test Yourself

Just in case you want to test your script on your database before submitting a pull request, you can do it by performing the following actions: 

1. Drop the `ShopDB` database using "DROP DATABASE ShopDB;" statement if you already have it on your database server. 
2. Run the script you wrote in the `task.sql` on your database server. 
3. Run the `test.sql` script on your database. If the script execution is finished without errors you are ready to submit a pull request. 
