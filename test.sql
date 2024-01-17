-- Verify GeoIPCache table
SET @GeoIPTable := (SELECT count(*)
FROM   information_schema.TABLES
WHERE  TABLE_SCHEMA = 'ShopDB'
AND TABLE_NAME = 'GeoIPCache'
AND ENGINE = 'Memory'); 
SELECT IF( @GeoIPTable = 1, 'GeoIPCache table found!', 'Error: unable to verify GeoIP table');

-- Verify ProductDescription table
SET @ProductDescriptionTable := (SELECT count(*)
FROM   information_schema.TABLES
WHERE  TABLE_SCHEMA = 'ShopDB'
AND TABLE_NAME = 'ProductDescription'
AND ENGINE = 'MyISAM'); 
SELECT IF( @ProductDescriptionTable = 1, 'ProductDescription table found!', 'Error: unable to verify ProductDescription table');

-- Verify Logs table
SET @LogsTable := (SELECT count(*)
FROM   information_schema.TABLES
WHERE  TABLE_SCHEMA = 'ShopDB'
AND TABLE_NAME = 'LogsTable'
AND ENGINE = 'BLACKHOLE'); 
SELECT IF( @ProductDescriptionTable = 1, 'LogsTable table found!', 'Error: unable to verify LogsTable table');

-- Verify ProductReporting table
SET @ProductReportingTable := (SELECT count(*)
FROM   information_schema.TABLES
WHERE  TABLE_SCHEMA = 'ShopDB'
AND TABLE_NAME = 'ProductReporting'
AND ENGINE = 'CSV'); 
SELECT IF( @ProductReportingTable = 1, 'ProductReporting table found!', 'Error: unable to verify ProductReporting table');
